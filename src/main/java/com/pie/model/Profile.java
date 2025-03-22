package com.pie.model;

import org.springframework.web.multipart.MultipartFile;

public class Profile {
	private Integer userId;
	private Boolean isapproved;
	private MultipartFile companyLogo;//
	private String companyName;
	private String companyEmailId;
	private Boolean emailVerified;//?
	private String companyPhoneNo;
	private String companyWebsite;
	private String companyIndustry;
	private String companyLinkedin;
	private String companyStreetAddress;
	private String companyCity;
	private String companyState;
	private String companyCountry;
	private String companyPincode;
	private String contactPersonName;
	private String contactPersonDesignation;
	private String contactPersonEmailId;
	private String contactPersonPhoneNo;
	private String typeOfCompany;
	private String buisnessRegNumber; // CIN No.
	private String taxIdNumber; // EIN no.
	private String bankName;
	private String accountNumber;
	private String ifscCode;
	private String annualTurnover;
	private MultipartFile signature;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Boolean getIsapproved() {
		return isapproved;
	}
	public void setIsapproved(Boolean isapproved) {
		this.isapproved = isapproved;
	}
	public MultipartFile getCompanyLogo() {
		return companyLogo;
	}
	public void setCompanyLogo(MultipartFile companyLogo) {
		this.companyLogo = companyLogo;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyEmailId() {
		return companyEmailId;
	}
	public void setCompanyEmailId(String companyEmailId) {
		this.companyEmailId = companyEmailId;
	}
	public Boolean getEmailVerified() {
		return emailVerified;
	}
	public void setEmailVerified(Boolean emailVerified) {
		this.emailVerified = emailVerified;
	}
	public String getCompanyPhoneNo() {
		return companyPhoneNo;
	}
	public void setCompanyPhoneNo(String companyPhoneNo) {
		this.companyPhoneNo = companyPhoneNo;
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
	public String getCompanyLinkedin() {
		return companyLinkedin;
	}
	public void setCompanyLinkedin(String companyLinkedin) {
		this.companyLinkedin = companyLinkedin;
	}
	public String getCompanyStreetAddress() {
		return companyStreetAddress;
	}
	public void setCompanyStreetAddress(String companyStreetAddress) {
		this.companyStreetAddress = companyStreetAddress;
	}
	public String getCompanyCity() {
		return companyCity;
	}
	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
	}
	public String getCompanyState() {
		return companyState;
	}
	public void setCompanyState(String companyState) {
		this.companyState = companyState;
	}
	public String getCompanyCountry() {
		return companyCountry;
	}
	public void setCompanyCountry(String companyCountry) {
		this.companyCountry = companyCountry;
	}
	public String getCompanyPincode() {
		return companyPincode;
	}
	public void setCompanyPincode(String companyPincode) {
		this.companyPincode = companyPincode;
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
	public String getContactPersonEmailId() {
		return contactPersonEmailId;
	}
	public void setContactPersonEmailId(String contactPersonEmailId) {
		this.contactPersonEmailId = contactPersonEmailId;
	}
	public String getContactPersonPhoneNo() {
		return contactPersonPhoneNo;
	}
	public void setContactPersonPhoneNo(String contactPersonPhoneNo) {
		this.contactPersonPhoneNo = contactPersonPhoneNo;
	}
	public String getTypeOfCompany() {
		return typeOfCompany;
	}
	public void setTypeOfCompany(String typeOfCompany) {
		this.typeOfCompany = typeOfCompany;
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
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getIfscCode() {
		return ifscCode;
	}
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public String getAnnualTurnover() {
		return annualTurnover;
	}
	public void setAnnualTurnover(String annualTurnover) {
		this.annualTurnover = annualTurnover;
	}
	public MultipartFile getSignature() {
		return signature;
	}
	public void setSignature(MultipartFile signature) {
		this.signature = signature;
	}
}