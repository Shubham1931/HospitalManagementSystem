package com.hospital.web.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.hospital.web.project.entites.Patient;
import com.hospital.web.project.entites.PatientData;

public class PatientDao {
	
	public PatientDao(Connection con) {
		super();
		this.con = con;
	}
	private Connection con;
	public boolean savePatient(Patient patient) {
	    boolean isSuccess = false;
	    String query = "INSERT INTO patients (name, age, gender, address,phoneNumber,email,diseases) VALUES (?, ?, ?, ?,?,?,?)";

	    if (patient == null) {
	        System.err.println("User object is null");
	        return false;
	    }

	    try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
	        pstmt.setString(1, patient.getName());
	        pstmt.setInt(2, patient.getAge());
	        pstmt.setString(3, patient.getGender());
	        pstmt.setString(4, patient.getAddress());
	        pstmt.setString(5, patient.getPhoneNumber());
	        pstmt.setString(6, patient.getEmail());
	        pstmt.setString(7, patient.getDiseases());

	        int rowsAffected = pstmt.executeUpdate();
	        isSuccess = rowsAffected > 0; // Check if the insertion was successful
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}
	public PatientData getPatientByEmailAndPassword(String email,String password) {
		
		PatientData patient = null;

		  try {
	            String query = "SELECT * FROM patientlogin WHERE email=? AND password=?";
	            PreparedStatement pstmt = this.con.prepareStatement(query);
	            pstmt.setString(1, email);
	            pstmt.setString(2, password);
	           
	            ResultSet rs = pstmt.executeQuery();

	            // If patient exists
	            if (rs.next()) {
	            patient = new PatientData();
	                patient.setId(rs.getInt("patientid"));
	                patient.setName(rs.getString("name"));
	                patient.setEmail(rs.getString("email"));
	                patient.setProfilePic(rs.getString("profilepic"));
	                // Add more fields if necessary
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return patient;  // Will return null if no patient is found
	    }
}
