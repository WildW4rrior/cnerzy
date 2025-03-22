package com.pie.util;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.pie.model.EmailFile;

@Component
public class EmailSender {

	private static final Logger LOGGER = LoggerFactory.getLogger(EmailSender.class);

	@Autowired
	private Environment env;

	@Autowired
	private EnvironmentUtil environmentUtil;
	
	/*
	 * @Autowired private Account account;
	 */
	@Async
	public void sendEmail(String subject, String body,String[] toAddresses, String[] ccAddresses,
			List<EmailFile> emailFiles ,String senderName,String replyTo) throws MessagingException {
		LOGGER.info("Inside sendEmail ,  from email id to :  {} cc :{} property : {} ",  toAddresses, ccAddresses,
				environmentUtil.getEnvironment());
		String host = env.getProperty("admin.host");
		String port = env.getProperty("admin.port");
		String mailFrom = env.getProperty("admin.emailId");					
		String password = env.getProperty("admin.password");
		sendHtmlEmail(host, port, mailFrom, password, subject, body, toAddresses, ccAddresses, emailFiles , senderName,replyTo);
		LOGGER.info("Email sent to {}. cc to {}.", toAddresses, ccAddresses);

	}
	
	private String[] validateEmailAddresses(String[] emailAddressesToBeValidate) {
		if (emailAddressesToBeValidate == null || emailAddressesToBeValidate.length < 1) {
			return null;
		}
		Set<String> emailAddressesValidated = new HashSet<>();

		String regex = "^(.+)@(.+)$";
		Pattern pattern = Pattern.compile(regex);
		for (String email : emailAddressesToBeValidate) {
			Matcher matcher = pattern.matcher(email);
			if (matcher.matches()) {
				emailAddressesValidated.add(email);
			} else {
				LOGGER.info("Wrong email address provided, hence removed: " + email);
			}
		}
		int size = emailAddressesValidated.size();
        String emails[] = new String[size];
		return emailAddressesValidated.toArray(emails);
	}

	private void sendHtmlEmail(String host, String port, final String mailFrom, final String password, String subject,
			String body, String[] toAddresses, String[] ccAddresses, List<EmailFile> emailFiles , String senderName, String replyTo )
			throws MessagingException {
		Properties properties = new Properties();
		
		//common properties for staging and prod 
//		properties.put("mail.smtp.user", mailFrom);
//		properties.put("mail.smtp.starttls.required", "true");
//		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.socketFactory.port", port);
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
//		properties.put("mail.debug", "true");
		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailFrom, password);
			}
		};

		javax.mail.Session session = javax.mail.Session.getInstance(properties, auth);

		// creates a new e-mail message
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(mailFrom ,senderName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] toAddressesVAlidated = validateEmailAddresses(toAddresses);
		String[] ccAddressesVAlidated = validateEmailAddresses(ccAddresses);
		if (null != toAddressesVAlidated && toAddressesVAlidated.length > 0) {
			InternetAddress[] toAddressesInet = new InternetAddress[toAddressesVAlidated.length];
			for (int i = 0; i < toAddressesVAlidated.length; i++) {
				if(null== toAddressesVAlidated[i] || "".equals(toAddressesVAlidated[i]) || "''".equals(toAddressesVAlidated[i]) || "``".equals(toAddressesVAlidated[i]) || "`".equals(toAddressesVAlidated[i]) || "'".equals(toAddressesVAlidated[i])) {
					continue;
				}
				toAddressesInet[i] = new InternetAddress(toAddressesVAlidated[i]);
			}
			if(toAddresses !=null )
				msg.addRecipients(Message.RecipientType.TO, toAddressesInet);
			if(!StringUtil.isNullOrEmpty(replyTo)) {
				InternetAddress[] replyToAddress = new InternetAddress[1];
				replyToAddress[0] = new InternetAddress(replyTo);
				msg.setReplyTo(replyToAddress);
			}
		}

		if (null != ccAddressesVAlidated && ccAddressesVAlidated.length > 0) {
			try {
				InternetAddress[] ccAddressesInet = new InternetAddress[ccAddressesVAlidated.length];
				for (int i = 0; i < ccAddressesVAlidated.length; i++) {
					if(null== ccAddressesVAlidated[i] || "".equals(ccAddressesVAlidated[i]) || "''".equals(ccAddressesVAlidated[i]) || "``".equals(ccAddressesVAlidated[i]) || "`".equals(ccAddressesVAlidated[i]) || "'".equals(ccAddressesVAlidated[i])) {
						continue;
					}
					ccAddressesInet[i] = new InternetAddress(ccAddressesVAlidated[i]);
				}
				if(checkNullAddress(ccAddressesInet))
					msg.addRecipients(Message.RecipientType.CC, ccAddressesInet);

			} catch (Exception e) {
				e.printStackTrace();
				LOGGER.error("Error setting up cc email address: {}", e.getMessage() );
			}
		}
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		if(emailFiles!=null && !emailFiles.isEmpty()) {
		    Multipart multipart = new MimeMultipart();
		    BodyPart messageBodyPart = new MimeBodyPart();
		    messageBodyPart.setContent(body, "text/html; charset=utf-8");
		    multipart.addBodyPart(messageBodyPart);
			for(EmailFile emailFile : emailFiles) {
		        messageBodyPart = new MimeBodyPart();
		        DataSource source = new FileDataSource(emailFile.getFilePath());
		        messageBodyPart.setDataHandler(new DataHandler(source));
		        messageBodyPart.setFileName(emailFile.getMailFileName());
		        multipart.addBodyPart(messageBodyPart);
			}
		    msg.setContent(multipart);
		}
		else {
			msg.setText(body, "UTF-8", "html");
		}
		
		try {
			Transport.send(msg);
		}catch (Exception e) {
			LOGGER.error(e.toString());
			e.printStackTrace();
		}		
	}

	private boolean checkNullAddress(InternetAddress[] ccAddressesInet) {
		if(ccAddressesInet !=null && ccAddressesInet.length > 0) {
			for(int i =0; i < ccAddressesInet.length ; i++) {
				if (ccAddressesInet[i] == null) {
					return false;
				}
			}
		}
		return true;
	}

}
