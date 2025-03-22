package com.pie.model;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BuyerDetails {

	private String firstName;
	private String lastName;
	private String personalEmail;
	private boolean personalEmailVerified;
	private String userCountry;
	@NotEmpty
	private String companyName;
	@NotEmpty
	private String companyEmail;
	@NotEmpty
	private String companyPhone;
	private String companyWebsite;
	@NotEmpty
	private String companyIndustry;
	private String companyLinkedInUrl;
	private String companyType;
	private Integer companyLogoId;
	private String companyLogoUrl;
	private MultipartFile companyLogo;
	private Integer companySignatureId;
	private String companySignatureUrl;
	private MultipartFile companySignature;
    private Boolean getIsNotificationsAllowed;

	private Integer addressId;
	@NotEmpty
	private String streetAddress;
	@NotEmpty
	private String city;
	@NotEmpty
	private String state;
	private String country;
	@NotEmpty
	private String pincode;

	private Integer contactPersonId;
	@NotEmpty
	private String contactPersonName;
	@NotEmpty
	private String contactPersonDesignation;
	@NotEmpty
	private String contactPersonEmail;
	@NotEmpty
	private String contactPersonPhone;

	private String typeOfBusinessEntity;
	private String buisnessRegNumber; // CIN No.
	private String taxIdNumber; // EIN no.
	private String gstNo;

	private Integer companyBankId;
	private String companyBankName;
	private String companyAccountNumber;
	private String companyRoutingNumber;
	private String companyIfscCode;
	private String companyDeclarationDate;

	private String userRole;
	private Integer accountId;
	private Integer companyId;
	private String declerationDate;
	
	private Integer annualTurnoverId;
	private BigDecimal annualTurnoverValue;
	private String turnoverFinancialYear;
	
	
	
	
	public String getUserCountry() {
		return userCountry;
	}

	public void setUserCountry(String userCountry) {
		this.userCountry = userCountry;
	}

	public boolean isPersonalEmailVerified() {
		return personalEmailVerified;
	}

	public void setPersonalEmailVerified(boolean personalEmailVerified) {
		this.personalEmailVerified = personalEmailVerified;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPersonalEmail() {
		return personalEmail;
	}

	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public Boolean getGetIsNotificationsAllowed() {
		return getIsNotificationsAllowed;
	}

	public void setGetIsNotificationsAllowed(Boolean getIsNotificationsAllowed) {
		this.getIsNotificationsAllowed = getIsNotificationsAllowed;
	}

	public Integer getCompanyLogoId() {
		return companyLogoId;
	}

	public void setCompanyLogoId(Integer companyLogoId) {
		this.companyLogoId = companyLogoId;
	}

	public String getCompanyLogoUrl() {
		return companyLogoUrl;
	}

	public void setCompanyLogoUrl(String companyLogoUrl) {
		this.companyLogoUrl = companyLogoUrl;
	}

	public Integer getCompanySignatureId() {
		return companySignatureId;
	}

	public void setCompanySignatureId(Integer companySignatureId) {
		this.companySignatureId = companySignatureId;
	}

	public String getCompanySignatureUrl() {
		return companySignatureUrl;
	}

	public void setCompanySignatureUrl(String companySignatureUrl) {
		this.companySignatureUrl = companySignatureUrl;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getContactPersonId() {
		return contactPersonId;
	}

	public void setContactPersonId(Integer contactPersonId) {
		this.contactPersonId = contactPersonId;
	}

	public Integer getCompanyBankId() {
		return companyBankId;
	}

	public void setCompanyBankId(Integer companyBankId) {
		this.companyBankId = companyBankId;
	}

	public Integer getAnnualTurnoverId() {
		return annualTurnoverId;
	}

	public void setAnnualTurnoverId(Integer annualTurnoverId) {
		this.annualTurnoverId = annualTurnoverId;
	}

	public String getCompanyIfscCode() {
		return companyIfscCode;
	}

	public void setCompanyIfscCode(String companyIfscCode) {
		this.companyIfscCode = companyIfscCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyEmail() {
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyWebsite() {
		return companyWebsite;
	}

	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}

	public String getCompanyIndustry() {
		return companyIndustry;
	}

	public void setCompanyIndustry(String companyIndustry) {
		this.companyIndustry = companyIndustry;
	}

	public String getCompanyLinkedInUrl() {
		return companyLinkedInUrl;
	}

	public void setCompanyLinkedInUrl(String companyLinkedInUrl) {
		this.companyLinkedInUrl = companyLinkedInUrl;
	}

	public MultipartFile getCompanyLogo() {
		return companyLogo;
	}

	public void setCompanyLogo(MultipartFile companyLogo) {
		this.companyLogo = companyLogo;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getContactPersonDesignation() {
		return contactPersonDesignation;
	}

	public void setContactPersonDesignation(String contactPersonDesignation) {
		this.contactPersonDesignation = contactPersonDesignation;
	}

	public String getContactPersonEmail() {
		return contactPersonEmail;
	}

	public void setContactPersonEmail(String contactPersonEmail) {
		this.contactPersonEmail = contactPersonEmail;
	}

	public String getContactPersonPhone() {
		return contactPersonPhone;
	}

	public void setContactPersonPhone(String contactPersonPhone) {
		this.contactPersonPhone = contactPersonPhone;
	}

	public String getTypeOfBusinessEntity() {
		return typeOfBusinessEntity;
	}

	public void setTypeOfBusinessEntity(String typeOfBusinessEntity) {
		this.typeOfBusinessEntity = typeOfBusinessEntity;
	}

	public String getBuisnessRegNumber() {
		return buisnessRegNumber;
	}

	public void setBuisnessRegNumber(String buisnessRegNumber) {
		this.buisnessRegNumber = buisnessRegNumber;
	}

	public String getTaxIdNumber() {
		return taxIdNumber;
	}

	public void setTaxIdNumber(String taxIdNumber) {
		this.taxIdNumber = taxIdNumber;
	}

	public String getCompanyBankName() {
		return companyBankName;
	}

	public void setCompanyBankName(String companyBankName) {
		this.companyBankName = companyBankName;
	}

	public String getCompanyAccountNumber() {
		return companyAccountNumber;
	}

	public void setCompanyAccountNumber(String companyAccountNumber) {
		this.companyAccountNumber = companyAccountNumber;
	}

	public String getCompanyRoutingNumber() {
		return companyRoutingNumber;
	}

	public void setCompanyRoutingNumber(String companyRoutingNumber) {
		this.companyRoutingNumber = companyRoutingNumber;
	}

	public BigDecimal getAnnualTurnoverValue() {
		return annualTurnoverValue;
	}

	public void setAnnualTurnoverValue(BigDecimal annualTurnoverValue) {
		this.annualTurnoverValue = annualTurnoverValue;
	}

	public String getTurnoverFinancialYear() {
		return turnoverFinancialYear;
	}

	public void setTurnoverFinancialYear(String turnoverFinancialYear) {
		this.turnoverFinancialYear = turnoverFinancialYear;
	}

	public String getCompanyDeclarationDate() {
		return companyDeclarationDate;
	}

	public void setCompanyDeclarationDate(String companyDeclarationDate) {
		this.companyDeclarationDate = companyDeclarationDate;
	}

	public MultipartFile getCompanySignature() {
		return companySignature;
	}

	public void setCompanySignature(MultipartFile companySignature) {
		this.companySignature = companySignature;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getDeclerationDate() {
		return declerationDate;
	}

	public void setDeclerationDate(String declerationDate) {
		this.declerationDate = declerationDate;
	}

}
