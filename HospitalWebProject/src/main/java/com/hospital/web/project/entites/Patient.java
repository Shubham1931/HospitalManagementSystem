package com.hospital.web.project.entites;

public class Patient {
private int id;
private String name;
private int age;
private String gender;
private String address;
private String phoneNumber;
private String email;
private String diseases;
private String password;
private String profilePic;
public Patient(int id, String name, String email, String profilePic) {
	super();
	this.id = id;
	this.name = name;
	this.email = email;
	this.profilePic = profilePic;
}
public String getProfilePic() {
	return profilePic;
}
public void setProfilePic(String profilePic) {
	this.profilePic = profilePic;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
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
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
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
public String getDiseases() {
	return diseases;
}
public void setDiseases(String diseases) {
	this.diseases = diseases;
}
public Patient(String name, int age, String gender, String address, String phoneNumber, String email, String diseases) {
	super();
	this.name = name;
	this.age = age;
	this.gender = gender;
	this.address = address;
	this.phoneNumber = phoneNumber;
	this.email = email;
	this.diseases = diseases;
}
public Patient() {
	// TODO Auto-generated constructor stub
}

}
