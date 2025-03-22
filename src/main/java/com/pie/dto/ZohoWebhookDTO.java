package com.pie.dto;
import java.util.List;

public class ZohoWebhookDTO {
    private Requests requests;
    private Notifications notifications;

    public Requests getRequests() {
        return requests;
    }

    public void setRequests(Requests requests) {
        this.requests = requests;
    }

    public Notifications getNotifications() {
        return notifications;
    }

    public void setNotifications(Notifications notifications) {
        this.notifications = notifications;
    }

    public static class Requests {
        private String requestStatus;
        private String ownerEmail;
        private List<Document> documentIds;
        private boolean selfSign;
        private String ownerFirstName;
        private String ownerLastName;
		public String getRequestStatus() {
			return requestStatus;
		}
		public void setRequestStatus(String requestStatus) {
			this.requestStatus = requestStatus;
		}
		public String getOwnerEmail() {
			return ownerEmail;
		}
		public void setOwnerEmail(String ownerEmail) {
			this.ownerEmail = ownerEmail;
		}
		public List<Document> getDocumentIds() {
			return documentIds;
		}
		public void setDocumentIds(List<Document> documentIds) {
			this.documentIds = documentIds;
		}
		public boolean isSelfSign() {
			return selfSign;
		}
		public void setSelfSign(boolean selfSign) {
			this.selfSign = selfSign;
		}
		public String getOwnerFirstName() {
			return ownerFirstName;
		}
		public void setOwnerFirstName(String ownerFirstName) {
			this.ownerFirstName = ownerFirstName;
		}
		public String getOwnerLastName() {
			return ownerLastName;
		}
		public void setOwnerLastName(String ownerLastName) {
			this.ownerLastName = ownerLastName;
		}
        
    }

    public static class Document {
        private String documentName;
        private int documentSize;
        private int documentOrder;
        private int totalPages;
        private String documentId;
		public String getDocumentName() {
			return documentName;
		}
		public void setDocumentName(String documentName) {
			this.documentName = documentName;
		}
		public int getDocumentSize() {
			return documentSize;
		}
		public void setDocumentSize(int documentSize) {
			this.documentSize = documentSize;
		}
		public int getDocumentOrder() {
			return documentOrder;
		}
		public void setDocumentOrder(int documentOrder) {
			this.documentOrder = documentOrder;
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

    public static class Notifications {
        private String performedByEmail;
        private long performedAt;
        private String reason;
        private String activity;
		public String getPerformedByEmail() {
			return performedByEmail;
		}
		public void setPerformedByEmail(String performedByEmail) {
			this.performedByEmail = performedByEmail;
		}
		public long getPerformedAt() {
			return performedAt;
		}
		public void setPerformedAt(long performedAt) {
			this.performedAt = performedAt;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public String getActivity() {
			return activity;
		}
		public void setActivity(String activity) {
			this.activity = activity;
		}
        
        
    }
}
