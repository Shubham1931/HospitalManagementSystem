<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Doctors</title>
    <!-- Bootstrap 5.3.1 CSS -->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
   <style>
  td {
    max-width: 180px; /* Limits the maximum width of the cell */
    white-space: normal; /* Allows text to wrap within the cell */
    word-wrap: break-word; /* Breaks long words inside the cell */
    overflow: hidden; /* Hides any content that overflows */
    text-overflow: ellipsis; /* Adds ellipsis (...) for overflowed text */
  }
</style>
   
</head>
<body>
    <!-- Navbar (reused from admin dashboard) -->
<%@ include file="adminNav.jsp" %>	
    <div class="container mt-5 " style="margin-right:125px">
        <h2 class=" mb-2">Manage Doctors</h2>

        <!-- Add Doctor Button (Modal trigger) -->
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addDoctorModal">
            Add Doctor
        </button>

        <!-- Doctors Table -->
        <table class="table table-bordered table-hover text-center">
            <thead class="table-dark">
                <tr>
                 <th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 100px;">Doctor ID</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 150px;">Doctor Name</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 150px;">Specialization</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 130px;">Phone Number</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 180px;">Email</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 100px;">Gender</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 150px;">Qualification</th>       
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 130px;">Availability</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 150px;">Consultation Fee</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 150px;">Department</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 100px;">Status</th>
<th style="background-color:grey; color:white; word-wrap: break-word; white-space: normal; width: 100px;">Action</th>

                </tr>
            </thead>
            <tbody>
                <%
                    // Fetching doctor data from the database
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalform", "root", "$$gupta@#9634");
                        stmt = con.createStatement();
                        String query = "SELECT * FROM doctors";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("doctor_id") %></td>
                    <td><%= rs.getString("doctor_name") %></td>
                    <td><%= rs.getString("specialization") %></td>
                    <td><%= rs.getString("phone_number") %></td>
                    <td style=" word-wrap: break-word; white-space: normal; width: 180px;"><%= rs.getString("email") %></td>
                    <td><%= rs.getString("gender") %></td>
                    
                    <td><%= rs.getString("qualification") %></td>
                 
                    <td><%= rs.getString("availability") %></td>
                    <td><%= rs.getBigDecimal("consultation_fee") %></td>
                    <td><%= rs.getString("department") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <!-- Edit Button -->
                        <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editDoctorModal<%= rs.getInt("doctor_id") %>">
                            Edit
                        </button>

                        <!-- Edit Doctor Modal -->
                        <div class="modal fade" id="editDoctorModal<%= rs.getInt("doctor_id") %>" tabindex="-1" aria-labelledby="editDoctorLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editDoctorLabel">Edit Doctor</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="editDoctor" method="post">
                                            <input type="hidden" name="doctor_id" value="<%= rs.getInt("doctor_id") %>">
                                            <div class="mb-3">
                                                <label for="doctorName" class="form-label">Doctor Name</label>
                                                <input type="text" class="form-control" name="doctor_name" value="<%= rs.getString("doctor_name") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="specialization" class="form-label">Specialization</label>
                                                <input type="text" class="form-control" name="specialization" value="<%= rs.getString("specialization") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="phoneNumber" class="form-label">Phone Number</label>
                                                <input type="text" class="form-control" name="phone_number" value="<%= rs.getString("phone_number") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email</label>
                                                <input type="email" class="form-control" name="email" value="<%= rs.getString("email") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="gender" class="form-label">Gender</label>
                                                <input type="text" class="form-control" name="gender" value="<%= rs.getString("gender") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dateOfBirth" class="form-label">Date of Birth</label>
                                                <input type="date" class="form-control" name="date_of_birth" value="<%= rs.getDate("date_of_birth") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="joiningDate" class="form-label">Joining Date</label>
                                                <input type="date" class="form-control" name="joining_date" value="<%= rs.getDate("joining_date") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="address" class="form-label">Address</label>
                                                <input type="text" class="form-control" name="address" value="<%= rs.getString("address") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="qualification" class="form-label">Qualification</label>
                                                <input type="text" class="form-control" name="qualification" value="<%= rs.getString("qualification") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="experience" class="form-label">Experience (Years)</label>
                                                <input type="number" class="form-control" name="experience" value="<%= rs.getInt("experience") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="availability" class="form-label">Availability</label>
                                                <input type="text" class="form-control" name="availability" value="<%= rs.getString("availability") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="consultationFee" class="form-label">Consultation Fee</label>
                                                <input type="number" class="form-control" name="consultation_fee" step="0.01" value="<%= rs.getBigDecimal("consultation_fee") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="department" class="form-label">Department</label>
                                                <input type="text" class="form-control" name="department" value="<%= rs.getString("department") %>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="status" class="form-label">Status</label>
                                                <input type="text" class="form-control" name="status" value="<%= rs.getString("status") %>" required>
                                            </div>
                                            <button type="submit" class="btn btn-success">Update</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Add Doctor Modal -->
    <div class="modal fade" id="addDoctorModal" tabindex="-1" aria-labelledby="addDoctorLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDoctorLabel">Add Doctor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddDoctorServlet" method="post">
                        <div class="mb-3">
                            <label for="doctorName" class="form-label">Doctor Name</label>
                            <input type="text" class="form-control" name="doctor_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="specialization" class="form-label">Specialization</label>
                            <input type="text" class="form-control" name="specialization" required>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" name="phone_number" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <input type="text" class="form-control" name="gender" required>
                        </div>
                        <div class="mb-3">
                            <label for="dateOfBirth" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" name="date_of_birth" required>
                        </div>
                        <div class="mb-3">
                            <label for="joiningDate" class="form-label">Joining Date</label>
                            <input type="date" class="form-control" name="joining_date" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" name="address" required>
                        </div>
                        <div class="mb-3">
                            <label for="qualification" class="form-label">Qualification</label>
                            <input type="text" class="form-control" name="qualification" required>
                        </div>
                        <div class="mb-3">
                            <label for="experience" class="form-label">Experience (Years)</label>
                            <input type="number" class="form-control" name="experience" required>
                        </div>
                        <div class="mb-3">
                            <label for="availability" class="form-label">Availability</label>
                            <input type="text" class="form-control" name="availability" required>
                        </div>
                        <div class="mb-3">
                            <label for="consultationFee" class="form-label">Consultation Fee</label>
                            <input type="number" class="form-control" name="consultation_fee" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label for="department" class="form-label">Department</label>
                            <input type="text" class="form-control" name="department" required>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <input type="text" class="form-control" name="status" required>
                        </div>
                        <button type="submit" class="btn btn-success">Add Doctor</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
