package com.pie.service;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.hibernate.NonUniqueResultException;

import com.pie.entity.Account;
import com.pie.model.Profile;
import com.pie.model.RegisterationBean;

public interface AccountService {

	List<Account> getAccountBasedOnUserId(Integer userId);
	
	void sendForgotLink(String emailId,Integer userId, String path);
	
 	void sendForgotLink(Account account) throws MessagingException;
 	
	void updatePasswordBasedOnUserName(String username, String newpassword);

	Account getAccountBasedOnEmailId(String parameter);

	void updatePasswordBasedOnUserId(Integer userId,String password);	

	long getUserNameCount(String userName);

	public boolean isOldPasswordMatches(String reqOldPassword, String oldPassword);

	Account getAccount(String username);

	Account getAccountByCompanyId(Integer companyId);
	
	List<Account> getAllAccount();

	List<Account> getAllUsersBasedOnUserName(Set<String> clientEmailIdList);

	List<Map<String, String>> getAllUsersByFilter(Map<String, String> filters);

	List<String> getAddedBySessionList(Integer companyId);

	Profile getProfileDetails(Integer userId);

	Map<String, String> save(RegisterationBean registerationBean, HttpSession session)
			throws UnsupportedEncodingException, AddressException, MessagingException, ParseException;
	
	void updateAccountStatus(Map<String,String> statusMap) throws MessagingException;

	List<Map<String, Object>> getAllPmByFilter(Map<String, String> queryMap);

	Map<String, String> getPMProfileById(Integer reqId);

	Account getAccountBasedOnEmailIdAndRole(String email, String userRole) throws NonUniqueResultException;


}
