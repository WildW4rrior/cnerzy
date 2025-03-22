package com.pie.dao.impl;

import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.ProjectDao;
import com.pie.entity.Project;
import com.pie.util.USER_ROLES;

@Transactional
@Repository
public class ProjectDaoImpl implements ProjectDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Project project) {
		Session session = sessionFactory.getCurrentSession();
		session.save(project);
	}

	@Override
	public void update(Project project) {
		Session session = sessionFactory.getCurrentSession();
		session.update(project);
	}

	@Override
	public Project getProjectByReqId(Integer reqId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("reqId", reqId));
		return (Project) crit.uniqueResult();
	}
	
	@Override
	public Project getProjectByProjectId(Integer projectId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("id", projectId));
		return (Project) crit.uniqueResult();
	}

	@Override
	public List<Project> getProjectListOfUserByIdAndRole(Integer id, String role) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		// If admin, we need to fetch all
		if (role.equals(USER_ROLES.PM)) {
			crit.add(Restrictions.eq("managerId", id));
		} else if (role.equals(USER_ROLES.BUYER)) {
			crit.add(Restrictions.eq("buyerCompanyId", id));
		} else if (role.equals(USER_ROLES.SELLER)) {
			crit.add(Restrictions.eq("sellerCompanyId", id));
		}
		crit.addOrder(Order.desc("creationDate"));
		return crit.list();
	}

	@Override
	public Integer getCountOfActiveProjectsByPMId(int id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("managerId", id));
		crit.add(Restrictions.isNull("actualCompletionDate"));
		List<Project> activeProjectList = crit.list();
		return activeProjectList.size();
	}

	@Override
	public Integer getCountOfCompletedProjectsBySellerCompoanyId(int comapnyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("sellerCompanyId", comapnyId));
		crit.add(Restrictions.isNotNull("actualCompletionDate"));
		List<Project> activeProjectList = crit.list();
		return activeProjectList.size();
	}

	@Override
	public Integer getCountOfCompletedProjectsByBuyerCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("buyerCompanyId", companyId));
		crit.add(Restrictions.isNotNull("actualCompletionDate"));
		List<Project> activeProjectList = crit.list();
		return activeProjectList.size();
	}

	@Override
	public List<Project> getAllProjectsByReqIdList(List<Integer> reqIdsForProjects) {
		if(reqIdsForProjects==null ||  reqIdsForProjects.isEmpty()) {
			 return Collections.emptyList();
		}
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.in("reqId", reqIdsForProjects));
		return (List<Project>) crit.list();
	}
	
	@Override
	public Project getProjectByEscrowTransactionId(Integer transactionId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("escrowTransactionId", transactionId));
		return (Project) crit.uniqueResult();
	}
	
	@Override
	public Project getProjectByZohoTripartiteDocId(String zohoDocId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Project.class);
		crit.add(Restrictions.eq("zohoTripartiteDoCId", zohoDocId));
		return (Project) crit.uniqueResult();
	}
}
