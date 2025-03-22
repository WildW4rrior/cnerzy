package com.pie.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

import com.pie.util.Constants;

@Configuration
@EnableResourceServer
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {

	@Autowired
	private TokenStore tokenStore;

	@Override
	public void configure(ResourceServerSecurityConfigurer resources) {
		resources.resourceId(Constants.RESOURCE_ID).tokenStore(tokenStore);
	}

	@Override
	public void configure(HttpSecurity http) throws Exception {// Will convert access token to JSON for specified URL //
																// only.
		http.requestMatchers()
				.antMatchers("/getCompanyListM", "/saveCompanyM","/creaeSession", "/saveCompanyProfileM", "/invoiceGenM",
						"/downloadInvoiceM", "/sendInvoiceEmailM", "/previewInvoiceM", "/getToCompanyListM",
						"/getInvoiceListM", "/getToRecurringCompanyList", "/getRecurringInvoiceList",
						"/getInvoiceNumberListM", "/invoicePaymentM", "/resendInvoiceM", "/savePaymentM",
						"/getPaymentListM", "/getToCompanyPaymentListM", "/getRecievedInvoiceListM",
						"/getToCompanyRecievedInvoiceListM", "/saveInvoiceM", "/getCompleteProfileDetails", "/getCountofEveryMonthInvoicesM",
						"/getCountofEveryMonthpaymentsM", "/getCountofEveryMonthExpensesM", "/getInvoicesCompanyWiseM",
						"/getPaymentsCompanyWiseM", "/getExpensesCompanyWiseM", "/getQuotationsCompanyWiseM")
				.and().authorizeRequests().anyRequest().authenticated();
	}
}
