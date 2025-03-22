package com.pie.model;

public class EmailFile {
	String filePath;
	String mailFileName;
	
	public EmailFile(String filePath,String mailFileName){
		this.mailFileName = mailFileName;
		this.filePath = filePath;
	}

	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getMailFileName() {
		return mailFileName;
	}

	public void setMailFileName(String mailFileName) {
		this.mailFileName = mailFileName;
	}
	
}
