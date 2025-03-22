package com.pie.config.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.pie.config.ConfigService;

@Service
public class ConfigServerImpl implements ConfigService {

	@Autowired
	private Environment env;

	@Override
	public String getAuthorizationServerUser() {
		return env.getProperty("username.for.access.token");
	}

	@Override
	public String getAuthorizationServerPassword() {
		return env.getProperty("password.for.access.token");
	}

	@Override
	public String getJwtFileAlias() {
		return env.getProperty("alias.for.jwt.token");
	}

	@Override
	public String getJwtTokenFilePath() {
		return env.getProperty("file.path.for.jwt.token");
	}

	@Override
	public char[] getJwtTokenFilePassword() {
		return env.getProperty("password.for.jwt.token.file").toCharArray();
	}

	@Override
	public String getLoginMessage() {
		StringBuilder loginMessage = new StringBuilder(
				"An email has been sent to your registered email id. Please verify your email to enable your account. If you have not received the email, Please call us at "
						+ env.getProperty("customer.care.number") + " or email at "
						+ env.getProperty("customer.care.email"));
		return loginMessage.toString();
	}
	
	@Override
	public String getGoogleRedirectURL() {
		return env.getProperty("google.redirect.url");
	}
	
	@Override
	public String getGoogleClientId() {
		return env.getProperty("google.client.id");
	}
	
	@Override
	public String getGoogleSecretKey() {
		return env.getProperty("google.client.secret");
	}
		
	@Override
	public String getGoogleApiUrl() {
		return env.getProperty("google.api.url");
	}

}
