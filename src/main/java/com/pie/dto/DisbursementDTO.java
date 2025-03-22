package com.pie.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class DisbursementDTO {

    @JsonProperty("available_disbursement_methods")
    private List<AvailableDisbursementMethod> availableDisbursementMethods;

    @JsonProperty("saved_disbursement_methods")
    private List<DisbursementMethodDTO> savedDisbursementMethods;

    @JsonProperty("selected_disbursement_method")
    private DisbursementMethodDTO selectedDisbursementMethod;

    public List<AvailableDisbursementMethod> getAvailableDisbursementMethods() {
		return availableDisbursementMethods;
	}
	public void setAvailableDisbursementMethods(List<AvailableDisbursementMethod> availableDisbursementMethods) {
		this.availableDisbursementMethods = availableDisbursementMethods;
	}
	public List<DisbursementMethodDTO> getSavedDisbursementMethods() {
		return savedDisbursementMethods;
	}
	public void setSavedDisbursementMethods(List<DisbursementMethodDTO> savedDisbursementMethods) {
		this.savedDisbursementMethods = savedDisbursementMethods;
	}
	public DisbursementMethodDTO getSelectedDisbursementMethod() {
		return selectedDisbursementMethod;
	}
	public void setSelectedDisbursementMethod(DisbursementMethodDTO selectedDisbursementMethod) {
		this.selectedDisbursementMethod = selectedDisbursementMethod;
	}
	public static class AvailableDisbursementMethod {
        @JsonProperty("total")
        private String total;

        @JsonProperty("type")
        private String type;

		public String getTotal() {
			return total;
		}

		public void setTotal(String total) {
			this.total = total;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}
    }
}
