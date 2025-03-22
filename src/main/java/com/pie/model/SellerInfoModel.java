package com.pie.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SellerInfoModel {
	private String comapnyLogoUrl;
	private String companyExpertise;
	private Long totalRFQSent;
	private Long totalRFQParticipated;
	private List<String> projectCaseStudies= new ArrayList<>();
	private String status;
	private String companyName;
	private String companyIndustry;
	private boolean isSavedByBuyer;
	private boolean isRejected;
	private String location;
	private Long numberOfRatings;
	private Date dateAdded;
	private Date interestedOn;
	private Double ratings;
	private String linkedInProfile;
	private int numberOfProjectsCompleted;
	private boolean isSellerWithdrawn;
	private Integer sellerCompanyId;
	private boolean isNdaSendForSign;
	private boolean isBuyerSignedNda;
	private boolean isSellerSignedNda;
	private boolean isFinalised;
	
	
	
	
	public Date getDateAdded() {
		return dateAdded;
	}
	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
	public String getCompanyExpertise() {
		return companyExpertise;
	}
	public void setCompanyExpertise(String companyExpertise) {
		this.companyExpertise = companyExpertise;
	}
	public Long getTotalRFQSent() {
		return totalRFQSent;
	}
	public void setTotalRFQSent(Long totalRFQSent) {
		this.totalRFQSent = totalRFQSent;
	}
	public Long getTotalRFQParticipated() {
		return totalRFQParticipated;
	}
	public void setTotalRFQParticipated(Long totalRFQParticipated) {
		this.totalRFQParticipated = totalRFQParticipated;
	}
	public List<String> getProjectCaseStudies() {
		return projectCaseStudies;
	}
	public void setProjectCaseStudies(List<String> projectCaseStudies) {
		this.projectCaseStudies = projectCaseStudies;
	}

	public boolean isFinalised() {
		return isFinalised;
	}
	public void setFinalised(boolean isFinalised) {
		this.isFinalised = isFinalised;
	}
	public boolean isSellerWithdrawn() {
		return isSellerWithdrawn;
	}
	public void setSellerWithdrawn(boolean isSellerWithdrawn) {
		this.isSellerWithdrawn = isSellerWithdrawn;
	}
	public boolean isRejected() {
		return isRejected;
	}
	public void setRejected(boolean isRejected) {
		this.isRejected = isRejected;
	}
	public boolean isSavedByBuyer() {
		return isSavedByBuyer;
	}
	public void setSavedByBuyer(boolean isSavedByBuyer) {
		this.isSavedByBuyer = isSavedByBuyer;
	}
	public Integer getSellerCompanyId() {
		return sellerCompanyId;
	}
	public void setSellerCompanyId(Integer sellerCompanyId) {
		this.sellerCompanyId = sellerCompanyId;
	}
	public String getComapnyLogoUrl() {
		return comapnyLogoUrl;
	}
	public void setComapnyLogoUrl(String comapnyLogoUrl) {
		this.comapnyLogoUrl = comapnyLogoUrl;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyIndustry() {
		return companyIndustry;
	}
	public void setCompanyIndustry(String companyIndustry) {
		this.companyIndustry = companyIndustry;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public Long getNumberOfRatings() {
		return numberOfRatings;
	}
	public void setNumberOfRatings(Long numberOfRatings) {
		this.numberOfRatings = numberOfRatings;
	}
	public Double getRatings() {
		return ratings;
	}
	public void setRatings(Double ratings) {
		this.ratings = ratings;
	}
	public String getLinkedInProfile() {
		return linkedInProfile;
	}
	public void setLinkedInProfile(String linkedInProfile) {
		this.linkedInProfile = linkedInProfile;
	}
	public int getNumberOfProjectsCompleted() {
		return numberOfProjectsCompleted;
	}
	public void setNumberOfProjectsCompleted(int numberOfProjectsCompleted) {
		this.numberOfProjectsCompleted = numberOfProjectsCompleted;
	}
	public boolean isNdaSendForSign() {
		return isNdaSendForSign;
	}
	public void setNdaSendForSign(boolean isNdaSendForSign) {
		this.isNdaSendForSign = isNdaSendForSign;
	}
	public boolean isBuyerSignedNda() {
		return isBuyerSignedNda;
	}
	public void setBuyerSignedNda(boolean isBuyerSignedNda) {
		this.isBuyerSignedNda = isBuyerSignedNda;
	}
	public boolean isSellerSignedNda() {
		return isSellerSignedNda;
	}
	public void setSellerSignedNda(boolean isSellerSignedNda) {
		this.isSellerSignedNda = isSellerSignedNda;
	}
	public Date getInterestedOn() {
		return interestedOn;
	}
	public void setInterestedOn(Date interestedOn) {
		this.interestedOn = interestedOn;
	}

	
}
