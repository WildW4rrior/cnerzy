package com.pie.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "company_documents")
public class CompanyDocument {
		private Integer id;
		private Company company;
		private String docName;
		private String docPath;
		private Date date;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="id", unique = true, nullable = false)
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name = "doc_name")
		public String getDocName() {
			return docName;
		}
		public void setDocName(String docName) {
			this.docName = docName;
		}
		
		@Column(name = "doc_path")
		public String getDocPath() {
			return docPath;
		}
		public void setDocPath(String docPath) {
			this.docPath = docPath;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "date")
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "company_id", nullable = false)
		@JsonIgnore
		public Company getCompany() {
			return company;
		}

		public void setCompany(Company company) {
			this.company = company;
		}
		
}
