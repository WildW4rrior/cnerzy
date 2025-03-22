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
@Table(name = "requirement_seller")
public class RequirementSeller {

	
		private Integer id;
		private Integer reqId;
		private Integer sellerCompanyId;
		private Date dateAdded;
		private Date sellerInterestedOn;
		private boolean isSavedByBuyer;
		private boolean isInvitedByBuyer;
		private boolean isSellerInterested;
		private boolean isSellerNotInterested;
		private boolean isShortlisted;
		private boolean isFinalised;
		private boolean isSellerWithdrawn;
		private String authId;
		private boolean isRejected;
		private String rejectionReason; // PIPE | seprated
		private Boolean isNdaSendForSign;
		private Boolean isBuyerSignedNda;
		private Boolean isSellerSignedNda;
		private Date sellerNdaSignedDate;
		private Date sellerNegotiationStartDate;
		//NDA DOC ID
		private String zohoDocumentId;
		
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
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "date_added")
		public Date getDateAdded() {
			return dateAdded;
		}
		public void setDateAdded(Date dateAdded) {
			this.dateAdded = dateAdded;
		}
		
		@Column(name = "is_saved_by_buyer")
		public boolean getIsSavedByBuyer() {
			return isSavedByBuyer;
		}
		public void setIsSavedByBuyer(boolean isSavedByBuyer) {
			this.isSavedByBuyer = isSavedByBuyer;
		}
		
		@Column(name = "is_invited_buyer")
		public boolean getIsInvitedByBuyer() {
			return isInvitedByBuyer;
		}
		public void setIsInvitedByBuyer(boolean isInvitedByBuyer) {
			this.isInvitedByBuyer = isInvitedByBuyer;
		}
		
		@Column(name = "is_seller_intereseted")
		public boolean getIsSellerInterested() {
			return isSellerInterested;
		}
		public void setIsSellerInterested(boolean isSellerInterested) {
			this.isSellerInterested = isSellerInterested;
		}
		
		@Column(name = "is_shortlisted")
		public boolean getIsShortlisted() {
			return isShortlisted;
		}
		public void setIsShortlisted(boolean isShortlisted) {
			this.isShortlisted = isShortlisted;
		}
		
		@Column(name = "is_finalised")
		public boolean getIsFinalised() {
			return isFinalised;
		}
		public void setIsFinalised(boolean isFinalised) {
			this.isFinalised = isFinalised;
		}
		
		@Column(name = "is_auth_id")
		public String isAuthId() {
			return authId;
		}
		public void setAuthId(String authId) {
			this.authId = authId;
		}
		
		@Column(name = "is_rejected")
		public boolean getIsRejected() {
			return isRejected;
		}
		public void setIsRejected(boolean isRejected) {
			this.isRejected = isRejected;
		}
		
		@Column(name = "rejected_reason")
		public String getRejectionReason() {
			return rejectionReason;
		}
		public void setRejectionReason(String rejectionReason) {
			this.rejectionReason = rejectionReason;
		}
		@Column(name="seller_company_id")
		public Integer getSellerCompanyId() {
			return sellerCompanyId;
		}
		public void setSellerCompanyId(Integer sellerCompanyId) {
			this.sellerCompanyId = sellerCompanyId;
		}
		@Column(name = "is_seller_not_interested")
		public boolean getIsSellerNotInterested() {
			return isSellerNotInterested;
		}
		public void setIsSellerNotInterested(boolean isSellerNotInterested) {
			this.isSellerNotInterested = isSellerNotInterested;
		}
		
		@Column(name = "is_seller_withdrawn")
		public boolean getIsSellerWithdrawn() {
			return isSellerWithdrawn;
		}
		public void setIsSellerWithdrawn(boolean isSellerWithdrawn) {
			this.isSellerWithdrawn = isSellerWithdrawn;
		}
		
		@Column(name = "is_nda_send_for_sign")
		public Boolean getIsNdaSendForSign() {
			return isNdaSendForSign;
		}
		public void setIsNdaSendForSign(Boolean isNdaSendForSign) {
			this.isNdaSendForSign = isNdaSendForSign;
		}
		
		@Column(name = "is_buyer_signed_nda")
		public Boolean getIsBuyerSignedNda() {
			return isBuyerSignedNda;
		}
		public void setIsBuyerSignedNda(Boolean isBuyerSignedNda) {
			this.isBuyerSignedNda = isBuyerSignedNda;
		}
		
		@Column(name = "is_seller_signed_nda")
		public Boolean getIsSellerSignedNda() {
			return isSellerSignedNda;
		}
		public void setIsSellerSignedNda(Boolean isSellerSignedNda) {
			this.isSellerSignedNda = isSellerSignedNda;
		}
		
		@Column(name = "zoho_document_id")
		public String getZohoDocumentId() {
			return zohoDocumentId;
		}
		public void setZohoDocumentId(String zohoDocumentId) {
			this.zohoDocumentId = zohoDocumentId;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "seller_signed_nda_date")
		public Date getSellerNdaSignedDate() {
			return sellerNdaSignedDate;
		}
		public void setSellerNdaSignedDate(Date sellerNdaSignedDate) {
			this.sellerNdaSignedDate = sellerNdaSignedDate;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "seller_negotiation_start_date")
		public Date getSellerNegotiationStartDate() {
			return sellerNegotiationStartDate;
		}
		public void setSellerNegotiationStartDate(Date sellerNegotiationStartDate) {
			this.sellerNegotiationStartDate = sellerNegotiationStartDate;
		}
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "seller_interested_on")
		public Date getSellerInterestedOn() {
			return sellerInterestedOn;
		}
		public void setSellerInterestedOn(Date sellerInterestedOn) {
			this.sellerInterestedOn = sellerInterestedOn;
		}
		
		
		
}
