package com.pie.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import com.pie.entity.Account;
import com.pie.model.RegisterationBean;

public interface AccountDAO {

	Account findAccount(String userName);

	List<Account> getAccountBasedOnUserId(Integer userId);

	void updatePasswordBasedOnUserName(String username, String newpassword);

	Account getAccountBasedOnEmailId(String parameter);

//	void sendForgotLink(String emailId, Integer userId,String path);

	void updatePasswordBasedOnUserId(Integer userId, String password);

	long getUserNameCount(String userName);

	Account getAccountByCompanyId(Integer companyId);

	Account saveSubUser(Account account);

	List<Account> getUsersBasedOnCompanyId(Integer companyId, Map<String, String> queryMap);

	Boolean deleteSubUser(Account account);

	Account getAccountBasedOnUserId(Integer userId, Integer companyId);

	Boolean updateSubUserAccount(Account account);

	Boolean deleteAccountOwner(Account account);

	List<Account> getAllAccount();

	List<Account> getAllUsersBasedOnUserName(Set<String> clientEmailIdList);

	List<Account> getAllAccountsByFilter(Map<String, String> filter);

	Account save(Account account);

	void updateAccountEmailVerified(Account account);

	void update(Account account);

	Account getAccountBasedOnId(Integer id);

	void sendForgotLink(Account account) throws MessagingException;

	List<Account> getUsersByFilter(Map<String, String> filters);

	List<Account> getAllSellerAccountsByCompanyIds(List<Integer> sellerCompanyIds);

	List<Account> getPmByFilter(Map<String, String> filters);

	List<Account> getAllAccountsByCompanyIds(List<Integer> companyIds);

	Account getAccountBasedOnEmailIdAndRole(String email, String userRole);

}
