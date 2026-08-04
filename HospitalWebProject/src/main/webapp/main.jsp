<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@page import="com.hospital.web.project.entites.Message" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Home</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('img/hospitalHome.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }

        .center-block {
            width: 400px;
            margin: 100px auto;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .center-block h1 {
            margin: 0;
            padding: 10px;
            color: #333;
        }

        .center-block select, .center-block input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .center-block button {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .center-block button:hover {
            background-color: #2980b9;
        }

        .center-block a {
            display: block;
            margin-top: 20px;
            color: #2980b9;
            text-decoration: none;
            font-size: 14px;
        }

        .center-block a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="center-block">
        <h1>Hospital Name</h1>

        <!-- Dropdown to select login type (Admin or Patient) -->
       <% 
    // Check if there is a message in the session
    Message msg = (Message) session.getAttribute("msg");
    if (msg != null) {
%>
        <div class="<%= msg.getCssClass() %>">
            <%= msg.getContnent() %>
        </div>
<%
        // Clear the message after displaying it
        session.removeAttribute("msg");
    }
%>
        <select id="loginType" onchange="adjustForm()">
            <option value="admin">Login as Admin</option>
            <option value="patient">Login as Patient</option>
        </select>

        <!-- Login form that adjusts based on the selected login type -->
        <form id="loginForm" action="adminLogin" method="post">
            <input type="email" id="emailField" name="email" placeholder="Enter your email" required>
            <input type="password" id="passwordField" name="password" placeholder="Enter your password" required>
            <button type="submit">Login</button>
        </form>

        <a href="index.jsp" target="_blank">Go to Main Website</a>
    </div>

    <script>
        // Function to adjust form fields based on the login type selected
        function adjustForm() {
            var loginType = document.getElementById("loginType").value;
            var form = document.getElementById("loginForm");
            if (loginType === "admin") {
                // Admin login selected
                form.action = "adminLogin"; 
                // Form action set to admin login page
            } else {
                // Patient login selected
                form.action = "patientLogin";  // Form action set to patient login page              
            }
        }

        // Initialize the form to show the correct fields on page load
        adjustForm();
    </script>

</body>
</html>
