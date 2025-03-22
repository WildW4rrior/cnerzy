package com.pie.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.NotificationDao;
import com.pie.entity.Notification;
import com.pie.entity.ProjectManagerRefrence;
import com.pie.util.Constants;
import com.pie.util.USER_ROLES;

@Transactional
@Repository
public class NotificationDaoImpl implements NotificationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Notification notification) {
		Session session = sessionFactory.getCurrentSession();
		session.save(notification);
	}

	@Override
	public void update(Notification notification) {
		Session session = sessionFactory.getCurrentSession();
		session.update(notification);
	}

	@Override
	public Notification getNotificationById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Notification.class);
		crit.add(Restrictions.eq("id", id));
		return (Notification) crit.uniqueResult();
	}

	@Override
	public List<Notification> getListOfNotificaiton(Integer userId, String userRole, int page, int size) {
		Session session = sessionFactory.getCurrentSession();
		Criteria crit = session.createCriteria(Notification.class);

		if (USER_ROLES.ADMIN.equals(userRole)) {
			crit.add(Restrictions.eq("addedForAdmin", true));
			crit.add(Restrictions.isNull("addedFor"));
		} else {
			crit.add(Restrictions.eq("addedFor", userId));
		}

		crit.addOrder(Order.desc("createdOn"));
		crit.setFirstResult(page * size);
		crit.setMaxResults(size);
		return crit.list();
	}
	
	@Override
	public Long getUnreadNotificationCount(Integer userId, String userRole) {
	    Session session = sessionFactory.getCurrentSession();
	    Criteria crit = session.createCriteria(Notification.class);

	    if (USER_ROLES.ADMIN.equals(userRole)) {
	    	crit.add(Restrictions.eq("addedForAdmin", true));
			crit.add(Restrictions.isNull("addedFor"));
	    } else {
	        crit.add(Restrictions.eq("addedFor", userId));
	    }
	    crit.add(Restrictions.eq("isRead", false));
	    crit.setProjection(Projections.rowCount());
	    return (Long) crit.uniqueResult();
	}

	@Override
	public void markListOfNotificationReadByIds(List<Integer> ids, String userRole, Integer userId) {
	    Session session = sessionFactory.getCurrentSession();
	    String hql = "UPDATE Notification n SET n.isRead = true WHERE n.id IN (:ids)";

	    if (USER_ROLES.ADMIN.equals(userRole)) {
	    	hql += " AND n.addedFor Is null AND n.addedForAdmin = true";
	    }else {
	    	hql += " AND n.addedFor = :userId";
		}

	    Query query = session.createQuery(hql);
	    query.setParameterList("ids", ids);
	    if (!USER_ROLES.ADMIN.equals(userRole)) {
	        query.setParameter("userId", userId);
	    }

	    int updatedRows = query.executeUpdate();
	    System.out.println("Number of notifications marked as read: " + updatedRows);
	}

	@Override
	public void saveBulkNotification(List<Notification> listOfNotifications) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (Notification notification : listOfNotifications) {
				session.save(notification);
				if (i % Constants.BATCH_SIZE_HIBERNATE == 0) { // 50, same as the JDBC batch size
					// flush a batch of inserts and release memory:
					session.flush();
					session.clear();
				}
				i++;
			}
			tx.commit();	
		} catch (Exception e) {
			e.printStackTrace();	
		}
	}


}
