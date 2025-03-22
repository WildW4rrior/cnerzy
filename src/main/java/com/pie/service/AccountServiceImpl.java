package com.pie.service;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.hibernate.NonUniqueResultException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.pie.dao.AccountDAO;
import com.pie.dao.AddressDao;
import com.pie.dao.CompanyContactPersonDao;
import com.pie.dao.CompanyDao;
import com.pie.dao.ProjectDao;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.Address;
import com.pie.entity.Company;
import com.pie.entity.CompanyContactPerson;
import com.pie.model.Profile;
import com.pie.model.RegisterationBean;
import com.pie.util.Constants;
import com.pie.util.EmailSender;
import com.pie.util.StringUtil;
import com.pie.util.USER_ROLES;

@Service
public class AccountServiceImpl implements AccountService {

	private static final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
	private VerificationTokenService verificationTokenService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private CompanyContactPersonDao companyContactPersonDao;
	
	@Autowired
	private AddressDao addressDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Environment environment;

	@Override
	public Account getAccountByCompanyId(Integer companyId) {
		logger.info("Inside getAccountByCompanyId {}", companyId);
		Account account = accountDAO.getAccountByCompanyId(companyId);
		return account;
	}

	@Override
	public Account getAccount(String username) {
		logger.info("Inside getAccount {}", username);
		return accountDAO.findAccount(username);
	}

	@Override
	public Map<String, String> save(RegisterationBean registerationBean, HttpSession session)
			throws UnsupportedEncodingException, AddressException, MessagingException, ParseException {
		logger.info("Inside save user {}", registerationBean.getUserName());
		Map<String, String> errorMap = new HashMap<>();
		try {

			if (getAccountBasedOnEmailIdAndRole(registerationBean.getEmailId(), registerationBean.getUserRole()) != null) {
				errorMap.put("status", "false");
				errorMap.put("message", "Email already exists");
				return errorMap;
			}
			if (!registerationBean.getPassword().equals(registerationBean.getConfirmPassword())) {
				errorMap.put("status", "false");
				errorMap.put("message", "Password do not match.");
				return errorMap;
			}

			if (StringUtil.isNullOrEmpty(registerationBean.getUserRole())) {
				errorMap.put("status", "false");
				errorMap.put("message", "User Role Not Selected");
				return errorMap;
			}
			// Encode the password
			registerationBean.setPassword(passwordEncoder.encode(registerationBean.getPassword()));
			// Create a new account
			Account account = new Account();
			account.setUserId(registerationBean.getUserId());
			account.setFullName(getFullName(registerationBean));
			account.setFirstName(registerationBean.getFirstName());
			account.setLastName(registerationBean.getLastName());
			account.setEmailId(registerationBean.getEmailId());
			account.setPassword(registerationBean.getPassword());
			account.setUserName(registerationBean.getEmailId());
			account.setCreatedOn(getCurrentDateTime());
			account.setReferredFrom(registerationBean.getReferredFrom());
			account.setStatus(Constants.ACCOUNT_STATUS_IN_REVIEW);
			if (registerationBean.getCountry().equalsIgnoreCase(Constants.COUNTRY_IN)
					|| registerationBean.getCountry().equalsIgnoreCase(Constants.COUNTRY_US)) {
				account.setCountry(registerationBean.getCountry());
			} else {
				errorMap.put("status", "false");
				errorMap.put("message", "Country Not Available");
				return errorMap;
			}
			if (registerationBean.getUserRole().equalsIgnoreCase(USER_ROLES.BUYER)) {
				account.setUserRole(USER_ROLES.BUYER);
			} else if (registerationBean.getUserRole().equalsIgnoreCase(USER_ROLES.SELLER)) {
				account.setUserRole(USER_ROLES.SELLER);
			} else if (registerationBean.getUserRole().equalsIgnoreCase(USER_ROLES.PM)) {
				account.setUserRole(USER_ROLES.PM);
			} else {
				errorMap.put("status", "false");
				errorMap.put("message", "Invalid User Role!");
				return errorMap;
			}

			// Save the account
			account = accountDAO.save(account);

			// Details Pushed In Session
//			session.setAttribute(Constants.SESSION_USER_ID, account.getUserId());
//			session.setAttribute(Constants.SESSION_FIRST_NAME, account.getFirstName());
//			session.setAttribute(Constants.SESSION_LAST_NAME, account.getLastName());
//			session.setAttribute(Constants.SESSION_USER_ROLE, account.getUserRole());
//			session.setAttribute(Constants.SESSION_USER_COUNTRY, account.getCountry());
//			session.setAttribute(Constants.SESSION_USER_NAME, account.getEmailId());
			// Send verification email if the account is saved successfully

			//Sending New Register Email to Admin
			sendNewRegisterationEmailToAdmin(account.getUserRole());
			// Sending Verification Email
			boolean isVerificationMailSent = verificationTokenService.registerVerificationToken(account,false);
			errorMap.put("status", "true");
			return errorMap;
		} catch (Exception e) {
			e.printStackTrace();
			errorMap.put("status", "false");
			errorMap.put("message", e.getLocalizedMessage());
			return errorMap;
		}
	}
	
	private void sendNewRegisterationEmailToAdmin(String userRole) {
	    logger.info("Sending new user registration email to admin");
	    String adminEmail = environment.getProperty("admin.emailId");
	    List<String> linesList = new ArrayList<>();
	    String line1 = "A new user (" + userRole + ") has registered on the Cnerzy platform. Please review their profile for further details and  verify the information and approve or reject the account as necessary.";
	    linesList.add(line1);
		try {
			emailSender.sendEmail("New User Registration",
					EmailBody.generateHtmlAdminEmail(linesList), new String[] { adminEmail }, null,
					null, "Cnerzy", null);
			logger.info("sent new user registration email to admin: " + adminEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private String getFullName(RegisterationBean registerationBean) {
		String fullName = registerationBean.getFirstName();
		if (!StringUtil.isNullOrEmpty(registerationBean.getLastName())) {
			fullName += " " + registerationBean.getLastName();
		}
		return fullName;
	}

	private Date getCurrentDateTime() throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat(Constants.DATE_TIME_FORMAT);
		return formatter.parse(formatter.format(new Date()));
	}

	@Override
	public List<Account> getAccountBasedOnUserId(Integer userId) {
		logger.info("Inside getAccountBasedOnUserId {}", userId);
		return accountDAO.getAccountBasedOnUserId(userId);
	}

	@Override
	public void updatePasswordBasedOnUserName(String username, String newpassword) {
		logger.info("Inside updatePasswordBasedOnUserName {}", username);
		accountDAO.updatePasswordBasedOnUserName(username, passwordEncoder.encode(newpassword));

	}

	@Override
	public Account getAccountBasedOnEmailId(String parameter) throws NonUniqueResultException {
		logger.info("Inside getAccountBasedOnEmailId {}", parameter);
		return accountDAO.getAccountBasedOnEmailId(parameter);
	}
	
	@Override
	public Account getAccountBasedOnEmailIdAndRole(String email, String userRole) throws NonUniqueResultException {
		logger.info("Inside getAccountBasedOnEmailIdAndRole {}", email, userRole);
		return accountDAO.getAccountBasedOnEmailIdAndRole(email, userRole);
	}

	@Override
	public void updatePasswordBasedOnUserId(Integer userId, String password) {
		logger.info("Inside updatePasswordBasedOnUserId {}", userId);
		accountDAO.updatePasswordBasedOnUserId(userId, passwordEncoder.encode(password));
	}

	@Override
	public long getUserNameCount(String userName) {
		logger.info("Inside getUserNameCount {}", userName);
		return accountDAO.getUserNameCount(userName);
	}

	@Override
	public void sendForgotLink(String emailId, Integer userId, String path) {
		logger.info("Inside sendForgotLink {}", emailId);

	}

	public boolean isOldPasswordMatches(String reqOldPassword, String oldPassword) {
		logger.info("Inside isOldPasswordMatches");
		return !passwordEncoder.matches(reqOldPassword, oldPassword);

	}

	@Override
	public List<Account> getAllAccount() {
		return accountDAO.getAllAccount();
	}

	@Override
	public List<Account> getAllUsersBasedOnUserName(Set<String> clientEmailIdList) {
		return accountDAO.getAllUsersBasedOnUserName(clientEmailIdList);
	}

	@Override
	public List<Map<String, String>> getAllUsersByFilter(Map<String, String> filters) {
		List<Map<String, String>> accountListMap = new ArrayList<Map<String, String>>();

		List<Account> accountList = accountDAO.getUsersByFilter(filters);
		Integer i = 0;
		for (Account account : accountList) {
			Map<String, String> accountMap = new HashMap<String, String>();
			accountMap.put("sNo", i.toString());
			accountMap.put("id", account.getUserId().toString());
			i++;
			accountMap.put("name", account.getFullName() != null ? account.getFullName() : "-");
			accountMap.put("createdOn",
					account.getCreatedOn() == null ? "-" : account.getCreatedOn().toString());
			accountMap.put("userRole", account.getUserRole() != null ?  account.getUserRole() : "-");
			
			Company company = companyDao.getCompanyWithId(account.getCompanyId());
			if(company!=null) {
				accountMap.put("companyId", company.getCompanyId().toString());
				
				accountMap.put("companyName", company.getCompanyName()!=null? company.getCompanyName() : "-");
				accountMap.put("industry", company.getCompanyIndustry()!=null ? company.getCompanyIndustry() : "-");
				Address address = addressDao.getAddressByCompanyId(company.getCompanyId());
				if(address!=null) {
					String location = (address.getState()!=null?address.getState():"") +", "+ (address.getCountry()!=null?address.getCountry():"");
					accountMap.put("location", location);
				} else {
					accountMap.put("location", "N/A");
				}
			}
			if(account.getUserRole().equalsIgnoreCase(USER_ROLES.PM)) {
				accountMap.put("activeProjects", projectDao.getCountOfActiveProjectsByPMId(account.getUserId()).toString());
			}
			accountMap.put("status", account.getStatus()!=null?account.getStatus():"-");
			accountListMap.add(accountMap);
		}
		return accountListMap;
	}

	@Override
	public List<String> getAddedBySessionList(Integer companyId) {
		List<Account> accounts = accountDAO.getUsersBasedOnCompanyId(companyId, null);
		List<String> addedBySessionByList = new ArrayList<>();
		for (Account account : accounts) {
			addedBySessionByList.add(account.getFullName());
		}

		return addedBySessionByList;
	}

	@Override
	public void sendForgotLink(Account account) throws MessagingException {
		logger.info("Inside sendForgotLink {}", account.getUserId());
		accountDAO.sendForgotLink(account);
	}

	@Override
	public Profile getProfileDetails(Integer userId) {
		Profile profile = new Profile();
		profile.setUserId(userId);

		Account account = getAccountBasedOnUserId(userId).get(0);
		profile.setIsapproved(account.getStatus().equalsIgnoreCase(Constants.ACCOUNT_STATUS_APPROVED));
		Company company = companyDao.getCompanyWithId(account.getCompanyId());

		profile.setCompanyName(company.getCompanyName());
		profile.setCompanyEmailId(company.getCompanyEmail());
		profile.setCompanyPhoneNo(company.getCompanyPhoneNo());
		profile.setCompanyWebsite(company.getCompanyWebsite());
		profile.setCompanyIndustry(company.getCompanyIndustry());
		profile.setCompanyLinkedin(company.getCompanyLinkedIn());

		Address address = company.getAddresses().get(0);
		profile.setCompanyStreetAddress(address.getAddressLine1());
		profile.setCompanyCity(address.getCity());
		profile.setCompanyState(address.getState());
		profile.setCompanyCountry(address.getCountry());
		profile.setCompanyPincode(address.getPincode());

		return null;
	}

	@Override
	public void updateAccountStatus(Map<String, String> statusMap) throws MessagingException {
		Account account = accountDAO.getAccountBasedOnId(Integer.parseInt(statusMap.get("id")));
		account.setStatus(statusMap.get("status"));
		if(account.getStatus().equalsIgnoreCase(Constants.ACCOUNT_STATUS_APPROVED)) {
			account.setApprovedDate(new Date());
			account.setApprovedBy("ADMIN");
			sendAccountApprovedEmail(account.getFullName(),account.getEmailId(),account.getUserRole());
		}else if(statusMap.get("status").equalsIgnoreCase(Constants.ACCOUNT_STATUS_ON_HOLD)) {
			account.setApprovedBy(null);
			account.setApprovedDate(null);
			account.setConcern(statusMap.get("concern"));
			sendAccountConcernRaisedEmail(account.getFullName(),account.getEmailId(),account.getConcern());
		} else {
			sendAccountRejectionEmail(account.getFullName(),account.getEmailId(),account.getConcern());
		}
		accountDAO.update(account);
	}
	
	private void sendAccountApprovedEmail(String name, String email, String userRole) {
		logger.info("sending account approve email to" + email);
		List<String> linesList = new ArrayList<>();	
		if(userRole.equals(USER_ROLES.PM)) {
			String line1 = "Welcome to Cnerzy! We're excited to have you on board and help you achieve your manufacturing goals. Cnerzy provides a comprehensive platform designed to streamline your project management process and boost operational efficiency.";
			linesList.add(line1);
		}else if(userRole.equals(USER_ROLES.BUYER)){
			String line1 = "We are pleased to inform you that your account has been verified. Welcome to the Cnerzy community!";
			String line2 = "Login and explore our platform, designed to connect you with the right partners to meet your requirements.";
			linesList.add(line1);
			linesList.add(line2);
		}else if (userRole.equals(USER_ROLES.SELLER)) {
			String line1 = "Welcome to Cnerzy! Your account has been approved and we are excited to have you on board and support you to gain market visibility and business growth.";
			String line2 = "Start exploring opportunities and connect with potential buyers on our platform with peace of mind in the form of project management and ESCROW services.";
			linesList.add(line1);
			linesList.add(line2);
		}
		try {
			emailSender.sendEmail("Welcome to Cnerzy!",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent account approve email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	private void sendAccountConcernRaisedEmail(String name, String email, String reason) {
		logger.info("sending account approve email to" + email);
		List<String> linesList = new ArrayList<>();	
			String line1 = "We noticed that your form submission is missing some essential information. To ensure a smooth process, we kindly request that you complete/update your profile";
			String line2 = "Reason: "+reason;
			linesList.add(line1);
			linesList.add(line2);
		try {
			emailSender.sendEmail("Form Completion Required - Please Take Action",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent account approve email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	private void sendAccountRejectionEmail(String name, String email, String reason) {
		logger.info("sending account approve email to" + email);
		List<String> linesList = new ArrayList<>();	
			String line1 = "Thank you for your interest in joining Cnerzy. We regret to inform you that your application was not approved. Please consider reapplying again in the future.";
			String line2 = "Reason: "+reason;
			linesList.add(line1);
			linesList.add(line2);
		try {
			emailSender.sendEmail("Cnerzy Account Application Update",
					EmailBody.generateHtmlEmail(name, linesList), new String[] { email }, null,
					null, "Cnerzy", null);
			logger.info("sent account approve email to" + email);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> getAllPmByFilter(Map<String, String> filters) {
		List<Map<String, Object>> accountListMap = new ArrayList<Map<String, Object>>();
		List<Account> accountList = accountDAO.getPmByFilter(filters);
		Integer i = 0;
		for (Account account : accountList) {
			Map<String, Object> accountMap = new HashMap<String, Object>();
			accountMap.put("sNo", i);
			accountMap.put("id", account.getUserId());
			i++;
			accountMap.put("name", account.getFullName() != null ? account.getFullName() : "-");
			accountMap.put("email", account.getEmailId());
			accountMap.put("phoneNo", account.getMobileNumber()!= null ? account.getMobileNumber() : "-");
			accountMap.put("activeProjects", projectDao.getCountOfActiveProjectsByPMId(account.getUserId()));
			accountListMap.add(accountMap);
		}
		return accountListMap;
	}
	
	@Override
	public Map<String, String> getPMProfileById(Integer userId) {
		Map<String, String> response = new HashMap<>();
		try {
			response.put("status", "false");
			Account account = accountDAO.getAccountBasedOnId(userId);
			response.put("id", account.getUserId().toString());
			response.put("email", account.getEmailId());
			response.put("phoneNo", account.getMobileNumber()!=null?account.getMobileNumber():"N/A");
			response.put("name", account.getFullName());
			return response;
		} catch (Exception e) {
			response.put("status", "false");
			response.put("message", e.getMessage());
		}
		return response;
	}

}