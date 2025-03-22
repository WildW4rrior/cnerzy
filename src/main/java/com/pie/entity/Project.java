package com.pie.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name = "project")
public class Project {

	
	private Integer id;
	private Integer buyerCompanyId;
	private Integer sellerCompanyId;
	private Integer reqId;
	private String reqUniqueCode;
	private BigDecimal budget;
	private Date creationDate;
	private Date estimatedCompletionDate;
	private Date actualCompletionDate;
	private Integer noOfMilestones;
	private Integer managerId; //PM Account ID
	private Date kickOffDate;
	private Date pmAssignDate;
	private Date escrowAccountCreationDate;
	private Date initiationDate;
	private String initiatedBy;
	private Boolean isSingleEscrowTransaction;
	private BigDecimal totalProjctPrice;
	private Integer escrowTransactionId;
	private Boolean isDisbursementMethodSelected;
	private Boolean isPaymentSent;
	private Boolean isPaymentApproved;
	private BigDecimal amountInEscrow;
	private BigDecimal amountDisbursed;
	private Boolean isBuyerSignedTripartite;
	private Boolean isSellerSignedTripartite;
	private String zohoTripartiteDoCId;
	private Date sellerTripartiteSignedDate;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "buyer_cid")
	public Integer getBuyerCompanyId() {
		return buyerCompanyId;
	}
	public void setBuyerCompanyId(Integer buyerCompanyId) {
		this.buyerCompanyId = buyerCompanyId;
	}
	
	@Column(name = "seller_cid")
	public Integer getSellerCompanyId() {
		return sellerCompanyId;
	}
	public void setSellerCompanyId(Integer sellerCompanyId) {
		this.sellerCompanyId = sellerCompanyId;
	}
	
	@Column(name = "req_id")
	public Integer getReqId() {
		return reqId;
	}
	
	@Column(name = "reqUniqueCode", unique = true)
	public String getReqUniqueCode() {
		return reqUniqueCode;
	}
	public void setReqUniqueCode(String reqUniqueCode) {
		this.reqUniqueCode = reqUniqueCode;
	}
	public void setReqId(Integer reqId) {
		this.reqId = reqId;
	}
	
	@Column(name = "budget")
	public BigDecimal getBudget() {
		return budget;
	}
	public void setBudget(BigDecimal budget) {
		this.budget = budget;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "creation_date")
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "estimated_completion_date")
	public Date getEstimatedCompletionDate() {
		return estimatedCompletionDate;
	}
	public void setEstimatedCompletionDate(Date estimatedCompletionDate) {
		this.estimatedCompletionDate = estimatedCompletionDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "actual_completion_date")
	public Date getActualCompletionDate() {
		return actualCompletionDate;
	}
	public void setActualCompletionDate(Date actualCompletionDate) {
		this.actualCompletionDate = actualCompletionDate;
	}
	
	@Column(name = "no_of_milestones")
	public Integer getNoOfMilestones() {
		return noOfMilestones;
	}
	public void setNoOfMilestones(Integer noOfMilestones) {
		this.noOfMilestones = noOfMilestones;
	}
	
	@Column(name = "manager_id")
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "kick_off_date")
	public Date getKickOffDate() {
		return kickOffDate;
	}
	public void setKickOffDate(Date kickOffDate) {
		this.kickOffDate = kickOffDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "pm_assign_date")
	public Date getPmAssignDate() {
		return pmAssignDate;
	}
	public void setPmAssignDate(Date pmAssignDate) {
		this.pmAssignDate = pmAssignDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "escrow_account_creation_date")
	public Date getEscrowAccountCreationDate() {
		return escrowAccountCreationDate;
	}
	public void setEscrowAccountCreationDate(Date escrowAccountCreationDate) {
		this.escrowAccountCreationDate = escrowAccountCreationDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "inititated_date")
	public Date getInitiationDate() {
		return initiationDate;
	}
	public void setInitiationDate(Date initiationDate) {
		this.initiationDate = initiationDate;
	}
	
	@Column(name = "initiated_by")
	public String getInitiatedBy() {
		return initiatedBy;
	}
	public void setInitiatedBy(String initiatedBy) {
		this.initiatedBy = initiatedBy;
	}
	@Column(name = "is_single_transaction")
	public Boolean getIsSingleEscrowTransaction() {
		return isSingleEscrowTransaction;
	}
	public void setIsSingleEscrowTransaction(Boolean isSingleEscrowTransaction) {
		this.isSingleEscrowTransaction = isSingleEscrowTransaction;
	}
	@Column(name = "total_project_price")
	public BigDecimal getTotalProjctPrice() {
		return totalProjctPrice;
	}
	public void setTotalProjctPrice(BigDecimal totalProjctPrice) {
		this.totalProjctPrice = totalProjctPrice;
	}
	@Column(name = "escrow_transaction_id")
	public Integer getEscrowTransactionId() {
		return escrowTransactionId;
	}
	public void setEscrowTransactionId(Integer escrowTransactionId) {
		this.escrowTransactionId = escrowTransactionId;
	}
	@Column(name = "is_payment_sent")
	public Boolean getIsPaymentSent() {
		return isPaymentSent;
	}
	public void setIsPaymentSent(Boolean isPaymentSent) {
		this.isPaymentSent = isPaymentSent;
	}
	@Column(name = "is_payment_approved")
	public Boolean getIsPaymentApproved() {
		return isPaymentApproved;
	}
	public void setIsPaymentApproved(Boolean isPaymentApproved) {
		this.isPaymentApproved = isPaymentApproved;
	}
	@Column(name = "is_disbursement_method_selected")
	public Boolean getIsDisbursementMethodSelected() {
		return isDisbursementMethodSelected;
	}
	public void setIsDisbursementMethodSelected(Boolean isDisbursementMethodSelected) {
		this.isDisbursementMethodSelected = isDisbursementMethodSelected;
	}
	@Column(name = "amount_in_escrow")
	public BigDecimal getAmountInEscrow() {
		return amountInEscrow;
	}
	public void setAmountInEscrow(BigDecimal amountInEscrow) {
		this.amountInEscrow = amountInEscrow;
	}
	@Column(name = "amount_disbursed")
	public BigDecimal getAmountDisbursed() {
		return amountDisbursed;
	}
	public void setAmountDisbursed(BigDecimal amountDisbursed) {
		this.amountDisbursed = amountDisbursed;
	}
	@Column(name = "is_seller_signed_tripartite")
	public Boolean getIsSellerSignedTripartite() {
		return isSellerSignedTripartite;
	}
	public void setIsSellerSignedTripartite(Boolean isSellerSignedTripartite) {
		this.isSellerSignedTripartite = isSellerSignedTripartite;
	}
	@Column(name = "is_buyer_signed_tripartite")
	public Boolean getIsBuyerSignedTripartite() {
		return isBuyerSignedTripartite;
	}
	public void setIsBuyerSignedTripartite(Boolean isBuyerSignedTripartite) {
		this.isBuyerSignedTripartite = isBuyerSignedTripartite;
	}
	@Column(name = "zoho_tripartite_doc_id")
	public String getZohoTripartiteDoCId() {
		return zohoTripartiteDoCId;
	}
	public void setZohoTripartiteDoCId(String zohoTripartiteDoCId) {
		this.zohoTripartiteDoCId = zohoTripartiteDoCId;
	}	
	@Column(name = "seller_traipartite_signed_date")
	public Date getSellerTripartiteSignedDate() {
		return sellerTripartiteSignedDate;
	}
	public void setSellerTripartiteSignedDate(Date sellerTripartiteSignedDate) {
		this.sellerTripartiteSignedDate = sellerTripartiteSignedDate;
	}
	
}
