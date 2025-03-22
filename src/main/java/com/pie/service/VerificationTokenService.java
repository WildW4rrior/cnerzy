package com.pie.service;

import java.util.HashMap;

import com.pie.entity.Account;

public interface VerificationTokenService {

	String generateVerificationToken();
	HashMap<String, String> verifyToken(String token);

	boolean registerVerificationToken(Account account, boolean isEmailUpdate);

	void sendVerificationToken(String verificationToken, Account account, boolean isEmailUpdate);


}
