package com.pie.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ZohoRequestDTO {
    @JsonProperty("request_status")
    public String requestStatus;

    @JsonProperty("notes")
    public String notes;

    @JsonProperty("reminder_period")
    public int reminderPeriod;

    @JsonProperty("owner_id")
    public String ownerId;

    @JsonProperty("description")
    public String description;

    @JsonProperty("request_name")
    public String requestName;

    @JsonProperty("modified_time")
    public long modifiedTime;

    @JsonProperty("action_time")
    public long actionTime;

    @JsonProperty("is_deleted")
    public boolean isDeleted;

    @JsonProperty("expiration_days")
    public int expirationDays;

    @JsonProperty("is_sequential")
    public boolean isSequential;

    @JsonProperty("sign_submitted_time")
    public long signSubmittedTime;

    @JsonProperty("templates_used")
    public List<String> templatesUsed;

    @JsonProperty("owner_first_name")
    public String ownerFirstName;

    @JsonProperty("sign_percentage")
    public double signPercentage;

    @JsonProperty("expire_by")
    public long expireBy;

    @JsonProperty("is_expiring")
    public boolean isExpiring;

    @JsonProperty("owner_email")
    public String ownerEmail;

    @JsonProperty("created_time")
    public long createdTime;

    @JsonProperty("email_reminders")
    public boolean emailReminders;

    @JsonProperty("document_ids")
    public List<ZohoDocumentIdDTO> documentIds;

    @JsonProperty("self_sign")
    public boolean selfSign;

    @JsonProperty("sign_id")
    public String signId;

    @JsonProperty("document_fields")
    public List<DocumentFieldsDTO> documentFields;

    @JsonProperty("template_ids")
    public List<String> templateIds;

    @JsonProperty("in_process")
    public boolean inProcess;

    @JsonProperty("validity")
    public int validity;

    @JsonProperty("request_type_name")
    public String requestTypeName;

    @JsonProperty("visible_sign_settings")
    public VisibleSignSettingsDTO visibleSignSettings;

    @JsonProperty("request_id")
    public String requestId;

    @JsonProperty("zsdocumentid")
    public String zsDocumentId;

    @JsonProperty("request_type_id")
    public String requestTypeId;

    @JsonProperty("owner_last_name")
    public String ownerLastName;

    @JsonProperty("actions")
    public List<ActionDTO> actions;

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getReminderPeriod() {
		return reminderPeriod;
	}

	public void setReminderPeriod(int reminderPeriod) {
		this.reminderPeriod = reminderPeriod;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRequestName() {
		return requestName;
	}

	public void setRequestName(String requestName) {
		this.requestName = requestName;
	}

	public long getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(long modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	public long getActionTime() {
		return actionTime;
	}

	public void setActionTime(long actionTime) {
		this.actionTime = actionTime;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public int getExpirationDays() {
		return expirationDays;
	}

	public void setExpirationDays(int expirationDays) {
		this.expirationDays = expirationDays;
	}

	public boolean isSequential() {
		return isSequential;
	}

	public void setSequential(boolean isSequential) {
		this.isSequential = isSequential;
	}

	public long getSignSubmittedTime() {
		return signSubmittedTime;
	}

	public void setSignSubmittedTime(long signSubmittedTime) {
		this.signSubmittedTime = signSubmittedTime;
	}

	public List<String> getTemplatesUsed() {
		return templatesUsed;
	}

	public void setTemplatesUsed(List<String> templatesUsed) {
		this.templatesUsed = templatesUsed;
	}

	public String getOwnerFirstName() {
		return ownerFirstName;
	}

	public void setOwnerFirstName(String ownerFirstName) {
		this.ownerFirstName = ownerFirstName;
	}

	public double getSignPercentage() {
		return signPercentage;
	}

	public void setSignPercentage(double signPercentage) {
		this.signPercentage = signPercentage;
	}

	public long getExpireBy() {
		return expireBy;
	}

	public void setExpireBy(long expireBy) {
		this.expireBy = expireBy;
	}

	public boolean isExpiring() {
		return isExpiring;
	}

	public void setExpiring(boolean isExpiring) {
		this.isExpiring = isExpiring;
	}

	public String getOwnerEmail() {
		return ownerEmail;
	}

	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}

	public long getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(long createdTime) {
		this.createdTime = createdTime;
	}

	public boolean isEmailReminders() {
		return emailReminders;
	}

	public void setEmailReminders(boolean emailReminders) {
		this.emailReminders = emailReminders;
	}

	public List<ZohoDocumentIdDTO> getDocumentIds() {
		return documentIds;
	}

	public void setDocumentIds(List<ZohoDocumentIdDTO> documentIds) {
		this.documentIds = documentIds;
	}

	public boolean isSelfSign() {
		return selfSign;
	}

	public void setSelfSign(boolean selfSign) {
		this.selfSign = selfSign;
	}

	public String getSignId() {
		return signId;
	}

	public void setSignId(String signId) {
		this.signId = signId;
	}

	public List<DocumentFieldsDTO> getDocumentFields() {
		return documentFields;
	}

	public void setDocumentFields(List<DocumentFieldsDTO> documentFields) {
		this.documentFields = documentFields;
	}

	public List<String> getTemplateIds() {
		return templateIds;
	}

	public void setTemplateIds(List<String> templateIds) {
		this.templateIds = templateIds;
	}

	public boolean isInProcess() {
		return inProcess;
	}

	public void setInProcess(boolean inProcess) {
		this.inProcess = inProcess;
	}

	public int getValidity() {
		return validity;
	}

	public void setValidity(int validity) {
		this.validity = validity;
	}

	public String getRequestTypeName() {
		return requestTypeName;
	}

	public void setRequestTypeName(String requestTypeName) {
		this.requestTypeName = requestTypeName;
	}

	public VisibleSignSettingsDTO getVisibleSignSettings() {
		return visibleSignSettings;
	}

	public void setVisibleSignSettings(VisibleSignSettingsDTO visibleSignSettings) {
		this.visibleSignSettings = visibleSignSettings;
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getZsDocumentId() {
		return zsDocumentId;
	}

	public void setZsDocumentId(String zsDocumentId) {
		this.zsDocumentId = zsDocumentId;
	}

	public String getRequestTypeId() {
		return requestTypeId;
	}

	public void setRequestTypeId(String requestTypeId) {
		this.requestTypeId = requestTypeId;
	}

	public String getOwnerLastName() {
		return ownerLastName;
	}

	public void setOwnerLastName(String ownerLastName) {
		this.ownerLastName = ownerLastName;
	}

	public List<ActionDTO> getActions() {
		return actions;
	}

	public void setActions(List<ActionDTO> actions) {
		this.actions = actions;
	}
    
    
}