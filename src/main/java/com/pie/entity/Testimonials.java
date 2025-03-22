package com.pie.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "testimonials")
public class Testimonials {

		private Integer id;
		private Date date;
		private String testimonialBy;
		private String testimonialFor;
		private String testimonialDescription;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="id", unique = true, nullable = false)
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
		@Column(name="date")
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		
		@Column(name="testimonial_by")
		public String getTestimonialBy() {
			return testimonialBy;
		}
		public void setTestimonialBy(String testimonialBy) {
			this.testimonialBy = testimonialBy;
		}
		
		@Column(name="testimonial_for")
		public String getTestimonialFor() {
			return testimonialFor;
		}
		public void setTestimonialFor(String testimonialFor) {
			this.testimonialFor = testimonialFor;
		}
		
		@Column(name="tetsimonial_description")
		public String getTestimonialDescription() {
			return testimonialDescription;
		}
		public void setTestimonialDescription(String testimonialDescription) {
			this.testimonialDescription = testimonialDescription;
		}
		
}
