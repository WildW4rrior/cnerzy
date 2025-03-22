package com.pie.dao;

import java.util.List;

import com.pie.entity.Milestone;

public interface MilestoneDao {

	List<Milestone> getMilestoneListByProjectId(Integer projectId);

	void save(Milestone milestone);

	void update(Milestone milestone);

	Milestone getMilestoneById(Integer milestoneId);

	Long countActiveMilestonesByProjectId(Integer projectId);

	Milestone getMileStoneByEscrowId(Integer escrowId);

}
