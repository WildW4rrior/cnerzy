package com.pie.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.math3.ml.distance.CanberraDistance;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.RequirementDao;
import com.pie.entity.Project;
import com.pie.entity.Requirement;
import com.pie.util.RequirementStatus;
import com.pie.util.StringUtil;

import ch.qos.logback.core.joran.conditional.IfAction;

@Transactional
@Repository
public class RequirementDaoImpl implements RequirementDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Requirement requirment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(requirment);
	}

	@Override
	public void update(Requirement requirment) {
		Session session = sessionFactory.getCurrentSession();
		session.update(requirment);
	}

	@Override
	public List<Requirement> getRequirementListByCompanyId(Integer buyerCompanyId, Integer sellerCid) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		crit.add(Restrictions.eq("companyId", buyerCompanyId));

		if (sellerCid != null) {
			// subquery to fetch reqId from Project where buyerCompanyId and sellerCompanyId
			// match
			DetachedCriteria subquery = DetachedCriteria.forClass(Project.class)
					.add(Restrictions.eq("buyerCompanyId", buyerCompanyId))
					.add(Restrictions.eq("sellerCompanyId", sellerCid)).setProjection(Projections.property("reqId"));

			crit.add(Subqueries.propertyIn("id", subquery));
		}

		return (List<Requirement>) crit.list();
	}

	@Override
	public Requirement getRequirementByIdAndCompanyId(Integer id, Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		crit.add(Restrictions.eq("id", id));
		crit.add(Restrictions.eq("companyId", companyId));
		return (Requirement) crit.uniqueResult();
	}

	@Override
	public Requirement getRequirementByUniqueNo(String uniqueNo) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		crit.add(Restrictions.eq("requirementNo", uniqueNo));
		return (Requirement) crit.uniqueResult();
	}

	@Override
	public List<Object[]> getPreviousEngagedSellerList(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Project.class);

		criteria.add(Restrictions.eq("buyerCompanyId", companyId));
		criteria.add(Restrictions.isNotNull("actualCompletionDate"));

		criteria.setProjection(Projections.projectionList().add(Projections.property("sellerCompanyId"))
				.add(Projections.property("actualCompletionDate")));

		criteria.addOrder(Order.desc("actualCompletionDate"));

		return criteria.list();
	}

	@Override
	public Requirement getRequirementById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		crit.add(Restrictions.eq("id", id));
		return (Requirement) crit.uniqueResult();
	}

	@Override
	public List<Requirement> getRequirementsList(Map<String, String> queryMap) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		if (queryMap != null && !queryMap.isEmpty()) {
			if (queryMap.containsKey("status") && !StringUtil.isNullOrEmpty(queryMap.get("status"))) {
				crit.add(Restrictions.eq("status", queryMap.get("status")));
			}
		}
		crit.addOrder(Order.desc("id"));
		return crit.list();
	}

	@Override
	public void updateRequirementStatus(Integer reqId, RequirementStatus status) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		crit.add(Restrictions.eq("id", reqId));
		Requirement requirement = (Requirement) crit.uniqueResult();
		requirement.setStatus(status);
		session.update(requirement);

	}

	@Override
	public List<Requirement> getContractsForAdmin() {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Requirement.class);
		Criterion contractStatus = Restrictions.eq("status", RequirementStatus.PURCHASE_ORDER_RELEASE);
		Criterion projectKickoffStatus = Restrictions.eq("status", RequirementStatus.PROJECT_KICKOFF);
		Criterion bothStatus = Restrictions.or(contractStatus, projectKickoffStatus);
		crit.add(bothStatus);
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (List<Requirement>) crit.list();
	}
}
