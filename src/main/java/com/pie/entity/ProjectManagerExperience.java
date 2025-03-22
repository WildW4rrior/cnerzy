package com.pie.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "project_manager_experience")
public class ProjectManagerExperience {
	
	

	private Integer id;
	private Integer NoOfProjectHandled;
	private String description;	
	private Integer projectsComplexity;
	private Integer companyId;
	private Integer accountId;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	@Column(name = "account_id")
	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	@Column(name = "no_of_project_handled")
	public Integer getNoOfProjectHandled() {
		return NoOfProjectHandled;
	}

	public void setNoOfProjectHandled(Integer noOfProjectHandled) {
		NoOfProjectHandled = noOfProjectHandled;
	}

	@Column(name = "project_complexity")
	public Integer getProjectsComplexity() {
		return projectsComplexity;
	}

	public void setProjectsComplexity(Integer projectsComplexity) {
		this.projectsComplexity = projectsComplexity;
	}

	@Column(name = "company_id")
	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}


}
