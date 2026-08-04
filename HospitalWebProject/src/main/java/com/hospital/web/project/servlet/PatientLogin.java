package com.hospital.web.project.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.hospital.web.project.dao.PatientDao;
import com.hospital.web.project.entites.Message;
import com.hospital.web.project.entites.Patient;
import com.hospital.web.project.entites.PatientData;
import com.hospital.web.project.helper.ConnectionProvider;


@SuppressWarnings("serial")
@WebServlet("/patientLogin")
public class PatientLogin extends HttpServlet {

      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String userPassWord = request.getParameter("password");
	PatientDao dao = new PatientDao(ConnectionProvider.getConnection());
	PatientData patient = 	dao.getPatientByEmailAndPassword(userEmail, userPassWord);
	
	if(patient!=null) {
		
		 HttpSession session = request.getSession();
         session.setAttribute("currentPatient", patient);
		response.sendRedirect("index.jsp");
	}else {
		Message msg = new Message("invalid details! try again!!","error","alert-danger");
		HttpSession s = request.getSession();
		s.setAttribute("msg", msg);
		response.sendRedirect("main.jsp");
	}

	}

}
