package com.pie.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.RequirementDocumentDao;
import com.pie.entity.RequirementDocuments;
import com.pie.util.Constants;

@Transactional
@Repository
public class RequirementDocumentDaoImpl implements RequirementDocumentDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(RequirementDocuments requirementDocuments) {
		Session session = sessionFactory.getCurrentSession();
		session.save(requirementDocuments);
	}

	@Override
	public Boolean bulkSave(List<RequirementDocuments> requirementDocuments) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (RequirementDocuments document : requirementDocuments) {
				session.save(document);
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
	public void update(RequirementDocuments requirementDocuments) {
		Session session = sessionFactory.getCurrentSession();
		session.update(requirementDocuments);
	}

	@Override
	public List<RequirementDocuments> getRequirementDiscussionByReqId(Integer reqId, Integer participant1,
			Integer participant2) {
		Session session = sessionFactory.getCurrentSession();
//		String hql = "FROM RequirementDocuments rd WHERE rd.reqId = :reqId AND "
//				+ "(rd.addedByCid = :participant1 OR rd.addedForCid = :participant1 OR "
//				+ " rd.addedByCid = :participant2 OR rd.addedForCid = :participant2)";
		
		String hql = "FROM RequirementDocuments rd WHERE rd.reqId = :reqId AND "
	            + "((rd.addedByCid = :participant1 OR rd.addedForCid = :participant1) "
	            + " AND (rd.addedByCid = :participant2 OR rd.addedForCid = :participant2) "
	            + " OR (rd.addedByCid IS NULL AND rd.addedForCid IS NULL AND (rd.isAddedByPM = true OR rd.isAddedByAdmin = true))) "
	            + "ORDER BY rd.dateAdded DESC";

		Query query = session.createQuery(hql);
		query.setParameter("reqId", reqId);
		query.setParameter("participant1", participant1);
		query.setParameter("participant2", participant2);
		return query.list();
	}
}
