package com.pie.dao;

import java.util.List;

import com.pie.entity.Project;
import com.pie.entity.ProjectTimeline;

public interface ProjectDao {
	Integer getCountOfActiveProjectsByPMId(int id);

	Integer getCountOfCompletedProjectsBySellerCompoanyId(int comapnyId);

	Integer getCountOfCompletedProjectsByBuyerCompanyId(Integer companyId);

	List<Project> getProjectListOfUserByIdAndRole(Integer id, String role);

	void save(Project project);

	void update(Project project);

	Project getProjectByReqId(Integer reqId);

	List<Project> getAllProjectsByReqIdList(List<Integer> reqIdsForProjects);

	Project getProjectByProjectId(Integer projectId);

	Project getProjectByEscrowTransactionId(Integer transactionId);

	Project getProjectByZohoTripartiteDocId(String zohoDocId);
}
