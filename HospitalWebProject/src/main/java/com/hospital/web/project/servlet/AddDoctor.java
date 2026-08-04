package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

import com.hospital.web.project.dao.DoctorDao;
import com.hospital.web.project.entites.Doctors;
import com.hospital.web.project.helper.ConnectionProvider;
@SuppressWarnings("serial")
@WebServlet("/AddDoctorServlet")
public class AddDoctor extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String doctorName = request.getParameter("doctor_name");
        String specialization = request.getParameter("specialization");
        String phoneNumber = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        Date dob = Date.valueOf(request.getParameter("date_of_birth"));  // Assuming the date format is yyyy-mm-dd
        Date joiningDate = Date.valueOf(request.getParameter("joining_date"));  // Assuming the date format is yyyy-mm-dd
        String doctorAddress = request.getParameter("doctorAddress");
        String qualification = request.getParameter("qualification");
        String experience = request.getParameter("experience");
        String availability = request.getParameter("availability");
        float consultationFee = Float.parseFloat(request.getParameter("consultation_fee"));
        String department = request.getParameter("department");
        String status = request.getParameter("status");

        // Creating a Doctors object with the retrieved data
        Doctors doctor = new Doctors(doctorName, specialization, phoneNumber, email, gender, dob, joiningDate, doctorAddress, qualification, experience, availability, consultationFee, department, status);

        // Establishing connection
        Connection con = ConnectionProvider.getConnection();
        DoctorDao doctorDao = new DoctorDao(con);

        // Inserting the doctor into the database
        boolean isSuccess = doctorDao.insertDoctor(doctor);

        // Handling success or failure response
        if (isSuccess) {
            response.sendRedirect("doctors.jsp");
        } else {
            response.sendRedirect("doctors.jsp");
        }
	}

}
