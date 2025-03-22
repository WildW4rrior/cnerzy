package com.pie.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "factory")
public class Factory {

	private Integer id;
	private Integer companyId;
	private String address;
	private String name;
	private String area;
	private Integer totalEmployees;
	private Integer supervisiors;
	private Integer enggDegreeOrDiploma;
	private Integer skilledWorkers;
	private String designDepartment;
	private String qualityAndInspection;
	private List<Facility> facilities = new ArrayList<>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "company_id")
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	
	@Column(name = "address")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "area")
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	@Column(name = "total_employee")
	public Integer getTotalEmployees() {
		return totalEmployees;
	}
	public void setTotalEmployees(Integer totalEmployees) {
		this.totalEmployees = totalEmployees;
	}
	
	@Column(name = "supervisior")
	public Integer getSupervisiors() {
		return supervisiors;
	}
	public void setSupervisiors(Integer supervisiors) {
		this.supervisiors = supervisiors;
	}
	
	@Column(name = "engg_degree_diploma")
	public Integer getEnggDegreeOrDiploma() {
		return enggDegreeOrDiploma;
	}
	public void setEnggDegreeOrDiploma(Integer enggDegreeOrDiploma) {
		this.enggDegreeOrDiploma = enggDegreeOrDiploma;
	}
	
	@Column(name = "skilled_worker")
	public Integer getSkilledWorkers() {
		return skilledWorkers;
	}
	public void setSkilledWorkers(Integer skilledWorkers) {
		this.skilledWorkers = skilledWorkers;
	}
	
	@Column(name = "design_department")
	public String getDesignDepartment() {
		return designDepartment;
	}
	public void setDesignDepartment(String designDepartment) {
		this.designDepartment = designDepartment;
	}
	
	@Column(name = "quality_and_inspection")
	public String getQualityAndInspection() {
		return qualityAndInspection;
	}
	public void setQualityAndInspection(String qualityAndInspection) {
		this.qualityAndInspection = qualityAndInspection;
	}
	
	@OneToMany(mappedBy = "factory", cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
	public List<Facility> getFacilities() {
		return facilities;
	}
	
	public void setFacilities(List<Facility> facilities) {
		this.facilities = facilities;
	}
	
	
}
