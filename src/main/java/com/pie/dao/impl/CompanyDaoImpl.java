package com.pie.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.CompanyDao;
import com.pie.entity.Address;
import com.pie.entity.Company;

@Transactional
@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Company company) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(company);
	}

	@Override
	public void update(Company company) {
		Session session = sessionFactory.getCurrentSession();
		session.update(company);
	}

	@Override
	public Company getCompanyWithId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Company.class);
		crit.add(Restrictions.eq("companyId", companyId));
		Company company = (Company) crit.uniqueResult();
		return company;
	}
	
	@Override
	public List<Company> getCompaniesByIndustryExpertise(String industryExpertise){
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Company.class);
		crit.add(Restrictions.eq("industryExpertise", industryExpertise));
		return crit.list();
	}
	
	@Override
	public void removePastCompanyOfAccountId(Integer accountId) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "UPDATE Company c SET c.accountId = null WHERE c.accountId = :accountId";
        Query query = session.createQuery(hql);
        query.setParameter("accountId", accountId);
        int result = query.executeUpdate();
    }
	
}
