package com.pie.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import javax.mail.MessagingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.pie.dao.AccountDAO;
import com.pie.dao.VerificationTokenDao;
import com.pie.email.EmailBody;
import com.pie.entity.Account;
import com.pie.entity.VerificationToken;
import com.pie.util.EmailSender;

@Service
public class VerificationTokenServiceImpl implements VerificationTokenService {
	
	private static final Logger logger = LoggerFactory.getLogger(VerificationTokenServiceImpl.class);

	
		@Autowired
		private AccountDAO accountDAO;

		@Autowired
		private VerificationTokenDao verificationTokenDao;
		
		@Autowired
		private EmailSender emailSender;
		
		@Autowired
		private Environment env;

		@Async
		@Override
		public void sendVerificationToken(String verificationToken, Account account, boolean isEmailUpdate) {
			logger.info("Sending Verification Email to :"+ account.getEmailId());
			try {
					Boolean prodEnv = Integer.parseInt(env.getProperty("envFrom")) == 1;
					//Local
					String verificationUrl = (prodEnv ? env.getProperty("prod.url"): env.getProperty("local.url")) + "verifyToken?token="+verificationToken;
					//Staging
					//String verificationUrl = env.getProperty("prod.url") + "verifyToken?token="+verificationToken;
					List<String> linesList = new ArrayList<>();	
					String line1;
					if (isEmailUpdate) {
					    // Message for email update
					    line1 = "Your email has been updated successfully. Please verify your new email address.";
					} else {
					    // Message for new account creation
					    line1 = "Thank you for your interest in Cnerzy! We've received your application and your account has been successfully created.";
					}
					String line2 = "<a href='" + verificationUrl + "'>Verify Account</a>";
					linesList.add(line1);
					linesList.add(line2);
					String subject = "Verify Your Cnerzy Account";
					try {
						emailSender.sendEmail(subject,
								EmailBody.generateHtmlEmail(account.getFullName(), linesList), new String[] { account.getEmailId() }, null,
								null, "Cnerzy", null);
						logger.info("sent account Verification email to" + account.getEmailId());
					} catch (MessagingException e) {
						e.printStackTrace();
					}	
					
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		@Override
		public boolean registerVerificationToken(Account account, boolean isEmailUpdate) {
		    boolean tokenSaved = false;
		    int maxAttempts = 2; // Maximum number of attempts to save the token
		    
		    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
		        String verificationToken = generateVerificationToken();
		        VerificationToken token;
		        if (isEmailUpdate) {
		            token = verificationTokenDao.findByAccountId(account.getUserId());
		            if (token == null) {
		                token = new VerificationToken();
		                token.setAccountId(account);
		            }
		        } else {
		            token = new VerificationToken();
		            token.setAccountId(account);
		        }
		        try {
		        	token.setToken(verificationToken);
		            verificationTokenDao.save(token);
		            tokenSaved = true;
		            sendVerificationToken(verificationToken, account,isEmailUpdate);
		            break; // Exit the loop if the token is saved successfully
		        } catch (DataIntegrityViolationException e) {
		            // Handle duplicate token exception
		            if (attempt < maxAttempts) {
		                // If it's not the last attempt, generate a new token and retry
		                continue;
		            } else {
		               break;
		            }
		        }
		    }

		    return tokenSaved;
		}

		@Override
		public String generateVerificationToken() {
			SecureRandom secureRandom = new SecureRandom();
			byte[] bytes = new byte[32];
			secureRandom.nextBytes(bytes);
		    // Use Base64 encoding for URL-safe representation
		    return Base64.getUrlEncoder().encodeToString(bytes);
		}

		@Override
		public HashMap<String, String> verifyToken(String token) {
			HashMap<String, String> response = new HashMap<String, String>();
			response.put("status", "false");
			VerificationToken verificationToken = verificationTokenDao.getByVerificationToken(token);
			  if (verificationToken == null) {
			   response.put("message", "Invalid Verification Url.");
			   return response;
			  }
			  Account account = verificationToken.getAccountId();
			  response.put("status", "true");
			  if (account.isEmailVerified()) {
				  response.put("message", "User Already Verified.");
				   return response;
			  }
			  accountDAO.updateAccountEmailVerified(account);
			  response.put("message", "Email Verified Successfully");
			   return response;
			
		}

}
