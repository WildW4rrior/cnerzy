package com.pie.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pie.dao.AccountDAO;
import com.pie.dao.NotificationDao;
import com.pie.dao.RequirementDao;
import com.pie.dao.RequirementSellerDao;
import com.pie.dao.RequirementTimelineDao;
import com.pie.dao.impl.ProjectDaoImpl;
import com.pie.dto.SendZohoMailDTO;
import com.pie.dto.ZohoAuthDTO;
import com.pie.entity.Account;
import com.pie.entity.Notification;
import com.pie.entity.Project;
import com.pie.entity.Requirement;
import com.pie.entity.RequirementSeller;
import com.pie.entity.RequirementTimeline;
import com.pie.model.ZohoDocSignModel;
import com.pie.util.RequirementStatus;
import com.pie.util.ZohoSignUrls;

@Service
public class ZohoSignServiceImpl implements ZohoSignService{
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private AccountDAO accountDAO;
	
	@Autowired
	private RequirementSellerDao requirementSellerDao;
	
	@Autowired
	private NotificationDao notificationDao;
	
	@Autowired
	private RequirementDao requirementDao;
	
	@Autowired
	private RequirementTimelineDao requirementTimelineDao;
	
	@Autowired
	private ProjectDaoImpl projectDaoImpl;

	@Override
	public String getAccessToken() {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String url = ZohoSignUrls.auth +"?refresh_token="+ environment.getProperty("zoho.refresh_token") + "&client_id=" + environment.getProperty("zoho.sign.client_id") + "&client_secret=" + environment.getProperty("zoho.sign.client_secret") + "&grant_type=refresh_token";
        ResponseEntity<ZohoAuthDTO> response = restTemplate.exchange(url, HttpMethod.POST, null, ZohoAuthDTO.class);
        ZohoAuthDTO responseBody = response.getBody();
		return responseBody.getAccessToken();
	}
	
	@Override
	public void handleWebhookResponse(Object response) throws JsonParseException, JsonMappingException, IOException {
		String str = response.toString();
		str = str.replace("=", ":");
		str = str.replace(":,", ":null,");
        System.out.println(str);
        // Step 2: Add quotes around keys
        StringBuffer sb = new StringBuffer();
        Pattern pattern = Pattern.compile("([a-zA-Z0-9_]+):");
        Matcher matcher = pattern.matcher(str);
        
        while (matcher.find()) {
            matcher.appendReplacement(sb, "\"" + matcher.group(1) + "\":");
        }
        matcher.appendTail(sb);
        
        // Step 3: Handle values
        String jsonString = sb.toString();
        sb = new StringBuffer();
        pattern = Pattern.compile(":([^\\[{\"].*?)([,}])");
        matcher = pattern.matcher(jsonString);
        
        while (matcher.find()) {
            String value = matcher.group(1).trim();
            if (!value.equals("true") && !value.equals("false") && !value.matches("\\d+")) {
                matcher.appendReplacement(sb, ":\"" + value + "\"" + matcher.group(2));
            } else {
                matcher.appendReplacement(sb, ":" + value + matcher.group(2));
            }
        }
        matcher.appendTail(sb);
        jsonString = sb.toString();

        // Step 4: Correct any non-quoted values within arrays and objects
        jsonString = jsonString.replaceAll(":\\s*([^\"{\\[]\\S*?)([,}])", ": \"$1\"$2");

        // Step 5: Handle empty values
        jsonString = jsonString.replaceAll(":\\s*([,}])", ":\"\"$1");

        // Ensure boolean and numeric values are not quoted
        jsonString = jsonString.replaceAll("\"true\"", "true")
                               .replaceAll("\"false\"", "false")
                               .replaceAll("\"(\\d+)\"", "$1");

        // Convert to Map
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(jsonString, new TypeReference<Map<String, Object>>() {});
		
        Map<String, Object> requests = (Map<String, Object>) map.get("requests");
        
        List<Map<String, Object>> documentIds = (List) requests.get("document_ids");
        
        Map<String, Object> document = documentIds.get(0);
        
        String documentId = document.get("document_id").toString();
        RequirementSeller requirementSeller = requirementSellerDao.getRequirementSellerByZohoDocId(documentId);
        if(requirementSeller!=null) {
        //Its NDA
	        List<Map<String, Object>> actions = (List<Map<String, Object>>) requests.get("actions");
	
	        Map<String, Object> action1 = actions.get(0);
	        
	        String action1SigningOrder = action1.get("signing_order").toString();
	    	String status1 = action1.get("action_status").toString();
	    	if(status1.equalsIgnoreCase("SIGNED")) {
	            if(action1SigningOrder.equalsIgnoreCase("1")) {
	            	requirementSeller.setIsBuyerSignedNda(true);
	            	requirementSeller.setIsShortlisted(true);
	            	buyerSignedNda(requirementSeller.getReqId(), requirementSeller);
	            } else {
	            	requirementSeller.setIsSellerSignedNda(true);
	            	if(requirementSeller.getSellerNdaSignedDate()==null) {
	            	requirementSeller.setSellerNdaSignedDate(new Date());
	            	}
	            	sellerSignedNda(requirementSeller.getReqId());
	            }
	    	}
	    	
	        Map<String, Object> action2 = actions.get(1);
	        
	        String action2SigningOrder = action2.get("signing_order").toString();
	    	String status2 = action2.get("action_status").toString();
	    	if(status2.equalsIgnoreCase("SIGNED")) {
	            if(action2SigningOrder.equalsIgnoreCase("2")) {
	            	if(requirementSeller.getSellerNdaSignedDate()==null) {
		            	requirementSeller.setSellerNdaSignedDate(new Date());
		            	}
	            	requirementSeller.setIsSellerSignedNda(true);
	            	sellerSignedNda(requirementSeller.getReqId());
	            } else {
	            	requirementSeller.setIsBuyerSignedNda(true);
	            	requirementSeller.setIsShortlisted(true);
	            	buyerSignedNda(requirementSeller.getReqId(), requirementSeller);
	            }
	    	}
	    	requirementSellerDao.update(requirementSeller);
        } else {
        	//Its Tripartite
        	Project project = projectDaoImpl.getProjectByZohoTripartiteDocId(documentId);
        	List<Map<String, Object>> actions = (List<Map<String, Object>>) requests.get("actions");
        	
	        Map<String, Object> action1 = actions.get(0);
	        
	        String action1SigningOrder = action1.get("signing_order").toString();
	    	String status1 = action1.get("action_status").toString();
	    	if(status1.equalsIgnoreCase("SIGNED")) {
	            if(action1SigningOrder.equalsIgnoreCase("1")) {
	            	project.setIsBuyerSignedTripartite(true);
	            } else {
	            	project.setIsSellerSignedTripartite(true);
	            	if(project.getSellerTripartiteSignedDate()==null) {
	            		project.setSellerTripartiteSignedDate(new Date());
	            	}
	            }
	            if(project.getIsSellerSignedTripartite() && project.getIsBuyerSignedTripartite()) {
        			adminNotificationWhenBothSignedTripart(project.getReqUniqueCode());
        		}
	    	}
	    	
	        Map<String, Object> action2 = actions.get(1);
	        
	        String action2SigningOrder = action2.get("signing_order").toString();
	    	String status2 = action2.get("action_status").toString();
	    	if(status2.equalsIgnoreCase("SIGNED")) {
	            if(action2SigningOrder.equalsIgnoreCase("2")) {
	            	if(project.getSellerTripartiteSignedDate()==null) {
	            		project.setSellerTripartiteSignedDate(new Date());
	            		if(project.getIsBuyerSignedTripartite()) {
	            			adminNotificationWhenBothSignedTripart(project.getReqUniqueCode());
	            		}
		            	}
	            	project.setIsSellerSignedTripartite(true);
	            } else {
	            	project.setIsBuyerSignedTripartite(true);
	            }
	            if(project.getIsSellerSignedTripartite() && project.getIsBuyerSignedTripartite()) {
        			adminNotificationWhenBothSignedTripart(project.getReqUniqueCode());
        		}
	    	}
	    	projectDaoImpl.update(project);
        }
	}
	
	private void adminNotificationWhenBothSignedTripart(String projectCode) {
		Notification notification = new Notification();
		notification.setAddedForAdmin(true);
		notification.setTitle("The buyer and seller have both signed the tripartite agreement for the project "+ projectCode);
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
	}
	
	private void buyerSignedNda(Integer reqId, RequirementSeller requirementSeller) {
		Requirement requirement = requirementDao.getRequirementById(reqId);
		if (requirement.getStatus().equals(RequirementStatus.RECOMMENDED_SELLER)) {
			RequirementTimeline requirementTimeline = requirementTimelineDao.getRequirementTimelineByReqId(reqId);
			requirementTimeline.setSellerShortlistedDate(new Date());
			requirementTimelineDao.update(requirementTimeline);
			requirement.setStatus(RequirementStatus.SELLER_SHORTLISTED);
			requirementDao.update(requirement);
		}
		Account account = accountDAO.getAccountByCompanyId(requirementSeller.getSellerCompanyId());
		//Create Notification
		Notification notification = new Notification();
		notification.setAddedFor(account.getUserId());
		notification.setTitle("A NDA document requires your signature for the project "+requirement.getRequirementNo());
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
	}
	
	private void sellerSignedNda(Integer reqId) {
		Requirement requirement = requirementDao.getRequirementById(reqId);
		if (requirement.getStatus().equals(RequirementStatus.SELLER_SHORTLISTED)) {
			RequirementTimeline requirementTimeline = requirementTimelineDao.getRequirementTimelineByReqId(reqId);
			requirementTimeline.setDiscussionInitiatedDate(new Date());
			requirementTimelineDao.update(requirementTimeline);
			requirement.setStatus(RequirementStatus.IN_DISCUSSION);
			requirementDao.update(requirement);
		}
		
		Account account = accountDAO.getAccountByCompanyId(requirement.getCompanyId());
		//Create Notification
		Notification notification = new Notification();
		notification.setAddedFor(account.getUserId());
		notification.setTitle("The seller has signed the NDA Document for your project "+requirement.getRequirementNo()+". Review the signed document within Cnerzy and proceed to the next steps.");
		notification.setCreatedOn(new Date());
		notification.setIsRead(false);
		notificationDao.save(notification);
	}
	
	@Override
	public String sendNdaForSign(ZohoDocSignModel ndaSignModel) throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        String accessToken = getAccessToken();
        String url = ZohoSignUrls.createAndSendDocForSign + environment.getProperty("zoho.nda.template_id") + "/createdocument";
        headers.add("Authorization", "Zoho-oauthtoken "+accessToken);
        Map<String,Object> requestBody = new HashMap<>();
        Map<String,Object> templates = new HashMap<>();
        List actions = new ArrayList<>();
        Map<String,Object> buyerActions = new HashMap<>();
        buyerActions.put("recipient_name", ndaSignModel.getBuyerName());
        buyerActions.put("recipient_email", ndaSignModel.getBuyerEmail());
        buyerActions.put("action_id", environment.getProperty("zoho.nda.buyer.action_id"));
        buyerActions.put("signing_order", 1);
        buyerActions.put("role", "Buyer");
        buyerActions.put("verify_recipient", false);
        actions.add(buyerActions);
        Map<String,Object> sellerActions = new HashMap<>();
        sellerActions.put("recipient_name", ndaSignModel.getSellerName());
        sellerActions.put("recipient_email", ndaSignModel.getSellerEmail());
        sellerActions.put("action_id", environment.getProperty("zoho.nda.seller.action_id"));
        sellerActions.put("signing_order", 2);
        sellerActions.put("role", "Seller");
        sellerActions.put("verify_recipient", false);
        actions.add(sellerActions);
        templates.put("actions", actions);
        requestBody.put("templates", templates);
        ObjectMapper objectMapper = new ObjectMapper();
        String data = objectMapper.writeValueAsString(requestBody);
        HttpEntity<String> entity = new HttpEntity<>(data, headers);
        ResponseEntity<SendZohoMailDTO> response = restTemplate.exchange(url, HttpMethod.POST, entity, SendZohoMailDTO.class);
        SendZohoMailDTO responseBody = response.getBody();
        return responseBody.getRequests().getDocumentIds().get(0).getDocumentId();
	}
	
	@Override
	public String sendTripartiteDocForSign(ZohoDocSignModel tripartiteSignModel) throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        String accessToken = getAccessToken();
        String url = ZohoSignUrls.createAndSendDocForSign + environment.getProperty("zoho.tripartite.template_id") + "/createdocument";
        headers.add("Authorization", "Zoho-oauthtoken "+accessToken);
        Map<String,Object> requestBody = new HashMap<>();
        Map<String,Object> templates = new HashMap<>();
        Map<String,Object> field_data = new HashMap<>();
        Map<String,Object> field_text_data = new HashMap<>();
        Date now = new Date();
        field_text_data.put("Date", now.getDate()+"/"+now.getMonth()+"/"+now.getYear());
        field_data.put("field_text_data", field_text_data);
        templates.put("field_data", field_data);
        List actions = new ArrayList<>();
        Map<String,Object> buyerActions = new HashMap<>();
        buyerActions.put("recipient_name", tripartiteSignModel.getBuyerName());
        buyerActions.put("recipient_email", tripartiteSignModel.getBuyerEmail());
        buyerActions.put("action_id", environment.getProperty("zoho.tripartite.buyer.action_id"));
        buyerActions.put("signing_order", 1);
        buyerActions.put("role", "Buyer");
        buyerActions.put("verify_recipient", false);
        actions.add(buyerActions);
        Map<String,Object> sellerActions = new HashMap<>();
        sellerActions.put("recipient_name", tripartiteSignModel.getSellerName());
        sellerActions.put("recipient_email", tripartiteSignModel.getSellerEmail());
        sellerActions.put("action_id", environment.getProperty("zoho.tripartite.seller.action_id"));
        sellerActions.put("signing_order", 2);
        sellerActions.put("role", "Seller");
        sellerActions.put("verify_recipient", false);
        actions.add(sellerActions);
        templates.put("actions", actions);
        requestBody.put("templates", templates);
        ObjectMapper objectMapper = new ObjectMapper();
        String data = objectMapper.writeValueAsString(requestBody);
        HttpEntity<String> entity = new HttpEntity<>(data, headers);
        ResponseEntity<SendZohoMailDTO> response = restTemplate.exchange(url, HttpMethod.POST, entity, SendZohoMailDTO.class);
        SendZohoMailDTO responseBody = response.getBody();
        return responseBody.getRequests().getDocumentIds().get(0).getDocumentId();
	}
	
}
