package com.pie.dto;

public class CustomError {
	private String message;
	private Type type;
	private String field;

	public enum Type {
		VALIDATION("Validation"), REPOSITORY("Repository"), BUSINESS("Business"), NETWORK("Network");

		String value;

		Type(String value) {
			this.value = value;
		}
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	@Override
	public String toString() {
		return "{\"message\":\"" + this.message + "\", \"type\":\"" + this.type + "\", \"field\":\"" + this.field + "\"}";
	}
}
