package com.pie.model;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pie.validator.SellerStep1;
import com.pie.validator.SellerStep2;
import com.pie.validator.SellerStep3;

public class SellerModel {

	private String firstName;
	private String lastName;
	private String personalEmail;
	private boolean personalEmailVerified;
	private String userCountry;
	
	//1st Step
	@NotEmpty(groups = SellerStep1.class)
	private String industryClassificaiton;
	@NotEmpty(groups = SellerStep1.class)
	private String industryExpertise;
	@NotEmpty(groups = SellerStep1.class)
	private String companyName;
	@NotEmpty(groups = SellerStep1.class)
	private String companyWebsite;
	@NotEmpty(groups = SellerStep1.class)
	private String companyEmail;
	@NotEmpty(groups = SellerStep1.class)
	private String companyPhone;
	private String companyLinkedInUrl;
	private Integer companyLogoId;
	private String companyLogoUrl;
	@JsonIgnore
	private MultipartFile companyLogo;
	
	private Integer addressId;
	private String streetAddress;
	private String city;
	private String state;
	private String country;
	private String pincode;

	@Valid
	List<ContactPersonModel> contactPersonModels = new ArrayList<>();

	//Step 2
	private String typeOfCompany;
	private String buisnessRegNumber; // CIN No.
	private String registrationDate;
	private String dunsNumber;
	private String taxIdNumber; 
	private Integer w9SubmissionId;
	private String panNo;
	private String gstNo;
	private MultipartFile w9SubmissionForm;
	private String w9SubmissionUrl;
	private List<ProductModel> productsList = new ArrayList<>();
	@NotNull(groups = SellerStep2.class)
	private Boolean isSupplyingToOEM;
	List<OemModel> oemModels = new ArrayList<>();
	private List<CustomerModel> majorCustomers = new ArrayList<>();
	private Boolean isLogisticServiceProvider;
	private List<CustomerModel> logisticServiceProvider = new ArrayList<>();
	@NotNull(groups = SellerStep2.class)
	private Boolean isExporter;
	private List<ExporterModel> exporterList = new ArrayList<>();
	
	//Step 3
	private Integer bankId;
	@NotEmpty(groups = SellerStep3.class)
	private String accountNo;
	private String bankName;
	private String routingNo;
	private String accountType;
	private String ifscCode;
	private List<AnnualTurnoverModel> annualTurnoverList = new ArrayList<>();
	
	//Step 4
	private List<FactoryModel> factoryList = new ArrayList<>();
	
	//Step 5
	
	private Integer isoCertificationId;
	private String isoCertificationUrl;

	private Integer asCertificationId;
	private String asCertificationUrl;

	private Integer oshaCertificationId;
	private String oshaCertificationUrl;

	private Integer fdaRegisterationId;
	private String fdaRegisterationUrl;
	
	private Integer laborLawComplianceId;
	private String laborLawComplianceUrl;
	
	private Integer indianStandardsComplianceId;
	private String indianStandardsComplianceUrl;
	
	private Integer environmentalRegulationsComplianceId;
	private String environmentalRegulationsComplianceUrl;
	
	private Integer otherCertificationsId;
	private String otherCertificationsUrl;

	private MultipartFile isoCertificationFile;
	private MultipartFile asCertificationFile;
	private MultipartFile oshaCertificationFile;
	private MultipartFile fdaRegisterationFile;
	private MultipartFile laborLawComplianceFile;
	private MultipartFile indianStandardsComplianceFile;
	private MultipartFile environmentalRegulationsComplianceFile;
	private MultipartFile otherCertificationsIndiaFile;

	//Step 6
	private Integer projectCaseStudiesId;
	private String projectCaseStudiesUrl;
	private MultipartFile projectCaseStudiesFile;
	private List<ProductModel> testimonialsList = new ArrayList<>();
	private String declarationDate;
	private MultipartFile signatureFile;
	private String signatureUrl;
	private Integer signatureId;
	 private Boolean getIsNotificationsAllowed;
	//Step 7
	private Integer customerReferencePersonId;
	@NotEmpty
    private String customerReferencePersonName;
	@NotEmpty
    private String customerReferencePersonJobTitle;
	@NotEmpty
    private String customerReferencePersonCompanyName;
	@NotEmpty
    private String customerReferencePersonEmail;
	@NotEmpty
    private String customerReferencePersonPhoneNo;
	@NotEmpty
    private String customerReferencePersonCompanyWebsite;

	private PermissionModel permissionModel;


	private String userRole;
	private Integer accountId;
	private Integer companyId;
	
	
	
	
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
	public boolean isPersonalEmailVerified() {
		return personalEmailVerified;
	}
	public void setPersonalEmailVerified(boolean personalEmailVerified) {
		this.personalEmailVerified = personalEmailVerified;
	}
	public String getUserCountry() {
		return userCountry;
	}
	public void setUserCountry(String userCountry) {
		this.userCountry = userCountry;
	}
	public Integer getOtherCertificationsId() {
		return otherCertificationsId;
	}
	public void setOtherCertificationsId(Integer otherCertificationsId) {
		this.otherCertificationsId = otherCertificationsId;
	}
	public String getOtherCertificationsUrl() {
		return otherCertificationsUrl;
	}
	public void setOtherCertificationsUrl(String otherCertificationsUrl) {
		this.otherCertificationsUrl = otherCertificationsUrl;
	}
	public Boolean getIsLogisticServiceProvider() {
		return isLogisticServiceProvider;
	}
	public void setIsLogisticServiceProvider(Boolean isLogisticServiceProvider) {
		this.isLogisticServiceProvider = isLogisticServiceProvider;
	}
	public Boolean getGetIsNotificationsAllowed() {
		return getIsNotificationsAllowed;
	}
	public void setGetIsNotificationsAllowed(Boolean getIsNotificationsAllowed) {
		this.getIsNotificationsAllowed = getIsNotificationsAllowed;
	}
	public Integer getLaborLawComplianceId() {
		return laborLawComplianceId;
	}
	public void setLaborLawComplianceId(Integer laborLawComplianceId) {
		this.laborLawComplianceId = laborLawComplianceId;
	}
	public String getLaborLawComplianceUrl() {
		return laborLawComplianceUrl;
	}
	public void setLaborLawComplianceUrl(String laborLawComplianceUrl) {
		this.laborLawComplianceUrl = laborLawComplianceUrl;
	}
	public Integer getIndianStandardsComplianceId() {
		return indianStandardsComplianceId;
	}
	public void setIndianStandardsComplianceId(Integer indianStandardsComplianceId) {
		this.indianStandardsComplianceId = indianStandardsComplianceId;
	}
	public String getIndianStandardsComplianceUrl() {
		return indianStandardsComplianceUrl;
	}
	public void setIndianStandardsComplianceUrl(String indianStandardsComplianceUrl) {
		this.indianStandardsComplianceUrl = indianStandardsComplianceUrl;
	}
	public Integer getEnvironmentalRegulationsComplianceId() {
		return environmentalRegulationsComplianceId;
	}
	public void setEnvironmentalRegulationsComplianceId(Integer environmentalRegulationsComplianceId) {
		this.environmentalRegulationsComplianceId = environmentalRegulationsComplianceId;
	}
	public String getEnvironmentalRegulationsComplianceUrl() {
		return environmentalRegulationsComplianceUrl;
	}
	public void setEnvironmentalRegulationsComplianceUrl(String environmentalRegulationsComplianceUrl) {
		this.environmentalRegulationsComplianceUrl = environmentalRegulationsComplianceUrl;
	}
	
	public MultipartFile getLaborLawComplianceFile() {
		return laborLawComplianceFile;
	}
	public void setLaborLawComplianceFile(MultipartFile laborLawComplianceFile) {
		this.laborLawComplianceFile = laborLawComplianceFile;
	}
	public MultipartFile getIndianStandardsComplianceFile() {
		return indianStandardsComplianceFile;
	}
	public void setIndianStandardsComplianceFile(MultipartFile indianStandardsComplianceFile) {
		this.indianStandardsComplianceFile = indianStandardsComplianceFile;
	}
	public MultipartFile getEnvironmentalRegulationsComplianceFile() {
		return environmentalRegulationsComplianceFile;
	}
	public void setEnvironmentalRegulationsComplianceFile(MultipartFile environmentalRegulationsComplianceFile) {
		this.environmentalRegulationsComplianceFile = environmentalRegulationsComplianceFile;
	}
	public MultipartFile getOtherCertificationsIndiaFile() {
		return otherCertificationsIndiaFile;
	}
	public void setOtherCertificationsIndiaFile(MultipartFile otherCertificationsIndiaFile) {
		this.otherCertificationsIndiaFile = otherCertificationsIndiaFile;
	}
	public String getIfscCode() {
		return ifscCode;
	}
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public String getPanNo() {
		return panNo;
	}
	
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getGstNo() {
		return gstNo;
	}
	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}
	public Integer getCustomerReferencePersonId() {
		return customerReferencePersonId;
	}
	public void setCustomerReferencePersonId(Integer customerReferencePersonId) {
		this.customerReferencePersonId = customerReferencePersonId;
	}
	public Integer getIsoCertificationId() {
		return isoCertificationId;
	}
	public void setIsoCertificationId(Integer isoCertificationId) {
		this.isoCertificationId = isoCertificationId;
	}
	public String getIsoCertificationUrl() {
		return isoCertificationUrl;
	}
	public void setIsoCertificationUrl(String isoCertificationUrl) {
		this.isoCertificationUrl = isoCertificationUrl;
	}
	public Integer getAsCertificationId() {
		return asCertificationId;
	}
	public void setAsCertificationId(Integer asCertificationId) {
		this.asCertificationId = asCertificationId;
	}
	public String getAsCertificationUrl() {
		return asCertificationUrl;
	}
	public void setAsCertificationUrl(String asCertificationUrl) {
		this.asCertificationUrl = asCertificationUrl;
	}
	public Integer getOshaCertificationId() {
		return oshaCertificationId;
	}
	public void setOshaCertificationId(Integer oshaCertificationId) {
		this.oshaCertificationId = oshaCertificationId;
	}
	public String getOshaCertificationUrl() {
		return oshaCertificationUrl;
	}
	public void setOshaCertificationUrl(String oshaCertificationUrl) {
		this.oshaCertificationUrl = oshaCertificationUrl;
	}
	public Integer getFdaRegisterationId() {
		return fdaRegisterationId;
	}
	public void setFdaRegisterationId(Integer fdaRegisterationId) {
		this.fdaRegisterationId = fdaRegisterationId;
	}
	public String getFdaRegisterationUrl() {
		return fdaRegisterationUrl;
	}
	public void setFdaRegisterationUrl(String fdaRegisterationUrl) {
		this.fdaRegisterationUrl = fdaRegisterationUrl;
	}
	public Integer getW9SubmissionId() {
		return w9SubmissionId;
	}
	public void setW9SubmissionId(Integer w9SubmissionId) {
		this.w9SubmissionId = w9SubmissionId;
	}
	public String getIndustryClassificaiton() {
		return industryClassificaiton;
	}
	public void setIndustryClassificaiton(String industryClassificaiton) {
		this.industryClassificaiton = industryClassificaiton;
	}
	public String getIndustryExpertise() {
		return industryExpertise;
	}
	public void setIndustryExpertise(String industryExpertise) {
		this.industryExpertise = industryExpertise;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyWebsite() {
		return companyWebsite;
	}
	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}
	public String getCompanyEmail() {
		return companyEmail;
	}
	
	
	public String getW9SubmissionUrl() {
		return w9SubmissionUrl;
	}
	public void setW9SubmissionUrl(String w9SubmissionUrl) {
		this.w9SubmissionUrl = w9SubmissionUrl;
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
	public List<ContactPersonModel> getContactPersonModels() {
		return contactPersonModels;
	}
	public void setContactPersonModels(List<ContactPersonModel> contactPersonModels) {
		this.contactPersonModels = contactPersonModels;
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
	
	

	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getDunsNumber() {
		return dunsNumber;
	}
	public void setDunsNumber(String dunsNumber) {
		this.dunsNumber = dunsNumber;
	}
	public String getTaxIdNumber() {
		return taxIdNumber;
	}
	public void setTaxIdNumber(String taxIdNumber) {
		this.taxIdNumber = taxIdNumber;
	}
	public MultipartFile getW9SubmissionForm() {
		return w9SubmissionForm;
	}
	public void setW9SubmissionForm(MultipartFile w9SubmissionForm) {
		this.w9SubmissionForm = w9SubmissionForm;
	}
	public List<ProductModel> getProductsList() {
		return productsList;
	}
	public void setProductsList(List<ProductModel> productsList) {
		this.productsList = productsList;
	}
	public Boolean getIsSupplyingToOEM() {
		return isSupplyingToOEM;
	}
	public void setIsSupplyingToOEM(Boolean isSupplyingToOEM) {
		this.isSupplyingToOEM = isSupplyingToOEM;
	}
	public List<OemModel> getOemModels() {
		return oemModels;
	}
	public void setOemModels(List<OemModel> oemModels) {
		this.oemModels = oemModels;
	}
	public List<CustomerModel> getMajorCustomers() {
		return majorCustomers;
	}
	public void setMajorCustomers(List<CustomerModel> majorCustomers) {
		this.majorCustomers = majorCustomers;
	}
	public List<CustomerModel> getLogisticServiceProvider() {
		return logisticServiceProvider;
	}
	public void setLogisticServiceProvider(List<CustomerModel> logisticServiceProvider) {
		this.logisticServiceProvider = logisticServiceProvider;
	}
	public Boolean getIsExporter() {
		return isExporter;
	}
	public void setIsExporter(Boolean isExporter) {
		this.isExporter = isExporter;
	}
	public List<ExporterModel> getExporterList() {
		return exporterList;
	}
	public void setExporterList(List<ExporterModel> exporterList) {
		this.exporterList = exporterList;
	}
	public Integer getBankId() {
		return bankId;
	}
	public void setBankId(Integer bankId) {
		this.bankId = bankId;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getRoutingNo() {
		return routingNo;
	}
	public void setRoutingNo(String routingNo) {
		this.routingNo = routingNo;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public List<AnnualTurnoverModel> getAnnualTurnoverList() {
		return annualTurnoverList;
	}
	public void setAnnualTurnoverList(List<AnnualTurnoverModel> annualTurnoverList) {
		this.annualTurnoverList = annualTurnoverList;
	}
	public List<FactoryModel> getFactoryList() {
		return factoryList;
	}
	public void setFactoryList(List<FactoryModel> factoryList) {
		this.factoryList = factoryList;
	}
	
	
	
	public MultipartFile getIsoCertificationFile() {
		return isoCertificationFile;
	}
	public void setIsoCertificationFile(MultipartFile isoCertificationFile) {
		this.isoCertificationFile = isoCertificationFile;
	}
	public MultipartFile getAsCertificationFile() {
		return asCertificationFile;
	}
	public void setAsCertificationFile(MultipartFile asCertificationFile) {
		this.asCertificationFile = asCertificationFile;
	}
	public MultipartFile getOshaCertificationFile() {
		return oshaCertificationFile;
	}
	public void setOshaCertificationFile(MultipartFile oshaCertificationFile) {
		this.oshaCertificationFile = oshaCertificationFile;
	}
	public MultipartFile getFdaRegisterationFile() {
		return fdaRegisterationFile;
	}
	public void setFdaRegisterationFile(MultipartFile fdaRegisterationFile) {
		this.fdaRegisterationFile = fdaRegisterationFile;
	}
	
	
	public List<ProductModel> getTestimonialsList() {
		return testimonialsList;
	}
	public void setTestimonialsList(List<ProductModel> testimonialsList) {
		this.testimonialsList = testimonialsList;
	}
	public String getDeclarationDate() {
		return declarationDate;
	}
	public void setDeclarationDate(String declarationDate) {
		this.declarationDate = declarationDate;
	}
	
	public Integer getProjectCaseStudiesId() {
		return projectCaseStudiesId;
	}
	public void setProjectCaseStudiesId(Integer projectCaseStudiesId) {
		this.projectCaseStudiesId = projectCaseStudiesId;
	}
	public String getProjectCaseStudiesUrl() {
		return projectCaseStudiesUrl;
	}
	public void setProjectCaseStudiesUrl(String projectCaseStudiesUrl) {
		this.projectCaseStudiesUrl = projectCaseStudiesUrl;
	}
	public MultipartFile getProjectCaseStudiesFile() {
		return projectCaseStudiesFile;
	}
	public void setProjectCaseStudiesFile(MultipartFile projectCaseStudiesFile) {
		this.projectCaseStudiesFile = projectCaseStudiesFile;
	}
	public MultipartFile getSignatureFile() {
		return signatureFile;
	}
	public void setSignatureFile(MultipartFile signatureFile) {
		this.signatureFile = signatureFile;
	}
	public String getSignatureUrl() {
		return signatureUrl;
	}
	public void setSignatureUrl(String signatureUrl) {
		this.signatureUrl = signatureUrl;
	}
	public Integer getSignatureId() {
		return signatureId;
	}
	public void setSignatureId(Integer signatureId) {
		this.signatureId = signatureId;
	}
	public String getCustomerReferencePersonName() {
		return customerReferencePersonName;
	}
	public void setCustomerReferencePersonName(String customerReferencePersonName) {
		this.customerReferencePersonName = customerReferencePersonName;
	}
	public String getCustomerReferencePersonJobTitle() {
		return customerReferencePersonJobTitle;
	}
	public void setCustomerReferencePersonJobTitle(String customerReferencePersonJobTitle) {
		this.customerReferencePersonJobTitle = customerReferencePersonJobTitle;
	}
	public String getCustomerReferencePersonCompanyName() {
		return customerReferencePersonCompanyName;
	}
	public void setCustomerReferencePersonCompanyName(String customerReferencePersonCompanyName) {
		this.customerReferencePersonCompanyName = customerReferencePersonCompanyName;
	}
	public String getCustomerReferencePersonEmail() {
		return customerReferencePersonEmail;
	}
	public void setCustomerReferencePersonEmail(String customerReferencePersonEmail) {
		this.customerReferencePersonEmail = customerReferencePersonEmail;
	}
	public String getCustomerReferencePersonPhoneNo() {
		return customerReferencePersonPhoneNo;
	}
	public void setCustomerReferencePersonPhoneNo(String customerReferencePersonPhoneNo) {
		this.customerReferencePersonPhoneNo = customerReferencePersonPhoneNo;
	}
	public String getCustomerReferencePersonCompanyWebsite() {
		return customerReferencePersonCompanyWebsite;
	}
	public void setCustomerReferencePersonCompanyWebsite(String customerReferencePersonCompanyWebsite) {
		this.customerReferencePersonCompanyWebsite = customerReferencePersonCompanyWebsite;
	}
	public PermissionModel getPermissionModel() {
		return permissionModel;
	}
	public void setPermissionModel(PermissionModel permissionModel) {
		this.permissionModel = permissionModel;
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
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	

	
	
}
