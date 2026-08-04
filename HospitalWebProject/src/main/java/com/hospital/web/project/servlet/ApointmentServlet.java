package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hospital.web.project.dao.AppointmentDao;
import com.hospital.web.project.entites.Appointment;
import com.hospital.web.project.helper.ConnectionProvider;
@SuppressWarnings("serial")
@WebServlet("/addnewAppointment")
public class ApointmentServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("patientName");
		String department = request.getParameter("department");
		String Email = request.getParameter("patientEmail");
		String doctorName = request.getParameter("doctors");
		String appointmentDate= request.getParameter("appointmentDate");
		String appointmentTime  = request.getParameter("appointmentTime");
		Appointment user = new Appointment(name,Email,department,doctorName,appointmentDate,appointmentTime); 
		//create a user dao object
		AppointmentDao dao = new AppointmentDao(ConnectionProvider.getConnection());
		if(dao.saveappointment2(user)) {
			response.sendRedirect("appointments.jsp");
			
		}else {
			response.sendRedirect("appointments.jsp");
			
		}
	
	
	}

}
