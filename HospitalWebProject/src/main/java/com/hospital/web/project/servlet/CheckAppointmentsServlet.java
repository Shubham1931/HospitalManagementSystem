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
import java.sql.ResultSet;

import com.hospital.web.project.helper.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/CheckAppointmentsServlets")
public class CheckAppointmentsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String appointmentDate = request.getParameter("date");
        String appointmentTime = request.getParameter("appointmentTime");
     

        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        // Set response content type
        response.setContentType("text/plain");
        
        try (Connection conn = ConnectionProvider.getConnection()) {
            // Prepare the SQL query
            String sql = "SELECT * FROM hospitalform WHERE appointment_date = ? AND time = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, appointmentDate);
            stmt.setString(2, appointmentTime);
            
            // Execute the query
            rs = stmt.executeQuery();
            
            PrintWriter out = response.getWriter();

            // Now check if an appointment exists
            if (rs.next()) {
                // If rs.next() is true, the appointment is already taken
                out.write("unavailable");
               
            } else {
                // If no result is found, the appointment time is available
                out.write("available");
              
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
