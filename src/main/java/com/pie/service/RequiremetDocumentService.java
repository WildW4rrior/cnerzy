package com.pie.service;

import java.util.HashMap;
import java.util.Map;

import com.pie.model.RequirementChatModel;

public interface RequiremetDocumentService {

	Map<String, Object> sendDocument(RequirementChatModel reqChatModel);

	Map<String, Object> getAllChat(RequirementChatModel reqChatModel);

	HashMap<String, Object> finalizeSellerForReqId(RequirementChatModel reqChatModel);

}
