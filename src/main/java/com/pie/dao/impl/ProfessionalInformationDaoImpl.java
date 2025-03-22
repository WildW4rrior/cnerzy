package com.pie.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.ProfessionalInformationDao;
import com.pie.entity.ProfessionalInformation;

@Transactional
@Repository
public class ProfessionalInformationDaoImpl implements ProfessionalInformationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ProfessionalInformation professionalInformation) {
		Session session = sessionFactory.getCurrentSession();
		session.save(professionalInformation);
	}

	@Override
	public void update(ProfessionalInformation professionalInformation) {
		Session session = sessionFactory.getCurrentSession();
		session.update(professionalInformation);
	}

	@Override
	public ProfessionalInformation getProfessionalInfoByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProfessionalInformation.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (ProfessionalInformation) crit.uniqueResult();
	}

}