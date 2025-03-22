package com.pie.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "notification")
public class Notification {
	
	private Integer id;
	private Integer addedFor;
	private boolean isRead;
	private String title;
	private Boolean addedForAdmin;
	private Date createdOn;
	private String notificationType;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "is_read")
	public boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(boolean isRead) {
		this.isRead = isRead;
	}

	@Column(name = "added_for")
	public Integer getAddedFor() {
		return addedFor;
	}

	public void setAddedFor(Integer addedFor) {
		this.addedFor = addedFor;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "added_for_admin")
	public Boolean getAddedForAdmin() {
		return addedForAdmin;
	}

	public void setAddedForAdmin(Boolean addedForAdmin) {
		this.addedForAdmin = addedForAdmin;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_on")
	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	
	@Column(name = "notification_type")
	public String getNotificationType() {
		return notificationType;
	}

	public void setNotificationType(String notificationType) {
		this.notificationType = notificationType;
	}

}
