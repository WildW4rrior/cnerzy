package com.pie.service;

import java.math.BigDecimal;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pie.dao.AccountDAO;
import com.pie.dao.AddressDao;
import com.pie.dao.CompanyDao;
import com.pie.dao.CompanyDocumentDao;
import com.pie.dao.NotificationDao;
import com.pie.dao.ProjectDao;
import com.pie.dao.ProjectTimelineDao;
import com.pie.dao.RatingDao;
import com.pie.dao.RequirementDao;
import com.pie.dao.RequirementSellerDao;
import com.pie.dao.RequirementTimelineDao;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.Address;
import com.pie.entity.Company;
import com.pie.entity.CompanyDocument;
import com.pie.entity.Notification;
import com.pie.entity.Project;
import com.pie.entity.ProjectTimeline;
import com.pie.entity.Requirement;
import com.pie.entity.RequirementDocuments;
import com.pie.entity.RequirementSeller;
import com.pie.entity.RequirementTimeline;
import com.pie.model.BuyerInfoModel;
import com.pie.model.ZohoDocSignModel;
import com.pie.model.RequirementChatModel;
import com.pie.model.RequirementModel;
import com.pie.model.SellerInfoModel;
import com.pie.util.Constants;
import com.pie.util.EmailSender;
import com.pie.util.RequirementStatus;
import com.pie.util.StringUtil;
import com.pie.util.USER_ROLES;

@Service
public class RequirementServiceImpl implements RequirementService {

	private static final Logger logger = LoggerFactory.getLogger(RequirementServiceImpl.class);

	@Autowired
	private RequirementDao requirementDao;

	@Autowired
	private RequirementTimelineDao requirementTimelineDao;
	
	@Autowired
	private NotificationDao notificationDao;

	@Autowired
	private AddressDao addressDao;

	@Autowired
	private EmailSender emailSender;

	@Autowired
	private AccountDAO accountDao;

	@Autowired
	private RequirementSellerDao requirementSellerDao;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private RatingDao ratingDao;

	@Autowired
	private CompanyDocumentDao companyDocumentDao;

	@Autowired
	private ZohoSignService zohoSignService;
	
	@Autowired
	private ProjectTimelineDao projectTimelineDao;
	
	@Autowired
	private Environment environment;

	@Override
	public HashMap<String, Object> createNewRequirement(RequirementModel requirementModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Requirement requirement = new Requirement();
			requirement.setDateAdded(new Date());
			requirement.setAddedBy(requirementModel.getAddedBy());
			requirement.setIndustry(requirementModel.getIndustry());
			requirement.setService(requirementModel.getService());
			requirement.setTitle(requirementModel.getJobPostTitle());
			requirement.setDescription(requirementModel.getProjectDescription());
			requirement.setQuantityRequired(requirementModel.getQuantityRequired());
			requirement.setMaterialSpecification(requirementModel.getMaterialSpecifications());
			requirement.setQualitySpecification(requirementModel.getQualitySpecifications());
			requirement.setPackagingSpecification(requirementModel.getPackagingSpecifications());
			requirement.setLogisticSpecification(requirementModel.getLogisticsSpecifications());
			requirement.setDeliveryTimeline(requirementModel.getDeliveryTimelines());
			requirement.setSellerLocation(requirementModel.getSellerLocation());
			requirement.setSellerPrefrences(requirementModel.getSellerPreference().equalsIgnoreCase("Cnerzy Recommended")?Constants.CNERZY_RECOMMENDED:Constants.PREVIOUSLY_ENGAGED);
			requirement.setCompanyId(requirementModel.getCompanyId());
			requirement.setStatus(RequirementStatus.POSTED);
			requirement.setRequirementNo(generateUniqueId(requirement.getAddedBy(), requirement.getCompanyId()));
			requirement.setAuthorisedCid(null);

			if (requirementModel.getReEngagedSellerCid() != null) {
				requirement.setSellerPrefrences(Constants.BUYER_RECOMMENDED);
			}
			requirementDao.save(requirement);
			//Creating Notification
			Notification notification = new Notification();
			notification.setAddedForAdmin(true);
			notification.setTitle("A new requirement, "+requirement.getRequirementNo()+" , has been posted on Cnerzy.");
			notification.setCreatedOn(new Date());
			notification.setIsRead(false);
			notificationDao.save(notification);
			//Sending Admin Email
			sendNewRequirementEmailToAdmin(requirement.getRequirementNo());
			RequirementTimeline requirementTimeline = new RequirementTimeline();
			requirementTimeline.setReqId(requirement.getId());
			requirementTimeline.setPostedDate(new Date());
			requirementTimelineDao.save(requirementTimeline);
			if (requirementModel.getReEngagedSellerCid() != null) {
				RequirementSeller requirementSeller = new RequirementSeller();
				requirementSeller.setSellerCompanyId(requirementModel.getReEngagedSellerCid());
				;
				requirementSeller.setReqId(requirement.getId());
				requirementSeller.setDateAdded(new Date());
				requirementSeller.setIsFinalised(false);
				requirementSeller.setIsInvitedByBuyer(true);
				requirementSeller.setIsRejected(false);
				requirementSeller.setIsSavedByBuyer(false);
				requirementSeller.setIsSellerInterested(false);
				requirementSeller.setIsShortlisted(false);
				requirementSeller.setIsSellerNotInterested(false);
				requirementSellerDao.save(requirementSeller);
			}
			response.put("status", "true");
			response.put("RequirementName", requirement);
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}
	
	private void sendNewRequirementEmailToAdmin(String reqNo) {
	    logger.info("Sending new user Requirement email to admin");
	    String adminEmail = environment.getProperty("admin.emailId");
	    List<String> linesList = new ArrayList<>();
	    String line1 = "A new buyer requirement has been posted on the Cnerzy platform. The Requirement Id is "
	    				+reqNo+". Please review the details, validate and approve the requirement to proceed.";
	    linesList.add(line1);
		try {
			emailSender.sendEmail("New Requirement Posted - Action Required",
					EmailBody.generateHtmlAdminEmail(linesList), new String[] { adminEmail }, null,
					null, "Cnerzy", null);
			logger.info("sent new user Requirement email to admin" + adminEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private String generateUniqueId(String fullName, Integer companyId) {
		// First 2 characters: company name (uppercased)
		String prefix = fullName.substring(0, 2).toUpperCase();

		SimpleDateFormat sdf = new SimpleDateFormat("mmss");
		String time = sdf.format(new Date()).substring(0, 4);

		String randomString = getSecureRandomString(4);

		String uniqueId = prefix + "-" + time + randomString;

		do {
			// Check if ID already exists
			if (requirementDao.getRequirementByUniqueNo(uniqueId) == null) {
				break;
			}
			// Generate new random again
			time = sdf.format(new Date()).substring(0, 4);
			randomString = getSecureRandomString(4);
			uniqueId = prefix + "-" + time + randomString;
		} while (true);

		return uniqueId;
	}

	private String getSecureRandomString(int length) {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		SecureRandom random = new SecureRandom();
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			sb.append(characters.charAt(random.nextInt(characters.length())));
		}
		return sb.toString();
	}

	@Override
	public HashMap<String, Object> getBuyerRequirmentsList(Integer companyId, Integer sellerCid) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<Requirement> requirements = requirementDao.getRequirementListByCompanyId(companyId, sellerCid);

			List<Map<String, String>> requirementList = new ArrayList<>();
			for (Requirement requirement : requirements) {
				Map<String, String> map = new HashMap<>();
				map.put("id", requirement.getId().toString());
				map.put("title", requirement.getTitle());
				requirementList.add(map);
			}
			response.put("data", requirementList);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> getPreviousEngagedSellerList(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			 List<Object[]> sellerDataList = requirementDao.getPreviousEngagedSellerList(companyId);
	            
	            LinkedHashMap<Integer, Date> uniqueSellers = new LinkedHashMap<>();
	            for (Object[] row : sellerDataList) {
	                Integer sellerId = (Integer) row[0];
	                Date completionDate = (Date) row[1];
	                uniqueSellers.putIfAbsent(sellerId, completionDate);
	            }

	            List<SellerInfoModel> sellerData = new ArrayList<>();
	            for (Integer sellerCompanyId : uniqueSellers.keySet()) {
	                SellerInfoModel sellerInfoModel = new SellerInfoModel();
	                sellerData.add(addSellerInfoToModel(sellerInfoModel, sellerCompanyId, true));
	            }
			response.put("data", sellerData);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> getBuyerAllRequirementList(Integer companyId) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<Requirement> requirements = requirementDao.getRequirementListByCompanyId(companyId, null);

			List<Map<String, Object>> requirementList = new ArrayList<>();
			for (Requirement requirement : requirements) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", requirement.getId());
				map.put("reqNo", requirement.getRequirementNo());
				map.put("service", requirement.getService());
				map.put("createdOn", requirement.getDateAdded());
				map.put("sellerLocation", requirement.getSellerLocation());
				map.put("status", requirement.getStatus());
				map.put("title", requirement.getTitle());
				requirementList.add(map);
			}
			response.put("data", requirementList);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public RequirementModel viewRequirementById(Integer id) {
		Requirement requirement = requirementDao.getRequirementById(id);
		return mapRequirementToModel(requirement);
	}

	private RequirementModel mapRequirementToModel(Requirement requirement) {
		RequirementModel requirementModel = new RequirementModel();
		requirementModel.setId(requirement.getId());
		requirementModel.setJobPostTitle(requirement.getTitle());
		requirementModel.setProjectDescription(requirement.getDescription());
		requirementModel.setAddedBy(requirement.getAddedBy());
		requirementModel.setIndustry(requirement.getIndustry());
		requirementModel.setService(requirement.getService());
		requirementModel.setQuantityRequired(requirement.getQuantityRequired());
		requirementModel.setMaterialSpecifications(requirement.getMaterialSpecification());
		requirementModel.setQualitySpecifications(requirement.getQualitySpecification());
		requirementModel.setPackagingSpecifications(requirement.getPackagingSpecification());
		requirementModel.setLogisticsSpecifications(requirement.getLogisticSpecification());
		requirementModel.setDeliveryTimelines(requirement.getDeliveryTimeline());
		requirementModel.setSellerLocation(requirement.getSellerLocation());
		requirementModel.setSellerPreference(requirement.getSellerPrefrences());
		requirementModel.setCompanyId(requirement.getCompanyId());
		return requirementModel;
	}

	public List<Map<String, Object>> getRequirementsList(Map<String, String> queryMap) {
		List<Requirement> requirementsList = requirementDao.getRequirementsList(queryMap);
		List<Map<String, Object>> requirementsMapList = new ArrayList<>();
		for (Requirement requirement : requirementsList) {
			Map<String, Object> requirementMap = new HashMap<>();
			requirementMap.put("id", requirement.getId());
			requirementMap.put("requirementNo", requirement.getRequirementNo());
			requirementMap.put("title", requirement.getTitle());
			requirementMap.put("buyerName", requirement.getAddedBy());
			requirementMap.put("createdOnLocal", requirement.getDateAdded().toLocaleString());
			requirementMap.put("createdOn", requirement.getDateAdded().toString());
			Address address = addressDao.getAddressByCompanyId(requirement.getCompanyId());
			if (address != null) {
				String location = (address.getState() != null ? address.getState() : "") + ", "
						+ (address.getCountry() != null ? address.getCountry() : "");
				requirementMap.put("location", location);
			} else {
				requirementMap.put("location", "N/A");
			}
			if(requirement.getStatus().equals(RequirementStatus.POSTED)) {
				requirementMap.put("status", "In Review");
			}else if(requirement.getStatus().equals(RequirementStatus.REJECTED)) {
				requirementMap.put("status", "Rejected");
			}else {
				requirementMap.put("status", "Seller Intimation");
			}
			requirementMap.put("reqStatus", requirement.getStatus().toString());
			requirementsMapList.add(requirementMap);
		}
		return requirementsMapList;
	}

	@Override
	public void updateRequirementStatus(Map<String, String> requestBody) throws MessagingException {
		Requirement requirement = requirementDao.getRequirementById(Integer.parseInt(requestBody.get("id")));
		String status = "";
		Account buyerAccount = accountDao.getAccountByCompanyId(requirement.getCompanyId());

		if (requestBody.get("status").equalsIgnoreCase("APPROVED")) {
			requirement.setStatus(RequirementStatus.APPROVED);
			status = "Approved";
			saveAndSendMailToSeller(requirement);
			RequirementTimeline requirementTimeline = requirementTimelineDao
					.getRequirementTimelineByReqId(Integer.valueOf(requestBody.get("id")));
			requirementTimeline.setApprovedDate(new Date());
			requirementTimelineDao.update(requirementTimeline);
			sendBuyerEmailApprovedRequirement(buyerAccount.getFullName(), buyerAccount.getEmailId(), requirement.getRequirementNo());
		} else if (requestBody.get("status").equalsIgnoreCase("REJECTED")) {
			requirement.setStatus(RequirementStatus.REJECTED);
			status = "Rejected";
			sendBuyerEmailForRejectedRequirement(buyerAccount.getFullName(), buyerAccount.getEmailId());
		}
		if (requestBody.get("status").equalsIgnoreCase("APPROVED")) {
		Notification notification = new Notification();
		notification.setAddedFor(buyerAccount.getUserId());
		notification.setTitle(String.format("Great news! Your requirement for %s has been reviewed and approved.", requirement.getRequirementNo()));
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
		}
		requirementDao.update(requirement);
	}

	@Async
	private void saveAndSendMailToSeller(Requirement requirement) throws MessagingException {
		String[] to;
		Date todayDate =new Date();
		if (!requirement.getSellerPrefrences().equalsIgnoreCase(Constants.BUYER_RECOMMENDED)) {
			List<Account> sellerList = new ArrayList<>();
			List<Integer> sellerCompanyIds = new ArrayList<>();
			if (requirement.getSellerPrefrences().equalsIgnoreCase(Constants.CNERZY_RECOMMENDED)) {
				List<Company> sellerCompanyList = companyDao.getCompaniesByIndustryExpertise(requirement.getService());
				for (Company company : sellerCompanyList) {
					sellerCompanyIds.add(company.getCompanyId());
				}
			} else if (requirement.getSellerPrefrences().equalsIgnoreCase(Constants.PREVIOUSLY_ENGAGED)) {
				 List<Object[]> previousEngagedSellers = requirementDao.getPreviousEngagedSellerList(requirement.getCompanyId());
			     sellerCompanyIds.addAll(previousEngagedSellers.stream().map(seller -> (Integer) seller[0]).collect(Collectors.toList()));
			}
			sellerList = accountDao.getAllSellerAccountsByCompanyIds(sellerCompanyIds);
			List<RequirementSeller> requirementSellerList = new ArrayList<>();
			List<Notification> listOfNotifications = new ArrayList<>();
			for (Account account : sellerList) {
				
				//Creating Notificaiton for sellers
				Notification notification = new Notification();
				notification.setAddedFor(account.getUserId());
				notification.setTitle("A new request for quotation (RFQ) for "+requirement.getRequirementNo()+" has been sent your way!");
				notification.setCreatedOn(todayDate);
				notification.setIsRead(false);
				listOfNotifications.add(notification);
				//End Creating Notifications For Sellers
				RequirementSeller seller = new RequirementSeller();
				seller.setSellerCompanyId(account.getCompanyId());
				seller.setDateAdded(todayDate);
				seller.setReqId(requirement.getId());
				seller.setIsFinalised(false);
				seller.setIsInvitedByBuyer(false);
				seller.setIsRejected(false);
				seller.setIsSavedByBuyer(false);
				seller.setIsSellerInterested(false);
				seller.setIsShortlisted(false);
				seller.setIsSellerNotInterested(false);
				seller.setIsBuyerSignedNda(false);
				seller.setIsSellerSignedNda(false);
				seller.setIsNdaSendForSign(false);
				requirementSellerList.add(seller);
				sendSellerEmailNewRequirement(account.getFullName(), account.getEmailId(), requirement.getRequirementNo());
			}
			//Bulk Saving Notifications
			notificationDao.saveBulkNotification(listOfNotifications);
			requirementSellerDao.bulkSave(requirementSellerList);
			
		} else {
			RequirementSeller requirementSeller = requirementSellerDao
					.getAllRequirementSellersByReqId(requirement.getId(), null).get(0);
			Integer selllerCompanyId = requirementSeller.getSellerCompanyId();
			requirementSeller.setDateAdded(todayDate);
			requirementSellerDao.update(requirementSeller);
			Account account = accountDao.getAccountByCompanyId(selllerCompanyId);
			//Creating Notificaiton for sellers
			Notification notification = new Notification();
			notification.setAddedFor(account.getUserId());
			notification.setTitle("A new request for quotation (RFQ) for "+requirement.getRequirementNo()+" has been sent your way!");
			notification.setCreatedOn(todayDate);
			notification.setIsRead(false);
			notificationDao.save(notification);
			sendSellerEmailNewRequirement(account.getFullName(), account.getEmailId(), requirement.getRequirementNo());
		}
		
	}
	
	private void sendSellerEmailNewRequirement(String name, String email, String reqNo) {
		logger.info("sending sendSellerEmailNewRequirement email to" + email);
		List<String> linesList = new ArrayList<>();	
			String line1 = "Great news! A new project opportunity has landed in your account! A buyer has posted a request for quotation (RFQ) for "+reqNo+" on Cnerzy. Please log in to your account to review and respond to the RFQ.";
			linesList.add(line1);
		try {
			emailSender.sendEmail("New Project Opportunity: "+reqNo+" on Cnerzy",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent sendSellerEmailNewRequirement email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	private void sendBuyerEmailForRejectedRequirement(String name, String email) {
		logger.info("sending sendBuyerEmailForRejectedRequirement email to" + email);
		List<String> linesList = new ArrayList<>();	
			String line1 = "We regret to inform you that your recently posted requirement has not been approved by our admin team at this time.";
			linesList.add(line1);
		try {
			emailSender.sendEmail("Update on Your Posted Requirement",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent sendBuyerEmailForRejectedRequirement email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	private void sendBuyerEmailApprovedRequirement(String name, String email, String reqNo) {
		logger.info("sending sendBuyerEmailApprovedRequirement email to" + email);
		List<String> linesList = new ArrayList<>();	
			String line1 = "We are pleased to inform you that your requirement has been approved. Your Requirement ID is "+reqNo+".";
			String line2 = "You can now get an overview of your project on your dashboard. Please shortlist sellers you are interested in working with and contact them for proposal discussions.";

			linesList.add(line1);
			linesList.add(line2);
		try {
			emailSender.sendEmail("Great News! Your Requirement on Cnerzy is Approved!",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent sendBuyerEmailApprovedRequirement email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<SellerInfoModel> getIntimatedSellerListByReqId(Integer requirementId) {
		List<RequirementSeller> requirementSellerList = requirementSellerDao
				.getAllRequirementSellersByReqId(requirementId, null);
		List<SellerInfoModel> sellerInfoList = new ArrayList<>();
		for (RequirementSeller requirementSeller : requirementSellerList) {
			sellerInfoList.add(convertRequirementSellerToSellerInfo(requirementSeller));
		}
		return sellerInfoList;
	}

	private SellerInfoModel convertRequirementSellerToSellerInfo(RequirementSeller requirementSeller) {
		SellerInfoModel sellerInfoModel = new SellerInfoModel();
		if (requirementSeller.getIsRejected()) {
			sellerInfoModel.setStatus("Rejected");
		} else if (requirementSeller.getIsSellerNotInterested()) {
			sellerInfoModel.setStatus("Not Interested");
		} else if (requirementSeller.getIsFinalised()) {
			sellerInfoModel.setStatus("Finalised");
		} else if (requirementSeller.getIsShortlisted()) {
			sellerInfoModel.setStatus("Shortlisted");
		}  else if (requirementSeller.getIsSellerInterested()) {
			sellerInfoModel.setStatus("Interested");
		} else {
			sellerInfoModel.setStatus("Pending");
		}
		return addSellerInfoToModel(sellerInfoModel, requirementSeller.getSellerCompanyId(), false);
	}

	@Override
	public SellerInfoModel addSellerInfoToModel(SellerInfoModel sellerInfoModel, Integer sellerCompanyId,
			boolean isDetailed) {
		try {
			Company company = companyDao.getCompanyWithId(sellerCompanyId);
			sellerInfoModel.setCompanyIndustry(company.getCompanyIndustry());
			sellerInfoModel.setCompanyExpertise(company.getIndustryExpertise());
			sellerInfoModel.setCompanyName(company.getCompanyName());
			sellerInfoModel.setLinkedInProfile(company.getCompanyLinkedIn());
			sellerInfoModel.setSellerCompanyId(sellerCompanyId);
			Address address = addressDao.getAddressByCompanyId(company.getCompanyId());
			if (address != null) {
				String location = (address.getState() != null ? address.getState() : "") + ", "
						+ (address.getCountry() != null ? address.getCountry() : "");
				sellerInfoModel.setLocation(location);
			} else {
				sellerInfoModel.setLocation("N/A");
			}

			sellerInfoModel.setNumberOfProjectsCompleted(
					projectDao.getCountOfCompletedProjectsBySellerCompoanyId(company.getCompanyId()));
			List<String> namesList = Arrays.asList(Constants.COMPANY_PROJECT_CASE_STUDY, Constants.COMPANY_LOGO);
			List<CompanyDocument> companyDocuments = companyDocumentDao
					.getDocumentByCompanyIdAndNameList(sellerCompanyId, namesList);

			for (CompanyDocument companyLogoDoc : companyDocuments) {
				switch (companyLogoDoc.getDocName()) {
				case Constants.COMPANY_LOGO:
					if (companyLogoDoc != null && !StringUtil.isNullOrEmpty(companyLogoDoc.getDocPath())) {

						sellerInfoModel.setComapnyLogoUrl(companyLogoDoc.getDocPath());
					} else {
						sellerInfoModel.setComapnyLogoUrl("");
					}
					break;
				default:
					break;
				}
			}

			if (isDetailed) {
				Map<String, Long> countResult = requirementSellerDao.getSellerRequirementCounts(sellerCompanyId);
				sellerInfoModel.setTotalRFQParticipated(countResult.get("interestedCount"));
				sellerInfoModel.setTotalRFQSent(countResult.get("totalRequirementSent"));

				List<String> projectCaseStudies = new ArrayList<>();
				for (CompanyDocument projectCaseStudy : companyDocuments) {
					switch (projectCaseStudy.getDocName()) {
					case Constants.COMPANY_PROJECT_CASE_STUDY:
						if (projectCaseStudy != null && !StringUtil.isNullOrEmpty(projectCaseStudy.getDocPath())) {
							projectCaseStudies.add(projectCaseStudy.getDocPath());
						}
						break;
					default:
						break;
					}
				}
				sellerInfoModel.setProjectCaseStudies(projectCaseStudies);

			}

			// TODO Update Rating Later
			Map<String, Object> ratingMap = ratingDao.getRatingStatsForCompany(sellerCompanyId);
			sellerInfoModel.setRatings((Double) ratingMap.get("averageRating"));
			sellerInfoModel.setNumberOfRatings((Long) ratingMap.get("ratingCount"));
			return sellerInfoModel;
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("Error in Filling SellerInfoModel Data:" + e.getLocalizedMessage());
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> getRequirementSellerListBySellerId(String sellerId) {
		Account account = accountDao.getAccountBasedOnId(Integer.parseInt(sellerId));
		List<RequirementSeller> requirementSellerList = requirementSellerDao
				.getSellerRequirementListBySellerCompanyId(account.getCompanyId());
		List<Map<String, Object>> requirementSellerMapList = new ArrayList<>();
		for (RequirementSeller requirementSeller : requirementSellerList) {
			Map<String, Object> map = new HashMap<>();
			map.put("id", requirementSeller.getId());
			Requirement requirement = requirementDao.getRequirementById(requirementSeller.getReqId());
			map.put("requirementId", requirement.getId());
			map.put("requirementNo", requirement.getRequirementNo());
			map.put("title", requirement.getTitle());
			map.put("reqStatus", requirement.getStatus());
			map.put("buyerName", requirement.getAddedBy());
			map.put("buyerCid", requirement.getCompanyId());
			map.put("createdOnLocal", requirement.getDateAdded().toLocaleString());
			map.put("createdOn", requirement.getDateAdded().toString());
			map.put("isShotlisted", requirementSeller.getIsShortlisted());

			Address address = addressDao.getAddressByCompanyId(requirement.getCompanyId());
			if (address != null) {
				String location = (address.getState() != null ? address.getState() : "") + ", "
						+ (address.getCountry() != null ? address.getCountry() : "");
				map.put("location", location);
			} else {
				map.put("location", "N/A");
			}
			if (requirementSeller.getIsSellerInterested()) {
				if (requirementSeller.getIsRejected() || requirementSeller.getIsSellerWithdrawn()) {
					map.put("status", "Lost");
				} else if (requirementSeller.getIsFinalised()) {
					map.put("status", "Won");
				} else {
					map.put("status", "Interested");
				}
			} else {
				map.put("status", "In Review");
			}
			map.put("isNdaSendForSign", requirementSeller.getIsNdaSendForSign());
			map.put("isBuyerSignedNda", requirementSeller.getIsBuyerSignedNda());
			map.put("isSellerSignedNda", requirementSeller.getIsSellerSignedNda());
			requirementSellerMapList.add(map);
		}
		return requirementSellerMapList;
	}

	@Override
	public void changeInterestInRequirement(Map<String, String> request) {
		RequirementSeller requirementSeller = requirementSellerDao
				.getRequirementSellerId(Integer.parseInt(request.get("id")));
		Boolean interested = request.get("interested").equalsIgnoreCase("true");
		if (interested) {
			if (request.get("reqStatus").equalsIgnoreCase("Approved")) {
				Integer reqId = Integer.valueOf(request.get("reqId"));
				if (reqId != null) {
					requirementDao.updateRequirementStatus(reqId, RequirementStatus.RECOMMENDED_SELLER);
				
				}
			}
			requirementSeller.setIsSellerInterested(true);
			requirementSeller.setIsSellerNotInterested(false);
			requirementSeller.setSellerInterestedOn(new Date());
		} else {
			requirementSeller.setIsSellerInterested(false);
			requirementSeller.setIsSellerNotInterested(true);
		}
		requirementSellerDao.update(requirementSeller);
	}

	@Override
	public List<SellerInfoModel> getRecommendedSellerListByReqId(Integer reqId) {
		List<RequirementSeller> requirementSellerList = requirementSellerDao.getAllRequirementSellersByReqId(reqId,
				Constants.INTERESTED_SELLER);
		List<SellerInfoModel> sellerInfoList = new ArrayList<>();
		for (RequirementSeller requirementSeller : requirementSellerList) {
			SellerInfoModel sellerInfoModel = addSellerInfoToModel(new SellerInfoModel(),
					requirementSeller.getSellerCompanyId(), true);
			sellerInfoModel.setSavedByBuyer(requirementSeller.getIsSavedByBuyer());
			sellerInfoModel.setNdaSendForSign(requirementSeller.getIsNdaSendForSign());
			sellerInfoModel.setBuyerSignedNda(requirementSeller.getIsBuyerSignedNda());
			sellerInfoModel.setSellerSignedNda(requirementSeller.getIsSellerSignedNda());
			sellerInfoModel.setRejected(requirementSeller.getIsRejected());
			sellerInfoModel.setDateAdded(requirementSeller.getDateAdded());
			sellerInfoModel.setFinalised(requirementSeller.getIsFinalised());
			sellerInfoModel.setInterestedOn(requirementSeller.getSellerInterestedOn());
			sellerInfoModel.setSellerWithdrawn(requirementSeller.getIsSellerWithdrawn());
			sellerInfoList.add(sellerInfoModel);
		}
		return sellerInfoList;
	}

	@Override
	public List<SellerInfoModel> getShortlistedSellerListByReqId(Integer reqId) {
		List<RequirementSeller> requirementSellerList = requirementSellerDao.getAllRequirementSellersByReqId(reqId,
				Constants.SHORTLISTED_SELLER);
		List<SellerInfoModel> sellerInfoList = new ArrayList<>();
		for (RequirementSeller requirementSeller : requirementSellerList) {
			SellerInfoModel sellerInfoModel = addSellerInfoToModel(new SellerInfoModel(),
					requirementSeller.getSellerCompanyId(), true);
			sellerInfoModel.setRejected(requirementSeller.getIsRejected());
			sellerInfoModel.setSellerWithdrawn(requirementSeller.getIsSellerWithdrawn());
			sellerInfoModel.setFinalised(requirementSeller.getIsFinalised());
			sellerInfoModel
					.setStatus(requirementSeller.getIsBuyerSignedNda() && requirementSeller.getIsSellerSignedNda()
							&& requirementSeller.getIsNdaSendForSign() ? "NDA Recieved" : "Awaiting");
			sellerInfoList.add(sellerInfoModel);
		}
		return sellerInfoList;
	}

	@Override
	public List<SellerInfoModel> getFinalizedSellerListByReqId(Integer reqId) {
		List<RequirementSeller> requirementSellerList = requirementSellerDao.getAllRequirementSellersByReqId(reqId,
				Constants.FINALIZED_SELLER);
		List<SellerInfoModel> sellerInfoList = new ArrayList<>();
		for (RequirementSeller requirementSeller : requirementSellerList) {
			SellerInfoModel sellerInfoModel = addSellerInfoToModel(new SellerInfoModel(),
					requirementSeller.getSellerCompanyId(), true);
			sellerInfoList.add(sellerInfoModel);
		}
		return sellerInfoList;
	}

	@Override
	public HashMap<String, Object> finalizeSellerForReqId(RequirementChatModel reqChatModel) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<RequirementSeller> requirementSellerList = requirementSellerDao
					.getAllRequirementSellersByReqId(reqChatModel.getReqId(), null);
			for (RequirementSeller requirementSeller : requirementSellerList) {
				if (requirementSeller.getSellerCompanyId().equals(reqChatModel.getAddedForCid())) {
					requirementSeller.setIsFinalised(true);
					//Creating Notification
					Notification notification = new Notification();
					notification.setAddedForAdmin(true);
					notification.setTitle("The buyer has chosen a seller for the requirement "+reqChatModel.getReqUniqueCode()+". You can view the selected seller and project details from the contracts.");
					notification.setCreatedOn(new Date());
					notification.setIsRead(false);
					notificationDao.save(notification);
				} else {
					if (requirementSeller.getIsShortlisted() && requirementSeller.getIsNdaSendForSign()
							&& requirementSeller.getIsBuyerSignedNda() && requirementSeller.getIsSellerSignedNda()) {
						requirementSeller.setIsRejected(true);
					}
				}
			}

			requirementSellerDao.bulkSave(requirementSellerList);
			response.put("isSellerFinalized", "true");
		} catch (Exception e) {
			response.put("isSellerFinalized", "false");
			response.put("error in finalizing seller", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> saveSellerForReqId(Map<String, Integer> dataMap) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response.put("status", "false");
			Integer reqId = dataMap.get("reqId");
			Integer sellerCompanyId = dataMap.get("sellerCompanyId");
			RequirementSeller requirementSeller = requirementSellerDao.getRequirementSellerByReqIdAndSellerCid(reqId,
					sellerCompanyId);
			if (requirementSeller != null) {
				if (requirementSeller.getIsSavedByBuyer()) {
					requirementSeller.setIsSavedByBuyer(false);
				} else {
					requirementSeller.setIsSavedByBuyer(true);
				}
				requirementSellerDao.update(requirementSeller);
				response.put("status", "true");
			}
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> rejectSellerForReqId(Map<String, String> dataMap) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response.put("status", "false");
			Integer reqId = Integer.valueOf(dataMap.get("reqId"));
			Integer sellerCompanyId = Integer.valueOf(dataMap.get("addedForCid"));
			RequirementSeller requirementSeller = requirementSellerDao.getRequirementSellerByReqIdAndSellerCid(reqId,
					sellerCompanyId);
			if (requirementSeller != null) {
				requirementSeller.setIsRejected(true);
				requirementSeller.setRejectionReason(dataMap.get("rejectionReason"));
				requirementSellerDao.update(requirementSeller);
				response.put("status", "true");
			}
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, Object> sellerWithdrawnForReqId(Map<String, String> dataMap) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			response.put("status", "false");
			Integer reqId = Integer.valueOf(dataMap.get("reqId"));
			Integer sellerCompanyId = Integer.valueOf(dataMap.get("sellerCompanyId"));
			RequirementSeller requirementSeller = requirementSellerDao.getRequirementSellerByReqIdAndSellerCid(reqId,
					sellerCompanyId);
			if (requirementSeller != null) {
				requirementSeller.setIsSellerWithdrawn(true);
				requirementSeller.setRejectionReason(dataMap.get("rejectionReason"));
				requirementSellerDao.update(requirementSeller);
				response.put("status", "true");
			}
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public BuyerInfoModel getBuyerProfileData(Integer buyerCompanyId) {
		try {
			BuyerInfoModel buyerInfoModel = new BuyerInfoModel();
			Company company = companyDao.getCompanyWithId(buyerCompanyId);
			buyerInfoModel.setCompanyIndustry(company.getCompanyIndustry());
			buyerInfoModel.setCompanyName(company.getCompanyName());
			buyerInfoModel.setLinkedInProfile(company.getCompanyLinkedIn());
			buyerInfoModel.setBuyerCompanyId(buyerCompanyId);

			Address address = addressDao.getAddressByCompanyId(company.getCompanyId());
			if (address != null) {
				String location = (address.getState() != null ? address.getState() : "") + ", "
						+ (address.getCountry() != null ? address.getCountry() : "");
				buyerInfoModel.setLocation(location);
			} else {
				buyerInfoModel.setLocation("N/A");
			}

			buyerInfoModel.setNumberOfProjectsCompleted(
					projectDao.getCountOfCompletedProjectsByBuyerCompanyId(company.getCompanyId()));

			CompanyDocument companyLogoDoc = companyDocumentDao.getDocumentByCompanyIdAndName(company.getCompanyId(),
					Constants.COMPANY_LOGO);

			if (companyLogoDoc != null && !StringUtil.isNullOrEmpty(companyLogoDoc.getDocPath())) {
				buyerInfoModel.setComapnyLogoUrl(companyLogoDoc.getDocPath());
			} else {
				buyerInfoModel.setComapnyLogoUrl("");
			}

			Map<String, Object> ratingMap = ratingDao.getRatingStatsForCompany(buyerCompanyId);
			buyerInfoModel.setRatings((Double) ratingMap.get("averageRating"));
			buyerInfoModel.setNumberOfRatings((Long) ratingMap.get("ratingCount"));

			return buyerInfoModel;
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("Error in Filling BuyerInfoModel Data:" + e.getLocalizedMessage());
			return null;
		}
	}

	@Override
	public void sendNdaForSign(Integer reqId, Integer sellerCompanyId) throws JsonProcessingException {
		Requirement req = requirementDao.getRequirementById(reqId);
		Account seller = accountDao.getAccountByCompanyId(sellerCompanyId);
		Account buyer = accountDao.getAccountByCompanyId(req.getCompanyId());
		ZohoDocSignModel ndaSignModel = new ZohoDocSignModel();
		ndaSignModel.setBuyerEmail(buyer.getEmailId());
		ndaSignModel.setBuyerName(buyer.getFullName());
		ndaSignModel.setSellerEmail(seller.getEmailId());
		ndaSignModel.setSellerName(seller.getFullName());
		String zohoDocumentId = zohoSignService.sendNdaForSign(ndaSignModel);
		RequirementSeller requirementSeller = requirementSellerDao.getRequirementSellerByReqIdAndSellerCid(reqId,
				sellerCompanyId);
		requirementSeller.setZohoDocumentId(zohoDocumentId);
		requirementSeller.setIsNdaSendForSign(true);
		requirementSellerDao.update(requirementSeller);
		sendNDASignEmail(buyer.getFullName(), buyer.getEmailId(), buyer.getUserRole(), req.getRequirementNo());
		sendNDASignEmail(seller.getFullName(), seller.getEmailId(), seller.getUserRole(), req.getRequirementNo());
	}
	
	private void sendNDASignEmail(String name, String email, String userRole, String reqNo) {
		logger.info("sending nda sign email to" + email);
		List<String> linesList = new ArrayList<>();	
		if(userRole.equals(USER_ROLES.BUYER)){
			String line1 = "We are happy to see that you have identified/ shortlisted the sellers whom you could work with on your requirements. To proceed, please sign the Non-Disclosure Agreement (NDA) for your Requirement ID "+reqNo+" with them before you discuss more on the requirements.";
			String line2 = "Signing the NDA ensures the confidentiality of sensitive information shared between you and the sellers. Once the NDA is signed, you can proceed with requirement discussions and share confidential information securely.";
			linesList.add(line1);
			linesList.add(line2);
		}else if (userRole.equals(USER_ROLES.SELLER)) {
			String line1 = "Great news! You have been shortlisted by a buyer. To proceed, please sign and upload the Non-Disclosure Agreement (NDA) for the project "+reqNo+".";
			String line2 = "Signing the NDA ensures the confidentiality of sensitive information. Please proceed to sign the agreement using the link provided.";
			linesList.add(line1);
			linesList.add(line2);
		}
		try {
			emailSender.sendEmail("Important Action Required: Sign the NDA for "+reqNo+" on Cnerzy",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent nda sign email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, Date> getTimelineByReqId(Integer reqId, String userRole, Integer companyId) {
		RequirementTimeline requirementTimeline = requirementTimelineDao.getRequirementTimelineByReqId(reqId);
		Map<String, Date> respMap = new HashMap<>();
		RequirementSeller seller = null;
		if (userRole.equals(USER_ROLES.SELLER)) {
			seller = requirementSellerDao
					.getRequirementSellerByReqIdAndSellerCid(reqId, companyId);
			respMap.put("Requirement Intimation", seller.getDateAdded());
		} else if (userRole.equals(USER_ROLES.BUYER)||userRole.equals(USER_ROLES.ADMIN)) {
			respMap.put("Requirement Posted", requirementTimeline.getPostedDate());
			respMap.put("Requirement Approved", requirementTimeline.getApprovedDate());
			respMap.put("Sellers Shortlisted", requirementTimeline.getSellerShortlistedDate());
		}
		respMap.put("Discussion Initiated", requirementTimeline.getDiscussionInitiatedDate());
		respMap.put("Negotiations", requirementTimeline.getNegotiationStartedDate());
		if (userRole.equals(USER_ROLES.SELLER)) {
			respMap.put("Discussion Initiated", seller.getSellerNdaSignedDate());
			respMap.put("Negotiations", seller.getSellerNegotiationStartDate());
		}
		respMap.put("Contract Issued", requirementTimeline.getContractIssuedDate());
		respMap.put("Project Kickoff", requirementTimeline.getProjectKickoffDate());
		return respMap;
	}

	@Override
	public Requirement getRequirementById(Integer reqId) {
		return requirementDao.getRequirementById(reqId);
	}

	@Override
	public void updateRequirement(Requirement requirement) {
		requirementDao.update(requirement);

	}

	@Override
	public HashMap<String, Object> getContractsForAdmin() {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<Requirement> requirements = requirementDao.getContractsForAdmin();
			System.out.println(requirements);
			if (!requirements.isEmpty()) {
				List<Integer> reqIds = new ArrayList<>();
				System.out.println("IDS " +reqIds);
				for (Requirement requirement : requirements) {
					reqIds.add(requirement.getId());
					
				}
				List<Project> projectsList = projectDao.getAllProjectsByReqIdList(reqIds);
				Map<Integer, Integer> projectsListMap = new HashMap<>();
				if (!projectsList.isEmpty()) {
					System.out.println("projectList " +projectsList);
					for (Project project : projectsList) {
						projectsListMap.put(project.getReqId(), project.getManagerId());
					}
				}

				List<RequirementSeller> finalizedSellers = requirementSellerDao
						.getAllFinalizedRequirementSellersByReqIds(reqIds);
				// Fetching seller in one go
				Map<Integer, Integer> sellerMap = new HashMap<>();
				if (!finalizedSellers.isEmpty()) {
					for (RequirementSeller finalizedSeller : finalizedSellers) {
						sellerMap.put(finalizedSeller.getReqId(), finalizedSeller.getSellerCompanyId());
					}
				}

				List<Map<String, Object>> requirementList = new ArrayList<>();
				for (Requirement requirement : requirements) {
					Map<String, Object> requirementMap = new HashMap<>();
					requirementMap.put("id", requirement.getId());
					requirementMap.put("requirementNo", requirement.getRequirementNo());
					requirementMap.put("title", requirement.getTitle());
					requirementMap.put("buyerCid", requirement.getCompanyId());
					requirementMap.put("sellerCid", sellerMap.get(requirement.getId()));
					requirementMap.put("buyerName", requirement.getAddedBy());
					requirementMap.put("createdOn", requirement.getDateAdded());
					Address address = addressDao.getAddressByCompanyId(requirement.getCompanyId());
					if (address != null) {
						String location = (address.getState() != null ? address.getState() : "") + ", "
								+ (address.getCountry() != null ? address.getCountry() : "");
						requirementMap.put("location", location);
					} else {
						requirementMap.put("location", "N/A");
					}
					requirementMap.put("status",
							requirement.getStatus().equals(RequirementStatus.PURCHASE_ORDER_RELEASE) ? "In Review"
									: "Project Execution");

					requirementMap.put("managerId",	projectsListMap.get(requirement.getId()));

					requirementList.add(requirementMap);
				}
				response.put("data", requirementList);
			} else {
				response.put("data", "requirements empty");
			}
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

	@Override
	public HashMap<String, String> adminIntiateProject(Map<String, String> dataMap) {
		HashMap<String, String> response = new HashMap<>();
		try {
			response.put("status", "false");
			Integer reqId = Integer.valueOf(dataMap.get("reqId"));
			BigDecimal budgetAmount = new BigDecimal(dataMap.get("budgetAmount"));
			BigDecimal totalPrice = new BigDecimal(dataMap.get("totalPrice"));
			Requirement requirement = requirementDao.getRequirementById(reqId);
			requirement.setStatus(RequirementStatus.PROJECT_KICKOFF);
			requirementDao.update(requirement);
			RequirementTimeline requirementTimeline = requirementTimelineDao.getRequirementTimelineByReqId(reqId);
			requirementTimeline.setProjectKickoffDate(new Date());
			requirementTimelineDao.update(requirementTimeline);
			Project project = projectDao.getProjectByReqId(reqId);
			project.setBudget(budgetAmount);
			project.setTotalProjctPrice(totalPrice);
			project.setInitiatedBy("ADMIN");
			project.setInitiationDate(new Date());
			projectDao.update(project);
			createNotificationForIntiateProject(requirement, project);
			sendProjectIntiateEmail(project);
			sendTripartiteDocForSign(project);
			response.put("status", "true");
			response.put("projectName", project.getReqUniqueCode());
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}
	
	private void sendTripartiteDocForSign(Project project) throws JsonProcessingException {
		Account buyerAccount = accountDao.getAccountByCompanyId(project.getBuyerCompanyId());
		Account sellerAccount = accountDao.getAccountByCompanyId(project.getSellerCompanyId());
		ZohoDocSignModel tripartiteSignModel = new ZohoDocSignModel();
		tripartiteSignModel.setBuyerEmail(buyerAccount.getEmailId());
		tripartiteSignModel.setBuyerName(buyerAccount.getFullName());
		tripartiteSignModel.setSellerEmail(sellerAccount.getEmailId());
		tripartiteSignModel.setSellerName(sellerAccount.getFullName());
		String zohoDocumentId = zohoSignService.sendTripartiteDocForSign(tripartiteSignModel);
		project.setZohoTripartiteDoCId(zohoDocumentId);
		projectDao.update(project);
		sendTripartiteSignEmail(buyerAccount.getFullName(), buyerAccount.getEmailId(), buyerAccount.getUserRole(), project.getReqUniqueCode());
		sendTripartiteSentNotification(buyerAccount.getUserId(), project.getReqUniqueCode());
		sendTripartiteSignEmail(sellerAccount.getFullName(), sellerAccount.getEmailId(), sellerAccount.getUserRole(), project.getReqUniqueCode());
		sendTripartiteSentNotification(sellerAccount.getUserId(), project.getReqUniqueCode());
	}
	
	private void sendTripartiteSentNotification(Integer accountId, String projectCode) {
		Notification notification = new Notification();
		notification.setAddedFor(accountId);
		notification.setTitle("A new document, Tripartite Agreement, has been uploaded by the admin. Sign and upload the tripartite agreement to initiate the project "+projectCode +"." );
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
	}
	
	private void sendTripartiteSignEmail(String name, String email, String userRole, String projectCode) {
		logger.info("sending Tripartite sign email to" + email);
		List<String> linesList = new ArrayList<>();	
		if(userRole.equals(USER_ROLES.BUYER)){
			String line1 = "We are pleased to inform you that your requirement "+projectCode+" is ready to begin. Please sign and upload the Tripartite Agreement to commence your project .";
			String line2 = "Signing the Tripartite Agreement will initiate your project and ensure all parties are aligned on project terms and conditions.";
			linesList.add(line1);
			linesList.add(line2);
		}else if (userRole.equals(USER_ROLES.SELLER)) {
			String line1 = "Congratulations! The proposal for "+projectCode+" has been approved . To initiate the project execution, please sign and upload the Tripartite Agreement.";
			String line2 = "Signing the Tripartite Agreement will initiate your project and ensure all parties are aligned on project terms and conditions.";
			linesList.add(line1);
			linesList.add(line2);
		}
		try {
			emailSender.sendEmail("Cnerzy - Project Ready to Start: Sign the Tripartite Agreement for "+projectCode,
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent Tripartite sign email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	private void sendProjectIntiateEmail(Project project) {
		logger.info("inside sendProjectIntiateEmail email to");
		Account account = accountDao.getAccountByCompanyId(project.getBuyerCompanyId());
		logger.info("sending sendProjectIntiateEmail email to" + account.getEmailId());
		List<String> linesList = new ArrayList<>();

		String line1 = "We are excited to inform you that your project has been initiated. Your project ID is "
				+ project.getReqUniqueCode() + ".";
		String line2 = "The seller has started work on the project, and you can track progress updates in real-time on your dashboard.";

		linesList.add(line1);
		linesList.add(line2);
		try {

			emailSender.sendEmail(
					"Congratulations! Your Project, " + project.getReqUniqueCode() + ", is Now Underway on Cnerzy!",
					EmailBody.generateHtmlEmail(account.getFullName(), linesList),
					new String[] { account.getEmailId() }, null, null, "Cnerzy", null);
			logger.info("sent sendProjectIntiateEmail email to" + account.getEmailId());
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@Async
	private void createNotificationForIntiateProject(Requirement requirement, Project project) {
		RequirementSeller requirementSeller = requirementSellerDao.getAllRequirementSellersByReqId(requirement.getId(), Constants.FINALIZED_SELLER).get(0);
		List<Integer> accountCompanyIds= new ArrayList<>();
		accountCompanyIds.add(requirementSeller.getSellerCompanyId());
		accountCompanyIds.add(requirement.getCompanyId());
		List<Account> accounts = accountDao.getAllAccountsByCompanyIds(accountCompanyIds);
		for(Account account: accounts) {
			Notification notification = new Notification();
			notification.setAddedFor(account.getUserId());
			if(account.getUserRole().equals(USER_ROLES.BUYER)) {
			notification.setTitle("Congratulations! Your project, "+project.getReqUniqueCode()+" , has been initiated");
			}else {
				notification.setTitle("Great news! The project "+project.getReqUniqueCode()+" has been initiated. You can now access project details, and track progress updates within Cnerzy.");

			}
			notification.setCreatedOn(new Date());
			notification.setIsRead(false);
			notificationDao.save(notification);
		}
	}

	@Override
	public HashMap<String, String> adminAppointPMForProject(Map<String, String> dataMap) {
		HashMap<String, String> response = new HashMap<>();
		try {
			response.put("status", "false");
			Date nowDate = new Date();
			Integer reqId = Integer.valueOf(dataMap.get("reqId"));
			Integer pmId = Integer.valueOf(dataMap.get("pmId"));
			Project project = projectDao.getProjectByReqId(reqId);
			if (project == null) {
				response.put("message", "No Project Found");
				return response;
			}
			project.setPmAssignDate(nowDate);
			project.setManagerId(pmId);
			projectDao.update(project);
			//Creating Notification
			Notification notification = new Notification();
			notification.setAddedFor(pmId);
			notification.setTitle("Congratulations! You've been assigned to manage the project "+project.getReqUniqueCode()+".");
			notification.setCreatedOn(new Date());
			notification.setIsRead(false);
			notificationDao.save(notification);
			//Set Project Timeline
			ProjectTimeline projectTimeline = projectTimelineDao.getProjectTimelineByProjectId(project.getId());
			projectTimeline.setPmAssignedDate(nowDate);
			projectTimelineDao.update(projectTimeline);
			sendPMAppointEmail(project);
			response.put("status", "true");
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}
	
	@Async
	private void sendPMAppointEmail(Project project) {
		logger.info("inside sendPMAppointEmail email to");
		Account pmAccount = accountDao.getAccountBasedOnId(project.getManagerId());
		List<Account> accounts = accountDao.getAllAccountsByCompanyIds(Arrays.asList(project.getBuyerCompanyId(),project.getSellerCompanyId()));
		accounts.add(pmAccount);
		List<Notification> notifications= new ArrayList<>();
		for(Account account:accounts) {
		logger.info("sending sendPMAppointEmail email to" + account.getEmailId());
		List<String> linesList = new ArrayList<>();	
		String subject ="Project Manager Assigned for Project ID "+project.getReqUniqueCode();
		if(!account.getUserRole().equals(USER_ROLES.PM)){
			String line1 = "We are pleased to inform you that Project Manager has been assigned to oversee the execution of your project with ID " + project.getReqUniqueCode() + ".";
			String line1PMDetails = "Project Manager Details:<br />Name: " + pmAccount.getFullName() + "<br />Email: " + pmAccount.getEmailId() + pmAccount.getMobileNumber()!=null?("<br /> Ph No: " + pmAccount.getMobileNumber() + "."):"";
			String line2 = "Your Project Manager will ensure smooth project execution and provide you with peace of mind throughout the process. Please feel free to reach out to him/her for any queries or concerns you may have.";

			linesList.add(line1);
			linesList.add(line1PMDetails);
			linesList.add(line2);
			Notification notification = new Notification();
			notification.setAddedFor(account.getUserId());
			notification.setTitle("Project Manager(" + pmAccount.getFullName() + ") has been assignment for your project id ("+project.getReqUniqueCode()+") and will monitor the project execution.");
			notification.setCreatedOn(new Date());
			notification.setIsRead(false);
			notifications.add(notification);
		}else {
			subject="New Project Assigned: You're in Charge of "+project.getReqUniqueCode()+" on Cnerzy!";
			String line1 = "We're excited to announce that you've been assigned to manage a new project: "+project.getReqUniqueCode()+" on Cnerzy!.";
			String line2 = "As next steps we would need you to log in into your dashboard and review the documentation and set up the necessary steps for a smooth project execution.";
			linesList.add(line1);
			linesList.add(line2);
		}
		try {
			
			emailSender.sendEmail(subject,
					EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
					null, "Cnerzy", null);
			logger.info("sent sendPMAppointEmail email to" + account.getEmailId());
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		}
		notificationDao.saveBulkNotification(notifications);
	}
	
	@Override
	public RequirementSeller getFinializedRequirementSeller(Integer reqId) {
	return	requirementSellerDao.getAllRequirementSellersByReqId(reqId, Constants.FINALIZED_SELLER).get(0);
	}
	
	@Override
	public RequirementSeller getSellerForRequirementWithNoNegotiation(Integer reqId, Integer sellerCId) {
	return	requirementSellerDao.getSellerForRequirementWithNoNegotiation(reqId, sellerCId);
	}
	
	@Override
	public RequirementSeller getRequirementSellerByZohoDocId(String zohoDocId) {
		return requirementSellerDao.getRequirementSellerByZohoDocId(zohoDocId);
	}
	
	@Override
	public void updateRequirementSeller(RequirementSeller requirementSeller) {
		 requirementSellerDao.update(requirementSeller);
	}

}
