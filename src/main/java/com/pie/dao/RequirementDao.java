package com.pie.dao;

import java.util.List;
import java.util.Map;

import com.pie.entity.Requirement;
import com.pie.util.RequirementStatus;

public interface RequirementDao {

	void save(Requirement requirment);

	void update(Requirement requirment);

	Requirement getRequirementByIdAndCompanyId(Integer id, Integer companyId);

	List<Object[]> getPreviousEngagedSellerList(Integer companyId);

	Requirement getRequirementByUniqueNo(String uniqueNo);

	Requirement getRequirementById(Integer id);
	
	List<Requirement> getRequirementsList(Map<String, String> queryMap);

	List<Requirement> getRequirementListByCompanyId(Integer buyerCompanyId, Integer sellerCid);

	void updateRequirementStatus(Integer reqId, RequirementStatus recommendedSeller);

	List<Requirement> getContractsForAdmin();

}
