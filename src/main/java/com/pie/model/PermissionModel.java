package com.pie.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PermissionModel {

	private Integer id;
	private Integer companyId;
    private Boolean presentations;
    private Boolean newsletters;
    private Boolean customerProfileOnWeb;
    private Boolean rfp;
    private Boolean onlineDirectMarketingCampaigns;
    private Boolean sponsoredEvents;
    private Boolean caseStudy;
    private Boolean whitePaper;
    private Boolean broadcastMedia;
    private Boolean pressAnalysts;
    private Boolean customerTestimonialLetter;
    private Boolean customerTestimonialVideo;
    private Boolean speakingEngagement;
    private String declerationDate;
    private String signatureUrl;
    private MultipartFile signatureFile;
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
	public Boolean getPresentations() {
		return presentations;
	}
	public void setPresentations(Boolean presentations) {
		this.presentations = presentations;
	}
	public Boolean getNewsletters() {
		return newsletters;
	}
	public void setNewsletters(Boolean newsletters) {
		this.newsletters = newsletters;
	}
	public Boolean getCustomerProfileOnWeb() {
		return customerProfileOnWeb;
	}
	public void setCustomerProfileOnWeb(Boolean customerProfileOnWeb) {
		this.customerProfileOnWeb = customerProfileOnWeb;
	}
	public Boolean getRfp() {
		return rfp;
	}
	public void setRfp(Boolean rfp) {
		this.rfp = rfp;
	}
	public Boolean getOnlineDirectMarketingCampaigns() {
		return onlineDirectMarketingCampaigns;
	}
	public void setOnlineDirectMarketingCampaigns(Boolean onlineDirectMarketingCampaigns) {
		this.onlineDirectMarketingCampaigns = onlineDirectMarketingCampaigns;
	}
	public Boolean getSponsoredEvents() {
		return sponsoredEvents;
	}
	public void setSponsoredEvents(Boolean sponsoredEvents) {
		this.sponsoredEvents = sponsoredEvents;
	}
	public Boolean getCaseStudy() {
		return caseStudy;
	}
	public void setCaseStudy(Boolean caseStudy) {
		this.caseStudy = caseStudy;
	}
	public Boolean getWhitePaper() {
		return whitePaper;
	}
	public void setWhitePaper(Boolean whitePaper) {
		this.whitePaper = whitePaper;
	}
	public Boolean getBroadcastMedia() {
		return broadcastMedia;
	}
	public void setBroadcastMedia(Boolean broadcastMedia) {
		this.broadcastMedia = broadcastMedia;
	}
	public Boolean getPressAnalysts() {
		return pressAnalysts;
	}
	public void setPressAnalysts(Boolean pressAnalysts) {
		this.pressAnalysts = pressAnalysts;
	}
	public Boolean getCustomerTestimonialLetter() {
		return customerTestimonialLetter;
	}
	public void setCustomerTestimonialLetter(Boolean customerTestimonialLetter) {
		this.customerTestimonialLetter = customerTestimonialLetter;
	}
	public Boolean getCustomerTestimonialVideo() {
		return customerTestimonialVideo;
	}
	public void setCustomerTestimonialVideo(Boolean customerTestimonialVideo) {
		this.customerTestimonialVideo = customerTestimonialVideo;
	}
	public Boolean getSpeakingEngagement() {
		return speakingEngagement;
	}
	public void setSpeakingEngagement(Boolean speakingEngagement) {
		this.speakingEngagement = speakingEngagement;
	}
	
	public String getDeclerationDate() {
		return declerationDate;
	}
	public void setDeclerationDate(String declerationDate) {
		this.declerationDate = declerationDate;
	}
	public String getSignatureUrl() {
		return signatureUrl;
	}
	public void setSignatureUrl(String signatureUrl) {
		this.signatureUrl = signatureUrl;
	}
	public MultipartFile getSignatureFile() {
		return signatureFile;
	}
	public void setSignatureFile(MultipartFile signatureFile) {
		this.signatureFile = signatureFile;
	}
    
    
    
	
}
