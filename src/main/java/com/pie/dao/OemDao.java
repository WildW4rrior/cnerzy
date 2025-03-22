package com.pie.dao;

import java.util.List;

import com.pie.entity.OEMofCompany;

public interface OemDao {

	List<OEMofCompany> getAllOEMByCompanyId(Integer companyId);

	void update(OEMofCompany oemOfCompany);

	void save(OEMofCompany oemOfCompany);

	Boolean saveAll(List<OEMofCompany> oemsToSave);

	List<OEMofCompany> getOemsByIdList(List<Integer> oemIds);

}
