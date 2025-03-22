package com.pie.dao;

import java.util.List;

import com.pie.entity.RequirementTimeline;

public interface RequirementTimelineDao {

	void save(RequirementTimeline requirementTimeline);

	void update(RequirementTimeline requirementTimeline);

	RequirementTimeline getRequirementTimelineByReqId(Integer reqId);

}
