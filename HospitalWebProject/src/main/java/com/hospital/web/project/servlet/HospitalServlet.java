package com.hospital.web.project.servlet;
import com.hospital.web.project.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hospital.web.project.dao.AppointmentDao;
import com.hospital.web.project.entites.Appointment;
@SuppressWarnings("serial")
@WebServlet("/Hospital")
public class HospitalServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String department = request.getParameter("department");
		String doctorName = request.getParameter("doctorName");
		Appointment user = new Appointment(name,email,department,doctorName); 
		//create a user dao object
		AppointmentDao dao = new AppointmentDao(ConnectionProvider.getConnection());
		if(dao.saveUser(user)) {
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("index.jsp");
		}
	}

}
