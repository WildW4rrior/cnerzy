package com.pie.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.BankDetailsDao;
import com.pie.entity.BankDetails;

@Transactional
@Repository
public class BankDetailsDaoImpl implements BankDetailsDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(BankDetails bankDetails) {
		Session session = sessionFactory.getCurrentSession();
		session.save(bankDetails);
	}
	
	@Override
	public void update(BankDetails bankDetails) {
		Session session = sessionFactory.getCurrentSession();
		session.update(bankDetails);
	}

	@Override
	public BankDetails getBankDetailByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(BankDetails.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (BankDetails) crit.uniqueResult();
	}
	
	@Override
	public BankDetails getBankDetailById(Integer bankId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(BankDetails.class);
		crit.add(Restrictions.in("id", bankId));
		return (BankDetails) crit.uniqueResult();
	}
	
}
