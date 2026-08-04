package com.hospital.web.project.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hospital.web.project.dao.AppointmentDao;
import com.hospital.web.project.entites.Message;
import com.hospital.web.project.helper.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession(false);  // Don't create new session
	        
	        if (session != null && session.getAttribute("isAdminLoggedIn") != null) {
	            // User is logged in, proceed to admin page
	            RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            // Not logged in, redirect to login page
	            response.sendRedirect("main.jsp");
	        }
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String userPassWord = request.getParameter("password");
		AppointmentDao dao = new AppointmentDao(ConnectionProvider.getConnection());
	boolean flag = 	dao.getAdminByEmailAndPassword(userEmail, userPassWord);
	if(flag== true) {
		HttpSession session = request.getSession();
        session.setAttribute("isAdminLoggedIn", true);
		response.sendRedirect("admin.jsp");
	}else {
		Message msg = new Message("invalid details! try again!!","error","alert-danger");
		HttpSession s = request.getSession();
		s.setAttribute("msg", msg);
		 RequestDispatcher rd = request.getRequestDispatcher("main.jsp"); // Replace with your actual login JSP page
         rd.forward(request, response);
	}
		
	}

}
