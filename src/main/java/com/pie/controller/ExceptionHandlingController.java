package com.pie.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionHandlingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionHandlingController.class);
	
	@ExceptionHandler(Exception.class)
    public String internalServerExpception(Model model, Exception e)   {
		e.printStackTrace();
		logger.error(e.getMessage(), e);
		if(e instanceof NoHandlerFoundException) {
			return "pageNotFound";
		}else {
			model.addAttribute("cause", "cause : "+ e.getClass().getCanonicalName());
	        return "internalServerError";
		}						
    }
}
