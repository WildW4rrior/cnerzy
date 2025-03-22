package com.pie.controller;

import static com.pie.util.Constants.SESSION_USER_ROLE;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pie.entity.Account;
import com.pie.model.BuyerDetails;
import com.pie.model.PMDetails;
import com.pie.model.SellerModel;
import com.pie.service.AccountService;
import com.pie.service.ProfileService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;
import static com.pie.util.Constants.SESSION_IS_ACCOUNT_APPROVED;
@Controller
public class ProfileController {
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);

	@Autowired
	private ProfileService profileService;

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "/profile")
	public String profile(HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		String country = (String) session.getAttribute(Constants.SESSION_USER_COUNTRY);
		model.addAttribute("isApproved", session.getAttribute(SESSION_IS_ACCOUNT_APPROVED));
		model.addAttribute("role", userRole);
		model.addAttribute("country", country);
		if (session.getAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE) != null 
				&& session.getAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE).equals(true)) {
			if (userRole.equals(USER_ROLES.BUYER)) {
				return "buyer-profile";
			} else if (userRole.equals(USER_ROLES.SELLER)) {
				return "seller-profile";
			} else if (userRole.equals(USER_ROLES.PM)) {
				return "pm-profile";
			}
		} else {
			return "redirect:/onBoarding";
		}
		return "buyer-profile";
	}

	@RequestMapping(value = "/buyerRegistration")
	public String buyerRegistration(HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		model.addAttribute("role", userRole);
		Map<String, String> filterCustom = new HashMap<>();
		filterCustom.put("userRole", "BUYER");
		List<Map<String, String>> usersList = accountService.getAllUsersByFilter(filterCustom);
		String userListJson = new Gson().toJson(usersList);
		model.addAttribute("userListJson", userListJson);
		return "buyerRegistration";
	}

	@RequestMapping(value = "/sellerRegistration")
	public String sellerRegistration(HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		model.addAttribute("role", userRole);
		Map<String, String> filterCustom = new HashMap<>();
		filterCustom.put("userRole", "SELLER");
		List<Map<String, String>> usersList = accountService.getAllUsersByFilter(filterCustom);
		String userListJson = new Gson().toJson(usersList);
		model.addAttribute("userListJson", userListJson);
		return "sellerRegistration";
	}

	@RequestMapping(value = "/pmRegistration")
	public String pmRegistration(HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		model.addAttribute("role", userRole);
		Map<String, String> filterCustom = new HashMap<>();
		filterCustom.put("userRole", "PM");
		List<Map<String, String>> usersList = accountService.getAllUsersByFilter(filterCustom);
		String userListJson = new Gson().toJson(usersList);
		model.addAttribute("userListJson", userListJson);
		return "pmRegistration";
	}
//	@RequestMapping(value="/profile")
//	public String profile(HttpSession session, Model model) {
//		if (LoginUtil.checkIfSessionExpired(session)) {
//			return "redirect:/login";
//		}
//		Integer userId = session.getAttribute(SESSION_USER_ID) == null ? null
//				: (Integer) session.getAttribute(SESSION_USER_ID);
//		//check whether the user is buyer or seller or pm
//		Profile profile =  accountService.getProfileDetails(userId);
//		model.addAttribute("profile", profile);
//		return "buyer-profile";
//	}

	// PM Profile Update

	@RequestMapping(value = { "/updatePMProfessionalDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updatePMProfessionalDetails(@ModelAttribute PMDetails pmDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSavePMProfessionalDetails(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updatePMResume" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updatePMResume(@ModelAttribute PMDetails pmDetails, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());

		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updatePMResume(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updatePMPersonalDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updatePMPersonalDetails(@RequestBody PMDetails pmDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSavePMPersonalDetails(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updatePMLegalDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updatePMLegalDetails(@RequestBody PMDetails pmDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSavePMLegalDetails(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveOrUpdatePMExperience" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveOrUpdatePMExperience(@RequestBody PMDetails pmDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.saveOrUpdatePMExperience(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveOrUpdatePMReference" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveOrUpdatePMReference(@ModelAttribute PMDetails pmDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.saveOrUpdatePMReference(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updatePMAddress" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updatePMAddress(@RequestBody PMDetails pmDetails, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		pmDetails.setCompanyId(companyId);
		pmDetails.setCountry(country);
		pmDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSavePMAddress(pmDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	// Buyer

	@RequestMapping(value = { "/updateBuyerPersonalDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerPersonalDetails(@RequestBody BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateBuyerPersonalDetails(buyerDetails);
		if (response != null && response.get("status").equals("true")) {
			updateSessionData((Account) response.get("data"), session);
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	private void updateSessionData(Account account, HttpSession session) {
		session.setAttribute(Constants.SESSION_FIRST_NAME, account.getFirstName());
		session.setAttribute(Constants.SESSION_LAST_NAME, account.getLastName());
		session.setAttribute(Constants.SESSION_USER_COUNTRY, account.getCountry());
		session.setAttribute(Constants.SESSION_USER_NAME, account.getEmailId());
		session.setAttribute(Constants.SESSION_EMAIL_ID, account.getEmailId());
	}

	@RequestMapping(value = { "/updateBuyerCompanyDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerCompanyDetails(@RequestBody BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSaveBuyerCompanyDetails(buyerDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateBuyerCompanyAddressDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerCompanyAddressDetails(@RequestBody BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSaveBuyerCompanyAddressDetails(buyerDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateBuyerContactPersonDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerContactPersonDetails(@RequestBody BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSaveBuyerContactPersonDetails(buyerDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateBuyerLegalInformation" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerLegalInformation(@RequestBody BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSaveBuyerLegalInformation(buyerDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateBuyerBankDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerBankDetails(@RequestBody BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateOrSaveBuyerBankDetails(buyerDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateBuyerCompanyDocuments" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateBuyerCompanyDocuments(@ModelAttribute BuyerDetails buyerDetails,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		buyerDetails.setCompanyId(companyId);
		buyerDetails.setCountry(country);
		buyerDetails.setAccountId(accountId);

		HashMap<String, Object> response = profileService.saveOrUpdateBuyerCompanyDocuments(buyerDetails);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	// SELLER PROFILE UPDATE

	@RequestMapping(value = { "/updateSellerPersonalDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerPersonalDetails(@RequestBody SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerPersonalDetails(sellerModel);
		if (response != null && response.get("status").equals("true")) {
			updateSessionData((Account) response.get("data"), session);
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerCompanyDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateCompanyDetails(@RequestBody SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateCompanyDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerCompanyAddress" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateCompanyAddress(@RequestBody SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateCompanyAddress(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerContactPersons" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateContactPersons(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateContactPersons(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerLegalDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerLegalDetails(@RequestBody SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerLegalDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerW9Form" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerW9Form(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerW9Form(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerOEMAndProductDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerOEMDetails(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerOEMAndProductDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerCustomerDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerCustomerDetails(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerCustomerDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerExporterAndLogisticsDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data"  }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerLogisticsDetails(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerExporterAndLogisticDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerBankDetails" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerBankDetails(@RequestBody SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerBankDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerTurnoverDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerTurnoverDetails(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerTurnoverDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerFactoryDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerFactoryDetails(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerFactoryDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerCertifications" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerCertifications(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerCertifications(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerReferences" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerReferences(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerReferences(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerCustomerContact" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerCustomerContact(@RequestBody SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerCustomerContact(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerPermission" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerPermission(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerPermission(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/updateSellerPermissionSignature" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> updateSellerPermissionSignature(@ModelAttribute SellerModel sellerModel,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		sellerModel.setCompanyId(companyId);
		sellerModel.setCountry(country);
		sellerModel.setAccountId(accountId);

		HashMap<String, Object> response = profileService.updateSellerPermissionSignature(sellerModel);


		return new ResponseEntity<>(response, HttpStatus.OK);
	}
}
