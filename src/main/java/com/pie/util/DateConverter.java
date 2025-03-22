package com.pie.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.convert.converter.Converter;


public class DateConverter implements Converter<String, Date> {

	private static final Logger LOGGER = LoggerFactory.getLogger(DateConverter.class);

	@Override
	public Date convert(String source) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if (!source.isEmpty()) {
			try {
				return sf.parse(source);
			} catch (ParseException e) {
				LOGGER.error(e.getLocalizedMessage());
			}
		}
		return null;
	}
}