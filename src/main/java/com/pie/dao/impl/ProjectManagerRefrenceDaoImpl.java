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

import com.pie.dao.ProjectManagerRefrenceDao;
import com.pie.entity.ProjectManagerRefrence;
import com.pie.util.Constants;

@Transactional
@Repository
public class ProjectManagerRefrenceDaoImpl implements ProjectManagerRefrenceDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(ProjectManagerRefrence projectManagerRefrence) {
		Session session = sessionFactory.getCurrentSession();
		session.save(projectManagerRefrence);
		
	}
	
	@Override
	public void update(ProjectManagerRefrence projectManagerRefrence) {
		Session session = sessionFactory.getCurrentSession();
		session.update(projectManagerRefrence);
		
	}
	
	@Override
	public List<ProjectManagerRefrence> getPMRefrencesByAccountId(Integer accountId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProjectManagerRefrence.class);
		crit.add(Restrictions.eq("accountId", accountId));
		return (List<ProjectManagerRefrence>) crit.list();
	}

	@Override
	public List<ProjectManagerRefrence> getPMRefrencesByLsitIdAccountId(List<Integer> ids,Integer accountId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(ProjectManagerRefrence.class);
		crit.add(Restrictions.in("id", ids));
		crit.add(Restrictions.eq("accountId", accountId));
		return (List<ProjectManagerRefrence>) crit.list();
	}
	
	@Override
	public Boolean saveAll(List<ProjectManagerRefrence> projectManagerRefrences) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (ProjectManagerRefrence refrence : projectManagerRefrences) {
				session.saveOrUpdate(refrence);
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
