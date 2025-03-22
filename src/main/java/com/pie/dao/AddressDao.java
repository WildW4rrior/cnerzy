package com.pie.dao;

import java.util.List;

import com.pie.entity.Address;

public interface AddressDao {

	void save(Address address);

	Address getAddressById(Integer addressId);

	Address getAddressByCompanyId(Integer companyId);

	void update(Address address);
}
