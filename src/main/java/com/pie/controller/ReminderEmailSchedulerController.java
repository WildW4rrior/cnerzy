package com.pie.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.pie.service.AccountService;


public class ReminderEmailSchedulerController {

	private static final Logger logger = LoggerFactory.getLogger(ReminderEmailSchedulerController.class);

	
	@Autowired
	private AccountService accountService;

	/*@Scheduled(cron = "0 0/1 * * * ?")*/ 
//	public void reminderEmailScheduler() {
//
//		List<Invoice> invoiceList = invoiceGeneratorService.getInvoiceListBasedOnPaymentStatus();
//        List<Company> toCompanyEmailList = new ArrayList<>();
//		for (Invoice invoice : invoiceList) {
//
//			Integer reminderDays = invoice.getReminderDays();
//
//			LocalDateTime localDate = LocalDateTime.from(invoice.getDateGeneration().toInstant()).plusDays(reminderDays);
//			Date finalDate = Date.from(localDate.atZone(ZoneId.systemDefault()).toInstant());
//
//			if (finalDate.getTime() < new Date().getTime()) {
//				Company company = accountService.getCompany(invoice.getToCompany().getCompanyId());
//				toCompanyEmailList.add(company);
//			}
//		}
//		
//		if(null!=toCompanyEmailList) {
//			try {
//				makePaymentService.sendReminderEmailForPayment(toCompanyEmailList);
//			} catch (MessagingException e) {
//				e.printStackTrace();
//			}
//			logger.info("Reminder Mail sent ");
//		}
//	}
}