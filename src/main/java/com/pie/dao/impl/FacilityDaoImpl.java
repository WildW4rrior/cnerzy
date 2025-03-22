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

import com.pie.dao.FacilityDao;
import com.pie.entity.Facility;
import com.pie.util.Constants;

@Transactional
@Repository
public class FacilityDaoImpl implements FacilityDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Facility facility) {
		Session session = sessionFactory.getCurrentSession();
		session.save(facility);
	}

	@Override
	public void update(Facility facility) {
		Session session = sessionFactory.getCurrentSession();
		session.update(facility);
	}

	@Override
	public List<Facility> getAllFacilitiesByFactoryId(Integer factoryId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Facility.class);
		crit.add(Restrictions.eq("factory.id", factoryId));
		return (List<Facility>) crit.list();
	}

	@Override
	public List<Facility> getFacilitesToByIdAndFactoryIdList(List<Integer> ids, Integer factoryId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Facility.class);
		crit.add(Restrictions.in("id", ids));
		crit.add(Restrictions.eq("factory.id", factoryId));
		return (List<Facility>) crit.list();
	}

	@Override
	public Boolean saveAll(List<Facility> facilities) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (Facility facility : facilities) {
				session.saveOrUpdate(facility);
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
	public List<Facility> getFacilitiesByAllFactoryIds(List<Integer> factoryIds) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Facility.class);
		crit.add(Restrictions.in("factory.id", factoryIds));
		return (List<Facility>) crit.list();
	}
}