package com.pie.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.ProjectManagerExperienceDao;
import com.pie.entity.ProjectManagerExperience;
import com.pie.util.Constants;

@Transactional
@Repository
public class ProjectManagerExperienceDaoImpl implements ProjectManagerExperienceDao{

	

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void save(ProjectManagerExperience projectManagerExperience) {
		Session session = sessionFactory.getCurrentSession();
		session.save(projectManagerExperience);	
	}
	
	@Override
	public void update(ProjectManagerExperience projectManagerExperience) {
		Session session = sessionFactory.getCurrentSession();
		session.update(projectManagerExperience);	
	}
	
	
	@Override
	public ProjectManagerExperience getPMExperiencesByAccountId(Integer accountId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProjectManagerExperience.class);
		crit.add(Restrictions.eq("accountId", accountId));
		return (ProjectManagerExperience) crit.uniqueResult();
	}
	
	@Override
	public ProjectManagerExperience getPMExperiencesByIdAndAccountId(Integer id, Integer accountId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProjectManagerExperience.class);
		crit.add(Restrictions.in("id", id));
		crit.add(Restrictions.eq("accountId", accountId));
		return (ProjectManagerExperience)crit.uniqueResult();
	}


}
