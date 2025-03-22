package com.pie.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.AbstractDao;
import com.pie.dao.AccountDAO;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.Company;
import com.pie.util.DateUtil;
import com.pie.util.EmailSender;
import com.pie.util.Encoder;
import com.pie.util.EnvironmentUtil;
import com.pie.util.StringUtil;
import com.pie.util.USER_ROLES;

@Transactional
@Repository
public class AccountDAOImpl extends AbstractDao<Serializable, Account> implements AccountDAO {
	private static final Logger LOGGER = LoggerFactory.getLogger(AccountDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private EmailSender emailSender;

	@Autowired
	private EnvironmentUtil environmentUtil;

	@Override
	public Account findAccount(String userName) {
		Account account = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria crit = session.createCriteria(Account.class);
			crit.add(Restrictions.eq("userName", userName));
			account = (Account) crit.uniqueResult();
			LOGGER.info("Account: {}", account == null ? null : account.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e.getMessage());
		}
		return account;
	}

	@Override
	public Account getAccountBasedOnId(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Account.class);
		crit.add(Restrictions.eq("userId", id));
		Account account = (Account) crit.uniqueResult();
		return account;
	}

	@Override
	public Account save(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(account);
		return account;
	}

	@Override
	public void update(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.update(account);
	}

	@Override
	public List<Account> getAccountBasedOnUserId(Integer userId) {

		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Account.class);
		crit.add(Restrictions.eq("userId", userId));
		List<Account> account = (List<Account>) crit.list();
		return account;
	}

	@Override
	public void updatePasswordBasedOnUserName(String username, String newpassword) {
		Session session = sessionFactory.getCurrentSession();
		try {
			LOGGER.info("enter into updatePasswordBasedOnUserName ");
			Account acc = (Account) session.createCriteria(Account.class).add(Restrictions.eq("userName", username))
					.uniqueResult();
			acc.setPassword(newpassword);
			session.saveOrUpdate(acc);

			LOGGER.info("out into updatePasswordBasedOnUserName ");
		} catch (Exception asd) {
		}
	}

	@Override
	public Account getAccountBasedOnEmailId(String parameter) {
		try {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Account.class);
		crit.add(Restrictions.eq("emailId", parameter));
		Account account = (Account) crit.uniqueResult();
		LOGGER.info(account!=null?"Account Fetched With Email":"Either Account Not Exists Or Not Found");
		return account;
		}catch (Exception e) {
			LOGGER.info(e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void updatePasswordBasedOnUserId(Integer userId, String newPassword) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Account account = (Account) session.createCriteria(Account.class).add(Restrictions.eq("userId", userId))
					.uniqueResult();
			account.setPassword(newPassword);
			session.saveOrUpdate(account);
		} catch (Exception asd) {
			asd.printStackTrace();
		}
	}

	@Override
	public long getUserNameCount(String userName) {
		long count = ((Long) sessionFactory.getCurrentSession().createCriteria(Account.class)
				.add(Restrictions.eq("userName", userName)).setProjection(Projections.rowCount()).uniqueResult())
				.intValue();
		return count;
	}

	@Override
	public List<Account> getAllAccountsByFilter(Map<String, String> filters) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Account.class);
		if (!filters.isEmpty()) {
			if (filters.containsKey("startDate") && (filters.get("startDate") != "")) {
				crit.add(Restrictions.gt("createdOn", DateUtil.convert(filters.get("startDate"))));
			}
			if (filters.containsKey("endDate") && filters.get("endDate") != "") {
				crit.add(Restrictions.le("createdOn", DateUtil.convert(filters.get("endDate"))));
			}
			if (filters.containsKey("planType") && filters.get("planType") != "") {

				String[] planType = filters.get("planType").toString().split(",");
				List<String> planTypelist = Arrays.asList(planType);

				if (!planTypelist.isEmpty()) {
					crit.add(Restrictions.in("plan", planTypelist));
				}
			}
			if (filters.containsKey("expiresIn") && filters.get("expiresIn") != "") {
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DAY_OF_MONTH, (Integer.parseInt(filters.get("expiresIn"))));
				Date expiresInDate = cal.getTime();
				crit.add(Restrictions.le("expiresOn", expiresInDate));
			}
			if (filters.containsKey("userRole") && StringUtil.isNullOrEmpty(filters.get("userRole"))) {
				// TODO Add Filter BY User ROle
			}
		}
		crit.addOrder(Order.desc("createdOn"));
		List<Account> accountList = (List<Account>) crit.list();
		return accountList;
	}

	@Override
	public Account getAccountByCompanyId(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Account.class);
		criteria.add(Restrictions.eq("companyId", companyId));
		return (Account) criteria.uniqueResult();
	}

	@Override
	public Account saveSubUser(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.save(account);
		return account;
	}

	@Override
	public List<Account> getUsersBasedOnCompanyId(Integer companyId, Map<String, String> queryMap) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Account.class);
		criteria.add(Restrictions.eq("ccompanyId", companyId)).addOrder(Order.desc("createdOn"));
		List<Account> list = criteria.list();
		return list;
	}

	@Override
	public Boolean deleteSubUser(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(account);
		return true;
	}

	@Override
	public Account getAccountBasedOnUserId(Integer userId, Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Account.class);
		criteria.add(Restrictions.eq("company.companyId", companyId)).add(Restrictions.eq("userId", userId));
		Account account = (Account) criteria.uniqueResult();
		return account;
	}

	@Override
	public Boolean updateSubUserAccount(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.update(account);
		return true;
	}

	@Override
	public Boolean deleteAccountOwner(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.update(account);
		return true;
	}

	@Override
	public List<Account> getAllAccount() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Account.class);
		criteria.add(Restrictions.eq("userRole", "MANAGER")).add(Restrictions.isNotNull("company.companyId"));
		List<Account> accounts = criteria.list();
		return accounts;
	}

	@Override
	public List<Account> getAllUsersBasedOnUserName(Set<String> clientEmailIdList) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Account.class);
		criteria.add(Restrictions.in("userName", clientEmailIdList));
		criteria.add(Restrictions.or(Restrictions.eq("isDeleted", false), Restrictions.isNull("isDeleted")));
		List<Account> accounts = criteria.list();
		return accounts;
	}

	@Override
	public void updateAccountEmailVerified(Account account) {
		Session session = sessionFactory.getCurrentSession();
		account.setEmailVerified(true);
		session.update(account);
	}

	@Override
	public void sendForgotLink(Account account) throws MessagingException {
		LOGGER.info("Start sending forget link");
		String subject = "Reset Your Password";
		String link = environmentUtil.getEnvironment() + "forgotLink/"
				+ Encoder.encodeInput(String.valueOf(account.getUserId()));
		List<String> linesList = new ArrayList<>();	
		String line1 = "We received a request to reset your password for your Cnerzy account. If you requested this reset, follow the link below to create a new password:";
		String line2 = link;
		linesList.add(line1);
		linesList.add(line2);
		try {
			emailSender.sendEmail(subject,
					EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
					null, "Cnerzy", null);
			LOGGER.info("Forget password email sent to" + account.getEmailId());
		} catch (MessagingException e) {
			e.printStackTrace();
			LOGGER.error(e.getLocalizedMessage());
		}
	}

	@Override
	public List<Account> getUsersByFilter(Map<String, String> filters) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Account.class);
		if (filters!=null && !filters.isEmpty()) {
			if (filters.containsKey("userRole") && (filters.get("userRole") != "")) {
				crit.add(Restrictions.eq("userRole", (filters.get("userRole"))));
			}
		}
		crit.add(Restrictions.ne("userRole", USER_ROLES.ADMIN));
		crit.add(Restrictions.eq("isOnboardingComplete", true));
		crit.addOrder(Order.desc("createdOn"));
		List<Account> accountList = (List<Account>) crit.list();
		return accountList;
	}

	@Override
	public List<Account> getPmByFilter(Map<String, String> filters) {
		Session session = sessionFactory.getCurrentSession();
		if (!filters.isEmpty()) {
			if ((filters.containsKey("expertise") && (filters.get("expertise") != ""))
					&& ((filters.containsKey("industry") && (filters.get("industry") != "")))) {
				 String hql = "SELECT a FROM Account a JOIN Company c ON a.companyId = c.companyId " +
		                    "WHERE c.industryExpertise = :expertise AND c.companyIndustry = :industry AND a.userRole=:userRole AND a.status=:status";

		            Query query = session.createQuery(hql);
		            query.setParameter("expertise", filters.get("expertise"));
		            query.setParameter("industry", filters.get("industry"));
		            query.setParameter("userRole", USER_ROLES.PM);
		            query.setParameter("status", "approved");
				return query.list();

			}
		}
		return null;

	}

	@Override
	public List<Account> getAllSellerAccountsByCompanyIds(List<Integer> sellerCompanyIds) {
		if (sellerCompanyIds == null || sellerCompanyIds.isEmpty()) {
	        return Collections.emptyList();
	    }
		Session session = sessionFactory.getCurrentSession();
		
		Criteria crit = session.createCriteria(Account.class);
		crit.add(Restrictions.in("companyId", sellerCompanyIds));
		crit.add(Restrictions.eq("userRole", USER_ROLES.SELLER));
		return crit.list();
	}
	
	@Override
	public List<Account> getAllAccountsByCompanyIds(List<Integer> companyIds) {
		if (companyIds == null || companyIds.isEmpty()) {
	        return Collections.emptyList();
	    }
		Session session = sessionFactory.getCurrentSession();
		
		Criteria crit = session.createCriteria(Account.class);
		crit.add(Restrictions.in("companyId", companyIds));
		return crit.list();
	}

	@Override
	public Account getAccountBasedOnEmailIdAndRole(String email, String userRole) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria crit = session.createCriteria(Account.class);
			crit.add(Restrictions.eq("emailId", email));
			crit.add(Restrictions.eq("userRole", userRole).ignoreCase());
			Account account = (Account) crit.uniqueResult();
			LOGGER.info(account!=null?"Account Fetched With Email":"Either Account Not Exists Or Not Found");
			return account;
			}catch (Exception e) {
				LOGGER.info(e.getLocalizedMessage());
				e.printStackTrace();
				return null;
			}
	}

}