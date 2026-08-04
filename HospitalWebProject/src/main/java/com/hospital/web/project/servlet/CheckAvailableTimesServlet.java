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
import java.util.ArrayList;
import com.hospital.web.project.helper.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/CheckAvailableTimesServlets")
public class CheckAvailableTimesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedDate = request.getParameter("date");
        String doctorName = request.getParameter("doctorName");      
        PreparedStatement stmt = null;
        ResultSet rs = null;       
        // List of all possible time slots
        ArrayList<String> allTimeSlots = new ArrayList<>();
        allTimeSlots.add("07:00 AM");
        allTimeSlots.add("08:00 AM");
        allTimeSlots.add("09:00 AM");
        allTimeSlots.add("10:00 AM");
        allTimeSlots.add("11:00 AM");
        allTimeSlots.add("12:00 PM");
        allTimeSlots.add("01:00 PM");
        allTimeSlots.add("02:00 PM");
        allTimeSlots.add("03:00 PM");
        allTimeSlots.add("04:00 PM");
        allTimeSlots.add("05:00 PM");
        allTimeSlots.add("06:00 PM");
        allTimeSlots.add("07:00 PM");
        allTimeSlots.add("08:00 PM");
        allTimeSlots.add("09:00 PM");
        try (Connection conn = ConnectionProvider.getConnection()) {
            // Query to check booked appointments for the selected date
            String sql = "SELECT time FROM hospitalform WHERE doctorname = ? AND appointment_date = ? ";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, doctorName);
            stmt.setString(2, selectedDate);
            rs = stmt.executeQuery();

            // List to store booked time slots
            ArrayList<String> bookedTimeSlots = new ArrayList<>();
            
            // Fetch booked times
            while (rs.next()) {
                String bookedTime = rs.getString("time");
                bookedTimeSlots.add(bookedTime);
            }

            // Debug: Print booked time slots
           
            // Remove booked times from the available slots
            allTimeSlots.removeAll(bookedTimeSlots);

            // Debug: Print available time slots after removal
            
            
            // Send the available time slots as the response
            PrintWriter out = response.getWriter();
            response.setContentType("text/plain");
            for (String timeSlot : allTimeSlots) {
                out.println(timeSlot);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving available times.");
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
