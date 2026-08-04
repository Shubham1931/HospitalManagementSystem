package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
public class LogoutServlet extends HttpServlet {
	
	
	 private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        HttpSession session = request.getSession(false); // Fetch session if exists
	        if (session != null) {
	            session.invalidate(); // Invalidate session
	        }
	        response.sendRedirect("main.jsp"); // Redirect to login page
	    }

}
