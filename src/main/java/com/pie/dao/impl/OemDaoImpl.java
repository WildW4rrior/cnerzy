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

import com.pie.dao.OemDao;
import com.pie.entity.OEMofCompany;
import com.pie.util.Constants;

@Transactional
@Repository
public class OemDaoImpl implements OemDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(OEMofCompany oemOfCompany) {
		Session session = sessionFactory.getCurrentSession();
		session.save(oemOfCompany);
	}

	@Override
	public void update(OEMofCompany oemOfCompany)  {
		Session session = sessionFactory.getCurrentSession();
		session.update(oemOfCompany);
	}

	@Override
	public List<OEMofCompany> getAllOEMByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(OEMofCompany.class);
		crit.add(Restrictions.eq("companyId", companyId));
		return (List<OEMofCompany>) crit.list();
	}
	
	@Override
	public List<OEMofCompany> getOemsByIdList(List<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(OEMofCompany.class);
		crit.add(Restrictions.in("id", ids));
		return (List<OEMofCompany>) crit.list();
	}
	
	
	@Override
	public Boolean saveAll(List<OEMofCompany> oeMofCompanies) {
		 try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (OEMofCompany oeMofCompany : oeMofCompanies) {	
				 session.saveOrUpdate(oeMofCompany);
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
