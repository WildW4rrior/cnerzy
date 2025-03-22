package com.pie.model;

import java.util.ArrayList;
import java.util.List;

public class FactoryModel {

	private Integer id;
	private String factoryName;
	private String area;
	private String address;
	private Integer totalEmployees;
	private Integer supervisiors;
	private Integer enggDegreeOrDiploma;
	private Integer skilledWorkers;
	private String designDepartment;
	private String qualityAndInspection;
	private List<FacilityModel> facilityList = new ArrayList<>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getTotalEmployees() {
		return totalEmployees;
	}

	public void setTotalEmployees(Integer totalEmployees) {
		this.totalEmployees = totalEmployees;
	}

	public Integer getSupervisiors() {
		return supervisiors;
	}

	public void setSupervisiors(Integer supervisiors) {
		this.supervisiors = supervisiors;
	}

	public Integer getEnggDegreeOrDiploma() {
		return enggDegreeOrDiploma;
	}

	public void setEnggDegreeOrDiploma(Integer enggDegreeOrDiploma) {
		this.enggDegreeOrDiploma = enggDegreeOrDiploma;
	}

	public Integer getSkilledWorkers() {
		return skilledWorkers;
	}

	public void setSkilledWorkers(Integer skilledWorkers) {
		this.skilledWorkers = skilledWorkers;
	}

	public String getDesignDepartment() {
		return designDepartment;
	}

	public void setDesignDepartment(String designDepartment) {
		this.designDepartment = designDepartment;
	}

	public String getQualityAndInspection() {
		return qualityAndInspection;
	}

	public void setQualityAndInspection(String qualityAndInspection) {
		this.qualityAndInspection = qualityAndInspection;
	}

	public List<FacilityModel> getFacilityList() {
		return facilityList;
	}

	public void setFacilityList(List<FacilityModel> facilityList) {
		this.facilityList = facilityList;
	}

}
