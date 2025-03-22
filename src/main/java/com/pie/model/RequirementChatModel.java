package com.pie.model;

import org.springframework.web.multipart.MultipartFile;

public class RequirementChatModel {
	private Integer addedByCid;
	private Integer addedForCid;
	private Integer reqId;
	private String reqUniqueCode;
	private String addedBy; //Role
	private MultipartFile file;
	private String description;
	private String fileViaLink;
	private MultipartFile loiFile;
	private MultipartFile poFile;
	private String poLink;
	private String loiLink;
	private boolean isBuyerRejectMilestone;
	private boolean isSellerSubmitingWork;
	private Integer pmId;
	private String milestoneName;
	
	
	
	public String getReqUniqueCode() {
		return reqUniqueCode;
	}
	public void setReqUniqueCode(String reqUniqueCode) {
		this.reqUniqueCode = reqUniqueCode;
	}
	public MultipartFile getLoiFile() {
		return loiFile;
	}
	public void setLoiFile(MultipartFile loiFile) {
		this.loiFile = loiFile;
	}
	public MultipartFile getPoFile() {
		return poFile;
	}
	public void setPoFile(MultipartFile poFile) {
		this.poFile = poFile;
	}
	public String getPoLink() {
		return poLink;
	}
	public void setPoLink(String poLink) {
		this.poLink = poLink;
	}
	public String getLoiLink() {
		return loiLink;
	}
	public void setLoiLink(String loiLink) {
		this.loiLink = loiLink;
	}
	public Integer getAddedByCid() {
		return addedByCid;
	}
	public void setAddedByCid(Integer addedByCid) {
		this.addedByCid = addedByCid;
	}
	public Integer getAddedForCid() {
		return addedForCid;
	}
	public void setAddedForCid(Integer addedForCid) {
		this.addedForCid = addedForCid;
	}
	public Integer getReqId() {
		return reqId;
	}
	public void setReqId(Integer reqId) {
		this.reqId = reqId;
	}
	public String getAddedBy() {
		return addedBy;
	}
	public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFileViaLink() {
		return fileViaLink;
	}
	public void setFileViaLink(String fileViaLink) {
		this.fileViaLink = fileViaLink;
	}

	public boolean isSellerSubmitingWork() {
		return isSellerSubmitingWork;
	}
	public void setSellerSubmitingWork(boolean isSellerSubmitingWork) {
		this.isSellerSubmitingWork = isSellerSubmitingWork;
	}
	public String getMilestoneName() {
		return milestoneName;
	}
	public void setMilestoneName(String milestoneName) {
		this.milestoneName = milestoneName;
	}
	public Integer getPmId() {
		return pmId;
	}
	public void setPmId(Integer pmId) {
		this.pmId = pmId;
	}
	public boolean isBuyerRejectMilestone() {
		return isBuyerRejectMilestone;
	}
	public void setBuyerRejectMilestone(boolean isBuyerRejectMilestone) {
		this.isBuyerRejectMilestone = isBuyerRejectMilestone;
	}
	
	
}
