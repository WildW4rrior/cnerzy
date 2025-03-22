package com.pie.controller;

import static com.pie.util.Constants.SESSION_IS_ACCOUNT_APPROVED;
import static com.pie.util.Constants.SESSION_USER_ROLE;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pie.dao.CompanyDao;
import com.pie.entity.Account;
import com.pie.entity.Company;
import com.pie.service.AccountService;
import com.pie.service.ProjectService;
import com.pie.util.Constants;
import com.pie.util.EnvironmentUtil;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;

@Controller
public class DashboardController {

	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private EnvironmentUtil environmentUtil;

	@RequestMapping(value = { "/adminProfile" })
	public String adminProfile(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		model.addAttribute("role", userRole);

		return "adminProfile";
	}

	@RequestMapping(value = { "/dashboard" })
	public String roleBasedHomePageDecider(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		
		UserDetails userDetails = null;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
		    userDetails = (UserDetails) authentication.getPrincipal();
		}
		if (userDetails != null) {
			logger.info("Dashboard Controller, username: {}", userDetails.getUsername());
			Account account = accountService.getAccountBasedOnEmailIdAndRole(userDetails.getUsername(), userDetails.getAuthorities().iterator().next().getAuthority());
			if(account!=null) {
			session.setAttribute(Constants.SESSION_FULL_NAME, account.getFullName());
			session.setAttribute(Constants.SESSION_USER_NAME, account.getEmailId());
			session.setAttribute(Constants.SESSION_USER_ID, account.getUserId());
			session.setAttribute(Constants.SESSION_FIRST_NAME, account.getFirstName());
			session.setAttribute(Constants.SESSION_USER_ROLE, account.getUserRole());
			session.setAttribute(Constants.SESSION_USER_COUNTRY, account.getCountry());
			session.setAttribute(Constants.SESSION_C_ID, account.getCompanyId());
			session.setAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE, account.getIsOnboardingComplete());
			session.setAttribute(Constants.SESSION_IS_ACCOUNT_APPROVED, account.getApprovedDate()!=null?true:false);
			if(account.getCompanyId()!=null) {
			Company company = companyDao.getCompanyWithId(account.getCompanyId());
			session.setAttribute(Constants.SESSION_C_NAME, company.getCompanyName());
			}
			model.addAttribute("welcome", account.getFullName());
			model.addAttribute("role", account.getUserRole());
			model.addAttribute("isApproved", account.getApprovedDate()!=null?true:false);
			
			String userRole= account.getUserRole(); 
			model.addAttribute("data", new Gson().toJson(projectService.getProjectsDataByCIdAndRole(userRole.equals(USER_ROLES.PM)?account.getUserId():account.getCompanyId(), userRole)));
				
			if (account.getUserRole().equals(USER_ROLES.ADMIN)) {
			 model.addAttribute("registerationData", new Gson().toJson(accountService.getAllUsersByFilter(null)));
				return "dashboard";
			} else if (account.getIsOnboardingComplete() != null && account.getIsOnboardingComplete()) {
				if (account.getUserRole().equals(USER_ROLES.BUYER)) {
					return "dashboard-buyer";
				} else if (account.getUserRole().equals(USER_ROLES.SELLER)) {
					return "dashboard-seller";
				} else if (account.getUserRole().equals(USER_ROLES.PM)) {
					return "dashboard-pm";
				}
			} else if (account.getIsOnboardingComplete() == null || !account.getIsOnboardingComplete()) {
				return "redirect:/onBoarding";
			} else if (account.getApprovedDate() == null) {
				return "redirect:/profile";
			}
			}
			return "redirect:/login";

		} else {
			return "redirect:/login";

		}

	}
	

}