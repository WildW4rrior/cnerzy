package com.pie.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.ProjectTimelineDao;
import com.pie.entity.ProjectTimeline;

@Transactional
@Repository
public class ProjectTimelineDaoImpl implements ProjectTimelineDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(ProjectTimeline projectTimeline) {
		Session session = sessionFactory.getCurrentSession();
		session.save(projectTimeline);
	}

	@Override
	public void update(ProjectTimeline projectTimeline) {
		Session session = sessionFactory.getCurrentSession();
		session.update(projectTimeline);
	}

	@Override
	public ProjectTimeline getProjectTimelineByProjectId(Integer projectId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProjectTimeline.class);
		crit.add(Restrictions.in("projectId", projectId));
		return (ProjectTimeline) crit.uniqueResult();
	}

}
