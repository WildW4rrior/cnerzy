package com.pie.dto;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ItemDTO {
        
        @JsonProperty("category")
        private String category;

        @JsonProperty("description")
        private String description;

        @JsonProperty("extra_attributes")
        private Map<String, Object> extraAttributes;

        @JsonProperty("fees")
        private List<FeeDTO> fees;

        @JsonProperty("id")
        private Integer id;

        @JsonProperty("inspection_period")
        private Integer inspectionPeriod;

        @JsonProperty("quantity")
        private Integer quantity;

        @JsonProperty("schedule")
        private List<ScheduleDTO> schedule;

        @JsonProperty("status")
        private StatusDTO status;

        @JsonProperty("title")
        private String title;

        @JsonProperty("type")
        private String type;

        @JsonProperty("parent_item_id")
        private Integer parentItemId;

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Map<String, Object> getExtraAttributes() {
			return extraAttributes;
		}

		public void setExtraAttributes(Map<String, Object> extraAttributes) {
			this.extraAttributes = extraAttributes;
		}

		public List<FeeDTO> getFees() {
			return fees;
		}

		public void setFees(List<FeeDTO> fees) {
			this.fees = fees;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public Integer getInspectionPeriod() {
			return inspectionPeriod;
		}

		public void setInspectionPeriod(Integer inspectionPeriod) {
			this.inspectionPeriod = inspectionPeriod;
		}

		public Integer getQuantity() {
			return quantity;
		}

		public void setQuantity(Integer quantity) {
			this.quantity = quantity;
		}

		public List<ScheduleDTO> getSchedule() {
			return schedule;
		}

		public void setSchedule(List<ScheduleDTO> schedule) {
			this.schedule = schedule;
		}

		public StatusDTO getStatus() {
			return status;
		}

		public void setStatus(StatusDTO status) {
			this.status = status;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public Integer getParentItemId() {
			return parentItemId;
		}

		public void setParentItemId(Integer parentItemId) {
			this.parentItemId = parentItemId;
		}
    }