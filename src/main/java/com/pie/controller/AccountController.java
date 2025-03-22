package com.pie.controller;

import static com.pie.util.Constants.SESSION_USER_ID;
import static com.pie.util.Constants.SESSION_USER_NAME;
import static com.pie.util.Constants.SESSION_USER_ROLE;
import static com.pie.util.Constants.SESSION_USER_COUNTRY;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pie.authentication.CustomAuthenticationProvider;
import com.pie.authentication.MyDBAuthenticationService;
import com.pie.entity.Account;
import com.pie.model.Profile;
import com.pie.model.RegisterationBean;
import com.pie.service.AccountService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.StringUtil;
import com.pie.util.USER_ROLES;

@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	private AccountService accountService;

	@Autowired
	private MyDBAuthenticationService userdetailsService;

	@RequestMapping(value = { "/saveRegistration" }, method = { RequestMethod.POST })
	public ModelAndView saveRegisteration(@ModelAttribute @Valid RegisterationBean registerationBean,
			BindingResult result, RedirectAttributes redirectAttr, HttpServletRequest request, Model model,
			HttpSession session) throws IOException, AddressException, MessagingException, ParseException {

		logger.info("Add a new user for email id: " + registerationBean.getEmailId());
		Integer userId = session.getAttribute(SESSION_USER_ID) == null ? null
				: (Integer) session.getAttribute(SESSION_USER_ID);
		String errorName = result.getFieldError("password") != null ? result.getFieldError("password").getCode()
				: "noError";
		Boolean flagForCheckValidation = errorName.equalsIgnoreCase("NotEmpty") && userId != null ? false : true;
		redirectAttr.addFlashAttribute("pageName", "signup");
		if (result.hasErrors() && flagForCheckValidation) {
			String error = result.getAllErrors().get(0).getDefaultMessage();
			redirectAttr.addFlashAttribute("error", error);
			return new ModelAndView("redirect:/login");
		} else {
			Map<String, String> errorMap = accountService.save(registerationBean, session);
			if (errorMap.get("status") != null && errorMap.get("status").equalsIgnoreCase("false")) {
				redirectAttr.addFlashAttribute("error", errorMap.get("message"));
				return new ModelAndView("redirect:/login");
			} else if (errorMap.get("status") != null && errorMap.get("status").equalsIgnoreCase("true")) {
				// Manually Setting in SecurityContextHolder after Account Creation Success.
				UserDetails userDetails = userdetailsService
						.loadUserByUsername(registerationBean.getEmailId() + ":" + registerationBean.getUserRole());
				UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userDetails,
						null, userDetails.getAuthorities());
				SecurityContextHolder.getContext().setAuthentication(authToken);
				return new ModelAndView("redirect:/dashboard");
			}
		}

		return new ModelAndView("redirect:/login");

	}

	@RequestMapping(value = "/checkEmailExist", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ResponseEntity<Object> checkEmailExist(HttpServletRequest request, Model model,
			HttpSession session, RedirectAttributes redirectAttr, @RequestParam("emailId") String emailId,@RequestParam("userRole") String userRole) {
		HashMap<String, String> object = new HashMap<>();
		if (accountService.getAccountBasedOnEmailIdAndRole(emailId,userRole) != null) {
			object.put("status", "true");
			object.put("message",
					"This Email Id is already registered with us. Please use it or reset your password by clicking forget password on login page.");
			return new ResponseEntity<>(object, HttpStatus.OK);
		} else {
			object.put("status", "false");
			return new ResponseEntity<>(object, HttpStatus.OK);
		}
	}

	@RequestMapping(value = "/checkUserNameUniqueness")
	public @ResponseBody long checkUserNameUniqueness(@RequestParam("userName") String userName) {
		long count = accountService.getUserNameCount(userName);
		return count;
	}

	@RequestMapping(value = "/checkUserNameExist", produces = "application/json")
	private @ResponseBody String checkUserExist(@RequestParam String username) {
		Account account = accountService.getAccount(username);
		HashMap<String, Object> responseJson = new HashMap<>();
		if (account != null) {
			responseJson.put("status", true);
			responseJson.put("message",
					"This Email Id is already registered with us. Please use it or reset your password by clicking forget password on login page");
		} else {
			responseJson.put("status", false);
		}
		return new Gson().toJson(responseJson);
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

	@RequestMapping(value = "/getUsersList", produces = "application/json")
	public @ResponseBody String getUsersList(HttpSession session, @RequestParam() Map<String, String> queryMap) {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return null;
		}
		List<Map<String, String>> usersList = accountService.getAllUsersByFilter(queryMap);
		return new Gson().toJson(usersList);
	}

	@RequestMapping(value = "/changeAccountStatus", produces = "application/json")
	public ResponseEntity changeAccountStatusByAdmin(HttpSession session, @RequestBody Map<String, String> requestBody)
			throws MessagingException {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		if (!session.getAttribute(Constants.SESSION_USER_ROLE).toString().equalsIgnoreCase(USER_ROLES.ADMIN)) {
			return new ResponseEntity<>("Unauthorized", HttpStatus.FORBIDDEN);
		}
		accountService.updateAccountStatus(requestBody);
		Map<String, Boolean> response = new HashMap<>();
		response.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = "/getPmListToAppoint", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getPmListToAppoint(HttpSession session, @RequestParam Map<String, String> queryMap) {
		if (LoginUtil.checkIfSessionExpired(session)|| LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		List<Map<String, Object>> pmList = null;
		if (userRole.equals(USER_ROLES.ADMIN)) {
			pmList = accountService.getAllPmByFilter(queryMap);
		}
		return new ResponseEntity<>(new Gson().toJson(pmList), HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/getPMProfileById" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getPMProfileByReqId(@RequestParam(name = "id") Integer id,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Map<String, String> response = accountService.getPMProfileById(id);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

}
