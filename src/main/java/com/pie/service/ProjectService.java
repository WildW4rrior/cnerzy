package com.pie.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProjectService {

	List<Map<String, Object>> getProjectsDataByCIdAndRole(Integer companyId, String userRole);

	Map<String, Date> getTimelineByProjectId(Integer projectId, String userRole, Integer companyId);

	HashMap<String, Object> createFeedback(Map<String, Object> dataMap);

	Map<String, Object> getFeedbackByProjectId(Integer projectId);
	
	HashMap<String, Object> createMilestone(Map<String, String> dataMap);

	Map<String, Date> getTimelineByForDashboard(Integer projectId, Integer reqId, String userRole, Integer companyId);

	List<Map<String, Object>> getMilestonesByProjectId(Integer projectId);

	Map<String, String> markMilestoneAsAchieved(Map<String, Object> dataMap);

	void updateBuyerPaymentOption(String option, String projectId);

	void acceptMileStone(Integer milestoneId);

}
