package com.pie.dao;

import java.util.List;

import com.pie.entity.Product;

public interface ProductDao {

	List<Product> getAllProductsByCompanyId(Integer companyId);

	void update(Product product);

	void save(Product product);

	Boolean saveAll(List<Product> products);

	List<Product> getProductsByIdList(List<Integer> ids);

}
