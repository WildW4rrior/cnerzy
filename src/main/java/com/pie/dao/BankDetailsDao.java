package com.pie.dao;

import com.pie.entity.BankDetails;

public interface BankDetailsDao {

	void save(BankDetails bankDetails);

	BankDetails getBankDetailById(Integer bankId);

	BankDetails getBankDetailByCompanyId(Integer companyId);

	void update(BankDetails bankDetails);

}
