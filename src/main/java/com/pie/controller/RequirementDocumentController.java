package com.pie.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.pie.model.RequirementChatModel;
import com.pie.service.RequiremetDocumentService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;

@Controller
public class RequirementDocumentController {

	@Autowired
	private RequiremetDocumentService requiremetDocumentService;

	@RequestMapping(value = {
			"/sendDocument" }, method = RequestMethod.POST, consumes = "multipart/form-data", produces = "application/json")
	public ResponseEntity<Object> sendDocument(@ModelAttribute RequirementChatModel reqChatModel, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		reqChatModel.setAddedByCid(companyId);
		reqChatModel.setAddedBy(userRole);
		Map<String, Object> response = requiremetDocumentService.sendDocument(reqChatModel);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = {
			"/getAllChat" }, method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public ResponseEntity<Object> getAllChat(RequirementChatModel reqChatModel, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		if (!(userRole.equals(USER_ROLES.ADMIN) || userRole.equals(USER_ROLES.PM))) {
			reqChatModel.setAddedByCid(companyId);
		}
		reqChatModel.setAddedBy(userRole);
		Map<String, Object> response = requiremetDocumentService.getAllChat(reqChatModel);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);
	}

	@RequestMapping(value = { "/finalizeSellerForReqId" }, method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = "application/json")
	public ResponseEntity<Object> finalizeSellerForReqId(@ModelAttribute RequirementChatModel reqChatModel,
			HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}

		Integer companyId = session.getAttribute(Constants.SESSION_C_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_C_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		reqChatModel.setAddedByCid(companyId);
		reqChatModel.setAddedBy(userRole);
		HashMap<String, Object> response = requiremetDocumentService.finalizeSellerForReqId(reqChatModel);

		return new ResponseEntity<>(response, HttpStatus.OK);
	}

}
