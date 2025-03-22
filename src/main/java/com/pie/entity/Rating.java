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
@Table(name = "rating")
public class Rating {

	private Integer id;
	private Date addedOn;
	private Integer projectId;
	private Integer ratedByCId;
	private Integer ratedForCId;
	private Integer ratingValue;
	private String addedBy;
	private String addedFor;
	private String ratingCategory;
	private String ratingDescription;
	private String comment;
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "added_on")
	public Date getAddedOn() {
		return addedOn;
	}
	public void setAddedOn(Date addedOn) {
		this.addedOn = addedOn;
	}
	
	@Column(name = "project_id")
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	
	@Column(name = "rated_by_cid")
	public Integer getRatedByCId() {
		return ratedByCId;
	}
	public void setRatedByCId(Integer ratedByCId) {
		this.ratedByCId = ratedByCId;
	}
	@Column(name = "rated_for_cid")
	public Integer getRatedForCId() {
		return ratedForCId;
	}
	public void setRatedForCId(Integer ratedForCId) {
		this.ratedForCId = ratedForCId;
	}
	
	@Column(name = "rating_value")
	public Integer getRatingValue() {
		return ratingValue;
	}
	public void setRatingValue(Integer ratingValue) {
		this.ratingValue = ratingValue;
	}
	
	@Column(name = "added_by")
	public String getAddedBy() {
		return addedBy;
	}
	public void setAddedBy(String addedBy) {
		this.addedBy = addedBy;
	}
	
	@Column(name = "added_for")
	public String getAddedFor() {
		return addedFor;
	}
	public void setAddedFor(String addedFor) {
		this.addedFor = addedFor;
	}
	
	@Column(name = "rating_category")
	public String getRatingCategory() {
		return ratingCategory;
	}
	public void setRatingCategory(String ratingCategory) {
		this.ratingCategory = ratingCategory;
	}
	
	@Column(name = "rating_description")
	public String getRatingDescription() {
		return ratingDescription;
	}
	public void setRatingDescription(String ratingDescription) {
		this.ratingDescription = ratingDescription;
	}
	
	@Column(name = "comment")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
