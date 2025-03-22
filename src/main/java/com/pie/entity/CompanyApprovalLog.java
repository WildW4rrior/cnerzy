package com.pie.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "company_approval_log")
public class CompanyApprovalLog {
	
	private Integer id;
	private String concernRaised;
	private String response;
	private String raisedBy;
	private String raisedOn;
	private Integer companyId;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "concern_raised")
	public String getConcernRaised() {
		return concernRaised;
	}
	public void setConcernRaised(String concernRaised) {
		this.concernRaised = concernRaised;
	}
	
	@Column(name = "response")
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	
	@Column(name = "raised_by")
	public String getRaisedBy() {
		return raisedBy;
	}
	public void setRaisedBy(String raisedBy) {
		this.raisedBy = raisedBy;
	}
	
	@Column(name = "raised_on")
	public String getRaisedOn() {
		return raisedOn;
	}
	public void setRaisedOn(String raisedOn) {
		this.raisedOn = raisedOn;
	}
	
	@Column(name = "company_id") //not a FK
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}


	
}
