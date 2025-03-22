package com.pie.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.VerificationTokenDao;
import com.pie.entity.Account;
import com.pie.entity.VerificationToken;

@Repository
@Transactional
public class VerificationTokenDaoImpl implements VerificationTokenDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(VerificationToken verificationToken) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(verificationToken);
	}
	
	@Override
	public VerificationToken getByVerificationToken(String token) {
			Session session = sessionFactory.getCurrentSession();
			Criteria crit = session.createCriteria(VerificationToken.class);
			crit.add(Restrictions.eq("token", token));
			return (VerificationToken) crit.uniqueResult();
	}

	@Override
	public VerificationToken findByAccountId(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(VerificationToken.class);
		crit.add(Restrictions.eq("accountId.userId", userId));
		return (VerificationToken) crit.uniqueResult();
	}

}
