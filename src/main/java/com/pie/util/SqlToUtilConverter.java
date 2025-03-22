package com.pie.util;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SqlToUtilConverter {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SqlToUtilConverter.class);
	
	public static Date convertSqlToUtil(java.sql.Date sqlDate) {
		Date utilDate = new Date(sqlDate.getTime());
		LOGGER.info("Converted value of java.util.Date : " + utilDate);
		return utilDate;
	}

}
