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

import com.pie.dao.FactoryDao;
import com.pie.entity.Facility;
import com.pie.entity.Factory;
import com.pie.util.Constants;

@Transactional
@Repository
public class FactoryDaoImpl implements FactoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Factory factory) {
		Session session = sessionFactory.getCurrentSession();
		session.save(factory);
	}

	@Override
	public void update(Factory factory) {
		Session session = sessionFactory.getCurrentSession();
		session.update(factory);
	}

	@Override
	public List<Factory> getAllFactoriesByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Factory.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (List<Factory>) crit.list();
	}

	@Override
	public List<Factory> getFactoriesToByIdList(List<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Factory.class);
		crit.add(Restrictions.in("id", ids));
		return (List<Factory>) crit.list();
	}

	@Override
	public Boolean saveAll(List<Factory> factories) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (Factory factory : factories) {
				session.saveOrUpdate(factory);
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

	@Override
	public void saveFactoryAndFacilities(Factory factory, List<Facility> facilitiesToSave) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			// Save or update the factory
			session.saveOrUpdate(factory);

			// Save or update the facilities
			int i = 0;
			for (Facility facility : facilitiesToSave) {
				if (facility.getId() == null) {
					facility.setFactory(factory);
				}
				session.saveOrUpdate(facility);
				if (i % Constants.BATCH_SIZE_HIBERNATE == 0) { // 50, same as the JDBC batch size
					// flush a batch of inserts and release memory:
					session.flush();
					session.clear();
				}
				i++;
			}

			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
