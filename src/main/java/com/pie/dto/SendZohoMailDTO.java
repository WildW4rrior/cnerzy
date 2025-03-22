package com.pie.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class SendZohoMailDTO {
    @JsonProperty("code")
    public int code;

    @JsonProperty("requests")
    public ZohoRequestDTO requests;

    @JsonProperty("message")
    public String message;

    @JsonProperty("status")
    public String status;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public ZohoRequestDTO getRequests() {
		return requests;
	}

	public void setRequests(ZohoRequestDTO requests) {
		this.requests = requests;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}

class PageDTO {
    @JsonProperty("image_string")
    public String imageString;

    @JsonProperty("page")
    public int page;

    @JsonProperty("is_thumbnail")
    public boolean isThumbnail;

	public String getImageString() {
		return imageString;
	}

	public void setImageString(String imageString) {
		this.imageString = imageString;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public boolean isThumbnail() {
		return isThumbnail;
	}

	public void setThumbnail(boolean isThumbnail) {
		this.isThumbnail = isThumbnail;
	}
    
    
}

class DocumentFieldsDTO {
    @JsonProperty("document_id")
    public String documentId;

    @JsonProperty("fields")
    public List<FieldDTO> fields;

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public List<FieldDTO> getFields() {
		return fields;
	}

	public void setFields(List<FieldDTO> fields) {
		this.fields = fields;
	}
    
    
}

class FieldDTO {
    @JsonProperty("field_id")
    public String fieldId;

    @JsonProperty("x_coord")
    public int xCoord;

    @JsonProperty("field_type_id")
    public String fieldTypeId;

    @JsonProperty("abs_height")
    public int absHeight;

    @JsonProperty("text_property")
    public TextPropertyDTO textProperty;

    @JsonProperty("field_category")
    public String fieldCategory;

    @JsonProperty("field_label")
    public String fieldLabel;

    @JsonProperty("is_mandatory")
    public boolean isMandatory;

    @JsonProperty("default_value")
    public String defaultValue;

    @JsonProperty("page_no")
    public int pageNo;

    @JsonProperty("document_id")
    public String documentId;

    @JsonProperty("field_name")
    public String fieldName;

    @JsonProperty("y_value")
    public double yValue;

    @JsonProperty("abs_width")
    public int absWidth;

    @JsonProperty("width")
    public double width;

    @JsonProperty("field_value")
    public String fieldValue;

    @JsonProperty("y_coord")
    public double yCoord;

    @JsonProperty("field_type_name")
    public String fieldTypeName;

    @JsonProperty("description_tooltip")
    public String descriptionTooltip;

    @JsonProperty("x_value")
    public double xValue;

    @JsonProperty("height")
    public double height;

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public int getxCoord() {
		return xCoord;
	}

	public void setxCoord(int xCoord) {
		this.xCoord = xCoord;
	}

	public String getFieldTypeId() {
		return fieldTypeId;
	}

	public void setFieldTypeId(String fieldTypeId) {
		this.fieldTypeId = fieldTypeId;
	}

	public int getAbsHeight() {
		return absHeight;
	}

	public void setAbsHeight(int absHeight) {
		this.absHeight = absHeight;
	}

	public TextPropertyDTO getTextProperty() {
		return textProperty;
	}

	public void setTextProperty(TextPropertyDTO textProperty) {
		this.textProperty = textProperty;
	}

	public String getFieldCategory() {
		return fieldCategory;
	}

	public void setFieldCategory(String fieldCategory) {
		this.fieldCategory = fieldCategory;
	}

	public String getFieldLabel() {
		return fieldLabel;
	}

	public void setFieldLabel(String fieldLabel) {
		this.fieldLabel = fieldLabel;
	}

	public boolean isMandatory() {
		return isMandatory;
	}

	public void setMandatory(boolean isMandatory) {
		this.isMandatory = isMandatory;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public double getyValue() {
		return yValue;
	}

	public void setyValue(double yValue) {
		this.yValue = yValue;
	}

	public int getAbsWidth() {
		return absWidth;
	}

	public void setAbsWidth(int absWidth) {
		this.absWidth = absWidth;
	}

	public double getWidth() {
		return width;
	}

	public void setWidth(double width) {
		this.width = width;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public double getyCoord() {
		return yCoord;
	}

	public void setyCoord(double yCoord) {
		this.yCoord = yCoord;
	}

	public String getFieldTypeName() {
		return fieldTypeName;
	}

	public void setFieldTypeName(String fieldTypeName) {
		this.fieldTypeName = fieldTypeName;
	}

	public String getDescriptionTooltip() {
		return descriptionTooltip;
	}

	public void setDescriptionTooltip(String descriptionTooltip) {
		this.descriptionTooltip = descriptionTooltip;
	}

	public double getxValue() {
		return xValue;
	}

	public void setxValue(double xValue) {
		this.xValue = xValue;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}
    
    
}

class TextPropertyDTO {
    @JsonProperty("is_italic")
    public boolean isItalic;

    @JsonProperty("max_field_length")
    public int maxFieldLength;

    @JsonProperty("is_underline")
    public boolean isUnderline;

    @JsonProperty("font_color")
    public String fontColor;

    @JsonProperty("is_fixed_width")
    public boolean isFixedWidth;

    @JsonProperty("font_size")
    public int fontSize;

    @JsonProperty("is_fixed_height")
    public boolean isFixedHeight;

    @JsonProperty("is_read_only")
    public boolean isReadOnly;

    @JsonProperty("is_bold")
    public boolean isBold;

    @JsonProperty("font")
    public String font;

	public boolean isItalic() {
		return isItalic;
	}

	public void setItalic(boolean isItalic) {
		this.isItalic = isItalic;
	}

	public int getMaxFieldLength() {
		return maxFieldLength;
	}

	public void setMaxFieldLength(int maxFieldLength) {
		this.maxFieldLength = maxFieldLength;
	}

	public boolean isUnderline() {
		return isUnderline;
	}

	public void setUnderline(boolean isUnderline) {
		this.isUnderline = isUnderline;
	}

	public String getFontColor() {
		return fontColor;
	}

	public void setFontColor(String fontColor) {
		this.fontColor = fontColor;
	}

	public boolean isFixedWidth() {
		return isFixedWidth;
	}

	public void setFixedWidth(boolean isFixedWidth) {
		this.isFixedWidth = isFixedWidth;
	}

	public int getFontSize() {
		return fontSize;
	}

	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}

	public boolean isFixedHeight() {
		return isFixedHeight;
	}

	public void setFixedHeight(boolean isFixedHeight) {
		this.isFixedHeight = isFixedHeight;
	}

	public boolean isReadOnly() {
		return isReadOnly;
	}

	public void setReadOnly(boolean isReadOnly) {
		this.isReadOnly = isReadOnly;
	}

	public boolean isBold() {
		return isBold;
	}

	public void setBold(boolean isBold) {
		this.isBold = isBold;
	}

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}
    
    
}

class VisibleSignSettingsDTO {
    @JsonProperty("allow_custom_signer_reason_visible_sign")
    public boolean allowCustomSignerReasonVisibleSign;

    @JsonProperty("allow_predefined_reason_visible_sign")
    public boolean allowPredefinedReasonVisibleSign;

    @JsonProperty("visible_sign")
    public boolean visibleSign;

    @JsonProperty("predefined_reasons_visible_sign")
    public List<String> predefinedReasonsVisibleSign;

    @JsonProperty("allow_reason_visible_sign")
    public boolean allowReasonVisibleSign;

	public boolean isAllowCustomSignerReasonVisibleSign() {
		return allowCustomSignerReasonVisibleSign;
	}

	public void setAllowCustomSignerReasonVisibleSign(boolean allowCustomSignerReasonVisibleSign) {
		this.allowCustomSignerReasonVisibleSign = allowCustomSignerReasonVisibleSign;
	}

	public boolean isAllowPredefinedReasonVisibleSign() {
		return allowPredefinedReasonVisibleSign;
	}

	public void setAllowPredefinedReasonVisibleSign(boolean allowPredefinedReasonVisibleSign) {
		this.allowPredefinedReasonVisibleSign = allowPredefinedReasonVisibleSign;
	}

	public boolean isVisibleSign() {
		return visibleSign;
	}

	public void setVisibleSign(boolean visibleSign) {
		this.visibleSign = visibleSign;
	}

	public List<String> getPredefinedReasonsVisibleSign() {
		return predefinedReasonsVisibleSign;
	}

	public void setPredefinedReasonsVisibleSign(List<String> predefinedReasonsVisibleSign) {
		this.predefinedReasonsVisibleSign = predefinedReasonsVisibleSign;
	}

	public boolean isAllowReasonVisibleSign() {
		return allowReasonVisibleSign;
	}

	public void setAllowReasonVisibleSign(boolean allowReasonVisibleSign) {
		this.allowReasonVisibleSign = allowReasonVisibleSign;
	}
    
    
}

class ActionDTO {
    @JsonProperty("verify_recipient")
    public boolean verifyRecipient;

    @JsonProperty("recipient_countrycode_iso")
    public String recipientCountrycodeIso;

    @JsonProperty("action_type")
    public String actionType;

    @JsonProperty("private_notes")
    public String privateNotes;

    @JsonProperty("cloud_provider_name")
    public String cloudProviderName;

    @JsonProperty("has_payment")
    public boolean hasPayment;

    @JsonProperty("recipient_email")
    public String recipientEmail;

    @JsonProperty("send_completed_document")
    public boolean sendCompletedDocument;

    @JsonProperty("allow_signing")
    public boolean allowSigning;

    @JsonProperty("recipient_phonenumber")
    public String recipientPhoneNumber;

    @JsonProperty("is_bulk")
    public boolean isBulk;

    @JsonProperty("action_id")
    public String actionId;

    @JsonProperty("is_revoked")
    public boolean isRevoked;

    @JsonProperty("is_embedded")
    public boolean isEmbedded;

    @JsonProperty("cloud_provider_id")
    public int cloudProviderId;

    @JsonProperty("signing_order")
    public int signingOrder;

    @JsonProperty("fields")
    public List<FieldDTO> fields;

    @JsonProperty("recipient_name")
    public String recipientName;

    @JsonProperty("delivery_mode")
    public String deliveryMode;

    @JsonProperty("action_status")
    public String actionStatus;

    @JsonProperty("recipient_countrycode")
    public String recipientCountrycode;

	public boolean isVerifyRecipient() {
		return verifyRecipient;
	}

	public void setVerifyRecipient(boolean verifyRecipient) {
		this.verifyRecipient = verifyRecipient;
	}

	public String getRecipientCountrycodeIso() {
		return recipientCountrycodeIso;
	}

	public void setRecipientCountrycodeIso(String recipientCountrycodeIso) {
		this.recipientCountrycodeIso = recipientCountrycodeIso;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public String getPrivateNotes() {
		return privateNotes;
	}

	public void setPrivateNotes(String privateNotes) {
		this.privateNotes = privateNotes;
	}

	public String getCloudProviderName() {
		return cloudProviderName;
	}

	public void setCloudProviderName(String cloudProviderName) {
		this.cloudProviderName = cloudProviderName;
	}

	public boolean isHasPayment() {
		return hasPayment;
	}

	public void setHasPayment(boolean hasPayment) {
		this.hasPayment = hasPayment;
	}

	public String getRecipientEmail() {
		return recipientEmail;
	}

	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}

	public boolean isSendCompletedDocument() {
		return sendCompletedDocument;
	}

	public void setSendCompletedDocument(boolean sendCompletedDocument) {
		this.sendCompletedDocument = sendCompletedDocument;
	}

	public boolean isAllowSigning() {
		return allowSigning;
	}

	public void setAllowSigning(boolean allowSigning) {
		this.allowSigning = allowSigning;
	}

	public String getRecipientPhoneNumber() {
		return recipientPhoneNumber;
	}

	public void setRecipientPhoneNumber(String recipientPhoneNumber) {
		this.recipientPhoneNumber = recipientPhoneNumber;
	}

	public boolean isBulk() {
		return isBulk;
	}

	public void setBulk(boolean isBulk) {
		this.isBulk = isBulk;
	}

	public String getActionId() {
		return actionId;
	}

	public void setActionId(String actionId) {
		this.actionId = actionId;
	}

	public boolean isRevoked() {
		return isRevoked;
	}

	public void setRevoked(boolean isRevoked) {
		this.isRevoked = isRevoked;
	}

	public boolean isEmbedded() {
		return isEmbedded;
	}

	public void setEmbedded(boolean isEmbedded) {
		this.isEmbedded = isEmbedded;
	}

	public int getCloudProviderId() {
		return cloudProviderId;
	}

	public void setCloudProviderId(int cloudProviderId) {
		this.cloudProviderId = cloudProviderId;
	}

	public int getSigningOrder() {
		return signingOrder;
	}

	public void setSigningOrder(int signingOrder) {
		this.signingOrder = signingOrder;
	}

	public List<FieldDTO> getFields() {
		return fields;
	}

	public void setFields(List<FieldDTO> fields) {
		this.fields = fields;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getDeliveryMode() {
		return deliveryMode;
	}

	public void setDeliveryMode(String deliveryMode) {
		this.deliveryMode = deliveryMode;
	}

	public String getActionStatus() {
		return actionStatus;
	}

	public void setActionStatus(String actionStatus) {
		this.actionStatus = actionStatus;
	}

	public String getRecipientCountrycode() {
		return recipientCountrycode;
	}

	public void setRecipientCountrycode(String recipientCountrycode) {
		this.recipientCountrycode = recipientCountrycode;
	}
    
    
}
