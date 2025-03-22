package com.pie.config;

public interface ConfigService {

	String getAuthorizationServerUser();

	String getJwtFileAlias();

	String getJwtTokenFilePath();

	char[] getJwtTokenFilePassword();

	String getAuthorizationServerPassword();

	String getLoginMessage();
	
	String getGoogleSecretKey();
	
	String getGoogleClientId();
	
	String getGoogleRedirectURL();

	String getGoogleApiUrl();
}
