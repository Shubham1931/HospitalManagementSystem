package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.hospital.web.project.dao.AppointmentDao;
import com.hospital.web.project.dao.PatientDao;
import com.hospital.web.project.entites.Appointment;
import com.hospital.web.project.entites.Patient;
import com.hospital.web.project.helper.ConnectionProvider;
@SuppressWarnings("serial")
@WebServlet("/addPatient")
public class AddPatient extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String Stringage = request.getParameter("age");
		int age = Integer.parseInt(Stringage);
		String gender = request.getParameter("gender");
		String address= request.getParameter("address");
		String phoneNumber= request.getParameter("phone");
		String email = request.getParameter("email");
		String diseases = request.getParameter("diseases");
		Patient user = new Patient(name,age,gender,address,phoneNumber,email,diseases); 
		//create a user dao object
		PatientDao patient = new PatientDao(ConnectionProvider.getConnection());
		if(patient.savePatient(user)) {
			response.sendRedirect("managePatient.jsp");
		}else {
			response.sendRedirect("managePatient.jsp");
			System.out.println("error");
		}
	}
	}

