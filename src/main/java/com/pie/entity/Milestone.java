package com.pie.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "milestone")
public class Milestone {

	private Integer id;
	private Integer projectId;
	private Integer requirementId;
	private BigDecimal totalBudget;
	private String name;
	private BigDecimal milestoneAmount;
	private Date creationDate;
	private Date milestoneCompletionDateEstimated;
	private Date milestoneCompletionDateActual;
	private Boolean isActive;
	private String description;
	private String quantity;
	private String itemCategory;
	private String currency;
	private Integer escrowId;
	private Boolean isDisbursementMethodSelected;
	private Boolean isPaymentSent;
	private Boolean isPaymentApproved;
	private Boolean isPaymentDisbursed;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="total_budget")
	public BigDecimal getTotalBudget() {
		return totalBudget;
	}
	public void setTotalBudget(BigDecimal totalBudget) {
		this.totalBudget = totalBudget;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="milestone_amount")
	public BigDecimal getMilestoneAmount() {
		return milestoneAmount;
	}
	
	public void setMilestoneAmount(BigDecimal milestoneAmount) {
		this.milestoneAmount = milestoneAmount;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="creation_date")
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="milestone_completion_date_estimated")
	public Date getMilestoneCompletionDateEstimated() {
		return milestoneCompletionDateEstimated;
	}
	public void setMilestoneCompletionDateEstimated(Date milestoneCompletionDateEstimated) {
		this.milestoneCompletionDateEstimated = milestoneCompletionDateEstimated;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="milestone_completion_date_actual")
	public Date getMilestoneCompletionDateActual() {
		return milestoneCompletionDateActual;
	}
	public void setMilestoneCompletionDateActual(Date milestoneCompletionDateActual) {
		this.milestoneCompletionDateActual = milestoneCompletionDateActual;
	}
	
	@Column(name="is_active")
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="currency")
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	@Column(name="project_id")
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	
	@Column(name="requirement_id")
	public Integer getRequirementId() {
		return requirementId;
	}
	public void setRequirementId(Integer requirementId) {
		this.requirementId = requirementId;
	}
	
	@Column(name="item_category")
	public String getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}
	
	@Column(name="quantity")
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	@Column(name="escrow_id")
	public Integer getEscrowId() {
		return escrowId;
	}
	public void setEscrowId(Integer escrowId) {
		this.escrowId = escrowId;
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
	@Column(name = "is_payment_disbursed")
	public Boolean getIsPaymentDisbursed() {
		return isPaymentDisbursed;
	}
	public void setIsPaymentDisbursed(Boolean isPaymentDisbursed) {
		this.isPaymentDisbursed = isPaymentDisbursed;
	}
	@Column(name = "is_disbursement_method_selected")
	public Boolean getIsDisbursementMethodSelected() {
		return isDisbursementMethodSelected;
	}
	public void setIsDisbursementMethodSelected(Boolean isDisbursementMethodSelected) {
		this.isDisbursementMethodSelected = isDisbursementMethodSelected;
	}
	
}
