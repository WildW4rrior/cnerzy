package com.pie.util;

import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.Period;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;



public class DateUtil {

//	public static Date convert(String dateString, String format) throws ParseException {
//		Date date = new SimpleDateFormat(format).parse(dateString);
//		return date;
//	}
	
	public static HashMap<String, String> getFinancialYear() {
		LocalDate today = LocalDate.now();
        int year = today.getYear();
        int month = today.getMonthValue();
        int financialYear = (month > 3) ? year : year - 1;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fromDate = LocalDate.of(financialYear, 4, 1);
        LocalDate toDate = LocalDate.of(financialYear + 1, 3, 31);
        String formattedFromDate = fromDate.format(formatter);
        String formattedToDate = toDate.format(formatter);
        
        HashMap<String, String> dateMap = new HashMap<>();
        dateMap.put("fromDate", formattedFromDate);
        dateMap.put("toDate", formattedToDate);
        
        return dateMap;
	}

	public static ZonedDateTime getZonedTimeNow() {
		
		return null;
	}
	
	public static Date convert(String dateStr) {
		return convert(dateStr, Constants.DATE_FORMAT_YYYY_MM_DD);
	}
	
	public static Date convert(String dateStr, String format) {
		if(dateStr == null || dateStr.isEmpty())
			return null;
		SimpleDateFormat sf = new SimpleDateFormat(format);
		if (!dateStr.isEmpty()) {
			try {
				return sf.parse(dateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static String convertDateToString(Date date) {
		return getDateString(date, Constants.DATE_FORMAT_YYYY_MM_DD);
	}

	public static String convertDateToStringWithTime(Date date) {
		return getDateString(date, Constants.DATE_TIME_FORMAT_YYYY_MM_DD_HH_mm_ss);
	}
	
	public static String getDateString(Date date, String format) {
		if(date == null)
			return null;
		DateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
	}

	public static LocalDate convert(Date date) {
		Date safeDate = new Date(date.getTime());
		return safeDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	}

	public static String getTodaysDateString() {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	public static String getTodaysDateString(Date strDate) {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);		
		return dateFormat.format(strDate);
	}
	
	public static String getFirstDateOfMonth(Date date) {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
        return dateFormat.format(cal.getTime());
    }
	
	public static String getFirstDateOfMonth(String monthYear) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(Constants.DATE_FORMAT_DD_MM_YYYY_HYPHON);		
		Integer year = null;
		Integer month = null;
		if(monthYear.length()==5) {
			year = Integer.parseInt(monthYear.substring(1));
			month = Integer.parseInt(String.valueOf(monthYear.charAt(0)));
		}else {
			year = Integer.parseInt(monthYear.substring(2));
			month = Integer.parseInt(monthYear.substring(0, 2));
		}
		if(month>12) {
			System.out.println("Month is greater than 12");
			return null;			
		}
		String date = formatter.format(LocalDate.of(year, month, 1));		
		return date;		
    }

	public static String getLastDateOfMonth(Date date) {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        return dateFormat.format(cal.getTime());
    }

	public static String getFirstDateOfQuarter(Date date) {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    cal.set(Calendar.MONTH, cal.get(Calendar.MONTH)/3 * 3);
	    cal.set(Calendar.DAY_OF_MONTH, 1);
	    return dateFormat.format(cal.getTime());
	}

	public static String getLastDateOfQuarter(Date date) {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    cal.set(Calendar.MONTH, cal.get(Calendar.MONTH)/3 * 3 + 2);
	    cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
	    return dateFormat.format(cal.getTime());
	}

	public static List<Date> getDaysBetweenDates(Date startdate, Date enddate)
	{
	    List<Date> dates = new ArrayList<Date>();
	    Calendar calendar = new GregorianCalendar();
	    calendar.setTime(startdate);

	    while (calendar.getTime().before(enddate))
	    {
	        Date result = calendar.getTime();
	        dates.add(result);
	        calendar.add(Calendar.DATE, 1);
	    }
	    return dates;
	}

	public static List<LocalDate> getAllDatesInRange(LocalDate startDate, LocalDate endDate) {
		long numOfDays = ChronoUnit.DAYS.between(startDate, endDate); 
		List<LocalDate> daysRange = Stream.iterate(startDate, date -> date.plusDays(1)).limit(numOfDays)
				.collect(Collectors.toList());
		return daysRange;
	}

	public static List<LocalDate> getAllDatesInRange(String startDateStr, String endDateStr) {
		LocalDate startDate = LocalDate.parse(startDateStr);
		LocalDate endDate = LocalDate.parse(endDateStr);

		long numOfDays = ChronoUnit.DAYS.between(startDate, endDate) + 1; 
		List<LocalDate> daysRange = Stream.iterate(startDate, date -> date.plusDays(1)).limit(numOfDays)
				.collect(Collectors.toList());
		return daysRange;

	}
	
	
	public static String getFirstDateOfYear(Date date) {		
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.MONTH, Month.APRIL.getValue()-1);
	    cal.set(Calendar.DAY_OF_MONTH, 1);
	    cal.set(Calendar.YEAR, (1900 + date.getYear()-1));
	    System.out.println(cal.getTime());
	    return dateFormat.format(cal.getTime());
	}

	public static String getLastDateOfYear(Date date) {
		DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT_YYYY_MM_DD);
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.MONTH, Month.MARCH.getValue()-1);
	    cal.set(Calendar.DAY_OF_MONTH, 31);
	    cal.set(Calendar.YEAR, 1900 + date.getYear());
	    return dateFormat.format(cal.getTime());
	}
	
	
	public static String getMonth(int month) {
		
	        String monthString;
	        switch (month) {
	            case 0:  monthString = "Jan";
	                     break;
	            case 1:  monthString = "Feb";
	                     break;
	            case 2:  monthString = "Mar";
	                     break;
	            case 3:  monthString = "Apr";
	                     break;
	            case 4:  monthString = "May";
	                     break;
	            case 5:  monthString = "Jun";
	                     break;
	            case 6:  monthString = "Jul";
	                     break;
	            case 7:  monthString = "Aug";
	                     break;
	            case 8:  monthString = "Sep";
	                     break;
	            case 9: monthString = "Oct";
	                     break;
	            case 10: monthString = "Nov";
	                     break;
	            case 11: monthString = "Dec";
	                     break;
	            default: monthString = "Invalid month";
	                     break;
	        }
	        //System.out.println(monthString);
	        
		return monthString;
		
		
	}

	public static String getFirstDateOfLastMonth() {
		LocalDate now = LocalDate.now();
		LocalDate lastMonth = now.minusMonths(1);
		Date lastMonthDate = convert(lastMonth);
		return getFirstDateOfMonth(lastMonthDate);
    }

	private static Date convert(LocalDate date) {
		return Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());
	}

	public static String getLastDateOfLastMonth() 
	{LocalDate now = LocalDate.now();
	LocalDate lastMonth = now.minusMonths(1);
	Date lastMonthDate = convert(lastMonth);
	return getLastDateOfMonth(lastMonthDate);}
	
	
	public static Date getDateByBeforeDays(Integer days) {
		LocalDate now = LocalDate.now();
		LocalDate lastMonth = now.minusDays(days);
		Date lastMonthDate = convert(lastMonth);
		return lastMonthDate;
    }
	
	public static boolean checkDatePresentInCurrentMonth(Date givenDate ) {
		    ZoneId timeZone = ZoneId.systemDefault(); // Use whichever time zone makes sense for your use case
		    LocalDateTime givenLocalDateTime = LocalDateTime.ofInstant(givenDate.toInstant(), timeZone);

		    YearMonth currentMonth = YearMonth.now(timeZone);

		    return currentMonth.equals(YearMonth.from(givenLocalDateTime));
		
	}

	public static boolean checkSummaryLastMonthAndCurrentDateIsGreaterThan14(LocalDate startDate, int days ) {
		return checkSummaryLastMonthAndCurrentDateIsGreaterThan14(convert(startDate), days);
	}
	
	public static boolean checkSummaryLastMonthAndCurrentDateIsGreaterThan14(Date startDate, int days) {
		ZoneId timeZone = ZoneId.systemDefault();
		LocalDate lastMonth = LocalDate.now().minusMonths(1);
		LocalDateTime givenLocalDateTime = LocalDateTime.ofInstant(startDate.toInstant(), timeZone);
		if(lastMonth.getMonth() == givenLocalDateTime.getMonth()) {
			LocalDate currentDate = LocalDate.now();
			LocalDate localDate = LocalDate.of(currentDate.getYear(), currentDate.getMonth(),days);
			
			if(currentDate.isBefore(localDate)) {
				return true;
			}
		}
		return false;
	}
	
	public static void main(String[] args)  {
		LocalDate localDate = convert(new Date());
		System.out.println(localDate);
		
		String dateBeforeString = "2020-05-24";
//		String dateBeforeString2 = "07/05/2020";
		
		String dateAfterString = "2020-07-29";
			
		//Parsing the date
		LocalDate dateBeforeStr = LocalDate.parse(dateBeforeString);
//		LocalDate dateBeforeStr2 = LocalDate.parse(dateBeforeString2);
		LocalDate dateAfterStr = LocalDate.parse(dateAfterString);
		LocalDate startDate = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate endDate = new Date().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		 //24-May-2017, change this to your desired Start Date
		LocalDate dateBefore = LocalDate.of(2020, Month.MAY, 24);
	        //29-July-2017, change this to your desired End Date
		LocalDate dateAfter = LocalDate.of(2020, Month.JULY, 29);
		getAllDatesInRange(dateBefore,dateAfter);
		
	}

	public static Integer getCurrentYear() {
		return LocalDate.now().getYear();
	}

	public static Date addHourToDate(Date date, Integer hours) {
		Calendar cal = Calendar.getInstance(); // creates calendar
		cal.setTime(date);               // sets calendar time/date
		cal.add(Calendar.HOUR_OF_DAY, hours);      // adds one hour
		return cal.getTime();    
	}
	
	public static String convertStringToMonthYear(String date) {			
		LocalDate startDate = LocalDate.parse(date);		
		StringBuilder retPeriod = new StringBuilder();
		if(startDate.getMonthValue() < 10) {
			retPeriod.append("0" + startDate.getMonthValue());
		} else {
			retPeriod.append(startDate.getMonthValue());
		}
		retPeriod.append(startDate.getYear());
		return retPeriod.toString();		
	}
	
	public static String convertDateToMonthYear(Date date) {
        LocalDate localDate = new Date(date.getTime()).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy, MMM");
        String outputDate = localDate.format(outputFormatter);
	    return (outputDate.toUpperCase());
	}
	
	public static String removeTimeFromDate(Date date) {
	    String df = DateFormat.getDateInstance().format(date);
	    return df;
	}
	
	public static Date createDate(Integer day, Integer month, Integer year) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = year.toString()+"-"+month.toString()+"-"+day.toString();
		try {
			Date date = format.parse(dateString);
			return date;
		} catch (ParseException e) {			 
			e.printStackTrace();
			return null;
		}		
	}
	
	public static Integer getDaysBetweenTwoDates(Date startDate, Date endDate) {
		LocalDate startDateLocal = convert(startDate);
		LocalDate endDateLocal = convert(endDate);

		long p2 = ChronoUnit.DAYS.between(startDateLocal, endDateLocal);
		
		return (int) p2;
	}
	
	public static Long getNumberOfDaysBetweenTwoDates(Date startDate,Date endDate) {
		LocalDateTime start = Instant.ofEpochMilli(startDate.getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime();
		LocalDateTime end = Instant.ofEpochMilli(endDate.getTime()).atZone(ZoneId.systemDefault()).toLocalDateTime();
		long diffInDays = ChronoUnit.DAYS.between(start, end);
		return diffInDays;
	}
	
	
	public static Date getDateBeforeOneWeek() {					    
	    Date oneWeekBeforeDate = DateUtils.addDays(new Date(), -7);
	    return oneWeekBeforeDate;
	}
	
	public static Date convertPeriodIntoDate(String datePeriod, String dateFormatYYYYMMDD) {	
		try {
			String[] parts = datePeriod.split(", ");
			String yearStr = parts[0];
	        String monthStr = parts[1];
	
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy, MMM");
	        SimpleDateFormat outputFormat = new SimpleDateFormat(dateFormatYYYYMMDD);
	        
	        Date date = null;
	        Date formattedDate = null;
			date = dateFormat.parse(yearStr + ", " + monthStr);
			String formattedDateStr = outputFormat.format(date);
			formattedDate = outputFormat.parse(formattedDateStr);
			
			 return formattedDate;
		} catch (Exception e) {
			e.printStackTrace();
			return convert(datePeriod, dateFormatYYYYMMDD);
		}
		
	}
	
	public static Integer getNumberOfDaysBetweenTwoStringDates(String startDate, String endDate) {
		Date date1 = convert(startDate);
		Date date2 = convert(endDate);
		return getNumberOfDaysBetweenTwoDates(date1, date2).intValue();
	}
	
	public static String addDaysToDate(Date date, Integer days) {
		LocalDate newDate = convert(date).plusDays(days);
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = newDate.format(dateFormat);
        return formattedDate;
	}
}