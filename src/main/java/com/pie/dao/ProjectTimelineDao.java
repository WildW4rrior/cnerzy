package com.pie.dao;

import com.pie.entity.ProjectTimeline;

public interface ProjectTimelineDao {

	void save(ProjectTimeline projectTimeline);

	void update(ProjectTimeline projectTimeline);

	ProjectTimeline getProjectTimelineByProjectId(Integer projectId);

}
