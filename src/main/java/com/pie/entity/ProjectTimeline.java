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
@Table(name = "project_timeline" )
public class ProjectTimeline {

	private Integer id;
	private Integer reqId;
	private Integer projectId;
	private Date kickOffDate;
	private Date pmAssignedDate;
	private Date EscrowInitiateDate;
	private Date projectCompletionDate;
	private Date buyerReviewFeedbackDate;
	private Date sellerReviewFeedbackDate;
	
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
	
	@Column(name = "project_id")
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "kickoff_date")
	public Date getKickOffDate() {
		return kickOffDate;
	}
	public void setKickOffDate(Date kickOffDate) {
		this.kickOffDate = kickOffDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pm_assigned_date")
	public Date getPmAssignedDate() {
		return pmAssignedDate;
	}
	public void setPmAssignedDate(Date pmAssignedDate) {
		this.pmAssignedDate = pmAssignedDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "escrow_initiate_date")
	public Date getEscrowInitiateDate() {
		return EscrowInitiateDate;
	}
	public void setEscrowInitiateDate(Date escrowInitiateDate) {
		EscrowInitiateDate = escrowInitiateDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "project_completion_date")
	public Date getProjectCompletionDate() {
		return projectCompletionDate;
	}
	public void setProjectCompletionDate(Date projectCompletionDate) {
		this.projectCompletionDate = projectCompletionDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "buyer_review_feedback_date")
	public Date getBuyerReviewFeedbackDate() {
		return buyerReviewFeedbackDate;
	}
	public void setBuyerReviewFeedbackDate(Date buyerReviewFeedbackDate) {
		this.buyerReviewFeedbackDate = buyerReviewFeedbackDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "seller_review_feedback_date")
	public Date getSellerReviewFeedbackDate() {
		return sellerReviewFeedbackDate;
	}
	public void setSellerReviewFeedbackDate(Date sellerReviewFeedbackDate) {
		this.sellerReviewFeedbackDate = sellerReviewFeedbackDate;
	}
	
	
	
	
	
	
}
