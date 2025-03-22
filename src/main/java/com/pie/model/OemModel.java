package com.pie.model;

import java.math.BigDecimal;

public class OemModel {
	
	private Integer id;
	private String supplyingTo;
	private String supplierSince;
	private BigDecimal value;
	private Integer vendorRating;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSupplyingTo() {
		return supplyingTo;
	}
	public void setSupplyingTo(String supplyingTo) {
		this.supplyingTo = supplyingTo;
	}
	public String getSupplierSince() {
		return supplierSince;
	}
	public void setSupplierSince(String supplierSince) {
		this.supplierSince = supplierSince;
	}
	public BigDecimal getValue() {
		return value;
	}
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	public Integer getVendorRating() {
		return vendorRating;
	}
	public void setVendorRating(Integer vendorRating) {
		this.vendorRating = vendorRating;
	}
	
	

}
