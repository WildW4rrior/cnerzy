package com.pie.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "man_power" )
public class Man_Power {
		
		private Integer id;
		private Integer companyId;
		private Integer totalEmployees;
		private Integer supervisors;
		private Integer skilledWorkers;
		private Date date;
		private String addedBy;
		
		
		
		@Id
		@GeneratedValue(strategy = IDENTITY)
		@Column(name = "id")
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name = "total_employees")
		public Integer getTotalEmployees() {
			return totalEmployees;
		}
		public void setTotalEmployees(Integer totalEmployees) {
			this.totalEmployees = totalEmployees;
		}
		
		@Column(name = "total_supervisors")
		public Integer getSupervisors() {
			return supervisors;
		}
		public void setSupervisors(Integer supervisors) {
			this.supervisors = supervisors;
		}
		
		@Column(name = "total_skilledworkers")
		public Integer getSkilledWorkers() {
			return skilledWorkers;
		}
		public void setSkilledWorkers(Integer skilledWorkers) {
			this.skilledWorkers = skilledWorkers;
		}
		
		@Column(name = "date")
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		
		@Column(name = "added_by")
		public String getAddedBy() {
			return addedBy;
		}
		public void setAddedBy(String addedBy) {
			this.addedBy = addedBy;
		}
		@Column(name = "company_id")
		public Integer getCompanyId() {
			return companyId;
		}
		public void setCompanyId(Integer companyId) {
			this.companyId = companyId;
		}
		
		
		
		
		
}
