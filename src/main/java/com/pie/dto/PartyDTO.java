package com.pie.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class PartyDTO {
    
    @JsonProperty("agreed")
    private Boolean agreed;

    @JsonProperty("customer")
    private String customer;

    @JsonProperty("disbursement_method_selected")
    private Boolean disbursementMethodSelected;

    @JsonProperty("id")
    private Integer id;

    @JsonProperty("initiator")
    private Boolean initiator;

    @JsonProperty("role")
    private String role;

    @JsonProperty("verification_required")
    private Boolean verificationRequired;

	public Boolean getAgreed() {
		return agreed;
	}

	public void setAgreed(Boolean agreed) {
		this.agreed = agreed;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public Boolean getDisbursementMethodSelected() {
		return disbursementMethodSelected;
	}

	public void setDisbursementMethodSelected(Boolean disbursementMethodSelected) {
		this.disbursementMethodSelected = disbursementMethodSelected;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getInitiator() {
		return initiator;
	}

	public void setInitiator(Boolean initiator) {
		this.initiator = initiator;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Boolean getVerificationRequired() {
		return verificationRequired;
	}

	public void setVerificationRequired(Boolean verificationRequired) {
		this.verificationRequired = verificationRequired;
	}
}
