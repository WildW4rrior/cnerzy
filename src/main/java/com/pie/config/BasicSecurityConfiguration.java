package com.pie.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.pie.authentication.CustomAuthenticationProvider;
import com.pie.authentication.MyDBAuthenticationService;

@Configuration
@EnableWebSecurity
@Order(1)
public class BasicSecurityConfiguration extends WebSecurityConfigurerAdapter {

	private static final Logger logger = LoggerFactory.getLogger(BasicSecurityConfiguration.class);

	@Autowired
	private JwtAuthenticationTokenFilter jwtauthFilter;

	@Autowired
	private MyDBAuthenticationService userDetailService;

	@Bean
	@Lazy
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public CustomAuthenticationProvider authenticationProvider() {
		CustomAuthenticationProvider authenticationProvider = new CustomAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userDetailService);
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		return authenticationProvider;
	}

	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Autowired
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/validateVoucher","/saveRegistrationM","/user/available");
	}

//	@Bean
//	@Autowired
//	public TokenStoreUserApprovalHandler userApprovalHandler(TokenStore tokenStore) {
//		TokenStoreUserApprovalHandler handler = new TokenStoreUserApprovalHandler();
//		handler.setTokenStore(tokenStore);
//		handler.setRequestFactory(new DefaultOAuth2RequestFactory(clientDetailsService));
//		handler.setClientDetailsService(clientDetailsService);
//		return handler;
//	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http.csrf().disable().anonymous().disable().authorizeRequests().antMatchers("/oauth/token").permitAll();
		http.csrf().disable().anonymous().disable().authorizeRequests().antMatchers("/favicon").permitAll();

		http.authorizeRequests().and().formLogin()// Submit URL of login page.
				.loginProcessingUrl("/j_spring_security_check").loginPage("/login").defaultSuccessUrl("/dashboard")
				.failureUrl("/login?error=true").usernameParameter("modifiedUserName").passwordParameter("password")
				.failureHandler((req, res, exp) -> {
					String email = (String) req.getAttribute("emailInput");
					logger.error("Login falied with user id {}", email);
					String errMsg = "";
					if (exp.getClass().isAssignableFrom(BadCredentialsException.class)) {
						errMsg = "Invalid username or password.";
					} else if (exp.getMessage() == null) {
						errMsg = "User has not been registered.";
					}else {
						if(exp.getMessage().equalsIgnoreCase("Incorrect User Type")) {
							errMsg=exp.getMessage();
						}
					else if(exp.getMessage().equalsIgnoreCase("User is disabled")) {
							errMsg = "Login Failed- " + "You have not activated your account yet by verifying your email. Please verify your email";									
						}else {
							errMsg = "Login Failed- " + exp.getMessage();
						}
					}
					
					req.getSession().setAttribute("message", errMsg);	
					if(	req.getParameter("type").equalsIgnoreCase("Admin")) {
						res.sendRedirect(req.getContextPath() + "/adminLogin");
					}else {
						res.sendRedirect(req.getContextPath() + "/login");
					}		
				}).and().logout().logoutUrl("/logout").logoutSuccessUrl("/login").and()
				.addFilterBefore(jwtauthFilter, UsernamePasswordAuthenticationFilter.class);
	}
}