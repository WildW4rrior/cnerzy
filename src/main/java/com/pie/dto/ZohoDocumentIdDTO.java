package com.pie.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ZohoDocumentIdDTO {
    @JsonProperty("image_string")
    public String imageString;

    @JsonProperty("document_name")
    public String documentName;

    @JsonProperty("pages")
    public List<PageDTO> pages;

    @JsonProperty("document_size")
    public int documentSize;

    @JsonProperty("document_order")
    public String documentOrder;

    @JsonProperty("is_nom151_present")
    public boolean isNom151Present;

    @JsonProperty("is_editable")
    public boolean isEditable;

    @JsonProperty("total_pages")
    public int totalPages;

    @JsonProperty("document_id")
    public String documentId;

	public String getImageString() {
		return imageString;
	}

	public void setImageString(String imageString) {
		this.imageString = imageString;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public List<PageDTO> getPages() {
		return pages;
	}

	public void setPages(List<PageDTO> pages) {
		this.pages = pages;
	}

	public int getDocumentSize() {
		return documentSize;
	}

	public void setDocumentSize(int documentSize) {
		this.documentSize = documentSize;
	}

	public String getDocumentOrder() {
		return documentOrder;
	}

	public void setDocumentOrder(String documentOrder) {
		this.documentOrder = documentOrder;
	}

	public boolean isNom151Present() {
		return isNom151Present;
	}

	public void setNom151Present(boolean isNom151Present) {
		this.isNom151Present = isNom151Present;
	}

	public boolean isEditable() {
		return isEditable;
	}

	public void setEditable(boolean isEditable) {
		this.isEditable = isEditable;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}
    
    
}
