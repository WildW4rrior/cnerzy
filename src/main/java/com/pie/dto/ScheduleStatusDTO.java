package com.pie.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ScheduleStatusDTO {
    
    @JsonProperty("disbursed_to_beneficiary")
    private Boolean disbursedToBeneficiary;

    @JsonProperty("payment_received")
    private Boolean paymentReceived;

    @JsonProperty("payment_sent")
    private Boolean paymentSent;

    @JsonProperty("refund_created")
    private Boolean refundCreated;

    @JsonProperty("refund_rejected")
    private Boolean refundRejected;

    @JsonProperty("refund_resolved")
    private Boolean refundResolved;

    @JsonProperty("secured")
    private Boolean secured;

	public Boolean getDisbursedToBeneficiary() {
		return disbursedToBeneficiary;
	}

	public void setDisbursedToBeneficiary(Boolean disbursedToBeneficiary) {
		this.disbursedToBeneficiary = disbursedToBeneficiary;
	}

	public Boolean getPaymentReceived() {
		return paymentReceived;
	}

	public void setPaymentReceived(Boolean paymentReceived) {
		this.paymentReceived = paymentReceived;
	}

	public Boolean getPaymentSent() {
		return paymentSent;
	}

	public void setPaymentSent(Boolean paymentSent) {
		this.paymentSent = paymentSent;
	}

	public Boolean getRefundCreated() {
		return refundCreated;
	}

	public void setRefundCreated(Boolean refundCreated) {
		this.refundCreated = refundCreated;
	}

	public Boolean getRefundRejected() {
		return refundRejected;
	}

	public void setRefundRejected(Boolean refundRejected) {
		this.refundRejected = refundRejected;
	}

	public Boolean getRefundResolved() {
		return refundResolved;
	}

	public void setRefundResolved(Boolean refundResolved) {
		this.refundResolved = refundResolved;
	}

	public Boolean getSecured() {
		return secured;
	}

	public void setSecured(Boolean secured) {
		this.secured = secured;
	}
}
