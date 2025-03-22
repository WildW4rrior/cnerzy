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

import com.pie.dao.LogisticDao;
import com.pie.entity.LogisticServiceProvider;
import com.pie.util.Constants;

@Transactional
@Repository
public class LogisticDaoImpl implements LogisticDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(LogisticServiceProvider logistic) {
		Session session = sessionFactory.getCurrentSession();
		session.save(logistic);
	}

	@Override
	public void update(LogisticServiceProvider logistic) {
		Session session = sessionFactory.getCurrentSession();
		session.update(logistic);
	}

	@Override
	public List<LogisticServiceProvider> getAllLogisticProviderByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(LogisticServiceProvider.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (List<LogisticServiceProvider>) crit.list();
	}

	@Override
	public List<LogisticServiceProvider> getLogisticServiceProvidersByIdList(List<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(LogisticServiceProvider.class);
		crit.add(Restrictions.in("id", ids));
		return (List<LogisticServiceProvider>) crit.list();
	}
	
	@Override
	public Boolean saveAll(List<LogisticServiceProvider> logistics) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (LogisticServiceProvider logistic : logistics) {
				session.saveOrUpdate(logistic);
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
