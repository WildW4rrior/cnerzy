package com.pie.dao;

import java.util.List;

import com.pie.entity.CompanyContactPerson;

public interface CompanyContactPersonDao {

	void save(CompanyContactPerson contactPerson);

	void update(CompanyContactPerson contactPerson);

	Boolean saveAll(List<CompanyContactPerson> contactPersons);

	List<CompanyContactPerson> getCompanyContactsByIdList(List<Integer> ids, String type);

	List<CompanyContactPerson> getCompanyContactPersonByCompanyId(Integer companyId, String type);

	CompanyContactPerson getCompanyContactByIdAndType(Integer id, Integer companyId, String type);

	CompanyContactPerson getCustomerReferenceByCompanyIdAndType(Integer companyId, String type);

}
