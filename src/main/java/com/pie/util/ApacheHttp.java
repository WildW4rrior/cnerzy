package com.pie.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONObject;

public class ApacheHttp {	

	public static JSONObject getForURL(String url, String token) {
		try {
			StringBuilder responseBuilder = new StringBuilder();
			String line = null;
			CloseableHttpClient httpclient = HttpClients.createDefault();
			HttpGet httpget = new HttpGet(url + token);
			HttpResponse httpresponse = httpclient.execute(httpget);
			if (httpresponse.getEntity().getContentLength() == 0) {// Will not come in it
				throw new RuntimeException("User not with Google");
			} else {
				BufferedReader reader = new BufferedReader(new InputStreamReader(httpresponse.getEntity().getContent()),
						65728);
				while ((line = reader.readLine()) != null) {
					responseBuilder.append(line);
				}
				return new JSONObject(responseBuilder.toString());
			}
		} catch (Exception ex) {
			throw new RuntimeException("Not able to connect Google.");
		}
	}
}
