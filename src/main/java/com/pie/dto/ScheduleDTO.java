package com.pie.dto;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ScheduleDTO {
    
    @JsonProperty("amount")
    private BigDecimal amount;

    @JsonProperty("beneficiary_customer")
    private String beneficiaryCustomer;

    @JsonProperty("description")
    private String description;

    @JsonProperty("paid_date")
    private String paidDate;

    @JsonProperty("payer_customer")
    private String payerCustomer;

    @JsonProperty("required_before_shipment")
    private Boolean requiredBeforeShipment;

    @JsonProperty("status")
    private ScheduleStatusDTO status;

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getBeneficiaryCustomer() {
		return beneficiaryCustomer;
	}

	public void setBeneficiaryCustomer(String beneficiaryCustomer) {
		this.beneficiaryCustomer = beneficiaryCustomer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}

	public String getPayerCustomer() {
		return payerCustomer;
	}

	public void setPayerCustomer(String payerCustomer) {
		this.payerCustomer = payerCustomer;
	}

	public Boolean getRequiredBeforeShipment() {
		return requiredBeforeShipment;
	}

	public void setRequiredBeforeShipment(Boolean requiredBeforeShipment) {
		this.requiredBeforeShipment = requiredBeforeShipment;
	}

	public ScheduleStatusDTO getStatus() {
		return status;
	}

	public void setStatus(ScheduleStatusDTO status) {
		this.status = status;
	}
}
