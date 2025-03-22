package com.pie.service;

import java.io.IOException;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.pie.model.ZohoDocSignModel;

public interface ZohoSignService {
	public String getAccessToken();

	String sendNdaForSign(ZohoDocSignModel ndaSignModel) throws JsonProcessingException;

	void handleWebhookResponse(Object response) throws JsonParseException, JsonMappingException, IOException;

	public String sendTripartiteDocForSign(ZohoDocSignModel tripartiteSignModel) throws JsonProcessingException;
}
