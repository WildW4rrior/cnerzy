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

import com.pie.dao.CompanyDocumentDao;
import com.pie.entity.CompanyDocument;
import com.pie.util.Constants;

@Transactional
@Repository
public class CompanyDocumentDaoImpl implements CompanyDocumentDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(CompanyDocument document) {
		Session session = sessionFactory.getCurrentSession();
		session.save(document);
	}

	@Override
	public void update(CompanyDocument document)  {
		Session session = sessionFactory.getCurrentSession();
		session.update(document);
	}

	@Override
	public List<CompanyDocument> getCompanyDocumentsByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyDocument.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		return (List<CompanyDocument>) crit.list();
	}
	
	@Override
	public List<CompanyDocument> getCompanyDocumentsByIdList(List<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyDocument.class);
		crit.add(Restrictions.in("id", ids));
		return (List<CompanyDocument>) crit.list();
	}
	
	@Override
	public CompanyDocument getCompanyDocumentById(Integer id, Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyDocument.class);
		crit.add(Restrictions.eq("id", id));
		crit.add(Restrictions.eq("company.companyId", companyId));
		return (CompanyDocument) crit.uniqueResult();
	}
	
	@Override
	public CompanyDocument getDocumentByCompanyIdAndName(Integer companyId, String name) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyDocument.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		crit.add(Restrictions.eq("docName", name));
		return (CompanyDocument) crit.uniqueResult();
	}
	
	@Override
	public List<CompanyDocument> getDocumentByCompanyIdAndNameList(Integer companyId, List<String> names) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CompanyDocument.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		crit.add(Restrictions.in("docName", names));
		return (List<CompanyDocument>) crit.list();
	}
	
	@Override
	public Boolean saveAll(List<CompanyDocument> documents) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (CompanyDocument companyDocument : documents) {
				session.saveOrUpdate(companyDocument);
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
