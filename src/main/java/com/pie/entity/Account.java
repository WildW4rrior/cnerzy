package com.pie.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "account" )
public class Account implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userId;
	private String userName;
	private String password;
	private Integer companyId;
	private String confirmPassword;
	private boolean emailVerified;
	private String userRole;
	private String fullName;
	private String firstName;
	private String lastName;
	private String mobileNumber;	
	private String emailId;
	private String country;
	private Date createdOn;
	private Boolean isOnboardingComplete;
	private Boolean isDeleted;	
	private String referredFrom;
	
	private String status;
	private Date approvedDate;
	private String approvedBy;
	private BigDecimal experience;
	private String concern; //raised by admin while reviewing account
	private String escrowVerificationStatus;
	private String escrowPartyId;
//	private Discount discount;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@NotEmpty
	@Column(name = "user_name", length = 100, nullable = false)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name = "company_id")
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Column(name = "password", length = 100, nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	@Column(name = "user_role", length = 20, nullable = false)
	public String getUserRole() {
		return userRole;
	}

	@Column(name = "email_verified", length = 1, nullable = false)
	public boolean isEmailVerified() {
		return emailVerified;
	}

	public void setEmailVerified(boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	
	@NotEmpty
	@Column(name = "full_name")
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "first_name")
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "last_name")
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "mobile_no")
	public String getMobileNumber() {
		return this.mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@NotEmpty
	@Email
	@Column(name = "email_id")
	public String getEmailId() {
		return this.emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	@Transient
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}


	@Column(name = "country")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_on")
	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	
	@Column(name="onboarding_complete")
	public Boolean getIsOnboardingComplete() {
		return isOnboardingComplete;
	}

	public void setIsOnboardingComplete(Boolean isOnboardingComplete) {
		this.isOnboardingComplete = isOnboardingComplete;
	}

	@Column(name="is_Deleted")
	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Column(name="referred_from")
	public String getReferredFrom() {
		return referredFrom;
	}

	public void setReferredFrom(String referredFrom) {
		this.referredFrom = referredFrom;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "approved_date")
	public Date getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(Date approvedDate) {
		this.approvedDate = approvedDate;
	}

	@Column(name = "approved_by")
	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}
	
	@Column(name = "experience")
	public BigDecimal getExperience() {
		return experience;
	}

	public void setExperience(BigDecimal experience) {
		this.experience = experience;
	}
	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "concern", length = 500)
	public String getConcern() {
		return concern;
	}

	public void setConcern(String concern) {
		this.concern = concern;
	}

	@Column(name = "escrow_verification_status")
	public String getEscrowVerificationStatus() {
		return escrowVerificationStatus;
	}

	public void setEscrowVerificationStatus(String escrowVerificationStatus) {
		this.escrowVerificationStatus = escrowVerificationStatus;
	}

	@Column(name = "escrow_party_id")
	public String getEscrowPartyId() {
		return escrowPartyId;
	}

	public void setEscrowPartyId(String escrowPartyId) {
		this.escrowPartyId = escrowPartyId;
	}
	
	
//	@OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.PERSIST)
//	@JoinColumn(name = "discount_id")
//	public Discount getDiscount() {
//		return discount;
//	}
//
//	public void setDiscount(Discount discount) {
//		this.discount = discount;
//	}
	
	
}