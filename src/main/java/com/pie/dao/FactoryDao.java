package com.pie.dao;

import java.util.List;

import com.pie.entity.Facility;
import com.pie.entity.Factory;

public interface FactoryDao {

	Boolean saveAll(List<Factory> factories);

	List<Factory> getFactoriesToByIdList(List<Integer> ids);

	List<Factory> getAllFactoriesByCompanyId(Integer companyId);

	void update(Factory factory);

	void save(Factory factory);

	void saveFactoryAndFacilities(Factory factory, List<Facility> facilitiesToSave);

}
