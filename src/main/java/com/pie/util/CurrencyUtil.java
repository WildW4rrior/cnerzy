package com.pie.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class CurrencyUtil {
	
	public static String INR = "INR";
	public static String USD = "USD";
	public static String AUD = "AUD";
	public static String EURO = "EUR";
	public static String GBP = "GBP";
	public static String AED = "AED";
	
	public static String convertToWords(BigDecimal num, String currency) {
		return convertToWords(num.toString(), currency);
	}

	public static String convertToWords(String num, String currency) {
		BigDecimal bd = new BigDecimal(num);
		long number = bd.longValue();
		long no = bd.longValue();
		int decimal = (int) (bd.remainder(BigDecimal.ONE).doubleValue() * 100);
		int digits_length = String.valueOf(no).length();
		int i = 0;
		ArrayList<String> str = new ArrayList<>();
		HashMap<Integer, String> words = new HashMap<>();
		words.put(0, "");
		words.put(1, "One");
		words.put(2, "Two");
		words.put(3, "Three");
		words.put(4, "Four");
		words.put(5, "Five");
		words.put(6, "Six");
		words.put(7, "Seven");
		words.put(8, "Eight");
		words.put(9, "Nine");
		words.put(10, "Ten");
		words.put(11, "Eleven");
		words.put(12, "Twelve");
		words.put(13, "Thirteen");
		words.put(14, "Fourteen");
		words.put(15, "Fifteen");
		words.put(16, "Sixteen");
		words.put(17, "Seventeen");
		words.put(18, "Eighteen");
		words.put(19, "Nineteen");
		words.put(20, "Twenty");
		words.put(30, "Thirty");
		words.put(40, "Forty");
		words.put(50, "Fifty");
		words.put(60, "Sixty");
		words.put(70, "Seventy");
		words.put(80, "Eighty");
		words.put(90, "Ninety");
		String digits[] = { "", "Hundred", "Thousand", "Lakh", "Crore" };
		while (i < digits_length) {
			int divider = (i == 2) ? 10 : 100;
			number = no % divider;
			no = no / divider;
			i += divider == 10 ? 1 : 2;
			if (number > 0) {
				int counter = str.size();
				String plural = (counter > 0 && number > 9) ? "s" : "";
				String tmp = (number < 21) ? words.get(Integer.valueOf((int) number)) + " " + digits[counter] + plural
						: words.get(Integer.valueOf((int) Math.floor(number / 10) * 10)) + " "
								+ words.get(Integer.valueOf((int) (number % 10))) + " " + digits[counter] + plural;
				str.add(tmp);
			} else {
				str.add("");
			}
		}

		Collections.reverse(str);
		String Rupees = String.join(" ", str).trim();
		
		String hundredthValueInWords = null; 

		switch(currency) {
		case "USD" :
			hundredthValueInWords = " Cent ";
			break;
		case "AUD" :
			hundredthValueInWords = " Cent ";
			break;
		case "EUR" :
			hundredthValueInWords = " Cent ";
			break;
		case "GBP" :
			hundredthValueInWords = " Pence ";
			break;
		case "AED" :
			hundredthValueInWords = " Pils ";
			break;
		default :	
			hundredthValueInWords = " Paise ";
			break;
		}
		
		String paise = (decimal) > 0
				? " And " + words.get(Integer.valueOf((int) (decimal - decimal % 10))) + " "
						+ words.get(Integer.valueOf((int) (decimal % 10))) + hundredthValueInWords
				: "";
		return currency + " " + Rupees + paise + "Only";
	}
	
	public static List<String> getCurrencyList() {
		List<String> currency = new ArrayList<>();
		currency.add(INR);
		currency.add(USD);
		currency.add(AUD);
		currency.add(EURO);
		currency.add(GBP);
		currency.add(AED);
		return currency;
	}


	/**
	 * @param args the command line arguments
	 */
	public static String getCurrencyIcon(String currency) {
		if(currency.equalsIgnoreCase("INR")) {
			return "<i class=\"fas fa-rupee-sign\"></i>";
		}
		if(currency.equalsIgnoreCase("USD")) {
			return "<i class=\"fas fa-dollar-sign\"></i>";
		}		
		if(currency.equalsIgnoreCase("EUR")) {
			return "<i class=\"fas fa-euro-sign\"></i>";
		}
		if(currency.equalsIgnoreCase("AED")) {
			return "AED";
		}
		if(currency.equalsIgnoreCase("AUD")) {
			return "A <i class=\"fas fa-dollar-sign\"></i>";
		}
		return "<i class=\"fas fa-rupee-sign\"></i>"; 
	}

	
	public static BigDecimal convertAmountAccordingToCurrency(String value ,String fromCurrency , String toCurrency) {
		BigDecimal amount = new BigDecimal(value);			 	
		Map<String, Double> currencyMap = currencyRatesToInr();
		BigDecimal convertedCurrencyRate = new BigDecimal(currencyMap.get(fromCurrency))
				.divide(new BigDecimal(currencyMap.get(toCurrency)),4,RoundingMode.CEILING);		
		return amount.multiply(convertedCurrencyRate);		
	}
	
	public static double getNumberFromCurrency(String value) {
		if(value==null)
			return 0.0;
		try {
			return NumberFormat.getNumberInstance(java.util.Locale.ENGLISH).parse(value).doubleValue();
		} catch (ParseException e) {
			e.printStackTrace();
			return 0.0;
		}
	}
	
	private static Map<String,Double> currencyRatesToInr() {
		Map<String, Double> currencyMap = new HashMap<>();
		currencyMap.put(INR, 1.00);
		currencyMap.put(AED, 22.17);
		currencyMap.put(USD, 81.45);
		currencyMap.put(AUD, 57.93);
		currencyMap.put(GBP, 101.07);
		currencyMap.put(EURO, 88.70);
		return currencyMap;
	}
	
	public static void main(String[] args) {
//		System.out.println("56721351 = " + CurrencyUtil.convertToWords(new BigDecimal(56721351), CurrencyUtil.INR));
//		System.out.println("76521351.61 = " + CurrencyUtil.convertToWords("76521351.61", CurrencyUtil.INR));
		double value = getNumberFromCurrency(" 10,000.05");
		System.out.println(value);
		
	}
	

	
}