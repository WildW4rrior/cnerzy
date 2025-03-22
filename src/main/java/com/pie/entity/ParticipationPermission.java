package com.pie.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="participation_permission")
public class ParticipationPermission {
		
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
	    private Date declerationDate;
	    private String signatureUrl;
	    
	    
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "id")
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name = "company_id")
		public Integer getCompanyId() {
			return companyId;
		}
		public void setCompanyId(Integer companyId) {
			this.companyId = companyId;
		}
		
		@Column(name = "presentations")
		public Boolean getPresentations() {
			return presentations;
		}
		public void setPresentations(Boolean presentations) {
			this.presentations = presentations;
		}
		
	    @Column(name = "newsletters")
		public Boolean getNewsletters() {
			return newsletters;
		}
		public void setNewsletters(Boolean newsletters) {
			this.newsletters = newsletters;
		}
		
	    @Column(name = "customer_profile_on_web")
		public Boolean getCustomerProfileOnWeb() {
			return customerProfileOnWeb;
		}
		public void setCustomerProfileOnWeb(Boolean customerProfileOnWeb) {
			this.customerProfileOnWeb = customerProfileOnWeb;
		}
		
		 @Column(name = "rfp")
		public Boolean getRfp() {
			return rfp;
		}
		public void setRfp(Boolean rfp) {
			this.rfp = rfp;
		}
		
		@Column(name = "online_direct_marketing_campaigns")
		public Boolean getOnlineDirectMarketingCampaigns() {
			return onlineDirectMarketingCampaigns;
		}
		public void setOnlineDirectMarketingCampaigns(Boolean onlineDirectMarketingCampaigns) {
			this.onlineDirectMarketingCampaigns = onlineDirectMarketingCampaigns;
		}
		
		@Column(name = "sponsored_events")
		public Boolean getSponsoredEvents() {
			return sponsoredEvents;
		}
		public void setSponsoredEvents(Boolean sponsoredEvents) {
			this.sponsoredEvents = sponsoredEvents;
		}
		
		@Column(name = "case_study")
		public Boolean getCaseStudy() {
			return caseStudy;
		}
		public void setCaseStudy(Boolean caseStudy) {
			this.caseStudy = caseStudy;
		}
		
		 @Column(name = "white_paper")
		public Boolean getWhitePaper() {
			return whitePaper;
		}
		public void setWhitePaper(Boolean whitePaper) {
			this.whitePaper = whitePaper;
		}
		
	    @Column(name = "broadcast_media")
		public Boolean getBroadcastMedia() {
			return broadcastMedia;
		}
		public void setBroadcastMedia(Boolean broadcastMedia) {
			this.broadcastMedia = broadcastMedia;
		}
		
		@Column(name = "press_analysts")
		public Boolean getPressAnalysts() {
			return pressAnalysts;
		}
		public void setPressAnalysts(Boolean pressAnalysts) {
			this.pressAnalysts = pressAnalysts;
		}
		
		@Column(name = "customer_testimonial_letter")
		public Boolean getCustomerTestimonialLetter() {
			return customerTestimonialLetter;
		}
		public void setCustomerTestimonialLetter(Boolean customerTestimonialLetter) {
			this.customerTestimonialLetter = customerTestimonialLetter;
		}
		
		  @Column(name = "customer_testimonial_video")
		public Boolean getCustomerTestimonialVideo() {
			return customerTestimonialVideo;
		}
		public void setCustomerTestimonialVideo(Boolean customerTestimonialVideo) {
			this.customerTestimonialVideo = customerTestimonialVideo;
		}
		
		@Column(name = "speaking_engagement")
		public Boolean getSpeakingEngagement() {
			return speakingEngagement;
		}
		public void setSpeakingEngagement(Boolean speakingEngagement) {
			this.speakingEngagement = speakingEngagement;
		}
		@Column(name = "decleration_date")
		public Date getDeclerationDate() {
			return declerationDate;
		}
		public void setDeclerationDate(Date declerationDate) {
			this.declerationDate = declerationDate;
		}
		@Column(name = "signature")
		public String getSignatureUrl() {
			return signatureUrl;
		}
		public void setSignatureUrl(String signatureUrl) {
			this.signatureUrl = signatureUrl;
		}
		
		
	    
}
