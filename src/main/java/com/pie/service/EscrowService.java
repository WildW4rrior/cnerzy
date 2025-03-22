package com.pie.service;

import java.util.Map;

import com.pie.dto.CustomerDTO;
import com.pie.dto.DisbursementDTO;
import com.pie.dto.DisbursementMethodDTO;
import com.pie.dto.PartyInfoDTO;
import com.pie.dto.ShipmentTrackingInformation;
import com.pie.dto.TransactionDTO;

public interface EscrowService {
	CustomerDTO createCustomer(CustomerDTO customer);
	TransactionDTO createTransaction(TransactionDTO transaction);
	TransactionDTO getTransactionById(String transactionId);
	TransactionDTO transactionActions(String transactionId, String action, String asCustomer, ShipmentTrackingInformation trackingInformation);
	DisbursementDTO getAvailableDisbursementMethods(String transactionId,String asCustomer);
	DisbursementDTO selectDisbursementMethods(String transactionId,String asCustomer, DisbursementMethodDTO disbursementMethod);
	void handleWebhookResponse(Map<String,Object> requestBody);
	PartyInfoDTO getPartInfoById(String partyId);
	public void transactionActionsPerItem(String transactionId, String action,String asCustomer, String itemId);
}
