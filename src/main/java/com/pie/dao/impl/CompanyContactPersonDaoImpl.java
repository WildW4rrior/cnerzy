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

import com.pie.dao.CompanyContactPersonDao;
import com.pie.entity.CompanyContactPerson;
import com.pie.util.Constants;

@Transactional
@Repository
public class CompanyContactPersonDaoImpl implements CompanyContactPersonDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(CompanyContactPerson contactPerson) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(contactPerson);
	}

	@Override
	public void update(CompanyContactPerson contactPerson) {
		Session session = sessionFactory.getCurrentSession();
		session.update(contactPerson);
	}

	@Override
	public List<CompanyContactPerson> getCompanyContactPersonByCompanyId(Integer companyId, String type) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyContactPerson.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		crit.add(Restrictions.eq("type", type));
		return (List<CompanyContactPerson>) crit.list();
	}
	
	@Override
	public List<CompanyContactPerson> getCompanyContactsByIdList(List<Integer> ids, String type) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyContactPerson.class);
		crit.add(Restrictions.in("id", ids));
		crit.add(Restrictions.eq("type", type));
		return (List<CompanyContactPerson>) crit.list();
	}
	
	@Override
	public CompanyContactPerson getCompanyContactByIdAndType(Integer id, Integer companyId, String type) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyContactPerson.class);
		crit.add(Restrictions.eq("id", id));
		crit.add(Restrictions.eq("company.companyId", companyId));
		crit.add(Restrictions.eq("type", type));
		return (CompanyContactPerson) crit.uniqueResult();
	}
	
	@Override
	public CompanyContactPerson getCustomerReferenceByCompanyIdAndType(Integer companyId, String type) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyContactPerson.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		crit.add(Restrictions.eq("type", type));
		return (CompanyContactPerson) crit.uniqueResult();
	}
	
	@Override
	public Boolean saveAll(List<CompanyContactPerson> contactPersons) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (CompanyContactPerson person : contactPersons) {
				session.saveOrUpdate(person);
				if (i % Constants.BATCH_SIZE_HIBERNATE == 0) { // 50, same as the JDBC batch size
					// flush a batch of inserts and release memory:
					session.flush();
					session.clear();
				}
				i++;
			}
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
