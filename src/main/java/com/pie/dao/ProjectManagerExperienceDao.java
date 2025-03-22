package com.pie.dao;

import java.util.List;

import com.pie.entity.Product;
import com.pie.entity.ProjectManagerExperience;

public interface ProjectManagerExperienceDao {

		void save(ProjectManagerExperience projectManagerExperience);

		ProjectManagerExperience getPMExperiencesByAccountId(Integer accountId);

		void update(ProjectManagerExperience projectManagerExperience);

		ProjectManagerExperience getPMExperiencesByIdAndAccountId(Integer id, Integer accountId);
}