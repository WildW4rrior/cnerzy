package com.pie.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class StatusDTO {
    
    @JsonProperty("accepted")
    private Boolean accepted;

    @JsonProperty("accepted_returned")
    private Boolean acceptedReturned;

    @JsonProperty("canceled")
    private Boolean canceled;

    @JsonProperty("in_dispute")
    private Boolean inDispute;

    @JsonProperty("received")
    private Boolean received;

    @JsonProperty("received_returned")
    private Boolean receivedReturned;

    @JsonProperty("rejected")
    private Boolean rejected;

    @JsonProperty("rejected_returned")
    private Boolean rejectedReturned;

    @JsonProperty("shipped")
    private Boolean shipped;

    @JsonProperty("shipped_returned")
    private Boolean shippedReturned;

	public Boolean getAccepted() {
		return accepted;
	}

	public void setAccepted(Boolean accepted) {
		this.accepted = accepted;
	}

	public Boolean getAcceptedReturned() {
		return acceptedReturned;
	}

	public void setAcceptedReturned(Boolean acceptedReturned) {
		this.acceptedReturned = acceptedReturned;
	}

	public Boolean getCanceled() {
		return canceled;
	}

	public void setCanceled(Boolean canceled) {
		this.canceled = canceled;
	}

	public Boolean getInDispute() {
		return inDispute;
	}

	public void setInDispute(Boolean inDispute) {
		this.inDispute = inDispute;
	}

	public Boolean getReceived() {
		return received;
	}

	public void setReceived(Boolean received) {
		this.received = received;
	}

	public Boolean getReceivedReturned() {
		return receivedReturned;
	}

	public void setReceivedReturned(Boolean receivedReturned) {
		this.receivedReturned = receivedReturned;
	}

	public Boolean getRejected() {
		return rejected;
	}

	public void setRejected(Boolean rejected) {
		this.rejected = rejected;
	}

	public Boolean getRejectedReturned() {
		return rejectedReturned;
	}

	public void setRejectedReturned(Boolean rejectedReturned) {
		this.rejectedReturned = rejectedReturned;
	}

	public Boolean getShipped() {
		return shipped;
	}

	public void setShipped(Boolean shipped) {
		this.shipped = shipped;
	}

	public Boolean getShippedReturned() {
		return shippedReturned;
	}

	public void setShippedReturned(Boolean shippedReturned) {
		this.shippedReturned = shippedReturned;
	}
}
