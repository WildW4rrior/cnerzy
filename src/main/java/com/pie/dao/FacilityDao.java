package com.pie.dao;

import java.util.List;

import com.pie.entity.Facility;

public interface FacilityDao {

	void save(Facility facility);

	void update(Facility facility);

	List<Facility> getAllFacilitiesByFactoryId(Integer factoryId);

	List<Facility> getFacilitesToByIdAndFactoryIdList(List<Integer> ids, Integer factoryId);

	Boolean saveAll(List<Facility> facilities);

	List<Facility> getFacilitiesByAllFactoryIds(List<Integer> factoryIds);

}
