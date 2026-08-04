package com.hospital.web.project.entites;

import java.sql.Date;

public class Doctors {
private int doctorid ;
private String doctorname;
private String specialization;
private String phoneNumber;
private String 	email;
private String gender;
private Date Dob;
private Date joining_date;
private String doctoraddress;
private String Qualification;
private String experience;
private String availablity;
private float consultationFee;
private String department;
private String status;
public int getDoctorid() {
	return doctorid;
}

public Doctors(String doctorname, String specialization, String phoneNumber, String email, String gender, Date dob,
		Date joining_date, String doctoraddress, String qualification, String experience, String availablity,
		float consultationFee, String department, String status) {
	super();
	this.doctorname = doctorname;
	this.specialization = specialization;
	this.phoneNumber = phoneNumber;
	this.email = email;
	this.gender = gender;
	Dob = dob;
	this.joining_date = joining_date;
	this.doctoraddress = doctoraddress;
	Qualification = qualification;
	this.experience = experience;
	this.availablity = availablity;
	this.consultationFee = consultationFee;
	this.department = department;
	this.status = status;
}

public void setDoctorid(int doctorid) {
	this.doctorid = doctorid;
}
public String getDoctorname() {
	return doctorname;
}
public void setDoctorname(String doctorname) {
	this.doctorname = doctorname;
}
public String getSpecialization() {
	return specialization;
}
public void setSpecialization(String specialization) {
	this.specialization = specialization;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public Date getDob() {
	return Dob;
}
public void setDob(Date dob) {
	Dob = dob;
}
public Date getJoining_date() {
	return joining_date;
}
public void setJoining_date(Date joining_date) {
	this.joining_date = joining_date;
}
public String getDoctoraddress() {
	return doctoraddress;
}
public void setDoctoraddress(String doctoraddress) {
	this.doctoraddress = doctoraddress;
}
public String getQualification() {
	return Qualification;
}
public void setQualification(String qualification) {
	Qualification = qualification;
}
public String getExperience() {
	return experience;
}
public void setExperience(String experience) {
	this.experience = experience;
}
public String getAvailablity() {
	return availablity;
}
public void setAvailablity(String availablity) {
	this.availablity = availablity;
}
public float getConsultationFee() {
	return consultationFee;
}
public void setConsultationFee(float consultationFee) {
	this.consultationFee = consultationFee;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}


}
