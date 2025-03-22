package com.pie.dao;

import java.util.List;

import com.pie.entity.Company;

public interface CompanyDao {

	void save(Company company);

	void update(Company company);
	
	Company getCompanyWithId(Integer companyId);

	List<Company> getCompaniesByIndustryExpertise(String industryExpertise);

	void removePastCompanyOfAccountId(Integer accountId);

}
