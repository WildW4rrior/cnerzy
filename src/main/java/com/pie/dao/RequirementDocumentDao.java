package com.pie.dao;

import java.util.List;

import com.pie.entity.RequirementDocuments;

public interface RequirementDocumentDao {

	void save(RequirementDocuments requirementDocuments);
	
	void update(RequirementDocuments requirementDocuments);

	List<RequirementDocuments> getRequirementDiscussionByReqId(Integer reqId, Integer participant1,
			Integer participant2);

	Boolean bulkSave(List<RequirementDocuments> requirementDocuments);

}
