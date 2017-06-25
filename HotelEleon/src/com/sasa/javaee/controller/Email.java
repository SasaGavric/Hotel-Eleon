package com.sasa.javaee.controller;

public class Email {
	
	String name;
	String adress;
	String emailId;
	String content;
	
	public Email(String name, String adress, String emailId, String content) {
		super();
		this.name = name;
		this.adress = adress;
		this.emailId = emailId;
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public String getAdress() {
		return adress;
	}

	public String getEmailId() {
		return emailId;
	}

	public String getContent() {
		return content;
	}
	
	public String toString(){
		return name + " \n" + adress + " \n" + emailId + " \n" + " \n\n" + content;
	}
	
	

}
