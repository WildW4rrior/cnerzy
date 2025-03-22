package com.pie.model;

import java.math.BigDecimal;

public class AnnualTurnoverModel {
	
	private Integer id;
	private String financialYear;
	private BigDecimal turnover;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public BigDecimal getTurnover() {
		return turnover;
	}
	public void setTurnover(BigDecimal turnover) {
		this.turnover = turnover;
	}

	
	
}
