package com.hospital.web.project.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

    // Method to return a new connection every time it's called
    public static Connection getConnection() {
        Connection con = null;
        try {
            // Load the driver class
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure this is the correct driver
            // Create a new connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalform", "root", "$$gupta@#9634");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}