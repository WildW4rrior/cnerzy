package com.pie.util;

public interface Constants {

	String SESSION_C_ID = "cId";
	String SESSION_C_NAME = "cName";
	String SESSION_USER_NAME = "userName";
	String SESSION_FIRST_NAME = "firstName";
	String SESSION_PARTNER_FIRST_NAME = "partnerFirstName";
	String SESSION_USER_ID = "userId";
	String SESSION_USER_COUNTRY = "userCountry";
	String SESSION_FULL_NAME = "fullName";
	String SESSION_LAST_NAME = "lastName";
	String SESSION_EMAIL_ID = "email";
	String SESSION_USER_ROLE = "userRole";
	String SESSION_IS_ONBOARDING_COMPLETE = "Is Onboarding Complete";
	String SESSION_IS_ACCOUNT_APPROVED= "Is Account Approved";
	//Seller Preference
	String BUYER_RECOMMENDED = "Buyer Recommended";
	String CNERZY_RECOMMENDED = "Cnerzy Recommended";
	String PREVIOUSLY_ENGAGED = "Previosly Engaged";
	//User Country
	String COUNTRY_US = "US";
	String COUNTRY_IN = "IN";
	//Company Address
	String ADDRESS_FACTORY = "factory";
	String ADDRESS_COMPANY = "company";
	//FACILITY
	String FACILITY_INSPECTION = "Inspection";
	String FACILITY_MACHINING = "Machining";
	//Company Documents
	String COMPANY_LOGO = "Company Logo";
	String SIGNATURE = "Signature";
	String COMPANY_W9SUBMISSION = "W-9 Submission Form";
	String COMPANY_ISO_CERTIFICATION = "ISO Certification";
	String COMPANY_AS_CERTIFICATION = "AS Certification";
	String COMPANY_OSHA_COMPLIANCE = "OSHA Compliance";
	String COMPANY_FDA_REGISTRATION = "FDA Registration";
	String COMPANY_PROJECT_CASE_STUDY = "Project Case Study";
	String COMPANY_LABOR_LAW_COMPLIANCE  = "Compliance with Labor Laws";
	String COMPANY_INDIAN_STANDARDS_COMPLIANCE  = "Compliance with Indian Standards";
	String COMPANY_ENVIRONMENTAL_REGULATIONS_COMPLIANCE  = "Compliance with Environmental Regulations";
	String COMPANY_OTHER_CERTIFICATIONS_INDIA  = "Other Certifications(CE, ROHS, UL)";
	String COMPANY_OTHER_CERTIFICATIONS_US = "Other Certifications";
	String COMPANY_CONTACT_PERSON = "Contact Person";
	String COMPANY_CONTACT_CUSTOMER_REFERENCE= "Customer Reference";
	String PM_RELEVENT_CERITFICATE = "Pm Relevent Certificate";
	
	String PM_RESUME = "Pm Resume";
	//Fetching Requirement Sellers
	String INTERESTED_SELLER = "interested";
	String NOT_INTERESTED_SELLER = "not interested";
	String SHORTLISTED_SELLER = "shortlisted";
	String FINALIZED_SELLER = "finalized";
	//Requirement Documents
	String DOCUMENT_TYPE_LOI = "LOI";
	String DOCUMENT_TYPE_PO = "PO";
	String DOCUMENT_TYPE_BUYER_NDA = "Buyer NDA";
	String DOCUMENT_TYPE_SELLER_NDA = "Seller NDA";
	String DATE_FORMAT_DD_MM_YYYY = "dd/MM/yyyy";
	String DATE_FORMAT_DD_MM_YYYY_WITH_AM_PM = "dd/MM/yyyy HH:mm:ss a";
	String DATE_FORMAT_YYYY_MM_DD = "yyyy-MM-dd";
	String DATE_FORMAT_DD_MM_YYYY_HYPHON = "dd-MM-yyyy";
	String DATE_FORMAT_DD_HYP_MM_HYP_YYYY = "dd-MM-yyyy";
	String[] BACKGROUN_COLOR = { "#f56954", "#00a65a", "#f39c12", "#00c0ef", "#3c8dbc", "#d2d6de", "#bc3c4d", "#3c4dbc",
			"#bc6b3c", "#3cbc8b", "#bc3cad", "#f51f03", "#03d9f5", "#f50360", "#03f598", "#9803f5", "#d9f503",
			"#1f03f5", "#d9f503", "#f59803", "#02a969", "#a96902", "#0242a9", "#a91602", "#02a916", "#a90242",
			"#a99302", "#f5d503", "#0323f5", "#f55c03", "#039cf5", "#03f5d5", "#f56954", "#00a65a", "#f39c12",
			"#00c0ef", "#3c8dbc", "#d2d6de", "#bc3c4d", "#3c4dbc", "#bc6b3c", "#3cbc8b", "#bc3cad", "#f51f03",
			"#03d9f5", "#f50360", "#03f598", "#9803f5", "#d9f503", "#1f03f5", "#d9f503", "#f59803", "#02a969",
			"#a96902", "#0242a9", "#a91602", "#02a916", "#a90242", "#a99302", "#f5d503", "#0323f5", "#f55c03",
			"#039cf5", "#03f5d5" };
	String DATE_TIME_FORMAT = "dd-MM-yyyy HH:mm:ss";
	String DATE_TIME_FORMAT_YYYY_MM_DD_HH_mm_ss = "yyyy-MM-dd HH:mm:ss";
	String DATE_TIME_FORMAT_DD_MM_YYYY_HH_mm_ss = "dd-MM-yyyy HH:mm:ss";
	String VENDOR_EMAIL_AUTO_ID = "vendor@pieinfosystems.com";
	String BACKGROUN_COLOR1 = "#800000";

	Integer CHUNK_SIZE_FOR_REG_IDS = 1000;
	Integer BATCH_SIZE_HIBERNATE = 50;
	String RESOURCE_ID = "ip_details_api";
	String REALM = "MY_OAUTH_REALM";
	String SECRET = "pieTrustedUser";
	String INVITATION_STATUS = "invitationStatus";
	String ACCEPTED = "accepted";
	String PENDING = "pending";
	String ENTERPRISE_KEY = "enterprise_key";
	String ENTERPRISE_SECRET = "enterprise_secret";
	
	String ESCROW_ACTION_SHIP = "ship";
	String ESCROW_ACTION_RECEIVE = "receive";
	String ESCROW_ACTION_ACCEPT = "accept";
	String ESCROW_ACTION_AGREE = "agree";
	
	String ACCOUNT_STATUS_IN_REVIEW = "inReview";
	String ACCOUNT_STATUS_ON_HOLD = "onHold";
	String ACCOUNT_STATUS_APPROVED = "approved";
	String ACCOUNT_STATUS_REJECTED = "rejected";
	
	String ONE_TIME_PAYMENT = "oneTime";
	String MILESTONE_BASED = "milestoneBased";
	


	

}
