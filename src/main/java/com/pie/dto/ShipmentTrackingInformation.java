package com.pie.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ShipmentTrackingInformation {
	
    @JsonProperty("carrier")
	String carrier;
    @JsonProperty("tracking_id")
	String trackingId;
    @JsonProperty("carrier_contact")
	String carrierContact;
    
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getTrackingId() {
		return trackingId;
	}
	public void setTrackingId(String trackingId) {
		this.trackingId = trackingId;
	}
	public String getCarrierContact() {
		return carrierContact;
	}
	public void setCarrierContact(String carrierContact) {
		this.carrierContact = carrierContact;
	}
}
