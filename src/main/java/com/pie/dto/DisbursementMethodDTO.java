package com.pie.dto;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class DisbursementMethodDTO {
	@JsonProperty("account_name")
    private String accountName;

    @JsonProperty("account_type")
    private String accountType;

    @JsonProperty("bank_account_number")
    private String bankAccountNumber;

    @JsonProperty("bank_address")
    private AddressDTO bankAddress;

    @JsonProperty("bank_name")
    private String bankName;

    @JsonProperty("beneficiary_address")
    private AddressDTO beneficiaryAddress;

    @JsonProperty("clearing_system_code")
    private String clearingSystemCode;

    @JsonProperty("currency")
    private String currency;

    @JsonProperty("id")
    private Integer id;

    @JsonProperty("type")
    private String type;

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getBankAccountNumber() {
		return bankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}

	public AddressDTO getBankAddress() {
		return bankAddress;
	}

	public void setBankAddress(AddressDTO bankAddress) {
		this.bankAddress = bankAddress;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public AddressDTO getBeneficiaryAddress() {
		return beneficiaryAddress;
	}

	public void setBeneficiaryAddress(AddressDTO beneficiaryAddress) {
		this.beneficiaryAddress = beneficiaryAddress;
	}

	public String getClearingSystemCode() {
		return clearingSystemCode;
	}

	public void setClearingSystemCode(String clearingSystemCode) {
		this.clearingSystemCode = clearingSystemCode;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
