package com.pie.dao;

import java.util.List;

import com.pie.entity.Customer;

public interface CustomerDao {

	void save(Customer customer);

	void update(Customer customer);

	List<Customer> getAllCustomersByCompanyId(Integer companyId);

	Boolean saveAll(List<Customer> customers);

	List<Customer> getCustomersByIdList(List<Integer> ids);

}
