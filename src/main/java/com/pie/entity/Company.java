package com.pie.entity;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "company")
public class Company{
	private Integer companyId;
	private Integer accountId;
	
	private Date registerationDate;
	private Date declerationDate;

	private String companyName;
	private String companyEmail;
	private String companyPhoneNo;
	private String companyWebsite;
	private String companyIndustry;
	private String industryExpertise;
	private String companyLinkedIn;
	private String buisnessRegNumber; // CIN No.
	private String taxIdNumber; // EIN no.
	private String dunsNumber;
	private String panNo;
	private String gstNo;

	private String typeOfCompany;
	private String cnergyType;
	private Boolean isExporter;
	private Boolean isLogisticServiceProvider;
	private Boolean isSupplyingToOEM;
	private Boolean isNotificationsAllowed;



	private List<CompanyDocument> companyDocuments = new ArrayList<>();
	private List<CompanyContactPerson> companyContactPersons =  new ArrayList<>();
	private List<Address> addresses = new ArrayList<>();
	private List<CustomerTestimonial> customerTestimonials = new ArrayList<>();
	private List<AnnualTurnover> annualTurnovers = new ArrayList<>();

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "company_id")
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	@Column(name = "buisness_reg_no")
	public String getBuisnessRegNumber() {
		return buisnessRegNumber;
	}

	public void setBuisnessRegNumber(String buisnessRegNumber) {
		this.buisnessRegNumber = buisnessRegNumber;
	}

	@Column(name = "tax_id_no")
	public String getTaxIdNumber() {
		return taxIdNumber;
	}

	public void setTaxIdNumber(String taxIdNumber) {
		this.taxIdNumber = taxIdNumber;
	}

	@Column(name = "supplying_to_oem")
	public Boolean getIsSupplyingToOEM() {
		return isSupplyingToOEM;
	}

	public void setIsSupplyingToOEM(Boolean isSupplyingToOEM) {
		this.isSupplyingToOEM = isSupplyingToOEM;
	}
	
	@Column(name = "pan_no")
	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	@Column(name = "gst_no")
	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	@Column(name = "industry_expertise")
	public String getIndustryExpertise() {
		return industryExpertise;
	}

	public void setIndustryExpertise(String industryExpertise) {
		this.industryExpertise = industryExpertise;
	}

	@Column(name = "company_name")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "registeration_date")
	public Date getRegisterationDate() {
		return registerationDate;
	}

	public void setRegisterationDate(Date registerationDate) {
		this.registerationDate = registerationDate;
	}

	@Column(name = "type_of_company")
	public String getTypeOfCompany() {
		return typeOfCompany;
	}

	public void setTypeOfCompany(String typeOfCompany) {
		this.typeOfCompany = typeOfCompany;
	}

	@Column(name = "cnergy_type", nullable = false)
	public String getCnergyType() {
		return cnergyType;
	}

	public void setCnergyType(String cnergyType) {
		this.cnergyType = cnergyType;
	}

	@Column(name = "duns_number")
	public String getDunsNumber() {
		return dunsNumber;
	}

	public void setDunsNumber(String dunsNumber) {
		this.dunsNumber = dunsNumber;
	}

	@Column(name = "is_exporter")
	public Boolean getIsExporter() {
		return isExporter;
	}

	public void setIsExporter(Boolean isExporter) {
		this.isExporter = isExporter;
	}

	@Column(name = "company_email")
	public String getCompanyEmail() {
		return companyEmail;
	}

	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}

	@Column(name = "company_phone_no")
	public String getCompanyPhoneNo() {
		return companyPhoneNo;
	}

	public void setCompanyPhoneNo(String companyPhoneNo) {
		this.companyPhoneNo = companyPhoneNo;
	}

	@Column(name = "company_website")
	public String getCompanyWebsite() {
		return companyWebsite;
	}

	public void setCompanyWebsite(String companyWebsite) {
		this.companyWebsite = companyWebsite;
	}

	@Column(name = "company_industry")
	public String getCompanyIndustry() {
		return companyIndustry;
	}

	public void setCompanyIndustry(String companyIndustry) {
		this.companyIndustry = companyIndustry;
	}

	@Column(name = "company_linkedin")
	public String getCompanyLinkedIn() {
		return companyLinkedIn;
	}

	public void setCompanyLinkedIn(String companyLinkedIn) {
		this.companyLinkedIn = companyLinkedIn;
	}

	@OneToMany(mappedBy = "company", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	@Column(name = "account_id")
	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	@OneToMany(mappedBy = "company", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	public List<AnnualTurnover> getAnnualTurnovers() {
		return annualTurnovers;
	}

	public void setAnnualTurnovers(List<AnnualTurnover> annualTurnovers) {
		this.annualTurnovers = annualTurnovers;
	}

	@Column(name = "decleration_date")
	public Date getDeclerationDate() {
		return declerationDate;
	}

	public void setDeclerationDate(Date declerationDate) {
		this.declerationDate = declerationDate;
	}

	@OneToMany(mappedBy = "company", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	public List<CompanyDocument> getCompanyDocuments() {
		return companyDocuments;
	}

	public void setCompanyDocuments(List<CompanyDocument> companyDocuments) {
		this.companyDocuments = companyDocuments;
	}

	@OneToMany(mappedBy = "company", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	public List<CustomerTestimonial> getCustomerTestimonials() {
		return customerTestimonials;
	}

	public void setCustomerTestimonials(List<CustomerTestimonial> customerTestimonials) {
		this.customerTestimonials = customerTestimonials;
	}

	@OneToMany(mappedBy = "company", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	public List<CompanyContactPerson> getCompanyContactPersons() {
		return companyContactPersons;
	}

	public void setCompanyContactPersons(List<CompanyContactPerson> companyContactPersons) {
		this.companyContactPersons = companyContactPersons;
	}

	@Column(name="is_notifications_allowed")
	public Boolean getIsNotificationsAllowed() {
		return isNotificationsAllowed;
	}
	public void setIsNotificationsAllowed(Boolean isNotificationsAllowed) {
		this.isNotificationsAllowed = isNotificationsAllowed;
	}

	@Column(name="is_logistic_provider")
	public Boolean getIsLogisticServiceProvider() {
		return isLogisticServiceProvider;
	}

	public void setIsLogisticServiceProvider(Boolean isLogisticServiceProvider) {
		this.isLogisticServiceProvider = isLogisticServiceProvider;
	}
	
	

}
