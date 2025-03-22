package com.pie.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.weaving.DefaultContextLoadTimeWeaver;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pie.dao.AccountDAO;
import com.pie.dao.NotificationDao;
import com.pie.dao.ProjectDao;
import com.pie.dao.ProjectTimelineDao;
import com.pie.dao.RequirementDocumentDao;
import com.pie.dao.RequirementTimelineDao;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.CompanyDocument;
import com.pie.entity.Notification;
import com.pie.entity.Project;
import com.pie.entity.ProjectTimeline;
import com.pie.entity.Requirement;
import com.pie.entity.RequirementDocuments;
import com.pie.entity.RequirementSeller;
import com.pie.entity.RequirementTimeline;
import com.pie.model.RequirementChatModel;
import com.pie.util.Constants;
import com.pie.util.EmailSender;
import com.pie.util.NewDateFormatter;
import com.pie.util.RequirementStatus;
import com.pie.util.StringUtil;
import com.pie.util.USER_ROLES;
import com.pie.util.UploadUtil;

import ch.qos.logback.core.joran.conditional.IfAction;

@Service
public class RequiremetDocumentServiceImpl implements RequiremetDocumentService {
	
	private static final Logger logger = LoggerFactory.getLogger(RequiremetDocumentServiceImpl.class);

	@Autowired
	private UploadUtil uploadUtil;

	@Autowired
	private Environment env;

	@Autowired
	private RequirementTimelineDao requirementTimelineDao;

	@Autowired
	private RequirementDocumentDao requirementDocumentDao;

	@Autowired
	private ProjectTimelineDao projectTimelineDao;

	@Autowired
	private RequirementService requirementService;

	@Autowired
	private NewDateFormatter newDateFormatter;

	@Autowired
	private NotificationDao notificationDao;
	
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private ProjectDao projectDao;

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public Map<String, Object> sendDocument(RequirementChatModel reqChatModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response.put("status", "false");
			String path = env.getProperty("image.upload.path");
			RequirementDocuments requirementDocuments = createRequirementDocument(reqChatModel.getFile(),
					reqChatModel.getFileViaLink(), "DOCUMENT", reqChatModel, path);
			if (requirementDocuments != null) {
				Requirement requirement = requirementService.getRequirementById(reqChatModel.getReqId());
				requirementDocumentDao.save(requirementDocuments);
				// Creating Notification
				createNotificationForSendingDocument(requirement, reqChatModel, requirementDocuments);
				response.put("status", "true");
			} else {
				response.put("document", "Not Found or Not Saved!");
			}
			
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Async
	private void createNotificationForSendingDocument(Requirement requirement, RequirementChatModel reqChatModel,
			RequirementDocuments requirementDocuments) {
		Date todayDate = new Date();
		//Updating Timeline Status From Discussion to Negotiation
		if (requirement.getStatus().equals(RequirementStatus.IN_DISCUSSION)) {
			RequirementTimeline requirementTimeline = requirementTimelineDao
					.getRequirementTimelineByReqId(reqChatModel.getReqId());
			requirementTimeline.setNegotiationStartedDate(todayDate);
			requirementTimelineDao.update(requirementTimeline);
			requirement.setStatus(RequirementStatus.NEGOTIATIONS);
			requirementService.updateRequirement(requirement);
		}
		
		//Seller Submitted Work Notification
		if(reqChatModel.isSellerSubmitingWork()) {
			Account	account = accountDAO.getAccountByCompanyId(requirement.getCompanyId());
			reqChatModel.setReqUniqueCode(requirement.getRequirementNo());
			//Send Email to Buyer Regarding Seller Submitting Work
			sendSellerSubmitWorkEmailToBuyer(account, reqChatModel);
			//Sending PM Mail
			List<String> linesList = new ArrayList<>();	
			String line1 = "The milestone "+reqChatModel.getMilestoneName()+" for Project ID "+reqChatModel.getReqUniqueCode()+" has been completed by the seller. Please review and confirm the milestone's completion to trigger the buyer intimation for reviewing the same.";
			linesList.add(line1);
			String subject = "Milestone Achieved: "+reqChatModel.getMilestoneName()+" for Project "+ reqChatModel.getReqUniqueCode();
			sendSellerSubmitWorkEmailToPM(accountDAO.getAccountBasedOnId(reqChatModel.getPmId()), linesList,subject,reqChatModel);
			//Done Sending Email
			
			List<Notification> notificationsList  = new ArrayList<>();
			String title="The seller has submitted work for the milestone "+reqChatModel.getMilestoneName()+" on your project "+reqChatModel.getReqUniqueCode();
			createNotificationWithBody(title, reqChatModel.getPmId(), todayDate, notificationsList);
			createNotificationWithBody(title, account.getUserId(), todayDate, notificationsList);
			notificationDao.saveBulkNotification(notificationsList);
		}
		
		//Buyer Rejects Milestone Work
		if(reqChatModel.isBuyerRejectMilestone()) {
			Account	account = accountDAO.getAccountByCompanyId(requirement.getCompanyId());
			
			//Send Email to PM Regarding Seller Work
			List<String> linesList = new ArrayList<>();	
			String line1 = "The milestone "+reqChatModel.getMilestoneName()+" for Project ID "+reqChatModel.getReqUniqueCode()+" has been rejected by the buyer. Please review the feedback and work with the seller to address the concerns.";
			linesList.add(line1);
			String subject = "Milestone Rejected by Buyer for Project "+ reqChatModel.getReqUniqueCode();
			sendSellerSubmitWorkEmailToPM(accountDAO.getAccountBasedOnId(reqChatModel.getPmId()), linesList,subject,reqChatModel);
			//Done Sending Email
			
			List<Notification> notificationsList  = new ArrayList<>();
			String title="The seller has submitted work for the milestone "+reqChatModel.getMilestoneName()+" on your project "+reqChatModel.getReqUniqueCode();
			createNotificationWithBody(title, reqChatModel.getPmId(), todayDate, notificationsList);
			createNotificationWithBody(title, account.getUserId(), todayDate, notificationsList);
			notificationDao.saveBulkNotification(notificationsList);
		}		
		
		//Updating Negotiations Started for Each Seller
		if(reqChatModel.getAddedBy().equals(USER_ROLES.SELLER)) {
			RequirementSeller requirementSeller = requirementService.getSellerForRequirementWithNoNegotiation(reqChatModel.getReqId(), reqChatModel.getAddedByCid());
			if(requirementSeller!=null && requirementSeller.getSellerNegotiationStartDate()==null) {
				requirementSeller.setSellerNegotiationStartDate(todayDate);
				requirementService.updateRequirementSeller(requirementSeller);
			}
		}

		// Creating Notification For New Document
		if (requirement.getStatus().equals(RequirementStatus.PROJECT_KICKOFF)
				&& (reqChatModel.getAddedBy().equals(USER_ROLES.SELLER)
						|| reqChatModel.getAddedBy().equals(USER_ROLES.BUYER))) {
			Account account = null;
			Notification notification = new Notification();

			if (reqChatModel.getAddedBy().equals(USER_ROLES.SELLER)) {
				account = accountDAO.getAccountByCompanyId(requirement.getCompanyId());
				notification.setTitle("A new document," + requirementDocuments.getDocumentName()
						+ ", has been uploaded by the seller for your project " + requirement.getRequirementNo() + ".");
			} else {
				account = accountDAO.getAccountByCompanyId(reqChatModel.getAddedForCid());
				notification.setTitle("The buyer has uploaded a new document," + requirementDocuments.getDocumentName()
						+ ", for your project " + requirement.getRequirementNo() + ".");
			}
			notification.setAddedFor(account.getUserId());
			notification.setCreatedOn(todayDate);
			notification.setIsRead(false);
			notificationDao.save(notification);
		} else if (reqChatModel.getAddedBy().equals(USER_ROLES.ADMIN)
				|| reqChatModel.getAddedBy().equals(USER_ROLES.PM)) {

			RequirementSeller requirementSeller = requirementService
					.getFinializedRequirementSeller(requirement.getId());
			Account account = accountDAO.getAccountByCompanyId(requirement.getCompanyId());
			Account sellerAccount = accountDAO.getAccountByCompanyId(requirementSeller.getSellerCompanyId());
			createNotificationForBuyerAndSeller(account.getUserId(), reqChatModel.getAddedBy(),
					requirement.getRequirementNo());
			createNotificationForBuyerAndSeller(sellerAccount.getUserId(), reqChatModel.getAddedBy(),
					reqChatModel.getReqUniqueCode());
		}
	}
	
	private void sendSellerSubmitWorkEmailToBuyer(Account account, RequirementChatModel reqChatModel) {
		List<String> linesList = new ArrayList<>();	
	
			String line1 = "We are pleased to inform you that the milestone ("+reqChatModel.getMilestoneName()+") agreed upon has been completed by the seller for Project ID "+reqChatModel.getReqUniqueCode()+".";
			String line2 = "Please review the milestone and determine its completion status. If you have any queries or concerns, please raise them, and your project manager will reach out to assist you.";

			linesList.add(line1);
			linesList.add(line2);
		try {
			
			emailSender.sendEmail("Action Required: Review and Mark Milestone Completion for "+reqChatModel.getReqUniqueCode()+" on Cnerzy" ,
					EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
					null, "Cnerzy", null);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		}
	
	private void sendSellerSubmitWorkEmailToPM(Account account,List<String> linesList ,String subject,RequirementChatModel reqChatModel) {

		try {
			
			emailSender.sendEmail(subject,
					EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
					null, "Cnerzy", null);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		}


	private void createNotificationWithBody(String title, Integer accountId, Date date, List<Notification> notifications) {
		Notification notification = new Notification();
		notification.setAddedFor(accountId);
		notification.setTitle(title);
		notification.setCreatedOn(date);
		notification.setIsRead(false);
		notifications.add(notification);
	}
	
	private void createNotificationForBuyerAndSeller(Integer accountId, String role, String reqUniqueNo) {
		Notification notification = new Notification();
		notification.setAddedFor(accountId);
		if (role.equals(USER_ROLES.ADMIN)) {
			notification.setTitle("The Cnerzy admin team has a question regarding your project " + reqUniqueNo + ".");
		} else {
			notification.setTitle(
					"Your project manager has sent you a message regarding your project " + reqUniqueNo + ".");
		}
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
	}

	@Override
	public Map<String, Object> getAllChat(RequirementChatModel reqChatModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<RequirementDocuments> chats = requirementDocumentDao.getRequirementDiscussionByReqId(
					reqChatModel.getReqId(), reqChatModel.getAddedByCid(), reqChatModel.getAddedForCid());
			List<Map<String, Object>> chatMessages = new ArrayList<>();
			for (RequirementDocuments chat : chats) {
				Map<String, Object> message = new HashMap<>();
				message.put("id", chat.getId());
				String description = "No Description";

				if (!StringUtil.isNullOrEmpty(chat.getDescription())) {
				    if (chat.getDocumentType() != null) {
				        if (chat.getDocumentType().equalsIgnoreCase("DOCUMENT")) {
				            description = chat.getDescription();
				        } else {
				            description = chat.getDocumentType() + " - " + chat.getDescription();
				        }
				    } else {
				        description = chat.getDescription();
				    }
				}

				message.put("description", description);
//				if(reqChatModel.getAddedBy().equals(USER_ROLES.ADMIN)) {
//					message.put("addedBy","Recieved From " + chat.getAddedBy());
//				} else if(reqChatModel.getAddedBy().equals(USER_ROLES.PM)) {
				message.put("addedBy", chat.getAddedBy().equals(reqChatModel.getAddedBy()) ? "Document By Me"
						: "Recieved From " + chat.getAddedBy());
//				} else {
//					message.put("addedBy",
//							!reqChatModel.getAddedByCid().equals(chat.getAddedByCid())  ? "Recieved From " + chat.getAddedBy()
//									: "Document By Me");
//				}

				message.put("addedDate", newDateFormatter.getRelativeTime(chat.getDateAdded()));
				message.put("documentName", StringUtil.isNullOrEmpty(chat.getDocumentName())?"Name Not Found":chat.getDocumentName());
				message.put("documentPath", chat.getDocumentPath());
				message.put("LinkOrFile",chat.getDocType());
				String fileSizeString = chat.getDocFileSize();
				long fileSizeBytes = Long.parseLong(fileSizeString);

				double fileSizeKB = fileSizeBytes / 1024.0;
				double fileSizeMB = fileSizeBytes / (1024.0 * 1024.0);
				String sizeString;

				if (fileSizeMB >= 1.0) {
					sizeString = String.format("%.2f MB", fileSizeMB);
				} else {
					sizeString = String.format("%.2f KB", fileSizeKB);
				}
				message.put("fileSize", sizeString);
				chatMessages.add(message);
			}
			response.put("status", "true");
			response.put("messages", chatMessages);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> finalizeSellerForReqId(RequirementChatModel reqChatModel) {
		HashMap<String, Object> response = new HashMap<>();
		logger.info(null);
		try {
			response.put("status", "false");
			// File Upload Path
			String path = env.getProperty("image.upload.path");

			List<RequirementDocuments> requirementDocumentsList = new ArrayList<>();

			// Upload LOI File
			RequirementDocuments loiDocument = createRequirementDocument(reqChatModel.getLoiFile(),
					reqChatModel.getLoiLink(), Constants.DOCUMENT_TYPE_LOI, reqChatModel, path);
			if (loiDocument != null) {
				requirementDocumentsList.add(loiDocument);
			} else {
				response.put("loDocument", "Document Not Saved or Not Found");
			}

			// Upload PO File
			RequirementDocuments poDocument = createRequirementDocument(reqChatModel.getPoFile(),
					reqChatModel.getPoLink(), Constants.DOCUMENT_TYPE_PO, reqChatModel, path);
			if (poDocument != null) {
				requirementDocumentsList.add(poDocument);
			} else {
				response.put("PoDocument", "Document Not Saved or Not Found");
			}

			if (poDocument != null || loiDocument != null) {
				Boolean isSaved = requirementDocumentDao.bulkSave(requirementDocumentsList);
				response.put("status", isSaved == true ? "true" : "false");
				if (isSaved) {
					Date nowDate = new Date();
					response = requirementService.finalizeSellerForReqId(reqChatModel);
					Project project = new Project();
					project.setBuyerCompanyId(reqChatModel.getAddedByCid());
					project.setSellerCompanyId(reqChatModel.getAddedForCid());
					project.setReqId(reqChatModel.getReqId());
					project.setReqUniqueCode("PR"+reqChatModel.getReqUniqueCode());
					project.setCreationDate(nowDate);
					project.setIsPaymentApproved(false);
					project.setIsPaymentSent(false);
					project.setIsDisbursementMethodSelected(false);
					project.setAmountDisbursed(BigDecimal.ZERO);
					project.setAmountInEscrow(BigDecimal.ZERO);
					project.setIsSingleEscrowTransaction(true);
					project.setTotalProjctPrice(BigDecimal.ZERO);
					project.setNoOfMilestones(0);
					project.setIsBuyerSignedTripartite(false);
					project.setIsSellerSignedTripartite(false);
					projectDao.save(project);
					// Getting Requirement
					Requirement requirement = requirementService.getRequirementById(reqChatModel.getReqId());
					// Project Timeline
					ProjectTimeline projectTimeline = new ProjectTimeline();
					projectTimeline.setProjectId(project.getId());
					projectTimeline.setReqId(requirement.getId());
					projectTimeline.setKickOffDate(nowDate);
					projectTimelineDao.save(projectTimeline);
					//Sending Email to Admin On Project Intiation
					Account buyerAccount = accountDAO.getAccountByCompanyId(requirement.getCompanyId());
					sendProjectInitiatedEmailToAdmin(buyerAccount.getFullName(),project.getReqUniqueCode());
					// Requirement Timeline
					RequirementTimeline requirementTimeline = requirementTimelineDao
							.getRequirementTimelineByReqId(reqChatModel.getReqId());
					requirementTimeline.setContractIssuedDate(nowDate);
					requirementTimeline.setDiscussionInitiatedDate(new Date());
					;
					requirementTimelineDao.update(requirementTimeline);
					requirement.setStatus(RequirementStatus.PURCHASE_ORDER_RELEASE);
					requirementService.updateRequirement(requirement);
					response.put("projectNo", project.getReqUniqueCode());
				}

			}
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}
	
	private void sendProjectInitiatedEmailToAdmin(String buyerName,String projectNo) {
	    logger.info("Sending project initiated email to admin for Buyer Name: {} and Project No: {}", buyerName, projectNo);
	    String adminEmail = env.getProperty("admin.emailId");
	    List<String> linesList = new ArrayList<>();
	    String line1 = "The buyer "+buyerName+" has selected a seller for the project "+projectNo+"."
	    		+ " Kindly review it and initiate the tripartite agreement process to both parties for signatures.";
	    linesList.add(line1);
		try {
			emailSender.sendEmail("Project Initiated - Action Required",
					EmailBody.generateHtmlAdminEmail(linesList), new String[] { adminEmail }, null,
					null, "Cnerzy", null);
			logger.info("Sent project initiated email to admin " + adminEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}


	private RequirementDocuments createRequirementDocument(MultipartFile file, String fileLink, String documentType,
			RequirementChatModel reqChatModel, String path) throws IOException {
		String documentPath = null;
		String documentName = null;
		long documentSize = 0;
		String documentFileType = null;
		String fileOrLink = null;

		if (file != null && !file.isEmpty()) {
			documentPath = uploadUtil.uploadToDirectory(file, path);
			documentName = file.getOriginalFilename();
			documentSize = file.getSize();
			documentFileType = file.getContentType();
			fileOrLink = "File";
		} else if (fileLink != null && !fileLink.isEmpty()) {
			  logger.info("Processing file link: {} for Buyer Company ID: {} and Seller Company ID: {}", 
				        fileLink, reqChatModel.getAddedByCid(), reqChatModel.getAddedForCid());
			// TODO: Download file from link and set documentPath, documentName,
			Map<String, Object> fileDetails = uploadUtil.uploadFileFromUrl(fileLink, path);
			if (fileDetails != null) {
				documentPath = (String) fileDetails.get("url");
				documentName = (String) fileDetails.get("name");
				documentSize = (long) fileDetails.get("size");
				documentFileType = (String) fileDetails.get("type");
				fileOrLink = "Link";
			} else {
				return null;
			}
		} else {
			return null;
		}

		return fillRequirementDocuments(documentName, documentPath, documentSize, documentFileType, reqChatModel,
				documentType, fileOrLink );
	}

	private RequirementDocuments fillRequirementDocuments(String documentName, String documentPath, long documentSize,
			String documentFileType, RequirementChatModel reqChatModel, String documentType, String DocType ) {

		RequirementDocuments requirementDocuments = new RequirementDocuments();
		requirementDocuments.setReqId(reqChatModel.getReqId());
		requirementDocuments.setDocumentName(documentName);
		requirementDocuments.setDocumentPath(documentPath);
		requirementDocuments.setDateAdded(new Date());
		requirementDocuments.setDescription(reqChatModel.getDescription());
		if (reqChatModel.getAddedBy().equals(USER_ROLES.ADMIN)) {
			requirementDocuments.setIsAddedByAdmin(true);
		} else if (reqChatModel.getAddedBy().equals(USER_ROLES.PM)) {
			requirementDocuments.setIsAddedByPM(true);
		} else {
			requirementDocuments.setAddedByCid(reqChatModel.getAddedByCid());
			requirementDocuments.setAddedForCid(reqChatModel.getAddedForCid());
		}
		requirementDocuments.setAddedBy(reqChatModel.getAddedBy());
		requirementDocuments.setDocFileSize(String.valueOf(documentSize));
		requirementDocuments.setDocumentFileType(documentFileType);
		requirementDocuments.setDocumentType(documentType);
		requirementDocuments.setDocType(DocType);
		

		return requirementDocuments;
	}

}
