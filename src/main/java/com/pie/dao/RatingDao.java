package com.pie.dao;

import java.util.List;
import java.util.Map;

import com.pie.entity.Rating;

public interface RatingDao {

	void save(Rating rating);

	void update(Rating rating);

	Boolean saveAll(List<Rating> ratings);

	List<Rating> getRatingsByProjectId(Integer projectId);

	Map<String, Object> getRatingStatsForCompany(Integer companyId);

}
