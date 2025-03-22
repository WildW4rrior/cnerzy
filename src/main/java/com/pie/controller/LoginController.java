package com.pie.controller;

import static com.pie.util.Constants.SESSION_USER_ID;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pie.util.LoginUtil;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = { "/login", "/" })
	public String loginpage(Model model, HttpSession session , RedirectAttributes redirectAttr) {
		Boolean sessionExpired = LoginUtil.checkIfSessionExpired(session); 
		if (!sessionExpired) {
			logger.info("hello in login, forwarding to dashboard");
			return "redirect:/dashboard";
		}	
		logger.info("hello in login, forwarding to login");
		return "login-register";
	}
	
	@RequestMapping(value = { "/adminLogin"})
	public String adminLoginPage(Model model, HttpSession session , RedirectAttributes redirectAttr) {
		Boolean sessionExpired = LoginUtil.checkIfSessionExpired(session); 
		if (!sessionExpired) {
			logger.info("hello in login, forwarding to dashboard");
			return "redirect:/dashboard";
		}	
		logger.info("hello in login, forwarding to login");
		return "adminLogin";
	}
	
	@RequestMapping(value = { "/sessionlogout" })
	public String sessionLogout(HttpSession session) {
		logger.info("Request for sessionLogout {}" , session.getAttribute(SESSION_USER_ID));
		session.invalidate();
		return "redirect:/logout";
	}


}
