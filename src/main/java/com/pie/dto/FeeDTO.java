package com.pie.dto;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class FeeDTO {
    
    @JsonProperty("amount")
    private BigDecimal amount;

    @JsonProperty("amount_without_taxes")
    private BigDecimal amountWithoutTaxes;

    @JsonProperty("payer_customer")
    private String payerCustomer;

    @JsonProperty("split")
    private String split;

    @JsonProperty("type")
    private String type;

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public BigDecimal getAmountWithoutTaxes() {
		return amountWithoutTaxes;
	}

	public void setAmountWithoutTaxes(BigDecimal amountWithoutTaxes) {
		this.amountWithoutTaxes = amountWithoutTaxes;
	}

	public String getPayerCustomer() {
		return payerCustomer;
	}

	public void setPayerCustomer(String payerCustomer) {
		this.payerCustomer = payerCustomer;
	}

	public String getSplit() {
		return split;
	}

	public void setSplit(String split) {
		this.split = split;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
    
    
}
