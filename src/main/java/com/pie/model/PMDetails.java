package com.pie.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class PMDetails {

	private String name;
	private String email;
	private String phone;
	@NotEmpty
	private String industry;
	@NotEmpty
	private String expertise;
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

	@NotEmpty
	private List<String> companyName;
	
	private BigDecimal companyExperience;
	private String companyLinkedInUrl;
	private Integer relevantDocumentId;
	private MultipartFile relevantDocuments;
	private String relevantDocumentUrl;
	private Integer signatureDocumentId;
	private MultipartFile singatureDocument;
	private String singatureDocumentUrl;

	private String gstNo;
	private String EINNumber;
	private String panNo;

	private Integer resumeId;
	private MultipartFile resume;
	private String resumeLink;

	// project management experience
	private Integer exp_id;
	private String exp_description;
	private Integer exp_projectsComplexity;
	private Integer exp_projectsHandled;
	
	// Reference
	private List<PMRefrenceModel> pmRefrenceModels = new ArrayList<>();

	private String userRole;
	private Integer accountId;
	private Integer companyId;

	
	
	
	
	public Integer getSignatureDocumentId() {
		return signatureDocumentId;
	}

	public void setSignatureDocumentId(Integer signatureDocumentId) {
		this.signatureDocumentId = signatureDocumentId;
	}

	public MultipartFile getSingatureDocument() {
		return singatureDocument;
	}

	public void setSingatureDocument(MultipartFile singatureDocument) {
		this.singatureDocument = singatureDocument;
	}

	public String getSingatureDocumentUrl() {
		return singatureDocumentUrl;
	}

	public void setSingatureDocumentUrl(String singatureDocumentUrl) {
		this.singatureDocumentUrl = singatureDocumentUrl;
	}

	public String getEINNumber() {
		return EINNumber;
	}

	public void setEINNumber(String eINNumber) {
		EINNumber = eINNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
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

	

	public List<String> getCompanyName() {
		return companyName;
	}

	public void setCompanyName(List<String> companyName) {
		this.companyName = companyName;
	}

	public BigDecimal getCompanyExperience() {
		return companyExperience;
	}

	public void setCompanyExperience(BigDecimal companyExperience) {
		this.companyExperience = companyExperience;
	}

	public String getCompanyLinkedInUrl() {
		return companyLinkedInUrl;
	}

	public void setCompanyLinkedInUrl(String companyLinkedInUrl) {
		this.companyLinkedInUrl = companyLinkedInUrl;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public MultipartFile getResume() {
		return resume;
	}

	public void setResume(MultipartFile resume) {
		this.resume = resume;
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

	

	public Integer getExp_id() {
		return exp_id;
	}

	public void setExp_id(Integer exp_id) {
		this.exp_id = exp_id;
	}

	public String getExp_description() {
		return exp_description;
	}

	public void setExp_description(String exp_description) {
		this.exp_description = exp_description;
	}

	public Integer getExp_projectsComplexity() {
		return exp_projectsComplexity;
	}

	public void setExp_projectsComplexity(Integer exp_projectsComplexity) {
		this.exp_projectsComplexity = exp_projectsComplexity;
	}

	public Integer getExp_projectsHandled() {
		return exp_projectsHandled;
	}

	public void setExp_projectsHandled(Integer exp_projectsHandled) {
		this.exp_projectsHandled = exp_projectsHandled;
	}

	public List<PMRefrenceModel> getPmRefrenceModels() {
		return pmRefrenceModels;
	}

	public void setPmRefrenceModels(List<PMRefrenceModel> pmRefrenceModels) {
		this.pmRefrenceModels = pmRefrenceModels;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	

	public Integer getRelevantDocumentId() {
		return relevantDocumentId;
	}

	public void setRelevantDocumentId(Integer relevantDocumentId) {
		this.relevantDocumentId = relevantDocumentId;
	}

	public MultipartFile getRelevantDocuments() {
		return relevantDocuments;
	}

	public void setRelevantDocuments(MultipartFile relevantDocuments) {
		this.relevantDocuments = relevantDocuments;
	}

	public String getRelevantDocumentUrl() {
		return relevantDocumentUrl;
	}

	public void setRelevantDocumentUrl(String relevantDocumentUrl) {
		this.relevantDocumentUrl = relevantDocumentUrl;
	}

	public Integer getResumeId() {
		return resumeId;
	}

	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
	}

	public String getResumeLink() {
		return resumeLink;
	}

	public void setResumeLink(String resumeLink) {
		this.resumeLink = resumeLink;
	}

	public Boolean getGetIsNotificationsAllowed() {
		return getIsNotificationsAllowed;
	}

	public void setGetIsNotificationsAllowed(Boolean getIsNotificationsAllowed) {
		this.getIsNotificationsAllowed = getIsNotificationsAllowed;
	}

}
