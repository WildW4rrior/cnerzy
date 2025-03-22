package com.pie.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.MilestoneDao;
import com.pie.entity.Milestone;


@Transactional
@Repository
public class MilestoneDaoImpl implements MilestoneDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Milestone milestone) {
		Session session = sessionFactory.getCurrentSession();
		session.save(milestone);
		
	}
	
	@Override
	public void update(Milestone milestone) {
		Session session = sessionFactory.getCurrentSession();
		session.update(milestone);
		
	}
	
	@Override
	public List<Milestone> getMilestoneListByProjectId(Integer projectId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria= session.createCriteria(Milestone.class);
		criteria.add(Restrictions.eq("projectId", projectId));
		criteria.addOrder(Order.asc("id"));
		return (List<Milestone>) criteria.list();
		
	}

	@Override
	public Milestone getMilestoneById(Integer milestoneId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria= session.createCriteria(Milestone.class);
		criteria.add(Restrictions.eq("id", milestoneId));
		return (Milestone) criteria.uniqueResult();
	}
	
	 @Override
	    public Long countActiveMilestonesByProjectId(Integer projectId) {
	        Session session = sessionFactory.getCurrentSession();
	        Criteria criteria = session.createCriteria(Milestone.class);
	        criteria.add(Restrictions.eq("projectId", projectId));
	        criteria.add(Restrictions.eq("isActive", true));
	        criteria.setProjection(Projections.rowCount());
	        return (Long) criteria.uniqueResult();
	    }
	 
	 @Override
	 public Milestone getMileStoneByEscrowId(Integer escrowId) {
	        Session session = sessionFactory.getCurrentSession();
	        Criteria criteria = session.createCriteria(Milestone.class);
	        criteria.add(Restrictions.eq("escrowId", escrowId));
	        return (Milestone) criteria.uniqueResult();
	 }
}
