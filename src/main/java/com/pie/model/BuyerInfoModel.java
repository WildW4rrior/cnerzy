package com.pie.model;

public class BuyerInfoModel {
		private String comapnyLogoUrl;
		private String status;
		private String companyName;
		private String companyIndustry;
		private String location;
		private Long numberOfRatings;
		private Double ratings;
		private String linkedInProfile;
		private int numberOfProjectsCompleted;
		private Integer buyerCompanyId;
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
		public void setNumberOfRatings(Long numberOfRating) {
			this.numberOfRatings = numberOfRating;
		}
		public Double getRatings() {
			return ratings;
		}
		public void setRatings(Double rating) {
			this.ratings = rating;
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
		public Integer getBuyerCompanyId() {
			return buyerCompanyId;
		}
		public void setBuyerCompanyId(Integer buyerCompanyId) {
			this.buyerCompanyId = buyerCompanyId;
		}
		
		
}
