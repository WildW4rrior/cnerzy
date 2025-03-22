package com.pie.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "company_rating")
public class CompanyRating {

	
		private Integer id;
		private Integer to_cid;
		private Integer by_cid;
		private Integer queries_resolved_ontime;
		private Integer seller_response;
		private Integer production_capacity;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="id", unique = true, nullable = false)
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		@Column(name="to_cid")
		public Integer getTo_cid() {
			return to_cid;
		}
		public void setTo_cid(Integer to_cid) {
			this.to_cid = to_cid;
		}
		
		@Column(name="by_cid")
		public Integer getBy_cid() {
			return by_cid;
		}
		public void setBy_cid(Integer by_cid) {
			this.by_cid = by_cid;
		}
		
		@Column(name="queries_resolved")
		public Integer getQueries_resolved_ontime() {
			return queries_resolved_ontime;
		}
		public void setQueries_resolved_ontime(Integer queries_resolved_ontime) {
			this.queries_resolved_ontime = queries_resolved_ontime;
		}
		
		@Column(name="seller_response")
		public Integer getSeller_response() {
			return seller_response;
		}
		public void setSeller_response(Integer seller_response) {
			this.seller_response = seller_response;
		}
		
		@Column(name="production_capacity")
		public Integer getProduction_capacity() {
			return production_capacity;
		}
		public void setProduction_capacity(Integer production_capacity) {
			this.production_capacity = production_capacity;
		}
		
		
}
