package com.pie.service;

import java.util.List;
import java.util.Map;

public interface NotificationService {

	List<Map<String, Object>> getListOfNotificaiton(Integer accountId, String userRole, int page);

	Map<String, Integer> getunReadNotificationCount(Integer accountId, String userRole);

}
