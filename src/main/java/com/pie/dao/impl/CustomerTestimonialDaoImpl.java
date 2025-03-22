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

import com.pie.dao.CustomerTestimonialDao;
import com.pie.entity.CustomerTestimonial;
import com.pie.util.Constants;

@Transactional
@Repository
public class CustomerTestimonialDaoImpl implements CustomerTestimonialDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(CustomerTestimonial testimonial) {
		Session session = sessionFactory.getCurrentSession();
		session.save(testimonial);
	}

	@Override
	public void update(CustomerTestimonial testimonial) {
		Session session = sessionFactory.getCurrentSession();
		session.update(testimonial);
	}

	@Override
	public List<CustomerTestimonial> getAllCustomerTestimonialsByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CustomerTestimonial.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		return (List<CustomerTestimonial>) crit.list();
	}
	
	@Override
	public List<CustomerTestimonial> getCustomerTestimonialsByIdList(List<Integer> ids, Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(CustomerTestimonial.class);
		crit.add(Restrictions.in("id", ids));
		crit.add(Restrictions.eq("company.companyId", companyId));
		return (List<CustomerTestimonial>) crit.list();
	}

	@Override
	public Boolean saveAll(List<CustomerTestimonial> customerTestimonials) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (CustomerTestimonial testimonial : customerTestimonials) {
				session.saveOrUpdate(testimonial);
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
