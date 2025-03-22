package com.pie.util;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.pie.model.RegisterationBean;

public class FormValidator implements Validator {

	@Override
	public boolean supports(Class arg0) {
		return RegisterationBean.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors e) {
		ValidationUtils.rejectIfEmpty(e, "firstName", "firstName.empty");
		ValidationUtils.rejectIfEmpty(e, "lastName", "lastName.empty");
		ValidationUtils.rejectIfEmpty(e, "userName", "userName.empty");
		ValidationUtils.rejectIfEmpty(e, "password", "password.empty");
		ValidationUtils.rejectIfEmpty(e, "confirmPassword", "confirmPassword.empty");

		RegisterationBean user = (RegisterationBean) obj;
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			e.rejectValue("confirmPassword", "confirmPassword.notequal");
		}
	}

}