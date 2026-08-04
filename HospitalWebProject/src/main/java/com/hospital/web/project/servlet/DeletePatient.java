package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hospital.web.project.helper.ConnectionProvider;

@WebServlet("/deletePatient")
public class DeletePatient extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Id = request.getParameter("patientId");
        int patientId = Integer.parseInt(Id);

        Connection conn = null;
        PreparedStatement pstmt = null;
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            conn = ConnectionProvider.getConnection();
            String query = "DELETE FROM patients WHERE id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, patientId);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.write("{\"status\":\"success\"}");
            } else {
                out.write("{\"status\":\"failed\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.write("{\"status\":\"error\"}");
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        out.flush();
        out.close();
    }
}
