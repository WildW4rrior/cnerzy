package com.pie.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class StringUtil {

	public static boolean isNullOrEmpty(String str) {
        if(str != null && !str.trim().isEmpty())
            return false;
        return true;
    }
	
	public static boolean isNullOrEmpty(Integer val) {
        if(val != null && !val.equals("") && val != 0)
            return false;
        return true;
    }
	
	public static Boolean convertStringToBoolean(String val) {
		return Boolean.valueOf(val);
	}
	
	public static String convertEmptyStringToNull(String val) {
		if(isNullOrEmpty(val)) {
			return null;
		}
		return val;
	}
	public static String getFullName(String firstName, String lastName) {
        if (firstName == null || firstName.trim().isEmpty()) {
            return lastName;
        }
        if (lastName == null || lastName.trim().isEmpty()) {
            return firstName;
        }
        return firstName.trim() + " " + lastName.trim();
    }
	
	public static List<String> convertPipeSeparatedStringToList(String nameString) {
        if (nameString == null || nameString.isEmpty()) {
            return Collections.emptyList();
        }
        return Arrays.asList(nameString.split("\\|"));
    }

    public static String convertListToPipeSeparatedString(List<String> names) {
        if (names == null || names.isEmpty()) {
            return "";
        }
        return String.join("|", names);
    }
}
