package com.pie.service;


import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.*;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pie.dao.AccountDAO;
import com.pie.dao.MilestoneDao;
import com.pie.dao.ProjectDao;
import com.pie.dto.CustomerDTO;
import com.pie.dto.DisbursementDTO;
import com.pie.dto.DisbursementMethodDTO;
import com.pie.dto.ItemDTO;
import com.pie.dto.PartyInfoDTO;
import com.pie.dto.ShipmentTrackingInformation;
import com.pie.dto.TransactionDTO;
import com.pie.entity.Account;
import com.pie.entity.Milestone;
import com.pie.entity.Project;
import com.pie.util.EscrowUrls;
import com.pie.util.StringUtil;

@Service
public class EscrowServiceImpl implements EscrowService{
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired 
	private MilestoneDao milestoneDao;
	
	@Autowired 
	private AccountDAO accountDao;
	
	private String getRequestBodyString(Object object) {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        objectMapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
        String json;
		try {
			json = objectMapper.writeValueAsString(object);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
        return json;
	}
	
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String auth = environment.getProperty("escrow.email") + ":" + environment.getProperty("escrow.api.token");
        byte[] encodedAuth = Base64Utils.encode(auth.getBytes());
        String authHeader = "Basic " + new String(encodedAuth);
        headers.set("Authorization", authHeader);  
        return headers;
	}

	@Override
    public CustomerDTO createCustomer(CustomerDTO customer) {
		try {
	        RestTemplate restTemplate = new RestTemplate();
	        HttpHeaders headers = getHeaders();
	        HttpEntity<String> entity = new HttpEntity<>(getRequestBodyString(customer), headers);
	        ResponseEntity<CustomerDTO> response = restTemplate.exchange(EscrowUrls.customer, HttpMethod.POST, entity, CustomerDTO.class);
	        CustomerDTO responseBody = response.getBody();
	        return responseBody;
		} catch(HttpClientErrorException e) {
			if(e.getStatusCode()==HttpStatus.FORBIDDEN) {
				//the account with this email already exist on escrow
			}
			return null;
		}
    }

	@Override
	public TransactionDTO createTransaction(TransactionDTO transaction) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = getHeaders();
        HttpEntity<String> entity = new HttpEntity<>(getRequestBodyString(transaction), headers);
        ResponseEntity<TransactionDTO> response = restTemplate.exchange(EscrowUrls.transaction, HttpMethod.POST, entity, TransactionDTO.class);
        TransactionDTO responseBody = response.getBody();
        return responseBody;
	}

	@Override
	public TransactionDTO transactionActions(String transactionId, String action,String asCustomer, ShipmentTrackingInformation trackingInformation) {
        RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
        HttpHeaders headers = getHeaders();
        headers.add("As-Customer", asCustomer);
        Map<String,Object> requestBody = new HashMap<String,Object>();
        requestBody.put("action", action);
        if(trackingInformation!=null) {
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("carrier", trackingInformation.getCarrier());
            map.put("tracking_id", trackingInformation.getTrackingId());
            map.put("carrier_contact", trackingInformation.getCarrierContact());
            Map<String,Object> outerMap = new HashMap<String,Object>();
            outerMap.put("tracking_information", map);
            requestBody.put("shipping_information", outerMap);

        }
        HttpEntity<String> entity = new HttpEntity<>(getRequestBodyString(requestBody), headers);
        ResponseEntity<TransactionDTO> response = restTemplate.exchange(EscrowUrls.transaction+"/"+transactionId, HttpMethod.PATCH, entity, TransactionDTO.class);
        TransactionDTO responseBody = response.getBody();
        return responseBody;
	}
	
	@Override
	public void transactionActionsPerItem(String transactionId, String action,String asCustomer, String itemId) {
        RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
        HttpHeaders headers = getHeaders();
        headers.add("As-Customer", asCustomer);
        Map<String,Object> requestBody = new HashMap<String,Object>();
        requestBody.put("action", action);
        HttpEntity<String> entity = new HttpEntity<>(getRequestBodyString(requestBody), headers);
        ResponseEntity<TransactionDTO> response = restTemplate.exchange(EscrowUrls.transaction+"/"+transactionId+"/item/"+itemId, HttpMethod.PATCH, entity, TransactionDTO.class);
	}
	
	@Override
	public PartyInfoDTO getPartInfoById(String partyId) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = getHeaders();
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<PartyInfoDTO> response = restTemplate.exchange(EscrowUrls.party+"/"+partyId, HttpMethod.GET, entity, PartyInfoDTO.class);
        PartyInfoDTO responseBody = response.getBody();
        return responseBody;
	}

	@Override
	public TransactionDTO getTransactionById(String transactionId) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = getHeaders();
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<TransactionDTO> response = restTemplate.exchange(EscrowUrls.transaction+"/"+transactionId, HttpMethod.GET, entity, TransactionDTO.class);
        TransactionDTO responseBody = response.getBody();
        return responseBody;
	}

	@Override
	public DisbursementDTO getAvailableDisbursementMethods(String transactionId, String asCustomer) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = getHeaders();
        headers.add("As-Customer", asCustomer); 
        HttpEntity<String> entity = new HttpEntity<>(headers);
        ResponseEntity<DisbursementDTO> response = restTemplate.exchange(EscrowUrls.transaction+"/"+transactionId+"/"+EscrowUrls.disbrusmentMethods, HttpMethod.GET, entity, DisbursementDTO.class);
        DisbursementDTO responseBody = response.getBody();
        return responseBody;
	}

	@Override
	public DisbursementDTO selectDisbursementMethods(String transactionId, String asCustomer, DisbursementMethodDTO disbursementMethod) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = getHeaders();
        headers.add("As-Customer", asCustomer);
        String requestBodyString = "";
        if(StringUtil.isNullOrEmpty(disbursementMethod.getId())) {
	        Map<String,Object> requestBody = new HashMap<String,Object>();
	        requestBody.put("id", disbursementMethod.getId());
	        //just selecting the disbursement method 
	        requestBodyString = getRequestBodyString(requestBodyString);
        } else {
        	//creating and selecting the disbursement method
        	requestBodyString = getRequestBodyString(disbursementMethod);
        }
        HttpEntity<String> entity = new HttpEntity<>(getRequestBodyString(requestBodyString), headers);
        ResponseEntity<DisbursementDTO> response = restTemplate.exchange(EscrowUrls.transaction+"/"+transactionId+"/"+EscrowUrls.disbrusmentMethods, HttpMethod.POST, entity, DisbursementDTO.class);
        DisbursementDTO responseBody = response.getBody();
        return responseBody;
	}

	@Override
	public void handleWebhookResponse(Map<String, Object> requestBody) {
		System.out.println(requestBody);
		String event = requestBody.get("event").toString();
		if(!event.equalsIgnoreCase("create") && !event.equalsIgnoreCase("agree")) {
		Integer transactionId = Integer.parseInt(requestBody.get("transaction_id").toString());
		Project project = projectDao.getProjectByEscrowTransactionId(transactionId);
		if(project!=null) {
			if(event.equalsIgnoreCase("payment_sent")) {
				project.setIsPaymentSent(true);
			}
			if(event.equalsIgnoreCase("payment_approved")) {
				project.setAmountInEscrow(project.getTotalProjctPrice());
				project.setAmountDisbursed(BigDecimal.ZERO);
				project.setIsPaymentApproved(true);
			}
			if(event.equalsIgnoreCase("payment_disbursed")) {
				TransactionDTO transactionDTO = getTransactionById(transactionId.toString());
				List<ItemDTO> items =  transactionDTO.getItems();
				BigDecimal disbursedAmount = BigDecimal.ZERO;
				for(ItemDTO item : items) {
					Milestone milestone = milestoneDao.getMileStoneByEscrowId(item.getId());
					milestone.setIsPaymentDisbursed(item.getSchedule().get(0).getStatus().getDisbursedToBeneficiary());
					if(milestone.getIsPaymentDisbursed()){
						disbursedAmount=disbursedAmount.add(milestone.getMilestoneAmount());
					}
					milestoneDao.update(milestone);
				}
				project.setAmountDisbursed(disbursedAmount);
				project.setAmountInEscrow(project.getTotalProjctPrice().subtract(disbursedAmount));
			}
			if(project.getIsDisbursementMethodSelected()==null || (project.getIsDisbursementMethodSelected()!=null && !project.getIsDisbursementMethodSelected())) {
				Account account = accountDao.getAccountByCompanyId(project.getSellerCompanyId());
				DisbursementDTO disbursementDTO = getAvailableDisbursementMethods(transactionId.toString(), account.getEmailId());
				if(disbursementDTO.getSelectedDisbursementMethod()!=null) {
					project.setIsDisbursementMethodSelected(true);
				}
			}
			projectDao.update(project);
			
		} else {
			Milestone milestone = milestoneDao.getMileStoneByEscrowId(transactionId);
			Project milestoneProject = projectDao.getProjectByProjectId(milestone.getProjectId());
			if(event.equalsIgnoreCase("payment_sent")) {
				milestone.setIsPaymentSent(true);
			}
			if(event.equalsIgnoreCase("payment_approved") && !milestone.getIsPaymentApproved()) {
				if(milestoneProject.getAmountInEscrow()==null) {
					milestoneProject.setAmountInEscrow(milestone.getMilestoneAmount());
				} else {
					milestoneProject.setAmountInEscrow(milestoneProject.getAmountInEscrow().add(milestone.getMilestoneAmount()));
				}
				milestone.setIsPaymentApproved(true);
			}
			if(event.equalsIgnoreCase("payment_disbursed") && !milestone.getIsPaymentDisbursed()) {
				milestone.setIsPaymentDisbursed(true);
				if(milestoneProject.getAmountDisbursed()==null) {
					milestoneProject.setAmountDisbursed(milestone.getMilestoneAmount());
				} else {
					milestoneProject.setAmountDisbursed(milestoneProject.getAmountDisbursed().add(milestone.getMilestoneAmount()));
				}
				milestoneProject.setAmountInEscrow(milestoneProject.getAmountInEscrow().subtract(milestone.getMilestoneAmount()));
			}
			if(milestoneProject.getIsDisbursementMethodSelected()==null || (milestoneProject.getIsDisbursementMethodSelected()!=null && !milestoneProject.getIsDisbursementMethodSelected())) {
				Account account = accountDao.getAccountByCompanyId(milestoneProject.getSellerCompanyId());
				DisbursementDTO disbursementDTO = getAvailableDisbursementMethods(transactionId.toString(), account.getEmailId());
				if(disbursementDTO.getSelectedDisbursementMethod()!=null) {
					milestone.setIsDisbursementMethodSelected(true);
				}
			}
			projectDao.update(milestoneProject);
			milestoneDao.update(milestone);
		}
		}
	}

}
