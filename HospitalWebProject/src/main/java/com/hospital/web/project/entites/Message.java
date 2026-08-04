package com.hospital.web.project.entites;

public class Message {
private String contnent;
private String type;
private String cssClass;
public Message(String contnent, String type, String cssClass) {
	
	this.contnent = contnent;
	this.type = type;
	this.cssClass = cssClass;
}
public String getContnent() {
	return contnent;
}
public void setContnent(String contnent) {
	this.contnent = contnent;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getCssClass() {
	return cssClass;
}
public void setCssClass(String cssClass) {
	this.cssClass = cssClass;
} 



}
