
package com.pie.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pie.entity.Account;
import com.pie.service.AccountService;
import com.pie.util.Decoder;
import com.pie.util.LoginUtil;
import com.pie.util.StringUtil;

@Controller
public class PasswordController {
	private static final Logger logger = LoggerFactory.getLogger(PasswordController.class);

	@Autowired
	private AccountService accountService;

	@RequestMapping("changepassword")
	public String changePassword(Model model) {
		model.addAttribute("pageName", "Change Password");
		return "changePassword";
	}

	@RequestMapping(value = { "/user/changepassword" }, method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody ModelAndView updatepassword(HttpServletRequest request, HttpSession session,
			RedirectAttributes redirectAttr) {
		Boolean sessionExpired = LoginUtil.checkIfSessionExpired(session);
		if (sessionExpired) {
			redirectAttr.addFlashAttribute("sessionExpiredMsg", "Your Session has expired..Please login again!!");
			return new ModelAndView("redirect:/login");
		}
		String username = (String) session.getAttribute("userName");
		Account account = accountService.getAccountBasedOnEmailId(username);
		ModelAndView mv = new ModelAndView("changePassword");
		if (accountService.isOldPasswordMatches(request.getParameter("oldpassword"), account.getPassword())) {
			mv.addObject("status", false);
			mv.addObject("msg", "Old Password is incorrect...!!");
		} else if (!request.getParameter("newpassword").equalsIgnoreCase(request.getParameter("confirmnewpassword"))) {
			mv.addObject("status", false);
			mv.addObject("msg", "Password and Confirm Password does not match..!!");
		} else {
			String newpassword = request.getParameter("confirmnewpassword");
			accountService.updatePasswordBasedOnUserName(username, newpassword);
			mv.addObject("status", true);
			mv.addObject("msg", "Password Updated Successfully");
		}
		return mv;
	}

	@RequestMapping(value = { "/forgotPassword" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String forgotpassword() {
		return "forget-password1";
	}

	@RequestMapping(value = { "/forgot/savelink" }, method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody ModelAndView forgotLink(HttpServletRequest request, HttpSession session, Model model, @RequestParam(name="emailId", required=false) String emailId,@RequestParam(name="userRole", required=false) String userRole) {
		String email = request.getParameter("emailId");
		if(StringUtil.isNullOrEmpty(emailId)) {
			email = emailId;
		}
		session.setAttribute("emailId", email);
		session.setAttribute("userRole", userRole);
		logger.info(email);
		ModelAndView mv = null;
		if(StringUtil.isNullOrEmpty(email)) {
			mv = new ModelAndView("redirect:/forgotPassword");
			return mv;
		}
		Account acc = accountService.getAccountBasedOnEmailIdAndRole(email,userRole);
		if (acc != null) {
			try {
				mv = new ModelAndView("forget-password2");
				accountService.sendForgotLink(acc);
				mv.addObject("event", "forgot");
				mv.addObject("msg",
						"A link to reset your password has been sent to your email id. Please change your password and login!!");
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "Exception Occurs!!");
				mv = new ModelAndView("redirect:/forgotPassword");
			}
		} else {
			mv = new ModelAndView("redirect:/forgotPassword");
			mv.addObject("msg", "This email-Id is not registered with us!!");
		}
		return mv;
	}
	
	@RequestMapping(value = { "/forgot/savelinkM" })
	public @ResponseBody String forgotLinkM(@RequestParam("userName") String userName, HttpSession session) {

		logger.info(userName);		
		Account acc = accountService.getAccountBasedOnEmailId(userName);
		HashMap<String , Object> response = new HashMap<>();
		response.put("status", false);		
		if (acc != null) {
			try {				
				//accountService.sendForgotLink(acc);
				response.put("status", true);
				response.put("message", "A link to reset your password has been sent to your email id. Please change your password and login");				
			} catch (Exception e) {
				e.printStackTrace();
				response.put("message", "An error occured");
			}
		} else {
			response.put("message", "This email-Id is not registered with us");
		}
		return new Gson().toJson(response);
	}
	

	@RequestMapping(value = "/forgotLink/{userId}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getforgotPassword(@PathVariable String userId) {

		ModelAndView mv = new ModelAndView("forget-password3");
		mv.addObject("userIdDecoded", userId);
		return mv;
	}

	@RequestMapping(value = "/user/reset/{userId}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView resetPassword(@PathVariable String userId, HttpServletRequest request, RedirectAttributes redirectAtt) {
		String userIdDecoded = Decoder.decodeInput(userId);
		ModelAndView mv = new ModelAndView("redirect:/login");				
		String newpassword = request.getParameter("confirmnewpassword");
		accountService.updatePasswordBasedOnUserId(Integer.parseInt(userIdDecoded), newpassword);
		redirectAtt.addFlashAttribute("msg", "Password Updated Successfully");		
		return mv;
	}

	@RequestMapping(value = { "/user/available" }, method = { RequestMethod.PUT })
	public @ResponseBody Boolean authenticateUser(HttpServletRequest request, HttpSession session,
			@RequestParam String userName) {
		Account account = accountService.getAccount(userName);
		return account != null ? true : false;
	}

}