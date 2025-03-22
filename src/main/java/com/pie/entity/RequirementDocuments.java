package com.pie.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "requirement_documents")
public class RequirementDocuments {
	
		private Integer id;
		private Integer reqId;
		private String documentName;
		private String documentPath;
		private Date dateAdded;
		private String description;
		private Integer addedByCid;
		private Integer addedForCid;
		private	String addedBy;
		private Boolean isAddedByAdmin;
		private Boolean isAddedByPM;
		private String docFileSize;
		private String documentFileType;
		private String documentType;
		private String DocType;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "id")
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name = "req_id")
		public Integer getReqId() {
			return reqId;
		}
		public void setReqId(Integer reqId) {
			this.reqId = reqId;
		}
		
		@Column(name = "document_name")
		public String getDocumentName() {
			return documentName;
		}
		public void setDocumentName(String documentName) {
			this.documentName = documentName;
		}
		
		@Column(name = "document_path")
		public String getDocumentPath() {
			return documentPath;
		}
		public void setDocumentPath(String documentPath) {
			this.documentPath = documentPath;
		}
		
		@Temporal(TemporalType.TIMESTAMP)
		@Column(name = "date_added")
		public Date getDateAdded() {
			return dateAdded;
		}
		public void setDateAdded(Date dateAdded) {
			this.dateAdded = dateAdded;
		}
		
		@Column(name = "description")
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		
		@Column(name = "added_by_cid")
		public Integer getAddedByCid() {
			return addedByCid;
		}
		public void setAddedByCid(Integer addedByCid) {
			this.addedByCid = addedByCid;
		}
		
		@Column(name = "added_for_cid")
		public Integer getAddedForCid() {
			return addedForCid;
		}
		public void setAddedForCid(Integer addedForCid) {
			this.addedForCid = addedForCid;
		}
		@Column(name = "added_by")
		public String getAddedBy() {
			return addedBy;
		}
		public void setAddedBy(String addedBy) {
			this.addedBy = addedBy;
		}
		
		@Column(name = "doc_file_size")
		public String getDocFileSize() {
			return docFileSize;
		}
		public void setDocFileSize(String docFileSize) {
			this.docFileSize = docFileSize;
		}
		
		@Column(name = "document_file_type")
		public String getDocumentFileType() {
			return documentFileType;
		}
		public void setDocumentFileType(String documentFileType) {
			this.documentFileType = documentFileType;
		}
		
		@Column(name = "document_type")
		public String getDocumentType() {
			return documentType;
		}
		public void setDocumentType(String documentType) {
			this.documentType = documentType;
		}
		@Column(name = "is_added_by_admin")
		public Boolean getIsAddedByAdmin() {
			return isAddedByAdmin;
		}
		public void setIsAddedByAdmin(Boolean isAddedByAdmin) {
			this.isAddedByAdmin = isAddedByAdmin;
		}
		public Boolean getIsAddedByPM() {
			return isAddedByPM;
		}
		public void setIsAddedByPM(Boolean isAddedByPM) {
			this.isAddedByPM = isAddedByPM;
		}
		@Column(name = "file_type")
		public String getDocType() {
			return DocType;
		}
		public void setDocType(String docType) {
			DocType = docType;
		}
		
		
		
}
