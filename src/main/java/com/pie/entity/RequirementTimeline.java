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
@Table(name = "requirement_timeline" )
public class RequirementTimeline {
		
		private Integer id;
		private Integer reqId;
		private Date postedDate;
		private Date approvedDate;
		private Date sellerShortlistedDate;
		private Date discussionInitiatedDate;
		private Date negotiationStartedDate;
		private Date contractIssuedDate;
		private Date projectKickoffDate;
		private String status;
		
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "id")
		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name = "requirement_id")
		public Integer getReqId() {
			return reqId;
		}

		public void setReqId(Integer reqId) {
			this.reqId = reqId;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "posted_date")
		public Date getPostedDate() {
			return postedDate;
		}

		public void setPostedDate(Date postedDate) {
			this.postedDate = postedDate;
		}

		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "approved_date")
		public Date getApprovedDate() {
			return approvedDate;
		}

		public void setApprovedDate(Date approvedDate) {
			this.approvedDate = approvedDate;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "shorlisted_date")
		public Date getSellerShortlistedDate() {
			return sellerShortlistedDate;
		}

		public void setSellerShortlistedDate(Date sellerShortlistedDate) {
			this.sellerShortlistedDate = sellerShortlistedDate;
		}

		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "discussion_initiated")
		public Date getDiscussionInitiatedDate() {
			return discussionInitiatedDate;
		}

		public void setDiscussionInitiatedDate(Date discussionInitiatedDate) {
			this.discussionInitiatedDate = discussionInitiatedDate;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "negotiation_date")
		public Date getNegotiationStartedDate() {
			return negotiationStartedDate;
		}

		public void setNegotiationStartedDate(Date negotiationStartedDate) {
			this.negotiationStartedDate = negotiationStartedDate;
		}

		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "contract_date")
		public Date getContractIssuedDate() {
			return contractIssuedDate;
		}

		public void setContractIssuedDate(Date contractIssuedDate) {
			this.contractIssuedDate = contractIssuedDate;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "project_kickoff_date")
		public Date getProjectKickoffDate() {
			return projectKickoffDate;
		}

		public void setProjectKickoffDate(Date projectKickoffDate) {
			this.projectKickoffDate = projectKickoffDate;
		}

		@Column(name = "status")
		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		
}
