package com.pie.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.pie.util.RequirementStatus;

@Entity
@Table(name = "rfq_logs")
public class RfqLogs {
	
	private Integer id;
	private Integer reqId;
	private String reviewerName;
	private Date reviewerDate;
	private RequirementStatus newStatus;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "req_id")
	public Integer getReqId() {
		return reqId;
	}
	public void setReqId(Integer reqId) {
		this.reqId = reqId;
	}
	
	@Column(name = "reviewer_name")
	public String getReviewerName() {
		return reviewerName;
	}
	public void setReviewerName(String reviewerName) {
		this.reviewerName = reviewerName;
	}
	
	@Column(name = "reviewer_date")
	public Date getReviewerDate() {
		return reviewerDate;
	}
	public void setReviewerDate(Date reviewerDate) {
		this.reviewerDate = reviewerDate;
	}
	
	@Enumerated(EnumType.STRING)
	@Column(name = "new_status")
	public RequirementStatus getNewStatus() {
		return newStatus;
	}
	public void setNewStatus(RequirementStatus newStatus) {
		this.newStatus = newStatus;
	}
	
	
}
