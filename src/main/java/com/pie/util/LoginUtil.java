package com.pie.util;

import static com.pie.util.Constants.SESSION_C_ID;
import static com.pie.util.Constants.SESSION_IS_ACCOUNT_APPROVED;
import static com.pie.util.Constants.SESSION_USER_ROLE;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class LoginUtil {
	private static final Logger logger = LoggerFactory.getLogger(LoginUtil.class);

	public static boolean checkIfSessionExpired(HttpSession session) {
		String username = session.getAttribute(Constants.SESSION_USER_NAME) != null
				? session.getAttribute(Constants.SESSION_USER_NAME).toString()
				: null;
		if (username == null || "".equals(username)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean checkIfProfileNotApproved(HttpSession session) {
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (userRole != null && userRole.equals(USER_ROLES.ADMIN)) {
			return false;
		}
		Boolean isApproved = session.getAttribute(SESSION_IS_ACCOUNT_APPROVED) == null ? false
				: (Boolean) session.getAttribute(SESSION_IS_ACCOUNT_APPROVED);
		if (!isApproved) {
			return true;
		} else {
			return false;
		}
	}

	public static String returnDashboardBasedOnRole(String userRole) {
		if (!userRole.equals(USER_ROLES.ADMIN)) {
			return "redirect:/dashboard";
		}else {
			return null;
		}
	}

	public static String checkIfSessionExpired(HttpSession session, RedirectAttributes redirectAttr) {
		String username = session.getAttribute("userName") != null ? session.getAttribute("userName").toString() : null;
		if (username == null || "".equals(username)) {
			redirectAttr.addFlashAttribute("sessionExpiredMsg", "Your Session has expired..Please login again!!");
			return "redirect:/login";
		} else {
			return null;
		}
	}

	public static String checkIfCompanyProfileCompleted(HttpSession session, RedirectAttributes redirectAttr) {
		Integer companyId = session.getAttribute(SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(SESSION_C_ID);
		if (companyId == null) {
			redirectAttr.addFlashAttribute("msg", "Please complete company details!!");
			return "redirect:/completeyourprofile";
		} else {
			return null;
		}
	}

}
