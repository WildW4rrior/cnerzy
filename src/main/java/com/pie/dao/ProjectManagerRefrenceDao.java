package com.pie.dao;

import java.util.List;

import com.pie.entity.ProjectManagerRefrence;

public interface ProjectManagerRefrenceDao {
	
	
	void save(ProjectManagerRefrence projectManagerRefrence);

	Boolean saveAll(List<ProjectManagerRefrence> projectManagerRefrences);

	void update(ProjectManagerRefrence projectManagerRefrence);

	List<ProjectManagerRefrence> getPMRefrencesByAccountId(Integer accountId);

	List<ProjectManagerRefrence> getPMRefrencesByLsitIdAccountId(List<Integer> ids, Integer accountId);
	
}
