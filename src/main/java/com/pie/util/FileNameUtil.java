package com.pie.util;

import java.util.Calendar;

public class FileNameUtil {

	private FileNameUtil() {

	}

	public static String getInvoiceName(String path, String fromCompanyName, String toCompanyName, String invoiceNo) {		
		Calendar cal = Calendar.getInstance();
		StringBuilder invoiceFileName = new StringBuilder(path + "/");
		invoiceFileName.append(cleanFileName(getInitials(fromCompanyName)));
		invoiceFileName.append("_");
		invoiceFileName.append(cleanFileName(getInitials(toCompanyName)));
		invoiceFileName.append("_");
		invoiceFileName.append(cleanFileName(invoiceNo));
		invoiceFileName.append("_" + System.currentTimeMillis());
		invoiceFileName.append(".pdf");
		
		return invoiceFileName.toString();
	}

	private static String cleanFileName(String invoiceNo) {
		String newFileName = invoiceNo.replace( '\\', '_');
		newFileName = newFileName.replace( '/', '_');
		newFileName = newFileName.replace( '*', '_');
		newFileName = newFileName.replace( '?', '_');
		newFileName = newFileName.replace( ':', '_');
		newFileName = newFileName.replace( '|', '_');
		return newFileName;
	}

	private static String getInitials(String name) {
		name = name.replaceAll("\\s", "");
		return name.length() > 3 ? name.substring(0,3) : name;
	}
	
	public static String getPaymentChallanName(String path) {		
		Calendar cal = Calendar.getInstance();
		StringBuilder paymentChallanFileName = new StringBuilder(path + "/");
		paymentChallanFileName.append("Payment_challan");
//		paymentChallanFileName.append("_" + System.currentTimeMillis());
		paymentChallanFileName.append(".pdf");
		
		return paymentChallanFileName.toString();
	}

}
