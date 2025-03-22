package com.pie.controller;

import static com.pie.util.Constants.SESSION_USER_ROLE;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
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

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.pie.entity.Account;
import com.pie.entity.RequirementTimeline;
import com.pie.model.BuyerInfoModel;
import com.pie.model.RequirementModel;
import com.pie.model.SellerInfoModel;
import com.pie.service.EscrowServiceImpl;
import com.pie.service.RequirementService;
import com.pie.service.ZohoSignService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;

@Controller
public class RequirementController {
	@Autowired
	private RequirementService requirementService;

	@Autowired
	private ZohoSignService zohoSignService;
	
	@Autowired
	private EscrowServiceImpl escrowServiceImpl;

	@RequestMapping(value = { "/createNewRequirement" }, method = RequestMethod.POST, consumes = {
			"application/json" }, produces = "application/json")
	public ResponseEntity<Object> createNewRequirement(@RequestBody RequirementModel requirementModel,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String buyerCompanyName = (String) session.getAttribute(Constants.SESSION_C_NAME);
		requirementModel.setCompanyId(companyId);
		requirementModel.setAddedBy(buyerCompanyName);
		HashMap<String, Object> response = requirementService.createNewRequirement(requirementModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getBuyerRequirmentsListOption" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getBuyerRequirmentsList(
			@RequestParam(name = "sellerCid", required = false) Integer sellerCid, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		HashMap<String, Object> response = requirementService.getBuyerRequirmentsList(companyId, sellerCid);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getPreviousEngagedSellerList" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getPreviousEngagedSellerList(HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		HashMap<String, Object> response = requirementService.getPreviousEngagedSellerList(companyId);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getRecommendedSellerListByReqId" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getRecommendedSellerListByReqId(@RequestParam(name = "reqId") Integer reqId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		List<SellerInfoModel> response = requirementService.getRecommendedSellerListByReqId(reqId);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/getContractsForAdmin" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getContractsForAdmin(HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		HashMap<String, Object> response = null;
		if (userRole.equals(USER_ROLES.ADMIN)) {
			response = requirementService.getContractsForAdmin();
		}
		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getShortlistedSellerListByReqId" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getShortlistedSellerListByReqId(@RequestParam(name = "reqId") Integer reqId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		List<SellerInfoModel> response = requirementService.getShortlistedSellerListByReqId(reqId);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getFinalizedSellerListByReqId" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getFinalizedSellerListByReqId(@RequestParam(name = "reqId") Integer reqId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		List<SellerInfoModel> response = requirementService.getFinalizedSellerListByReqId(reqId);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getBuyerAllRequirementList" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getBuyerAllRequirementList(HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		HashMap<String, Object> response = requirementService.getBuyerAllRequirementList(companyId);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/getTimelineByReqId" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getRequirmentTimline(@RequestParam(name = "reqId") Integer reqId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);

		Map<String, Date> requirementTimeline = requirementService.getTimelineByReqId(reqId, userRole, companyId);

		return new ResponseEntity<>(requirementTimeline, HttpStatus.OK);
	}

	@RequestMapping(value = { "/saveSellerForReqId" }, method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Object> saveSellerForReqId(@RequestBody Map<String, Integer> dataMap, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		dataMap.put("buyerCompanyId", companyId);
		HashMap<String, Object> response = requirementService.saveSellerForReqId(dataMap);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/rejectSellerForReqId" }, method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Object> rejectSellerForReqId(@RequestBody Map<String, String> dataMap, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		HashMap<String, Object> response = requirementService.rejectSellerForReqId(dataMap);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	@RequestMapping(value = { "/sellerWithdrawnForReqId" }, method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Object> sellerWithdrawnForReqId(@RequestBody Map<String, String> dataMap,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		dataMap.put("sellerCompanyId", companyId.toString());
		HashMap<String, Object> response = requirementService.sellerWithdrawnForReqId(dataMap);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/adminIntiateProject" }, method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Object> adminIntiateProject(@RequestBody Map<String, String> dataMap,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		HashMap<String, String> response=null;
		if(userRole.equals(USER_ROLES.ADMIN)) {
		response = requirementService.adminIntiateProject(dataMap);
		}
		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/adminAssignPM" }, method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Object> adminAssignPM(@RequestBody Map<String, String> dataMap,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		HashMap<String, String> response=null;
		if(userRole.equals(USER_ROLES.ADMIN)) {
		response = requirementService.adminAppointPMForProject(dataMap);
		}
		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = { "/viewRequirementById" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> viewRequirementById(@RequestParam(name = "id") Integer id, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		RequirementModel response = requirementService.viewRequirementById(id);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = { "/getBuyerProfileData" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getBuyerProfileData(@RequestParam(name = "id") Integer buyerCompanyId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		BuyerInfoModel response = requirementService.getBuyerProfileData(buyerCompanyId);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}
	
	@RequestMapping(value = { "/getSellerProfileData" }, method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Object> getSellerProfileData(@RequestParam(name = "id") Integer sellerCompanyId,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		SellerInfoModel response = requirementService.addSellerInfoToModel(new SellerInfoModel(),sellerCompanyId,true);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}
	
	


	@RequestMapping(value = "/getAllRequirementsList", produces = "application/json")
	public ResponseEntity<Object> getAllRequirementsList(HttpSession session,
			@RequestBody Map<String, String> queryMap) {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		List<Map<String, Object>> requirementList = requirementService.getRequirementsList(queryMap);
		return new ResponseEntity<>(requirementList, HttpStatus.OK);
	}

	@RequestMapping(value = { "/postRequirement" })
	public String postRequirmentPage1(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		model.addAttribute("role", userRole);

		return "post-requirement";
	}

	@RequestMapping(value = { "/RFQs" })
	public String RFQs(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
		model.addAttribute("role", userRole);

		if (userRole.equals(USER_ROLES.ADMIN)) {
			return "Rfq";
		} else if (userRole.equals(USER_ROLES.SELLER)) {
			return "sellerRfq";
		}
//		model.addAttribute("welcome",session.getAttribute(SESSION_FULL_NAME));
		return "dashboard";
	}

	@RequestMapping(value = { "/sellerRequirement" })
	public String sellerRequirement(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
//		model.addAttribute("welcome", session.getAttribute(SESSION_FULL_NAME));
		model.addAttribute("role", userRole);
		return "sellerRequirement";
	}

	@RequestMapping(value = { "/BuyersRequirementList" })
	public String BuyersRequirementList(HttpServletRequest request, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		if (LoginUtil.checkIfSessionExpired(session)) {
			return "redirect:/login";
		}
		String userRole = (String) session.getAttribute(SESSION_USER_ROLE);
		if (LoginUtil.checkIfProfileNotApproved(session)) {
			return LoginUtil.returnDashboardBasedOnRole(userRole);
		}
//		model.addAttribute("welcome", session.getAttribute(SESSION_FULL_NAME));
		model.addAttribute("role",userRole);
		return "requirementList";
	}

	@RequestMapping(value = "/changeRequirementStatus", produces = "application/json")
	public ResponseEntity changeRequirementStatusByAdmin(HttpSession session,
			@RequestBody Map<String, String> requestBody) throws MessagingException {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		if (!session.getAttribute(Constants.SESSION_USER_ROLE).toString().equalsIgnoreCase(USER_ROLES.ADMIN)) {
			return new ResponseEntity<>("Unauthorized", HttpStatus.FORBIDDEN);
		}
		requirementService.updateRequirementStatus(requestBody);
		Map<String, Boolean> response = new HashMap<>();
		response.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = "/getIntimatedSellerList", produces = "application/json")
	public ResponseEntity getIntimatedSellerListByReqId(HttpSession session,
			@RequestParam(name = "requirementId") Integer requirementId) {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		if (!session.getAttribute(Constants.SESSION_USER_ROLE).toString().equalsIgnoreCase(USER_ROLES.ADMIN)) {
			return new ResponseEntity<>("Unauthorized", HttpStatus.FORBIDDEN);
		}
		List<SellerInfoModel> intimatedSellerList = requirementService.getIntimatedSellerListByReqId(requirementId);
		return new ResponseEntity<>(new Gson().toJson(intimatedSellerList), HttpStatus.OK);
	}

	@RequestMapping(value = "/getSellerRequirementList", produces = "application/json")
	public ResponseEntity getRequirementSellerListBySellerId(HttpSession session) {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		String sellerId = session.getAttribute(Constants.SESSION_USER_ID).toString();
		List<Map<String, Object>> requirementList = requirementService.getRequirementSellerListBySellerId(sellerId);
		return new ResponseEntity<>(new Gson().toJson(requirementList), HttpStatus.OK);
	}

	@RequestMapping(value = "/changeInterestInRequirement", produces = "application/json")
	public ResponseEntity changeInterestInRequirement(HttpSession session, @RequestBody Map<String, String> request) {
		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		requirementService.changeInterestInRequirement(request);
		Map<String, Boolean> response = new HashMap<>();
		response.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = "/zohoSignWebhook", consumes = "application/json", produces = "application/json")
	public ResponseEntity zohoSignWebhook(@RequestBody Object response)
			throws JsonParseException, JsonMappingException, IOException {
		zohoSignService.handleWebhookResponse(response);
		Map<String, Boolean> res = new HashMap<>();
		res.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(res), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/escrowWebhook", consumes = "application/json", produces = "application/json")
	public ResponseEntity escrowWebhook(@RequestBody Map<String,Object> response)
			throws JsonParseException, JsonMappingException, IOException {
		escrowServiceImpl.handleWebhookResponse(response);
		Map<String, Boolean> res = new HashMap<>();
		res.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(res), HttpStatus.OK);
	}

	@RequestMapping(value = "/buyerContactSeller")
	public ResponseEntity buyerContactSeller(HttpSession session, @RequestParam(name = "reqId") String reqId,
			@RequestParam(name = "sellerId") String sellerCompanyId) throws JsonProcessingException {
		requirementService.sendNdaForSign(Integer.parseInt(reqId), Integer.parseInt(sellerCompanyId));
		Map<String, Boolean> res = new HashMap<>();
		res.put("status", true);
		return new ResponseEntity<>(new Gson().toJson(res), HttpStatus.OK);
	}

}