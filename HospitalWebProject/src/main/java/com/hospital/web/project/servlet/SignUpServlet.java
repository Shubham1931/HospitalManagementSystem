package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hospital.web.project.entites.Patient;
import com.hospital.web.project.entites.PatientData;
import com.hospital.web.project.helper.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/signupServlet")
public class SignUpServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// Check for null or invalid input to avoid SQL errors
		if (name == null || email == null || password == null || name.isEmpty() || email.isEmpty() || password.isEmpty()) {
			response.getWriter().write("Invalid input, all fields are required.");
			return;
		}

		Connection con = ConnectionProvider.getConnection();
		String sql = "INSERT INTO patientlogin (name, email, password) VALUES (?, ?, ?)";

		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, password);
			
			int rowsAffected = pstmt.executeUpdate();
			
			if (rowsAffected > 0) {
				PatientData currentPatient = new PatientData();
				currentPatient.setName(name);
				currentPatient.setEmail(email);
				currentPatient.setProfilePic("default.jpg");
				// Set profilePic, id, and other attributes if applicable
				// Example: currentPatient.setProfilePic("default.jpg");

				// Store the Patient object in the session
				HttpSession session = request.getSession();
				session.setAttribute("currentPatient", currentPatient);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
