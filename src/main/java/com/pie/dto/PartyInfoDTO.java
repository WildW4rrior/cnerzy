package com.pie.dto;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class PartyInfoDTO {
    
	@JsonProperty("address")
    private AddressDTO address;

    @JsonProperty("company")
    private Map<String, Object> company;

    @JsonProperty("customer_email_verification")
    private Map<String, Object> customerEmailVerification;

    @JsonProperty("date_of_birth")
    private String dateOfBirth;

    @JsonProperty("display_name")
    private String displayName;

    @JsonProperty("electronic_verification")
    private Map<String, Object> electronicVerification;

    @JsonProperty("email")
    private String email;

    @JsonProperty("first_name")
    private String firstName;

    @JsonProperty("id")
    private int id;

    @JsonProperty("last_name")
    private String lastName;

    @JsonProperty("phone_number")
    private String phoneNumber;

    @JsonProperty("shipping_address")
    private Map<String, Object> shippingAddress;

    @JsonProperty("verification")
    private Map<String, Object> verification;

    @JsonProperty("verification_required")
    private Map<String, Object> verificationRequired;

	public AddressDTO getAddress() {
		return address;
	}

	public void setAddress(AddressDTO address) {
		this.address = address;
	}

	public Map<String, Object> getCompany() {
		return company;
	}

	public void setCompany(Map<String, Object> company) {
		this.company = company;
	}

	public Map<String, Object> getCustomerEmailVerification() {
		return customerEmailVerification;
	}

	public void setCustomerEmailVerification(Map<String, Object> customerEmailVerification) {
		this.customerEmailVerification = customerEmailVerification;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public Map<String, Object> getElectronicVerification() {
		return electronicVerification;
	}

	public void setElectronicVerification(Map<String, Object> electronicVerification) {
		this.electronicVerification = electronicVerification;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Map<String, Object> getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Map<String, Object> shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Map<String, Object> getVerification() {
		return verification;
	}

	public void setVerification(Map<String, Object> verification) {
		this.verification = verification;
	}

	public Map<String, Object> getVerificationRequired() {
		return verificationRequired;
	}

	public void setVerificationRequired(Map<String, Object> verificationRequired) {
		this.verificationRequired = verificationRequired;
	}
}