package com.hospital.web.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.hospital.web.project.entites.Doctors;

public class DoctorDao {
    
    private Connection con;

    public DoctorDao(Connection con) {
        this.con = con;
    }

    // Method to insert a new doctor into the database
    public boolean insertDoctor(Doctors doctor) {
        boolean status = false;
        String query = "INSERT INTO doctors (doctor_name, specialization, phone_number, email, gender, date_of_birth, joining_date, address, qualification, experience, availability, consultation_fee, department, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, doctor.getDoctorname());
            pstmt.setString(2, doctor.getSpecialization());
            pstmt.setString(3, doctor.getPhoneNumber());
            pstmt.setString(4, doctor.getEmail());
            pstmt.setString(5, doctor.getGender());
            pstmt.setDate(6, doctor.getDob());
            pstmt.setDate(7, doctor.getJoining_date());
            pstmt.setString(8, doctor.getDoctoraddress());
            pstmt.setString(9, doctor.getQualification());
            pstmt.setString(10, doctor.getExperience());
            pstmt.setString(11, doctor.getAvailablity());
            pstmt.setFloat(12, doctor.getConsultationFee());
            pstmt.setString(13, doctor.getDepartment());
            pstmt.setString(14, doctor.getStatus());
            
            // Execute the query
            pstmt.executeUpdate();
            status = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return status;
    }
}
