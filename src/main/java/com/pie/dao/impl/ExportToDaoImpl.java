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

import com.pie.dao.ExportToDao;
import com.pie.entity.ExportsTo;
import com.pie.util.Constants;

@Transactional
@Repository
public class ExportToDaoImpl implements ExportToDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(ExportsTo exportsTo) {
		Session session = sessionFactory.getCurrentSession();
		session.save(exportsTo);
	}

	@Override
	public void update(ExportsTo exportsTo) {
		Session session = sessionFactory.getCurrentSession();
		session.update(exportsTo);
	}

	@Override
	public List<ExportsTo> getAllExportsToByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ExportsTo.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (List<ExportsTo>) crit.list();
	}
	
	@Override
	public List<ExportsTo> getExportsToByIdList(List<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ExportsTo.class);
		crit.add(Restrictions.in("id", ids));
		return (List<ExportsTo>) crit.list();
	}

	@Override
	public Boolean saveAll(List<ExportsTo> exportsToList) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (ExportsTo exportsTo : exportsToList) {
				session.saveOrUpdate(exportsTo);
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
