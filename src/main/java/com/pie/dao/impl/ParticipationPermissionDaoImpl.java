package com.pie.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.ParticipationPermissionDao;
import com.pie.entity.ParticipationPermission;

@Transactional
@Repository
public class ParticipationPermissionDaoImpl implements ParticipationPermissionDao{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ParticipationPermission permission) {
		Session session = sessionFactory.getCurrentSession();
		session.save(permission);
	}

	@Override
	public void update(ParticipationPermission permission) {
		Session session = sessionFactory.getCurrentSession();
		session.update(permission);
	}

	@Override
	public ParticipationPermission getParticipationPermissionByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ParticipationPermission.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (ParticipationPermission) crit.uniqueResult();
	}
	@Override
	public ParticipationPermission getParticipationPermissionById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ParticipationPermission.class);
		crit.add(Restrictions.eq("id", id));
		return (ParticipationPermission) crit.uniqueResult();
	}

}