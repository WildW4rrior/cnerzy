package com.pie.controller;

import static com.pie.util.Constants.SESSION_USER_COUNTRY;
import static com.pie.util.Constants.SESSION_USER_ROLE;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pie.entity.Account;
import com.pie.model.BuyerDetails;
import com.pie.model.SellerModel;
import com.pie.model.PMDetails;
import com.pie.service.AccountService;
import com.pie.service.OnBoardingService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;
import com.pie.validator.SellerStep1;
import com.pie.validator.SellerStep2;
import com.pie.validator.SellerStep3;
import com.pie.validator.SellerStep4;
import com.pie.validator.SellerStep7;

@Controller
public class OnBoardingController {

	private static final Logger logger = LoggerFactory.getLogger(OnBoardingController.class);

	@Autowired
	private OnBoardingService onBoardingService;

	@RequestMapping(value = { "/onBoarding" })
	public String onBoarding(HttpSession session, RedirectAttributes redirectAttr, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		if (session.getAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE) != null && 
			session.getAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE).equals(true)) {
			logger.info("redirecting to profile as onboarding is complete");
			return "redirect:/profile";
		}
		logger.info("on boarding screen");
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		model.addAttribute("role", userRole);
		model.addAttribute("country", session.getAttribute(SESSION_USER_COUNTRY));
		if (userRole.equals(USER_ROLES.BUYER)) {
			return "buyer";
		} else if (userRole.equals(USER_ROLES.SELLER)) {
			return "seller";
		} else if (userRole.equals(USER_ROLES.PM)) {
			return "pm";
		}

		return "redirect:/login";
	}

	@RequestMapping(value = { "/saveBuyerDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveBuyerDetails(@ModelAttribute @Valid BuyerDetails buyerDetails,
			BindingResult result, HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		buyerDetails.setAccountId(accountId);
		buyerDetails.setUserRole(userRole);
		buyerDetails.setCountry(country);

		HashMap<String, String> response = onBoardingService.saveBuyerOnboardingDetails(buyerDetails);
		if (response != null && response.containsKey("companyId")) {
			session.setAttribute(Constants.SESSION_C_ID, Integer.valueOf(response.get("companyId")));
			session.setAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE, true);
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/savePMDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> savePMDetails(@ModelAttribute @Valid PMDetails pmDetails,
			BindingResult result, HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		pmDetails.setAccountId(accountId);
		pmDetails.setUserRole(userRole);
		pmDetails.setCountry(country);
		HashMap<String, String> response = onBoardingService.savePmOnboardingDetails(pmDetails);
		if (response != null && response.containsKey("companyId")) {
			session.setAttribute(Constants.SESSION_C_ID, Integer.valueOf(response.get("companyId")));
			session.setAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE, true);
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerCompanyDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerCompanyDetails(
			@ModelAttribute @Validated(SellerStep1.class) SellerModel sellerModel, BindingResult result,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		HashMap<String, Object> response = onBoardingService.saveSellerCompanyDetails(sellerModel);
		if (response.get("status") == "true") {
			session.setAttribute(Constants.SESSION_C_ID, response.get("companyId"));
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerLegalDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerLegalDetails(
			@ModelAttribute @Validated(SellerStep2.class) SellerModel sellerModel, BindingResult result,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		sellerModel.setCompanyId(companyId);
		HashMap<String, Object> response = onBoardingService.saveSellerLegalDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerFinancialDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerFinancialDetails(
			@ModelAttribute @Validated(SellerStep3.class) SellerModel sellerModel, BindingResult result,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		sellerModel.setCompanyId(companyId);
		HashMap<String, Object> response = onBoardingService.saveSellerFinancialDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerTechnicalDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerTechnicalDetails(@ModelAttribute SellerModel sellerModel,
			BindingResult result, HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		sellerModel.setCompanyId(companyId);
		HashMap<String, Object> response = onBoardingService.saveSellerTechnicalDetails(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerCertificatesDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerCertificatesDetails(@ModelAttribute SellerModel sellerModel,
			BindingResult result, HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		sellerModel.setCompanyId(companyId);
		HashMap<String, Object> response = onBoardingService.saveSellerCertificates(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerReferencesDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerReferencesDetails(@ModelAttribute SellerModel sellerModel,
			BindingResult result, HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		sellerModel.setCompanyId(companyId);

		HashMap<String, Object> response = onBoardingService.saveSellerRefrences(sellerModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerPermissionDetails" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> saveSellerPermissionDetails(
			@ModelAttribute @Validated(SellerStep7.class) SellerModel sellerModel, BindingResult result,
			HttpSession session, Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		if (result.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			int i = 1;
			for (org.springframework.validation.FieldError error : result.getFieldErrors()) {
				if (error.getCode().equals("NotEmpty")) {
					errorMap.put("message_" + i, error.getField() + " cannot be empty");
				} else {
					errorMap.put("message_" + i, error.getField() + " " + error.getDefaultMessage());
				}
				i++;
			}
			return new ResponseEntity<Object>(errorMap, HttpStatus.BAD_REQUEST);
		}

		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		Integer accountId = Integer.parseInt(session.getAttribute(Constants.SESSION_USER_ID).toString());
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		sellerModel.setAccountId(accountId);
		sellerModel.setUserRole(userRole);
		sellerModel.setCountry(country);
		sellerModel.setCompanyId(companyId);

		HashMap<String, Object> response = onBoardingService.saveSellerPermissions(sellerModel, true);
		if (response != null && response.get("status").equals("true")) {
			session.setAttribute(Constants.SESSION_IS_ONBOARDING_COMPLETE, true);
		}
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/getSellerCompanyDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerCompanyDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}
		HashMap<String, Object> response = onBoardingService.getSellerCompanyDetails(companyId);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = { "/getSellerLegalDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerLegalDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		HashMap<String, Object> response = onBoardingService.getSellerLegalDetails(companyId, country);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = { "/getSellerFinancialDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerFinancialDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		HashMap<String, Object> response = onBoardingService.getSellerFinancialDetails(companyId, country);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = { "/getSellerTechnicalDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerTechnicalDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}
		HashMap<String, Object> response = onBoardingService.getSellerTechnicalDetails(companyId);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = {
			"/getSellerCertificatesDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerCertificatesDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}
		String country = session.getAttribute(Constants.SESSION_USER_COUNTRY).toString();
		HashMap<String, Object> response = onBoardingService.getSellerCertifications(companyId, country);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = {
			"/getSellerReferencesDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerReferencesDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}
		HashMap<String, Object> response = onBoardingService.getSellerReferencesDetails(companyId);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = {
			"/getSellerPermissionDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getSellerPermissionDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}

		HashMap<String, Object> response = onBoardingService.getSellerPermissions(companyId);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = { "/getBuyerDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getBuyerDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}

		HashMap<String, Object> response = onBoardingService.getBuyerDetails(companyId);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}

	@RequestMapping(value = { "/getPmDetails" }, method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> getPmDetails(
			@RequestParam(name = "companyId", required = false) Integer adminCompanyId, HttpSession session,
			Model model) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = null;
		if (adminCompanyId == null) {
			companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		} else {
			companyId = adminCompanyId;
		}

		HashMap<String, Object> response = onBoardingService.getPMDetails(companyId);
		return new ResponseEntity<>(response, HttpStatus.OK);

	}
}