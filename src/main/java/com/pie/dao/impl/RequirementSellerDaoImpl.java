package com.pie.dao.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.RequirementSellerDao;
import com.pie.entity.ProjectManagerRefrence;
import com.pie.entity.RequirementSeller;
import com.pie.util.Constants;

@Transactional
@Repository
public class RequirementSellerDaoImpl implements RequirementSellerDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public RequirementSeller save(RequirementSeller requirementSeller) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(requirementSeller);
		return requirementSeller;
	}

	@Override
	public void bulkSave(List<RequirementSeller> requirementSellerList) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (RequirementSeller seller : requirementSellerList) {
				session.saveOrUpdate(seller);
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
		}
	}

	@Override
	public List<RequirementSeller> getAllRequirementSellersByReqId(Integer requirementId, String status) {
		// Use Status "null" for all Sellers, otherwise use Constants to get interested
		// or not, or add new constant
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.eq("reqId", requirementId));
		if (status != null) {
			if (status.equals(Constants.INTERESTED_SELLER)) {
				crit.add(Restrictions.eq("isSellerInterested", true));
			} else if (status.equals(Constants.NOT_INTERESTED_SELLER)) {
				crit.add(Restrictions.eq("isSellerNotInterested", true));
			} else if (status.equals(Constants.FINALIZED_SELLER)) {
				crit.add(Restrictions.eq("isFinalised", true));
			} else if (status.equals(Constants.SHORTLISTED_SELLER)) {
				crit.add(Restrictions.eq("isShortlisted", true));
			}
		}
		return crit.list();
	}

	@Override
	public List<RequirementSeller> getSellerRequirementListBySellerCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.eq("sellerCompanyId", companyId));
		crit.add(Restrictions.eq("isSellerNotInterested", false));
		return crit.list();
	}

	@Override
	public RequirementSeller getRequirementSellerId(int id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.eq("id", id));
		return (RequirementSeller) crit.uniqueResult();
	}

	@Override
	public void update(RequirementSeller requirementSeller) {
		Session session = sessionFactory.getCurrentSession();
		session.update(requirementSeller);
	}

	@Override
	public RequirementSeller getRequirementSellerByReqIdAndSellerCid(Integer reqId, Integer sellerCompanyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.eq("sellerCompanyId", sellerCompanyId));
		crit.add(Restrictions.eq("reqId", reqId));
		return (RequirementSeller) crit.uniqueResult();
	}
	
	@Override
	public RequirementSeller getSellerForRequirementWithNoNegotiation(Integer reqId, Integer sellerCompanyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.eq("sellerCompanyId", sellerCompanyId));
		crit.add(Restrictions.eq("reqId", reqId));
		crit.add(Restrictions.isNull("sellerNegotiationStartDate"));
		return (RequirementSeller) crit.uniqueResult();
	}
	
	 @Override
	    public Map<String, Long> getSellerRequirementCounts(Integer companyId) {
	        Session session = sessionFactory.getCurrentSession();
	        Criteria crit = session.createCriteria(RequirementSeller.class);

	        crit.setProjection(Projections.rowCount());
	        crit.add(Restrictions.eq("sellerCompanyId", companyId));
	        Long totalSent = (Long) crit.uniqueResult();

	        crit.setProjection(Projections.countDistinct("id"));
	        crit.add(Restrictions.eq("sellerCompanyId", companyId));
	        crit.add(Restrictions.eq("isSellerInterested", true));
	        Long interestedCount = (Long) crit.uniqueResult();

	        Map<String, Long> counts = new HashMap<>();
	        counts.put("totalRequirementSent", totalSent);
	        counts.put("interestedCount", interestedCount);

	        return counts;
	    }

	@Override
	public List<RequirementSeller> getAllFinalizedRequirementSellersByReqIds(List<Integer> reqIds) {
		if (reqIds == null || reqIds.isEmpty()) {
	        return Collections.emptyList();
	    }
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.in("reqId", reqIds));
		crit.add(Restrictions.eq("isFinalised", true));
		return crit.list();
	}

	@Override
	public RequirementSeller getRequirementSellerByZohoDocId(String zohoDocId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(RequirementSeller.class);
		crit.add(Restrictions.eq("zohoDocumentId", zohoDocId));
		return (RequirementSeller) crit.uniqueResult();
	}

}
