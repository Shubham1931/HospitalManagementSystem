package com.hospital.web.project.dao;
import java.sql.*;
import com.hospital.web.project.entites.Appointment;
public class AppointmentDao {
private Connection con;

public AppointmentDao(Connection con) {
	this.con = con;
}
public boolean saveUser(Appointment user) {
    boolean isSuccess = false;
    String query = "INSERT INTO hospitalform (name, email, department, doctorname) VALUES (?, ?, ?, ?)";

    if (user == null) {
        System.err.println("User object is null");
        return false;
    }

    try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getDepatment());
        pstmt.setString(4, user.getDoctorName());

        int rowsAffected = pstmt.executeUpdate();
        isSuccess = rowsAffected > 0; // Check if the insertion was successful
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return isSuccess;
}
public boolean saveappointment(Appointment user) {
    boolean isSuccess = false;
    String query = "INSERT INTO hospitalform (name, department, doctorname,appointment_date) VALUES (?, ?, ?, ?)";

    if (user == null) {
        System.err.println("User object is null");
        return false;
    }

    try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getDepatment());
        pstmt.setString(3, user.getDoctorName());
        pstmt.setString(4, user.getAppointmentDate());

        int rowsAffected = pstmt.executeUpdate();
        isSuccess = rowsAffected > 0; // Check if the insertion was successful
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return isSuccess;
}
public boolean saveappointment2(Appointment user) {
    boolean isSuccess = false;
    String query = "INSERT INTO hospitalform (name,email, department, doctorname,appointment_date,time) VALUES (?, ?, ?, ?,?,?)";

    if (user == null) {
        System.err.println("User object is null");
        return false;
    }

    try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getDepatment());
        pstmt.setString(4, user.getDoctorName());
        pstmt.setString(5, user.getAppointmentDate());
        pstmt.setString(6, user.getAppointmentTime());

        int rowsAffected = pstmt.executeUpdate();
        isSuccess = rowsAffected > 0; // Check if the insertion was successful
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return isSuccess;
}
public boolean getAdminByEmailAndPassword(String email,String password) {
	boolean flag = false;
	try {
		String query = "select * from adminlogin where email=? and password=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2,password);
		ResultSet  set = pstmt.executeQuery();
		if(set.next()) {
			flag = true;
			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return flag;
}
public boolean getPatientByEmailAndPassword(String email,String password) {
	boolean flag = false;
	try {
		String query = "select * from patientlogin where email=? and password=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2,password);
		ResultSet  set = pstmt.executeQuery();
		if(set.next()) {
			flag = true;
			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return flag;
}
}