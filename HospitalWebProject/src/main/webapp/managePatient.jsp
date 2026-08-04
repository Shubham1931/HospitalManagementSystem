<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException" %>
<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
   <% 
    request.getSession(false); // Don't create a new session
    if (session == null || session.getAttribute("isAdminLoggedIn") == null) {
        response.sendRedirect("main.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Patients</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
</head>
<body>
<%@ include file="adminNav.jsp" %>	
    <div class="container mt-4">
        <h2>Manage Patients</h2>

        <!-- Button to Add New Patient -->
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addPatientModal">
            Add Patient
        </button>

        <!-- Add Patient Modal -->
        <div class="modal fade" id="addPatientModal" tabindex="-1" aria-labelledby="addPatientModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addPatientModalLabel">Add New Patient</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Form to Add Patient -->
                        <form action="addPatient" method="post">
                            <!-- Patient form inputs -->
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="age" class="form-label">Age</label>
                                <input type="number" class="form-control" id="age" name="age" required>
                            </div>
                            <div class="mb-3">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-select" id="gender" name="gender" required>
                                    <option value="" disabled selected>Select</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="diseases" class="form-label">Diseases</label>
                                <textarea class="form-control" id="diseases" name="diseases" rows="3" required></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save Patient</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Patient Table -->
	        <table class="table table-striped table-bordered">
	            <thead class="thead-dark">
	                <tr>
	                    <th style="background-color:grey; color:white">ID</th>
	                    <th style="background-color:grey; color:white">Name</th>
	                    <th style="background-color:grey; color:white">Age</th>
	                    <th style="background-color:grey; color:white">Gender</th>
	                    <th style="background-color:grey; color:white">Address</th>
	                    <th style="background-color:grey; color:white">Phone</th>
	                    <th style="background-color:grey; color:white">Email</th>
	                    <th style="background-color:grey; color:white">Diseases</th>
	                    <th style="background-color:grey; color:white">Delete Patient</th>
	                </tr>
	            </thead>
	            <tbody>
	                <%
	                    Connection con = null;
	                    PreparedStatement pst = null;
	                    ResultSet rs = null;
	                    try {
	                        Class.forName("com.mysql.cj.jdbc.Driver");
	                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalform", "root", "$$gupta@#9634");
	
	                        String query = "SELECT * FROM patients";
	                        pst = con.prepareStatement(query);
	                        rs = pst.executeQuery();
	
	                        while (rs.next()) {
	                            int id = rs.getInt("id");
	                            String name = rs.getString("name");
	                            int age = rs.getInt("age");
	                            String gender = rs.getString("gender");
	                            String address = rs.getString("address");
	                            String phone = rs.getString("phoneNumber");
	                            String email = rs.getString("email");
	                            String diseases = rs.getString("diseases");
	                %>
	                <tr id="patient-row-<%= id %>">
	                    <td><%= id %></td>
	                    <td><%= name %></td>
	                    <td><%= age %></td>
	                    <td><%= gender %></td>
	                    <td><%= address %></td>
	                    <td><%= phone %></td>
	                    <td><%= email %></td>
	                   <td style="word-wrap: break-word; max-width: 200px;"><%= diseases %></td>
	                    <td style="text-align: center;">
    <!-- Edit Button -->
    <button type="button" class="btn btn-warning btn-sm" onclick="openEditModal('<%= id %>', '<%= name %>', '<%= age %>', '<%= gender %>', '<%= address %>', '<%= phone %>', '<%= email %>', '<%= diseases %>')">
        <i class="bi bi-pencil"></i> Edit
    </button>
    <!-- Delete Button -->
    <button type="button" onclick="deletePatient(<%= id %>)" class="btn btn-danger btn-sm">
        <i class="bi bi-trash"></i> Delete
    </button>
</td>
	                </tr>
	                <%
	                        }
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                        out.println("<p>Error: " + e.getMessage() + "</p>");
	                    } finally {
	                        if (rs != null) rs.close();
	                        if (pst != null) pst.close();
	                        if (con != null) con.close();
	                    }
	                %>
	            </tbody>
	        </table>
	    </div>
<!-- Edit Patient Modal -->
<div class="modal fade" id="editPatientModal" tabindex="-1" aria-labelledby="editPatientModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editPatientModalLabel">Edit Patient</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Form to Edit Patient -->
                <form action="editPatient" method="post" id="editPatientForm">
                    <input type="hidden" name="patientId" id="edit-patient-id">
                    <div class="mb-3">
                        <label for="edit-name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="edit-name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="edit-age" name="age" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-gender" class="form-label">Gender</label>
                        <select class="form-select" id="edit-gender" name="gender" required>
                            <option value="" disabled>Select</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="edit-address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="edit-address" name="address" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="edit-phone" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="edit-email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-diseases" class="form-label">Diseases</label>
                        <textarea class="form-control" id="edit-diseases" name="diseases" rows="3" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function openEditModal(id, name, age, gender, address, phone, email, diseases) {
        // Set the values in the edit form fields
        $('#edit-patient-id').val(id);
        $('#edit-name').val(name);
        $('#edit-age').val(age);
        $('#edit-gender').val(gender);
        $('#edit-address').val(address);
        $('#edit-phone').val(phone);
        $('#edit-email').val(email);
        $('#edit-diseases').val(diseases);

        // Show the modal
        $('#editPatientModal').modal('show');
    }
</script>

    <!-- JS Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deletePatient(patientId) {
            if (confirm("Are you sure you want to delete this patient?")) {
                $.ajax({
                    url: 'deletePatient',
                    type: 'POST',
                    data: { patientId: patientId },
                    success: function(response) {
                        if (response.status === 'success') {
                            // Remove the row from the table without reloading
                            $('#patient-row-' + patientId).remove();
                        } else {
                            alert('Failed to delete the patient.');
                        }
                    },
                    error: function() {
                        alert('An error occurred while trying to delete the patient.');
                    }
                });
            }
        }
    </script>
</body>
</html>
