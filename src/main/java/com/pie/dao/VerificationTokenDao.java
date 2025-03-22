package com.pie.dao;

import com.pie.entity.VerificationToken;

public interface VerificationTokenDao {

	void save(VerificationToken verificationToken);

	VerificationToken getByVerificationToken(String token);

	VerificationToken findByAccountId(Integer userId);

}
