package com.hospital.web.project.entites;

public class Appointment {
	private int id;
private String name;
private String email;
private String depatment ;
private String doctorName;
private String appointmentDate;
private String appointmentTime;
public String getAppointmentTime() {
	return appointmentTime;
}

public void setAppointmentTime(String appointmentTime) {
	this.appointmentTime = appointmentTime;
}



public Appointment(String name, String email, String depatment, String doctorName, String appointmentDate,
		String appointmentTime) {
	super();
	this.name = name;
	this.email = email;
	this.depatment = depatment;
	this.doctorName = doctorName;
	this.appointmentDate = appointmentDate;
	this.appointmentTime = appointmentTime;
}

public Appointment(int id, String name, String email, String depatment, String doctorName, String appointmentDate) {
	super();
	this.id = id;
	this.name = name;
	this.email = email;
	this.depatment = depatment;
	this.doctorName = doctorName;
	this.appointmentDate = appointmentDate;
}

public Appointment(String name, String depatment, String doctorName,String appointmentDate) {
	super();
	this.name = name;
	this.depatment = depatment;
	this.doctorName = doctorName;
	this.appointmentDate = appointmentDate;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getDepatment() {
	return depatment;
}
public void setDepatment(String depatment) {
	this.depatment = depatment;
}
public String getDoctorName() {
	return doctorName;
}
public void setDoctorName(String doctorName) {
	this.doctorName = doctorName;
}
public String getAppointmentDate() {
	return appointmentDate;
}
public void setAppointmentDate(String appointmentDate) {
	this.appointmentDate = appointmentDate;
}


public Appointment() {
	super();
}


}
