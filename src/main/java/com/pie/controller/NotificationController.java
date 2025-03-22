package com.pie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.pie.service.NotificationService;
import com.pie.util.Constants;
import com.pie.util.LoginUtil;
import com.pie.util.Messages;
import com.pie.util.USER_ROLES;

@RestController
public class NotificationController {

	@Autowired
	private NotificationService notificationService;

	@RequestMapping(value = {
			"/getNotificationList" }, method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public ResponseEntity<Object> getNotificationList(@RequestParam(defaultValue = "0", name= "page" ) int page, HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer accountId = session.getAttribute(Constants.SESSION_USER_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_USER_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		List<Map<String, Object>> response = notificationService.getListOfNotificaiton(accountId, userRole, page);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);

	}

	@RequestMapping(value = {
			"/unReadNotificationCount" }, method = RequestMethod.GET, consumes = "application/json", produces = "application/json")
	public ResponseEntity<Object> unReadNotificationCount(HttpSession session) {

		if (LoginUtil.checkIfSessionExpired(session) || LoginUtil.checkIfProfileNotApproved(session)) {
			return new ResponseEntity<>(Messages.SESSION_EXPIRED, HttpStatus.FORBIDDEN);
		}
		Integer accountId = session.getAttribute(Constants.SESSION_USER_ID) == null ? null
				: (Integer) session.getAttribute(Constants.SESSION_USER_ID);
		String userRole = (String) session.getAttribute(Constants.SESSION_USER_ROLE);
		Map<String, Integer> response = notificationService.getunReadNotificationCount(accountId, userRole);

		return new ResponseEntity<>(new Gson().toJson(response), HttpStatus.OK);

	}

}
