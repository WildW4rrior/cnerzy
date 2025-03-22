package com.pie.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.pie.dao.NotificationDao;
import com.pie.entity.Notification;

@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired
	private NotificationDao notificationDao;

	@Override
	public List<Map<String, Object>> getListOfNotificaiton(Integer accountId, String userRole, int page) {
		int size=10;
		List<Map<String, Object>> respList = new ArrayList<>();
		List<Integer> unreadNotificationIdList = new ArrayList<>();
		List<Notification> notificationList = notificationDao.getListOfNotificaiton(accountId,userRole, page, size);
		if(notificationList!=null) {
			for(Notification notification:notificationList) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", notification.getId());
				map.put("title", notification.getTitle());
				map.put("createdOn", notification.getCreatedOn());
				map.put("isRead", notification.getIsRead());
				if(!notification.getIsRead()) {
					unreadNotificationIdList.add(notification.getId());
				}
				respList.add(map);
			}
		}
		
		if(!unreadNotificationIdList.isEmpty()) {
			makeUnreadNotificationRead(unreadNotificationIdList, userRole, accountId);
		}
		return respList;
	}
	
	@Async
	private void makeUnreadNotificationRead(List<Integer> ids, String userRole,Integer userId ) {
		notificationDao.markListOfNotificationReadByIds(ids, userRole, userId);
		
	}

	@Override
	public Map<String, Integer> getunReadNotificationCount(Integer accountId, String userRole) {
		Map<String, Integer> map = new HashMap<>();
		map.put("unReadCount", notificationDao.getUnreadNotificationCount(accountId, userRole).intValue());
		return map;
		
		
	}
	
}
