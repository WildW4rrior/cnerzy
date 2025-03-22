package com.pie.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class EnvironmentUtil {

	@Autowired
	private Environment env;

	public String getEnvironment() {
		if (Integer.parseInt(env.getProperty("envFrom")) == 0) {
			return env.getProperty("local.url");
		}
		return env.getProperty("prod.url");
	}
	
	public String getValueFromProperty(String key) {
		return env.getProperty(key);
	}
	
	

}
