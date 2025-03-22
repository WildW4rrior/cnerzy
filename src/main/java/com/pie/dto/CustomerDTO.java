package com.pie.dto;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class CustomerDTO {
	@JsonProperty("email")
    private String email;

    @JsonProperty("first_name")
    private String firstName;

    @JsonProperty("middle_name")
    private String middleName;

    @JsonProperty("last_name")
    private String lastName;

    @JsonProperty("address")
    private AddressDTO address;

    @JsonProperty("phone_number")
    private String phoneNumber;
    
    @JsonProperty("company")
    private Map<String,Object> company;
    
    @JsonProperty("customer_email_verification")
    private Map<String,Object> customerEmailVerification;

    @JsonProperty("display_name")
    private String displayName;

    @JsonProperty("electronic_verification")
    private Map<String,Object> electronicVerification;

    @JsonProperty("id")
    private Integer id;

    @JsonProperty("verification")
    private Map<String,Object> verification;
    //in this verification map we have a key personal which is another map having key status, 
    //if its not verified or approved the payment can't be approved
    
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


	public String getMiddleName() {
		return middleName;
	}


	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public AddressDTO getAddress() {
		return address;
	}


	public void setAddress(AddressDTO address) {
		this.address = address;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

}
