package com.pie.dao;

import java.util.List;
import java.util.Map;

import com.pie.entity.RequirementSeller;

public interface RequirementSellerDao {
	RequirementSeller save(RequirementSeller requirementSeller);

	void bulkSave(List<RequirementSeller> requirementSellerList);

	List<RequirementSeller> getSellerRequirementListBySellerCompanyId(Integer companyId);

	RequirementSeller getRequirementSellerId(int parseInt);

	void update(RequirementSeller requirementSeller);

	List<RequirementSeller> getAllRequirementSellersByReqId(Integer requirementId, String status);

	RequirementSeller getRequirementSellerByReqIdAndSellerCid(Integer reqId, Integer sellerCompanyId);

	Map<String, Long> getSellerRequirementCounts(Integer companyId);

	List<RequirementSeller> getAllFinalizedRequirementSellersByReqIds(List<Integer> reqIds);

	RequirementSeller getRequirementSellerByZohoDocId(String zohoDocId);

	RequirementSeller getSellerForRequirementWithNoNegotiation(Integer reqId, Integer sellerCompanyId);
}
