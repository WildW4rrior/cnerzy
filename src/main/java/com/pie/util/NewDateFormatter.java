package com.pie.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class NewDateFormatter {
	
	public Date parseStringDate(String dateString) throws ParseException {
		   String[] acceptableFormats = {"yyyy-MM-dd", "dd/MM/yyyy"};

		    for (String format : acceptableFormats) {
		        try {
		            SimpleDateFormat inputFormat = new SimpleDateFormat(format);
	                inputFormat.setLenient(false);

	                // Parse the input date string
	                Date parsedDate = inputFormat.parse(dateString);

	                // Format the parsed date in "dd/MM/yyyy" before returning
	                SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
	                return outputFormat.parse(outputFormat.format(parsedDate));
		        } catch (ParseException e) {
		        }
		    }
	    throw new ParseException("Invalid date format. Expected 'yyyy-MM-dd' ", 0);
	}

	public String getStringFormattedDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		return dateFormat.format(date);
	}
	
	public String getStringFormattedWordDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yy");
		return dateFormat.format(date);
	}
	
	public String getStringFormattedDateINYYYYmmDDHyphen(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
		return dateFormat.format(date);
	}
	
	 public String getRelativeTime(Date date) {
	        LocalDateTime now = LocalDateTime.now();
	        LocalDateTime dateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());

	        Duration duration = Duration.between(dateTime, now);

	        if (duration.toDays() > 1) {
	            return duration.toDays() + " days ago";
	        } else if (duration.toDays() == 1) {
	            return "yesterday";
	        } else if (duration.toHours() > 1) {
	            return "few hours ago";
	        } else if (duration.toHours() == 1) {
	            return "an hour ago";
	        } else if (duration.toMinutes() > 1) {
	            return "few minutes ago";
	        } else if (duration.toMinutes() == 1) {
	            return "a minute ago";
	        } else {
	            return "just now";
	        }
	    }

}
