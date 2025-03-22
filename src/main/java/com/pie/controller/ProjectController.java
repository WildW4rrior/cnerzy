package com.pie.controller;

import static com.pie.util.Constants.SESSION_USER_ROLE;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.pie.service.ProjectService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@RequestMapping(value = { "/project" })
	public String project(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {

		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		if (userRole.equals(USER_ROLES.PM)) {
			// For PM Putting his account Id in place of companyId
			companyId = session.getAttribute(Constants.SESSION_USER_ID) == null ? null
					: (Integer) session.getAttribute(Constants.SESSION_USER_ID);
		}
		model.addAttribute("role", userRole);
		model.addAttribute("data", new Gson().toJson(projectService.getProjectsDataByCIdAndRole(companyId, userRole)));
		if (userRole.equals(USER_ROLES.ADMIN)) {
			return "admin-project";
		} else if (userRole.equals(USER_ROLES.SELLER)) {
			return "seller-project";
		} else if (userRole.equals(USER_ROLES.PM)) {
			return "pm-project";
		} else if (userRole.equals(USER_ROLES.BUYER)) {
			return "buyer-project";
		}
		return "dashboard";
	}

	@RequestMapping(value = { "/Contracts" })
	public String Contracts(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return "redirect:/login";
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		model.addAttribute("role", userRole);
		if (userRole.equals(USER_ROLES.ADMIN)) {
			return "contracts";
		} else if (userRole.equals(USER_ROLES.SELLER)) {
			return "seller-project";
		} else if (userRole.equals(USER_ROLES.PM)) {
			return "pm-project";
		} else if (userRole.equals(USER_ROLES.BUYER)) {
			return "buyer-project";
		}
		return "dashboard";
	}

	@RequestMapping(value = { "/getTimelineByProjectId" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getProjectTimline(@RequestParam(name = "projectId") Integer projectId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		Map<String, Date> projectTimeline = projectService.getTimelineByProjectId(projectId, userRole, companyId);

		return new ResponseEntity<>(projectTimeline, HttpStatus.OK);
	}

	@RequestMapping(value = { "/getTimelineForDashboard" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getTimelineForDashboard(@RequestParam(name = "projectId") Integer projectId,
			@RequestParam(name = "reqId") Integer reqId, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		Map<String, Date> dashboardTimeline = projectService.getTimelineByForDashboard(projectId, reqId, userRole,
				companyId);

		return new ResponseEntity<>(dashboardTimeline, HttpStatus.OK);
	}

	@RequestMapping(value = { "/getMilestoneByProject" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getMilestoneByProject(@RequestParam(name = "id") Integer projectId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
//		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
//		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
//				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		List<Map<String, Object>> respList = projectService.getMilestonesByProjectId(projectId);

		return new ResponseEntity<>(new Gson().toJson(respList), HttpStatus.OK);
	}

	@RequestMapping(value = { "/createFeedback" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public ResponseEntity<Object> createNewRequirement(@RequestBody Map<String, Object> dataMap, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		dataMap.put("ratedByCid", companyId);
		dataMap.put("addedBy", userRole);
		HashMap<String, Object> response = projectService.createFeedback(dataMap);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/markMilestoneAsAchieved" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public ResponseEntity<Object> markMilestoneAsAchieved(@RequestBody Map<String, Object> dataMap,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer accountId = session.getAttribute(Constants.SESSION_USER_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_USER_ID);
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		dataMap.put("buyerUserId", accountId);

		if (userRole.equals(USER_ROLES.BUYER)) {
			Map<String, String> response = projectService.markMilestoneAsAchieved(dataMap);

			return new ResponseEntity<>(response, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = { "/createMilestone" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public ResponseEntity<Object> createMilestone(@RequestBody Map<String, String> dataMap, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		if (userRole.equals(USER_ROLES.PM)) {
			HashMap<String, Object> response = projectService.createMilestone(dataMap);

			return new ResponseEntity<>(response, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = { "/getFeedbackForProject" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getFeedbackForProject(@RequestParam(name = "projectId") Integer projectId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		Map<String, Object> feedback = new HashMap<>();
	
			feedback = projectService.getFeedbackByProjectId(projectId);
		
		return new ResponseEntity<>(new Gson().toJson(feedback), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateBuyerPaymentOption")
	public ResponseEntity<Object> updateBuyerPaymentOption(@RequestParam(name="option") String option, @RequestParam(name="projectId") String projectId){
		projectService.updateBuyerPaymentOption(option,projectId);
		Map<String, Boolean> res = new HashMap<>();
		res.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(res), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/markMilestoneAchieved")
	public ResponseEntity<Object> markMilestoneAchieved(@RequestParam(name="milestoneId") String milestoneId){
		projectService.acceptMileStone(Integer.parseInt(milestoneId));
		Map<String, Boolean> res = new HashMap<>();
		res.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(res), HttpStatus.OK);
	}

}