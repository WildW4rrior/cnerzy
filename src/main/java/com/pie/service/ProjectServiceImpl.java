package com.pie.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.pie.dao.AccountDAO;
import com.pie.dao.AddressDao;
import com.pie.dao.CompanyDao;
import com.pie.dao.MilestoneDao;
import com.pie.dao.NotificationDao;
import com.pie.dao.ProjectDao;
import com.pie.dao.ProjectTimelineDao;
import com.pie.dao.RatingDao;
import com.pie.dao.RequirementDao;
import com.pie.dao.RequirementSellerDao;
import com.pie.dao.RequirementTimelineDao;
import com.pie.dto.FeeDTO;
import com.pie.dto.ItemDTO;
import com.pie.dto.PartyDTO;
import com.pie.dto.PartyInfoDTO;
import com.pie.dto.ScheduleDTO;
import com.pie.dto.TransactionDTO;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.Address;
import com.pie.entity.Company;
import com.pie.entity.Milestone;
import com.pie.entity.Notification;
import com.pie.entity.Project;
import com.pie.entity.ProjectTimeline;
import com.pie.entity.Rating;
import com.pie.entity.Requirement;
import com.pie.entity.RequirementSeller;
import com.pie.entity.RequirementTimeline;
import com.pie.util.Constants;
import com.pie.util.EmailSender;
import com.pie.util.NewDateFormatter;
import com.pie.util.USER_ROLES;

@Service
public class ProjectServiceImpl implements ProjectService {

	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);

	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private MilestoneDao milestoneDao;
	
	@Autowired
	private RequirementSellerDao requirementSellerDao;
	
	@Autowired
	private NotificationDao notificationDao;
	
	@Autowired
	private RequirementTimelineDao requirementTimelineDao;
	
	@Autowired
	private NewDateFormatter newDateFormatter;

	@Autowired
	private ProjectTimelineDao projectTimelineDao;

	@Autowired
	private RatingDao ratingDao;

	@Autowired
	private AddressDao addressDao;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private RequirementDao requirementDao;
	
	@Autowired
	private EscrowService escrowService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Environment environment;

	@Override
	public List<Map<String, Object>> getProjectsDataByCIdAndRole(Integer companyId, String userRole) {
		// accountId only for PM else companyID
		List<Project> projectsList = projectDao.getProjectListOfUserByIdAndRole(companyId, userRole);
		List<Map<String, Object>> respList = new ArrayList<>();
		for (Project project : projectsList) {
			Map<String, Object> map = new HashMap<>();
			map.put("id", project.getId());
			map.put("reqId", project.getReqId());
			map.put("reqUniqueCode", project.getReqUniqueCode());
			map.put("sellerCompanyId", project.getSellerCompanyId());
			map.put("buyerCompanyId", project.getBuyerCompanyId());
			map.put("totalPrice", project.getTotalProjctPrice());
			map.put("inEscrow", project.getAmountInEscrow()==null?BigDecimal.ZERO:project.getAmountInEscrow());
			map.put("milestonePaid", project.getAmountDisbursed()==null?BigDecimal.ZERO:project.getAmountDisbursed());
			map.put("isBuyerSignedTripartite", project.getIsBuyerSignedTripartite());
			map.put("isSellerSignedTripartite", project.getIsSellerSignedTripartite());
			map.put("sellerTripartiteDocSignDate", project.getSellerTripartiteSignedDate());
			if(project.getAmountDisbursed()!=null) {
				map.put("milestoneDue", project.getTotalProjctPrice().subtract(project.getAmountDisbursed()));
			} else {
				map.put("milestoneDue", project.getTotalProjctPrice());
			}
			map.put("pmId", project.getManagerId());
			map.put("createdOn", project.getCreationDate());
			map.put("isProjectIntiated", project.getInitiationDate()!= null ? "true" : "false");
			map.put("status", project.getActualCompletionDate() != null ? "Completed" : "In Review");
			map.put("isSingleEscrowTransaction", project.getIsSingleEscrowTransaction());
			if(project.getIsSingleEscrowTransaction()) {
				map.put("isBuyerSentPayment", project.getIsPaymentSent());
				map.put("isPaymentApproved", project.getIsPaymentApproved());
				map.put("isSellerSelectedDisbursementMethod", project.getIsDisbursementMethodSelected());
				map.put("escrowTransactionId", project.getEscrowTransactionId());
			}
			int noOfMilestonePaid = 0;
			int noOfMilestoneDue = 0;
			List<Milestone> milestones = milestoneDao.getMilestoneListByProjectId(project.getId());
			for(Milestone milestone : milestones) {
				if(!milestone.getIsActive()&&milestone.getMilestoneCompletionDateActual()!=null) {
					
					noOfMilestonePaid++;
				} else {
					noOfMilestoneDue++;
				}
				if((milestone.getIsPaymentDisbursed()==null ||(milestone.getIsPaymentDisbursed()!=null && !milestone.getIsPaymentDisbursed())) && !project.getIsSingleEscrowTransaction()) {
					map.put("isBuyerSentPayment", milestone.getIsPaymentSent());
					map.put("isPaymentApproved", milestone.getIsPaymentApproved());
					map.put("isSellerSelectedDisbursementMethod", milestone.getIsDisbursementMethodSelected());
					map.put("escrowTransactionId", milestone.getEscrowId());
					break;
				}
			}
			map.put("noOfMilestonePaid", noOfMilestonePaid);
			map.put("noOfMilestoneDue", noOfMilestoneDue);
			Company buyerCompany = null;
			Company sellerCompany = null;
			Account pmAccount = null;
			if (userRole.equals(USER_ROLES.BUYER)) {
				sellerCompany = companyDao.getCompanyWithId(project.getSellerCompanyId());
				pmAccount = accountDAO.getAccountBasedOnId(project.getManagerId());
				Address sellerAddress = addressDao.getAddressByCompanyId(project.getSellerCompanyId());
				map.put("sellerName", sellerCompany.getCompanyName());
				map.put("pmName", pmAccount != null ? pmAccount.getFullName() : "Not Assigned");
				map.put("sellerLocation", sellerAddress != null ? sellerAddress.getCountry() : "N/A");
				Account buyerAccount = accountDAO.getAccountByCompanyId(project.getBuyerCompanyId());
				map.put("isEscrowAccountVerified", buyerAccount.getEscrowVerificationStatus()!=null && buyerAccount.getEscrowVerificationStatus().equalsIgnoreCase("verified"));
			} else if (userRole.equals(USER_ROLES.SELLER)) {
				buyerCompany = companyDao.getCompanyWithId(project.getBuyerCompanyId());
				pmAccount = accountDAO.getAccountBasedOnId(project.getManagerId());
				Address buyerAddress = addressDao.getAddressByCompanyId(project.getBuyerCompanyId());
				map.put("buyerName", buyerCompany.getCompanyName());
				map.put("pmName", pmAccount != null ? pmAccount.getFullName() : "Not Assigned");
				map.put("buyerLocation", buyerAddress != null ? buyerAddress.getCountry() : "N/A");
				Account sellerAccount = accountDAO.getAccountByCompanyId(project.getSellerCompanyId());
				map.put("isEscrowAccountVerified", sellerAccount.getEscrowVerificationStatus()!=null && sellerAccount.getEscrowVerificationStatus().equalsIgnoreCase("verified"));
			} else if (userRole.equals(USER_ROLES.PM)) {
				buyerCompany = companyDao.getCompanyWithId(project.getBuyerCompanyId());
				sellerCompany = companyDao.getCompanyWithId(project.getSellerCompanyId());
				map.put("buyerName", buyerCompany.getCompanyName());
				map.put("sellerName", sellerCompany.getCompanyName());
			} else if (userRole.equals(USER_ROLES.ADMIN)) {
				buyerCompany = companyDao.getCompanyWithId(project.getBuyerCompanyId());
				sellerCompany = companyDao.getCompanyWithId(project.getSellerCompanyId());
				pmAccount = accountDAO.getAccountBasedOnId(project.getManagerId());
				map.put("buyerName", buyerCompany.getCompanyName());
				map.put("sellerName", sellerCompany.getCompanyName());
				map.put("pmName", pmAccount != null ? pmAccount.getFullName() : "Not Assigned");
			}

			respList.add(map);
		}
		return respList;
	}

	@Override
	public Map<String, Date> getTimelineByProjectId(Integer projectId, String userRole, Integer companyId) {
		ProjectTimeline projectTimeline = projectTimelineDao.getProjectTimelineByProjectId(projectId);
		Map<String, Date> respMap = new LinkedHashMap<>();
		respMap.put(userRole.equals(USER_ROLES.PM)==true?"Project Assigned":"Project Kick-off", projectTimeline.getKickOffDate());
		
		if(!userRole.equals(USER_ROLES.PM)) {
			respMap.put("Project Manager Assigned", projectTimeline.getPmAssignedDate());
		}
		if(userRole.equals(USER_ROLES.SELLER)||userRole.equals(USER_ROLES.BUYER)) {
			respMap.put("Escrow Account Created", projectTimeline.getEscrowInitiateDate());
		}
		
			List<Milestone> milestones = milestoneDao.getMilestoneListByProjectId(projectId);
			int counter = 1;
			for(Milestone milestone: milestones) {
				respMap.put("Milestone " + counter, milestone.getMilestoneCompletionDateActual());
				 counter++;
			}
		respMap.put("Project Completion", projectTimeline.getProjectCompletionDate());
		respMap.put("Review & Feedback", projectTimeline.getBuyerReviewFeedbackDate());
		if(userRole.equals(USER_ROLES.SELLER)) {
		respMap.put("Review & Feedback", projectTimeline.getSellerReviewFeedbackDate());
		}
		return respMap;
	}

	@Override
	public HashMap<String, Object> createFeedback(Map<String, Object> dataMap) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			List<Rating> ratings = new ArrayList<>();
			Integer projectId = (Integer) dataMap.get("projectId");
			Integer ratedByCid = (Integer) dataMap.get("ratedByCid");
			String addedBy = (String) dataMap.get("addedBy");
			Integer ratedForCid = (Integer) dataMap.get("ratedForCid");
			Date todayDate = new Date();
			String[] roles = { "buyer", "seller", "platform" };
			for (String role : roles) {
				if (dataMap.containsKey(role)) {
					Map<String, Object> roleMap = (Map<String, Object>) dataMap.get(role);
					for (Map.Entry<String, Object> categoryEntry : roleMap.entrySet()) {
						String category = categoryEntry.getKey();
						Map<String, String> ratingsMap = (Map<String, String>) categoryEntry.getValue();
						for (Map.Entry<String, String> ratingEntry : ratingsMap.entrySet()) {
							Rating rating = new Rating();
							rating.setAddedOn(todayDate);
							rating.setProjectId(projectId);
							rating.setRatedByCId(ratedByCid);
							if (!role.equals("platform")) {
								rating.setRatedForCId(ratedForCid);
							}
							rating.setAddedBy(addedBy);
							rating.setAddedFor(role.equals("platform") ? "Cnerzy"
									: (role.equals("buyer") ? USER_ROLES.BUYER : USER_ROLES.SELLER));
							rating.setRatingCategory(category);
							rating.setRatingDescription(ratingEntry.getKey());
							rating.setRatingValue(Integer.valueOf(ratingEntry.getValue()));
							ratings.add(rating);
						}
					}
				}
			}

			// Save all ratings in bulk
			ratingDao.saveAll(ratings);
			
			ProjectTimeline projectTimeline= projectTimelineDao.getProjectTimelineByProjectId(projectId);
			if(addedBy.equals(USER_ROLES.BUYER)) {
				projectTimeline.setBuyerReviewFeedbackDate(new Date());
			}else if (addedBy.equals(USER_ROLES.SELLER)) {
				projectTimeline.setSellerReviewFeedbackDate(new Date());
			}
			projectTimelineDao.update(projectTimeline);
			
			response.put("message", "Feedback created successfully");
			response.put("status", "true");

		} catch (Exception e) {
			response.put("message", e.getLocalizedMessage());
			response.put("status", "false");
		}
		return response;
	}

	@Override
	public Map<String, Object> getFeedbackByProjectId(Integer projectId) {
		List<Rating> ratings = ratingDao.getRatingsByProjectId(projectId);
		Map<String, Object> feedbackMap = new HashMap<>();

		Map<String, Map<String, Map<String, Integer>>> buyerFeedback = new HashMap<>();
		Map<String, Map<String, Map<String, Integer>>> sellerFeedback = new HashMap<>();

		for (Rating rating : ratings) {
			String addedBy = rating.getAddedBy();
			String ratingCategory = rating.getRatingCategory();
			String ratingDescription = rating.getRatingDescription();
			Integer ratingValue = rating.getRatingValue();

			if (addedBy.equals(USER_ROLES.BUYER)) {
				if (rating.getRatedForCId() != null) {
					addToNestedMap(buyerFeedback, "seller", ratingCategory, ratingDescription, ratingValue);
				} else {
					addToNestedMap(buyerFeedback, "platform", ratingCategory, ratingDescription, ratingValue);
				}
			} else if (addedBy.equals(USER_ROLES.SELLER)) {
				if (rating.getRatedForCId() != null) {
					addToNestedMap(sellerFeedback, "buyer", ratingCategory, ratingDescription, ratingValue);
				} else {
					addToNestedMap(sellerFeedback, "platform", ratingCategory, ratingDescription, ratingValue);
				}
			}
		}

		feedbackMap.put("buyerFeedback", buyerFeedback);
		feedbackMap.put("sellerFeedback", sellerFeedback);
		return feedbackMap;
	}

	private void addToNestedMap(Map<String, Map<String, Map<String, Integer>>> feedback, String key, String category,
			String description, Integer value) {
		feedback.computeIfAbsent(key, k -> new HashMap<>()).computeIfAbsent(category, k -> new HashMap<>())
				.put(description, value);

	}

	@Override
	public HashMap<String, Object> createMilestone(Map<String, String> dataMap) {
		HashMap<String, Object> response = new HashMap<>();
		try {
			Integer projectId = Integer.valueOf(dataMap.get("projectId"));
			Integer reqId = Integer.valueOf(dataMap.get("reqId"));
			String milestoneName = dataMap.get("milestoneName");
			String quantity = dataMap.get("quantity");
			String itemCategory = dataMap.get("itemCategory");
			String description = dataMap.get("description");
			BigDecimal amount = new BigDecimal(dataMap.get("amount"));
			String currency = dataMap.get("currency");
			Date completionDate = newDateFormatter.parseStringDate(dataMap.get("completionDate"));
			Milestone milestone = new Milestone();
			milestone.setCreationDate(new Date());
			milestone.setName(milestoneName);
			milestone.setCurrency(currency);
			milestone.setDescription(description);
			milestone.setMilestoneCompletionDateEstimated(completionDate);
			milestone.setMilestoneAmount(amount);
			milestone.setProjectId(projectId);
			milestone.setItemCategory(itemCategory);
			milestone.setQuantity(quantity);
			milestone.setRequirementId(reqId);
			milestone.setIsPaymentApproved(false);
			milestone.setIsPaymentDisbursed(false);
			milestone.setIsPaymentSent(false);
			milestone.setIsDisbursementMethodSelected(false);
			Project project = projectDao.getProjectByProjectId(projectId);
			if(project.getNoOfMilestones()==0) {
				milestone.setIsActive(true);
				project.setNoOfMilestones(1);
			}else {
				milestone.setIsActive(false);
			project.setNoOfMilestones(project.getNoOfMilestones()+1);
			}
			 List<Milestone> milestonesList = milestoneDao.getMilestoneListByProjectId(projectId);
			 BigDecimal totalMilestonePrice = BigDecimal.ZERO;
		     for(Milestone milestones : milestonesList) {
		        	totalMilestonePrice = totalMilestonePrice.add(milestones.getMilestoneAmount());
		        }

				totalMilestonePrice = totalMilestonePrice.add(milestone.getMilestoneAmount());
		     if(totalMilestonePrice.compareTo(project.getTotalProjctPrice())==1) {
		    	 response.put("status", "false");
		    	 response.put("message", "Milestone Price Exceeds Total Project Price ");
		    	 return response;
		     }
		   
			milestoneDao.save(milestone);
			logger.info("Milestone Saved with name: "+ milestone.getName());
			milestonesList.add(milestone);
			projectDao.update(project);
			logger.info("Project Updated: "+ project.getReqUniqueCode());
			createTransactionInEscrow(project,milestonesList,totalMilestonePrice);
			logger.info("Escrow Transaction Process Completed in Milestone Creation");
			response.put("status", "true");
		} catch (Exception e) {
			logger.error("Exception is: ", e);
			response.put("message", e.getLocalizedMessage());
			response.put("status", "false");
		}
		return response;
	}
	
	
	
	@Async
	private void createTransactionInEscrow(Project project, List<Milestone> milestones,BigDecimal totalMilestonePrice) {
		Requirement requirement = requirementDao.getRequirementById(project.getReqId());        
        if(project.getTotalProjctPrice().compareTo(totalMilestonePrice)==0) {
        	if(project.getIsSingleEscrowTransaction()) {
        		TransactionDTO transactionDTO = new TransactionDTO();
        		
        		PartyDTO escrowBroker = new PartyDTO();
        		escrowBroker.setInitiator(true);
        		escrowBroker.setCustomer("me");
        		escrowBroker.setRole("broker");
        		
        		Account buyerAccount = accountDAO.getAccountByCompanyId(project.getBuyerCompanyId());
        		PartyDTO buyer = new PartyDTO();
        		buyer.setRole("buyer");
        		buyer.setCustomer(buyerAccount.getEmailId());
        		
        		Account sellerAccount = accountDAO.getAccountByCompanyId(project.getSellerCompanyId());
        		PartyDTO seller = new PartyDTO();
        		seller.setRole("seller");
        		seller.setCustomer(sellerAccount.getEmailId());
        		
        		List<PartyDTO> parties = Arrays.asList(escrowBroker,buyer,seller);
        		transactionDTO.setParties(parties);
        		Requirement rqeuirement = requirementDao.getRequirementById(project.getReqId());
        		transactionDTO.setDescription(rqeuirement.getTitle());
        		transactionDTO.setCurrency("usd");
        		
        		List<ItemDTO> items = new ArrayList<>();
        		for(Milestone milestone : milestones) {
        			ItemDTO item = new ItemDTO();
        			item.setTitle(milestone.getName() + ":"+milestone.getId());
        			item.setDescription(milestone.getDescription());
        			item.setQuantity(Integer.parseInt(milestone.getQuantity()));
        			item.setInspectionPeriod(432000);
//        			item.setCategory(milestone.getItemCategory());
        			if(milestones.size()>1) {
            			item.setType("milestone");
        			} else {
            			item.setType("general_merchandise");
        			}
        			List<ScheduleDTO> schedules = new ArrayList<>();
        			ScheduleDTO scheduleDTO = new ScheduleDTO();
        			scheduleDTO.setAmount(milestone.getMilestoneAmount());
        			scheduleDTO.setPayerCustomer(buyerAccount.getEmailId());
        			scheduleDTO.setBeneficiaryCustomer(sellerAccount.getEmailId());
        			schedules.add(scheduleDTO);
        			item.setSchedule(schedules);
        			
        			List<FeeDTO> fees = new ArrayList<>();
        			
        			FeeDTO buyerFee = new FeeDTO();
        			buyerFee.setSplit("0.5");
        			buyerFee.setPayerCustomer(buyerAccount.getEmailId());
        			buyerFee.setType("escrow");
        			
        			FeeDTO sellerFee = new FeeDTO();
        			sellerFee.setSplit("0.5");
        			sellerFee.setPayerCustomer(sellerAccount.getEmailId());
        			sellerFee.setType("escrow");
        			
        			fees.add(sellerFee);
        			fees.add(buyerFee);
        			
        			item.setFees(fees);
        			
        			items.add(item);
        		}
    			
    			//for later the platform fee AKA broker fee in escrow
//    			ItemDTO item = new ItemDTO();
//    			item.setType("broker_fee");
//    			List<ScheduleDTO> schedules = new ArrayList<>();
//    			
//    			ScheduleDTO scheduleBuyer = new ScheduleDTO();
//    			scheduleBuyer.setAmount(BigDecimal.ZERO); //change accordingly
//    			scheduleBuyer.setPayerCustomer(buyerAccount.getEmailId());
//    			scheduleBuyer.setBeneficiaryCustomer("me");
//    			
//    			ScheduleDTO scheduleSeller = new ScheduleDTO();
//    			scheduleSeller.setAmount(BigDecimal.ZERO);//change accordingly
//    			scheduleSeller.setPayerCustomer(sellerAccount.getEmailId());
//    			scheduleSeller.setBeneficiaryCustomer("me");
//    			
//    			schedules.add(scheduleSeller);
//    			schedules.add(scheduleBuyer);
//    			
//    			item.setSchedule(schedules);
//    			items.add(item);
        		transactionDTO.setItems(items);
        		TransactionDTO createdTransaction = escrowService.createTransaction(transactionDTO);
        		//checking buyer escrow account verification status
        		checkAndUpdateEscrowAccountStatus(buyerAccount, createdTransaction);
        		//agree transaction for buyer
        		escrowService.transactionActions(createdTransaction.getId().toString(), Constants.ESCROW_ACTION_AGREE, buyerAccount.getEmailId(), null);
        		//checking seller escrow account verification status
        		checkAndUpdateEscrowAccountStatus(sellerAccount, createdTransaction);
        		//agree transaction for seller
        		escrowService.transactionActions(createdTransaction.getId().toString(), Constants.ESCROW_ACTION_AGREE, sellerAccount.getEmailId(), null);
        		project.setEscrowTransactionId(createdTransaction.getId());
        		projectDao.update(project);
        		for(int i = 0 ; i < milestones.size(); i++) {
        			Milestone milestone = milestones.get(i);
        			ItemDTO item = createdTransaction.getItems().get(i);
        			String[] temp = item.getTitle().split(":");
        			Integer escrowItemId = Integer.parseInt(temp[temp.length-1]);
        			if(milestone.getId().compareTo(escrowItemId)==0) {
        				milestone.setEscrowId(item.getId());
        				milestoneDao.update(milestone);
        			} else {
        				for(ItemDTO itemDto : createdTransaction.getItems()) {
                			String[] t = itemDto.getTitle().split(":");
                			Integer escrowId = Integer.parseInt(t[t.length-1]);
                			if(milestone.getId().compareTo(escrowId)==0) {
                				milestone.setEscrowId(escrowId);
                				milestoneDao.update(milestone);
                			}
        				}
        			}
        		}
        	} else {
	        		createEscrowTransaction(milestones.get(0), project);
        	}
        }
	}
	
	private void checkAndUpdateEscrowAccountStatus(Account user, TransactionDTO transaction) {
		if(user.getEscrowVerificationStatus()==null || (user.getEscrowVerificationStatus()!=null && !user.getEscrowVerificationStatus().equalsIgnoreCase("verified"))) {
			PartyDTO party = null;
			for(PartyDTO partyDTO : transaction.getParties()) {
				if(partyDTO.getCustomer().equalsIgnoreCase(user.getEmailId())) {
					party = partyDTO;
				}
			}
			PartyInfoDTO partyInfo = escrowService.getPartInfoById(party.getId().toString());
			user.setEscrowPartyId(party.getId().toString());
			Map<String,Object> personalInfo = (Map<String, Object>) partyInfo.getVerification().get("personal");
			user.setEscrowVerificationStatus(personalInfo.get("status").toString());
			accountDAO.update(user);
		}
	}
	
	@Override
	public List<Map<String, Object>> getMilestonesByProjectId(Integer projectId) {
        List<Map<String, Object>> milestonesList = new ArrayList<>();
        try {
            List<Milestone> milestones = milestoneDao.getMilestoneListByProjectId(projectId);
            for (Milestone milestone : milestones) {
                Map<String, Object> milestoneMap = new HashMap<>();
                milestoneMap.put("id", milestone.getId());
                milestoneMap.put("name", milestone.getName());
                milestoneMap.put("quantity", milestone.getQuantity());
                milestoneMap.put("category", milestone.getItemCategory());
                milestoneMap.put("amount", milestone.getMilestoneAmount());
                milestoneMap.put("isActive", milestone.getIsActive());
                milestoneMap.put("createdOn", milestone.getCreationDate());
                milestoneMap.put("estimateCompletiondate", milestone.getMilestoneCompletionDateEstimated());
                milestoneMap.put("actualCompletionDate", milestone.getMilestoneCompletionDateActual());
                milestoneMap.put("description", milestone.getDescription());
                milestonesList.add(milestoneMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        return milestonesList;
    }
	
	private void sendMilestoneCompleteMail(String projectCode, Account account,String milestoneName) {
		List<String> linesList = new ArrayList<>();	
			String line1 = "Thank you for updating the completion of the milestone "+milestoneName+" for Project ID. We are pleased to inform you that the milestone "+milestoneName+" of "+projectCode+" has been verified and approved by the buyer";
			String line2 = "If you have any questions or need clarification regarding the milestone, please reach out to the buyer directly.";
			String line3 = "Thank you for your continued efforts on this project.";

			linesList.add(line1);
			linesList.add(line2);
			linesList.add(line3);
		try {
			
			emailSender.sendEmail("Milestone Update: "+milestoneName+" Confirmed as Completed on "+projectCode,
					EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
					null, "Cnerzy", null);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Map<String, String> markMilestoneAsAchieved(Map<String, Object> dataMap) {
        Map<String, String> response = new HashMap<>();
        response.put("isProjectCompleted", "false");
        try {
            Integer projectId = (Integer) dataMap.get("projectId");
            Integer milestoneId = (Integer) dataMap.get("milestoneId");

            Milestone milestone = milestoneDao.getMilestoneById(milestoneId);
            if (milestone != null) {
            	dataMap.put("milestoneName", milestone.getName());
                milestone.setMilestoneCompletionDateActual(new Date());
                milestone.setIsActive(false);
                milestoneDao.update(milestone);
                Account seller = accountDAO.getAccountByCompanyId((Integer) dataMap.get("sellerCid"));
                dataMap.put("sellerAccount", seller);
                createNotificationForMilestone(dataMap);
            	Project project = projectDao.getProjectByProjectId(projectId);
            	sendMilestoneCompleteMail(project.getReqUniqueCode(), seller, milestone.getName());
            	List<Milestone> milestonesList = milestoneDao.getMilestoneListByProjectId(projectId);
            	if(project.getNoOfMilestones()>1) {
            	//Setting Next Milestone Active
            	for(Milestone milestones: milestonesList) {
            		if(milestones.getMilestoneCompletionDateActual()==null) {
            			milestones.setIsActive(true);
            			milestoneDao.update(milestones);
            			break;
            		}
            	}
            	}
            	if(project.getIsSingleEscrowTransaction()) {
            		if(project.getNoOfMilestones()==1) {
            			acceptMileStone(milestone.getEscrowId());
            		} else {
            			acceptMileStone(milestone.getEscrowId());
            			for(int i=0; i< milestonesList.size(); i++) {
            				Milestone m = milestonesList.get(i);
            				if(milestone.getId()==m.getId()) {
            					Milestone nextMileStone = milestonesList.get(i+1);
            					createEscrowTransaction(nextMileStone, project);
            					break;
            				}
            			}
            		}
            	} else {
        			acceptMileStone(milestone.getEscrowId());
            	}
                Long remainingActiveMilestone = milestoneDao.countActiveMilestonesByProjectId(projectId);
                if(remainingActiveMilestone == 0) {
                	project.setActualCompletionDate(new Date());
                	projectDao.update(project);
                	response.put("isProjectCompleted", "true");
                	//Send Email
                	sendProjectCompletedEmailToAdmin(project.getReqUniqueCode());
                	//Create Notification
                	List<Notification> notifications = new ArrayList<>();
                	Notification notification = new Notification();
            		notification.setTitle("The project "+project.getReqUniqueCode()+" has been marked as completed.");
            		notification.setCreatedOn(new Date());
            		notification.setIsRead(false);
            		notification.setAddedForAdmin(true);
            		notifications.add(notification);
            		createNotificationWithBody("The project "+project.getReqUniqueCode()+" has been marked as completed.", project.getManagerId(), new Date(), notifications);
            		notificationDao.saveBulkNotification(notifications);
                }
                response.put("status", "true");
                
            } else {
                response.put("status", "false");
                response.put("message", "Milestone not found or does not belong to the project.");
            }
        } catch (Exception e) {
            response.put("status", "false");
            response.put("message", e.getLocalizedMessage());
        }
        return response;
    }
	
	private void sendProjectCompletedEmailToAdmin(String projectNo) {
	    logger.info("Sending project completed email to admin for Project No: {}", projectNo);
	    String adminEmail = environment.getProperty("admin.emailId");
	    List<String> linesList = new ArrayList<>();
	    String line1 = "The project " + projectNo + " has been successfully completed. "
	            + "Please review the project details and feedback on the admin dashboard.";
	    linesList.add(line1);
		try {
			emailSender.sendEmail("Project Completed!",
					EmailBody.generateHtmlAdminEmail(linesList), new String[] { adminEmail }, null,
					null, "Cnerzy", null);
			logger.info("Sent project completed email to admin " + adminEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	private void createEscrowTransaction(Milestone milestone, Project project) {
		TransactionDTO transactionDTO = new TransactionDTO();
		
		PartyDTO escrowBroker = new PartyDTO();
		escrowBroker.setInitiator(true);
		escrowBroker.setCustomer("me");
		escrowBroker.setRole("broker");
		
		Account buyerAccount = accountDAO.getAccountByCompanyId(project.getBuyerCompanyId());
		PartyDTO buyer = new PartyDTO();
		buyer.setRole("buyer");
		buyer.setCustomer(buyerAccount.getEmailId());
		
		Account sellerAccount = accountDAO.getAccountByCompanyId(project.getSellerCompanyId());
		PartyDTO seller = new PartyDTO();
		seller.setRole("seller");
		seller.setCustomer(sellerAccount.getEmailId());
		
		List<PartyDTO> parties = Arrays.asList(escrowBroker,buyer,seller);
		transactionDTO.setParties(parties);
		transactionDTO.setDescription(milestone.getName());
		transactionDTO.setCurrency("usd");
		List<ItemDTO> items = new ArrayList<>();
		ItemDTO item = new ItemDTO();
		item.setTitle(milestone.getName() + ":"+milestone.getId());
		item.setDescription(milestone.getDescription());
		item.setQuantity(Integer.parseInt(milestone.getQuantity()));
		item.setInspectionPeriod(432000);
		item.setType("general_merchandise");
		List<ScheduleDTO> schedules = new ArrayList<>();
		ScheduleDTO scheduleDTO = new ScheduleDTO();
		scheduleDTO.setAmount(milestone.getMilestoneAmount());
		scheduleDTO.setPayerCustomer(buyerAccount.getEmailId());
		scheduleDTO.setBeneficiaryCustomer(sellerAccount.getEmailId());
		schedules.add(scheduleDTO);
		item.setSchedule(schedules);
		
		List<FeeDTO> fees = new ArrayList<>();
		
		FeeDTO buyerFee = new FeeDTO();
		buyerFee.setSplit("0.5");
		buyerFee.setPayerCustomer(buyerAccount.getEmailId());
		buyerFee.setType("escrow");
		
		FeeDTO sellerFee = new FeeDTO();
		sellerFee.setSplit("0.5");
		sellerFee.setPayerCustomer(sellerAccount.getEmailId());
		sellerFee.setType("escrow");
		
		fees.add(sellerFee);
		fees.add(buyerFee);
		
		item.setFees(fees);
		
		items.add(item);
		transactionDTO.setItems(items);
		TransactionDTO createdTransaction = escrowService.createTransaction(transactionDTO);
    	//checking buyer escrow account verification status
    	checkAndUpdateEscrowAccountStatus(buyerAccount, createdTransaction);
   		//checking seller escrow account verification status
   		checkAndUpdateEscrowAccountStatus(sellerAccount, createdTransaction);
		//agree transaction for buyer
		escrowService.transactionActions(createdTransaction.getId().toString(), Constants.ESCROW_ACTION_AGREE, buyerAccount.getEmailId(), null);
		//agree transaction for seller
		escrowService.transactionActions(createdTransaction.getId().toString(), Constants.ESCROW_ACTION_AGREE, sellerAccount.getEmailId(), null);
		milestone.setEscrowId(createdTransaction.getId());
		milestoneDao.update(milestone);
	}

	@Async
	private void sendProjectCompleteMail(Project project) {
		List<Account> accounts = accountDAO.getAllAccountsByCompanyIds(Arrays.asList(project.getBuyerCompanyId(),project.getSellerCompanyId()));
		for(Account account:accounts) {
		List<String> linesList = new ArrayList<>();	
		String subject ="Congratulations! Your Project "+project.getReqUniqueCode()+" is Completed on Cnerzy!";
		if(account.getUserRole().equals(USER_ROLES.SELLER)){
			String line1 = "We're thrilled to inform you that your project "+project.getReqUniqueCode()+" has been marked as completed! This signifies a successful collaboration between you and the buyer";
			String line2 = "Thank you for joining the Cnerzy community, your feedback is crucial for our continuous growth and improvement. Please take a moment to fill out the feedback form available on your dashboard.";
			String line3 = "Thank you for your dedication and contributions throughout this project.";

			linesList.add(line1);
			linesList.add(line2);
			linesList.add(line3);
		}else if(account.getUserRole().equals(USER_ROLES.BUYER)){		
			String line1 = "We are pleased to announce that your project "+project.getReqUniqueCode()+" has been successfully completed and delivered.";
			String line2 = "Thank you for joining the Cnerzy community, your feedback is crucial for our continuous growth and improvement. Please take a moment to fill out the feedback form available on your dashboard.";
			String line3 = "Thank you for choosing Cnerzy. We look forward to future successful collaborations.";

			linesList.add(line1);
			linesList.add(line2);
			linesList.add(line3);
		}
		try {
			
			emailSender.sendEmail(subject,
					EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
					null, "Cnerzy", null);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		}
	}

	private void createNotificationForMilestone(Map<String, Object> dataMap) {
		List<Notification> notifications = new ArrayList<>();
		Date todayDate = new Date();
		Integer buyerUserId = (Integer) dataMap.get("buyerUserId");
		Integer pmId = (Integer) dataMap.get("pmId");
		Account seller = (Account) dataMap.get("sellerAccount");
		String milestoneName = (String) dataMap.get("milestoneName");
		String projectNo = (String) dataMap.get("projectNo");
		String buyerTitle = "A major milestone, "+milestoneName+", has been completed for your project "+projectNo;
		String sellerTitle = "The buyer has marked a milestone, "+milestoneName+", as completed for your project "+projectNo;
		createNotificationWithBody(buyerTitle, buyerUserId, todayDate, notifications);
		createNotificationWithBody(sellerTitle, seller.getUserId(), todayDate, notifications);
		createNotificationWithBody(sellerTitle, pmId, todayDate, notifications);
		notificationDao.saveBulkNotification(notifications);
	}
	
	private void createNotificationWithBody(String title, Integer accountId, Date date, List<Notification> notifications) {
		Notification notification = new Notification();
		notification.setAddedFor(accountId);
		notification.setTitle(title);
		notification.setCreatedOn(date);
		notification.setIsRead(false);
		notifications.add(notification);
	}

	@Override
	public Map<String, Date> getTimelineByForDashboard(Integer projectId, Integer reqId, String userRole,
			Integer companyId) {
		Map<String, Date> respMap = new HashMap<>();
		RequirementTimeline requirementTimeline = requirementTimelineDao.getRequirementTimelineByReqId(reqId);
		ProjectTimeline projectTimeline = projectTimelineDao.getProjectTimelineByProjectId(projectId);
		Project project = projectDao.getProjectByProjectId(projectId);
		//TODO Basically project execution is - jb tripartite sign hua Jb milestone execution hora hai

		respMap.put("Project Execution", project.getSellerTripartiteSignedDate());
		respMap.put("Project Completion", projectTimeline.getProjectCompletionDate());
		RequirementSeller seller = null;
		if (userRole.equals(USER_ROLES.SELLER)) {
			seller = requirementSellerDao
					.getRequirementSellerByReqIdAndSellerCid(reqId, companyId);
			respMap.put("Requirement Intimation", seller.getDateAdded());
			
			respMap.put("Review & Feedback", projectTimeline.getBuyerReviewFeedbackDate());
			
		} else if (userRole.equals(USER_ROLES.BUYER)||userRole.equals(USER_ROLES.ADMIN)) {
			respMap.put("Requirement Posted", requirementTimeline.getPostedDate());
			respMap.put("Requirement Approved", requirementTimeline.getApprovedDate());
			respMap.put("Sellers Intimated", requirementTimeline.getSellerShortlistedDate());
			respMap.put("Review & Feedback", projectTimeline.getSellerReviewFeedbackDate());
		}
		respMap.put("Discussion Phase", requirementTimeline.getDiscussionInitiatedDate());
		respMap.put("Negotiations", requirementTimeline.getNegotiationStartedDate());
		if (userRole.equals(USER_ROLES.SELLER)) {
			respMap.put("Discussion Phase", seller.getSellerNdaSignedDate());
			respMap.put("Negotiations", seller.getSellerNegotiationStartDate());
		}
		respMap.put("Contract/ Purchase Order Issued", requirementTimeline.getContractIssuedDate());
		respMap.put("Project Kick-off", requirementTimeline.getProjectKickoffDate());
		
		return respMap;
	}

	@Override
	public void updateBuyerPaymentOption(String option, String projectId) {
		Project project = projectDao.getProjectByProjectId(Integer.parseInt(projectId));
		project.setIsSingleEscrowTransaction(option.equalsIgnoreCase(Constants.ONE_TIME_PAYMENT));
		projectDao.update(project);
	}
	
	@Override
	public void acceptMileStone(Integer milestoneId) {
		Milestone milestone = milestoneDao.getMileStoneByEscrowId(milestoneId);
		Project project = projectDao.getProjectByProjectId(milestone.getProjectId());
		Account buyerAccount = accountDAO.getAccountByCompanyId(project.getBuyerCompanyId());
		Account sellerAccount = accountDAO.getAccountByCompanyId(project.getSellerCompanyId());
		if(project.getIsSingleEscrowTransaction() && project.getNoOfMilestones().compareTo(1)==0) {
			escrowService.transactionActions(project.getEscrowTransactionId().toString(), Constants.ESCROW_ACTION_SHIP, sellerAccount.getEmailId(), null);
			escrowService.transactionActions(project.getEscrowTransactionId().toString(), Constants.ESCROW_ACTION_RECEIVE, buyerAccount.getEmailId(), null);
			escrowService.transactionActions(project.getEscrowTransactionId().toString(), Constants.ESCROW_ACTION_ACCEPT, buyerAccount.getEmailId(), null);
		} else if(project.getIsSingleEscrowTransaction() && project.getNoOfMilestones().compareTo(1)!=0) {
			escrowService.transactionActionsPerItem(project.getEscrowTransactionId().toString(), Constants.ESCROW_ACTION_SHIP, sellerAccount.getEmailId(), milestone.getEscrowId().toString());
			escrowService.transactionActionsPerItem(project.getEscrowTransactionId().toString(), Constants.ESCROW_ACTION_RECEIVE, buyerAccount.getEmailId(), milestone.getEscrowId().toString());
			escrowService.transactionActionsPerItem(project.getEscrowTransactionId().toString(), Constants.ESCROW_ACTION_ACCEPT, buyerAccount.getEmailId(), milestone.getEscrowId().toString());
		} else {
			escrowService.transactionActions(milestone.getEscrowId().toString(), Constants.ESCROW_ACTION_SHIP, sellerAccount.getEmailId(), null);
			escrowService.transactionActions(milestone.getEscrowId().toString(), Constants.ESCROW_ACTION_RECEIVE, buyerAccount.getEmailId(), null);
			escrowService.transactionActions(milestone.getEscrowId().toString(), Constants.ESCROW_ACTION_ACCEPT, buyerAccount.getEmailId(), null);
		}
	}

}
