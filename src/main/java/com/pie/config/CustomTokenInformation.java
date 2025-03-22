package com.pie.config;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.stereotype.Component;

import com.pie.dao.AccountDAO;
import com.pie.entity.Account;

@Component
public class CustomTokenInformation extends JwtAccessTokenConverter {

	@Autowired
	private AccountDAO accountDAO;

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
		if (authentication.getOAuth2Request().getGrantType().equalsIgnoreCase("password")) {
			UserDetails userDetails = (UserDetails) authentication.getPrincipal();
			Account account = accountDAO.findAccount(userDetails.getUsername());
			final Map<String, Object> additionalInfo = new HashMap<String, Object>();

//			additionalInfo.put("companyId", account.getCompany() != null ? account.getCompany().getCompanyId() : null);
			additionalInfo.put("accountId", account.getUserId());
			additionalInfo.put("firtName", account.getFirstName());
			 
			((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
		}
		accessToken = super.enhance(accessToken, authentication);
		((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(new HashMap<>());
		return accessToken;
	}
}
