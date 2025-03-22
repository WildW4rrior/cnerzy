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

import com.pie.dao.AnnualTurnoverDao;
import com.pie.entity.AnnualTurnover;
import com.pie.entity.CompanyContactPerson;
import com.pie.util.Constants;

@Transactional
@Repository
public class AnnualTurnoverDaoImpl implements AnnualTurnoverDao {


	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(AnnualTurnover annualTurnover) {
		Session session = sessionFactory.getCurrentSession();
		session.save(annualTurnover);
	}
	
	@Override
	public void update(AnnualTurnover annualTurnover) {
		Session session = sessionFactory.getCurrentSession();
		session.update(annualTurnover);
	}

	@Override
	public List<AnnualTurnover> getAnnualTurnoversByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(AnnualTurnover.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		return (List<AnnualTurnover>) crit.list();
	}
	
	@Override
	public List<AnnualTurnover> getAnnualTurnoversByIdList(List<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(AnnualTurnover.class);
		crit.add(Restrictions.in("id", ids));
		return (List<AnnualTurnover>) crit.list();
	}
	
	@Override
	public AnnualTurnover getAnnualTurnoversById(Integer id, Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(AnnualTurnover.class);
		crit.add(Restrictions.eq("id", id));
		crit.add(Restrictions.eq("company.companyId", companyId));
		return (AnnualTurnover) crit.uniqueResult();
	}
	
	@Override
	public Boolean saveAll(List<AnnualTurnover> annualTurnovers) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (AnnualTurnover annualTurnover : annualTurnovers) {
				session.saveOrUpdate(annualTurnover);
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
