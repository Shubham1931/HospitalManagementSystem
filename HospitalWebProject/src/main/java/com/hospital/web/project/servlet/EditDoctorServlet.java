package com.hospital.web.project.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hospital.web.project.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/editDoctor")
public class EditDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
        String doctorName = request.getParameter("doctor_name");
        String specialization = request.getParameter("specialization");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String qualification = request.getParameter("qualification");
        String availability = request.getParameter("availability");
        double consultationFee = Double.parseDouble(request.getParameter("consultation_fee"));
        String department = request.getParameter("department");
        String status = request.getParameter("status");

        try (Connection conn = ConnectionProvider.getConnection()) {
            String query = "UPDATE doctors SET doctor_name=?, specialization=?, phone_number=?, email=?, gender=?, qualification=?, availability=?, consultation_fee=?, department=?, status=? WHERE doctor_id=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, doctorName);
            pstmt.setString(2, specialization);
            pstmt.setString(3, phone);
            pstmt.setString(4, email);
            pstmt.setString(5, gender);
            pstmt.setString(6, qualification);
            pstmt.setString(7, availability);
            pstmt.setDouble(8, consultationFee);
            pstmt.setString(9, department);
            pstmt.setString(10, status);
            pstmt.setInt(11, doctorId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("doctors.jsp");
            } else {
                response.sendRedirect("doctors.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("manageDoctor.jsp?status=error");
        }
    }
}
