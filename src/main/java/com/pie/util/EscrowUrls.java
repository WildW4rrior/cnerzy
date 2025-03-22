package com.pie.util;

public interface EscrowUrls {
	
	String baseUrl = "https://api.escrow.com/v4";
	
	String customer = baseUrl + "/customer";
	String transaction = baseUrl + "/transaction";
	String party = baseUrl + "/party";
	String disbrusmentMethods = "/disbursement_methods";
}
