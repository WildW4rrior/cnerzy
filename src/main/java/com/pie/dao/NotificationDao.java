package com.pie.dao;

import java.util.List;

import com.pie.entity.Notification;

public interface NotificationDao {

	void save(Notification notification);

	void update(Notification notification);

	Notification getNotificationById(Integer id);

	void markListOfNotificationReadByIds(List<Integer> ids, String userRole, Integer userId);

	List<Notification> getListOfNotificaiton(Integer userId, String userRole, int page, int size);

	Long getUnreadNotificationCount(Integer userId, String userRole);

	void saveBulkNotification(List<Notification> listOfNotifications);

}
