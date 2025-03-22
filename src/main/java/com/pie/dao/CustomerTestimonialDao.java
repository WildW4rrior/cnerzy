package com.pie.dao;

import java.util.List;

import com.pie.entity.CustomerTestimonial;

public interface CustomerTestimonialDao {

	Boolean saveAll(List<CustomerTestimonial> customerTestimonials);

	List<CustomerTestimonial> getCustomerTestimonialsByIdList(List<Integer> ids, Integer companyId);

	List<CustomerTestimonial> getAllCustomerTestimonialsByCompanyId(Integer companyId);

	void update(CustomerTestimonial testimonial);

	void save(CustomerTestimonial testimonial);

}
