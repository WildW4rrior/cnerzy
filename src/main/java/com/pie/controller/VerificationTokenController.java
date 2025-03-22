package com.pie.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pie.service.VerificationTokenService;
import com.pie.util.LoginUtil;

@Controller
public class VerificationTokenController {
	
	@Autowired
	private VerificationTokenService verificationTokenService;
	
	@RequestMapping(value = "/verifyToken")
	public String checkEmailExist(Model model,
			HttpSession session, RedirectAttributes redirectAttr, @RequestParam("token") String token) {
		Boolean sessionExpired = LoginUtil.checkIfSessionExpired(session);
		HashMap<String, String> isTokenVerified = verificationTokenService.verifyToken(token);
		redirectAttr.addFlashAttribute("emailVerificationstatus", isTokenVerified.get("status"));
		redirectAttr.addFlashAttribute("emailVerificationmessage", isTokenVerified.get("message"));
		 if (sessionExpired) {
		        return "redirect:/login";
		    } else {
		        return "redirect:/onBoarding";
		    }
		}

}
