package com.pie.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pie.entity.Requirement;
import com.pie.entity.RequirementSeller;
import com.pie.entity.RequirementTimeline;
import com.pie.model.BuyerInfoModel;
import com.pie.model.RequirementChatModel;
import com.pie.model.RequirementModel;
import com.pie.model.SellerInfoModel;

public interface RequirementService {

	HashMap<String, Object> createNewRequirement(RequirementModel requirementModel);

	HashMap<String, Object> getBuyerRequirmentsList(Integer accountId, Integer sellerCid);
	
	List<Map<String,Object>> getRequirementsList(Map<String,String> queryMap);

	HashMap<String, Object> getPreviousEngagedSellerList(Integer companyId);

	HashMap<String, Object> getBuyerAllRequirementList(Integer companyId);

	RequirementModel viewRequirementById(Integer id);

	void updateRequirementStatus(Map<String, String> requestBody) throws MessagingException;

	List<SellerInfoModel> getIntimatedSellerListByReqId(Integer requirementId);

	List<Map<String, Object>> getRequirementSellerListBySellerId(String sellerId);

	void changeInterestInRequirement(Map<String, String> request);

	List<SellerInfoModel> getRecommendedSellerListByReqId(Integer reqId);

	List<SellerInfoModel> getShortlistedSellerListByReqId(Integer reqId);

	List<SellerInfoModel> getFinalizedSellerListByReqId(Integer reqId);

	HashMap<String, Object> finalizeSellerForReqId(RequirementChatModel reqChatModel);

	HashMap<String, Object> saveSellerForReqId(Map<String, Integer> dataMap);

	HashMap<String, Object> rejectSellerForReqId(Map<String, String> dataMap);

	HashMap<String, Object> sellerWithdrawnForReqId(Map<String, String> dataMap);

	BuyerInfoModel getBuyerProfileData(Integer buyerCompanyId);

	void sendNdaForSign(Integer reqId, Integer sellerCompanyId) throws JsonProcessingException;

	Map<String, Date> getTimelineByReqId(Integer reqId, String userRole, Integer companyId);

	Requirement getRequirementById(Integer reqId);

	void updateRequirement(Requirement requirement);

	HashMap<String, Object> getContractsForAdmin();

	SellerInfoModel addSellerInfoToModel(SellerInfoModel sellerInfoModel, Integer sellerCompanyId, boolean isDetailed);

	HashMap<String, String> adminIntiateProject(Map<String, String> dataMap);

	HashMap<String, String> adminAppointPMForProject(Map<String, String> dataMap);

	RequirementSeller getFinializedRequirementSeller(Integer reqId);

	RequirementSeller getRequirementSellerByZohoDocId(String zohoDocId);

	RequirementSeller getSellerForRequirementWithNoNegotiation(Integer reqId, Integer sellerCId);

	void updateRequirementSeller(RequirementSeller requirementSeller);	
}
