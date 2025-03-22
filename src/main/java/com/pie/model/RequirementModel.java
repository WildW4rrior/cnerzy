package com.pie.model;

import java.math.BigDecimal;

import com.pie.util.RequirementStatus;

public class RequirementModel {
	private Integer id; 
	    private String industry;
	    private String service;
	    private String jobPostTitle;
	    private String projectDescription;
	    private String quantityRequired;
	    private String materialSpecifications;
	    private String qualitySpecifications;
	    private String packagingSpecifications;
	    private String logisticsSpecifications;
	    private String deliveryTimelines;
	    private String sellerLocation;
	    private String sellerPreference;
	    private RequirementStatus status;
	    private String requirementNo;
	    private Integer companyId;
	    private String addedBy;
	    private Integer reEngagedSellerCid;
	    
	    
	    
		public String getRequirementNo() {
			return requirementNo;
		}
		public void setRequirementNo(String requirementNo) {
			this.requirementNo = requirementNo;
		}
		public RequirementStatus getStatus() {
			return status;
		}
		public void setStatus(RequirementStatus status) {
			this.status = status;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
	
		public Integer getCompanyId() {
			return companyId;
		}
		public void setCompanyId(Integer companyId) {
			this.companyId = companyId;
		}
		public String getAddedBy() {
			return addedBy;
		}
		public void setAddedBy(String addedBy) {
			this.addedBy = addedBy;
		}
		public String getIndustry() {
			return industry;
		}
		public void setIndustry(String industry) {
			this.industry = industry;
		}
		public String getService() {
			return service;
		}
		public void setService(String service) {
			this.service = service;
		}
		public String getJobPostTitle() {
			return jobPostTitle;
		}
		public void setJobPostTitle(String jobPostTitle) {
			this.jobPostTitle = jobPostTitle;
		}
		public String getProjectDescription() {
			return projectDescription;
		}
		public void setProjectDescription(String projectDescription) {
			this.projectDescription = projectDescription;
		}
		public String getQuantityRequired() {
			return quantityRequired;
		}
		public void setQuantityRequired(String quantityRequired) {
			this.quantityRequired = quantityRequired;
		}
		public String getMaterialSpecifications() {
			return materialSpecifications;
		}
		public void setMaterialSpecifications(String materialSpecifications) {
			this.materialSpecifications = materialSpecifications;
		}
		public String getQualitySpecifications() {
			return qualitySpecifications;
		}
		public void setQualitySpecifications(String qualitySpecifications) {
			this.qualitySpecifications = qualitySpecifications;
		}
		public String getPackagingSpecifications() {
			return packagingSpecifications;
		}
		public void setPackagingSpecifications(String packagingSpecifications) {
			this.packagingSpecifications = packagingSpecifications;
		}
		public String getLogisticsSpecifications() {
			return logisticsSpecifications;
		}
		public void setLogisticsSpecifications(String logisticsSpecifications) {
			this.logisticsSpecifications = logisticsSpecifications;
		}
		public String getDeliveryTimelines() {
			return deliveryTimelines;
		}
		public void setDeliveryTimelines(String deliveryTimelines) {
			this.deliveryTimelines = deliveryTimelines;
		}
		public String getSellerLocation() {
			return sellerLocation;
		}
		public void setSellerLocation(String sellerLocation) {
			this.sellerLocation = sellerLocation;
		}
		public String getSellerPreference() {
			return sellerPreference;
		}
		public void setSellerPreference(String sellerPreference) {
			this.sellerPreference = sellerPreference;
		}
		public Integer getReEngagedSellerCid() {
			return reEngagedSellerCid;
		}
		public void setReEngagedSellerCid(Integer reEngagedSellerCid) {
			this.reEngagedSellerCid = reEngagedSellerCid;
		}
	    
	    

}
