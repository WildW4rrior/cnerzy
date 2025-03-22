package com.pie.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.pie.dao.AddressDao;
import com.pie.entity.Address;
import com.pie.entity.BankDetails;

@Transactional
@Repository
public class AddressDaoImpl implements AddressDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Address address) {
		Session session = sessionFactory.getCurrentSession();
		session.save(address);
	}
	
	
	@Override
	public void update(Address address) {
		Session session = sessionFactory.getCurrentSession();
		session.update(address);
	}

	@Override
	public Address getAddressByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Address.class);
		crit.add(Restrictions.eq("company.companyId", companyId));
		 List<Address> addresses = crit.list();
		    if (addresses.size() > 0) {
		        return addresses.get(0);
		    } else {
				return null;
		    }
	}
	
	@Override
	public Address getAddressById(Integer addressId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Address.class);
		crit.add(Restrictions.in("id", addressId));
		List<Address> addresses = crit.list();
	    if (addresses.size() > 0) {
	        return addresses.get(0);
	    } else {
	        return null;
	    }
	}
}
