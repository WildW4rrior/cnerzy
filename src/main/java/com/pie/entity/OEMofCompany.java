package com.pie.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "oem_of_Company" )
public class OEMofCompany {

	
	private Integer id;
	private Integer companyId;
	private String supplyingTo;
	private BigDecimal value;
	private Integer vendorRating;
	private String supplierSince;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Min(value = 1)
	@Column(name = "vendor_rating")
	public Integer getVendorRating() {
		return vendorRating;
	}
	public void setVendorRating(Integer vendorRating) {
		this.vendorRating = vendorRating;
	}
	
	@Column(name = "company_id", nullable = false)
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
	@Column(name = "supplying_to")
	public String getSupplyingTo() {
		return supplyingTo;
	}
	public void setSupplyingTo(String supplyingTo) {
		this.supplyingTo = supplyingTo;
	}
	
	@Column(name = "value")
	public BigDecimal getValue() {
		return value;
	}
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	
	@Column(name = "supplier_since")
	public String getSupplierSince() {
		return supplierSince;
	}
	public void setSupplierSince(String supplierSince) {
		this.supplierSince = supplierSince;
	}
	
	
	
}
