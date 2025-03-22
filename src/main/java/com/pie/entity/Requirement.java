package com.pie.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.pie.util.RequirementStatus;

@Entity
@Table(name = "requirement" )
public class Requirement {
	
	private Integer id;
	private Date dateAdded;
	private String addedBy;
	private String industry;
	private String service;
	private Integer companyId; //Buyer Company Id
	private String requirementNo;
	
	private String title;
	private String description;
	private String quantityRequired;
	private String materialSpecification;
	private String qualitySpecification;
	private String packagingSpecification;
	private String logisticSpecification;
	private String deliveryTimeline;
	private String sellerLocation;
	private String sellerPrefrences;
	private RequirementStatus status;
	private Integer authorisedCid;
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "date_added")
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	
	
	@Column(name="requirement_no", unique = true)
	public String getRequirementNo() {
		return requirementNo;
	}
	public void setRequirementNo(String requirementNo) {
		this.requirementNo = requirementNo;
	}
	@Column(name = "added_by")
	public String getAddedBy() {
		return addedBy;
	}
	public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}
	
	@Column(name = "industry")
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	@Column(name = "service")
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	
	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "description", columnDefinition = "LONGTEXT")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name = "quantity_required")
	public String getQuantityRequired() {
		return quantityRequired;
	}
	public void setQuantityRequired(String quantityRequired) {
		this.quantityRequired = quantityRequired;
	}
	
	@Column(name = "material_specifiaction")
	public String getMaterialSpecification() {
		return materialSpecification;
	}
	public void setMaterialSpecification(String materialSpecification) {
		this.materialSpecification = materialSpecification;
	}
	
	@Column(name = "quality_specifiaction")
	public String getQualitySpecification() {
		return qualitySpecification;
	}
	public void setQualitySpecification(String qualitySpecification) {
		this.qualitySpecification = qualitySpecification;
	}
	
	@Column(name = "packaging_specification")
	public String getPackagingSpecification() {
		return packagingSpecification;
	}
	public void setPackagingSpecification(String packagingSpecification) {
		this.packagingSpecification = packagingSpecification;
	}
	
	@Column(name = "logistic_specification")
	public String getLogisticSpecification() {
		return logisticSpecification;
	}
	public void setLogisticSpecification(String logisticSpecification) {
		this.logisticSpecification = logisticSpecification;
	}
	
	@Column(name = "delivery_timelines")
	public String getDeliveryTimeline() {
		return deliveryTimeline;
	}
	public void setDeliveryTimeline(String deliveryTimeline) {
		this.deliveryTimeline = deliveryTimeline;
	}
	
	@Column(name = "seller_location")
	public String getSellerLocation() {
		return sellerLocation;
	}
	public void setSellerLocation(String sellerLocation) {
		this.sellerLocation = sellerLocation;
	}
	
	@Column(name = "seller_prefrences")
	public String getSellerPrefrences() {
		return sellerPrefrences;
	}
	public void setSellerPrefrences(String sellerPrefrences) {
		this.sellerPrefrences = sellerPrefrences;
	}
	
	@Enumerated(EnumType.STRING)
	@Column(name = "status")
	public RequirementStatus getStatus() {
		return status;
	}
	public void setStatus(RequirementStatus status) {
		this.status = status;
	}
	
	@Column(name = "authorised_id")
	public Integer getAuthorisedCid() {
		return authorisedCid;
	}
	public void setAuthorisedCid(Integer authorisedCid) {
		this.authorisedCid = authorisedCid;
	}
	
	@Column(name = "company_id")
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
	

}
