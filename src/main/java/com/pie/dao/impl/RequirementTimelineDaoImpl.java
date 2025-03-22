package com.pie.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.RequirementTimelineDao;
import com.pie.entity.RequirementTimeline;

@Transactional
@Repository
public class RequirementTimelineDaoImpl implements RequirementTimelineDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void save(RequirementTimeline requirementTimeline) {
		Session session = sessionFactory.getCurrentSession();
		session.save(requirementTimeline);	
	}

	@Override
	public void update(RequirementTimeline requirementTimeline) {
		Session session = sessionFactory.getCurrentSession();
		session.update(requirementTimeline);	
	}
	
	@Override
	public RequirementTimeline getRequirementTimelineByReqId(Integer reqId) {
	    Session session = sessionFactory.getCurrentSession();
	    Criteria crit = session.createCriteria(RequirementTimeline.class);
	    crit.add(Restrictions.eq("reqId", reqId));
	    return (RequirementTimeline) crit.uniqueResult();
	}
	
}