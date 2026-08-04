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
        session.invalidate(); // Invalidate if unauthorized
        response.sendRedirect("main.jsp");
        return;
    }

    // JDBC connection
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalform", "root", "$$gupta@#9634");

        // Check if Approve or Deny button is clicked
        if (request.getParameter("approveId") != null) {
            int approveId = Integer.parseInt(request.getParameter("approveId"));
            String updateQuery = "UPDATE hospitalform SET status = 'Approved' WHERE id = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setInt(1, approveId);
            pstmt.executeUpdate();
            session.setAttribute("message", "Appointment Approved!");
        }

        if (request.getParameter("denyId") != null) {
            int denyId = Integer.parseInt(request.getParameter("denyId"));
            String deleteQuery = "DELETE FROM hospitalform WHERE id = ?";
            pstmt = con.prepareStatement(deleteQuery);
            pstmt.setInt(1, denyId);
            pstmt.executeUpdate();
            session.setAttribute("message", "Appointment Denied and Deleted!");
        }

        if (request.getParameter("approveId") != null || request.getParameter("denyId") != null) {
            response.sendRedirect("appointments.jsp");
            return; // Stop further execution
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Appointments</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <style>
        .fade-out {
            opacity: 1;
            transition: opacity 1s ease-out;
        }
        .fade-out.hide {
            opacity: 0;
        }
    </style>
</head>
<body>
<%@ include file="adminNav.jsp" %>  
<div class="container mt-5">
    <h2 class="mb-4">Manage Appointments</h2>

    <!-- Message to display the result of Approve/Deny actions -->
    <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
    %>
        <div id="message" class="alert alert-info fade-out"><%= message %></div>
    <%
            session.removeAttribute("message");  // Remove message from session after displaying it
        }
    %>

    <!-- Table to display appointments -->
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Doctor Name</th>
                <th>Appointment Submission Date</th>
                <th>Appointment Date</th>
                <th>Time</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Fetching appointment data from the database
                try {
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospitalform", "root", "$$gupta@#9634");
                    stmt = con.createStatement();
                    String query = "SELECT * FROM hospitalform";
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("department") %></td>
                <td><%= rs.getString("doctorname") %></td>
                <td><%= rs.getDate("appointmen_submitt_date") %></td>
                <td><%= rs.getDate("appointment_date") %></td>
                
                <%
                    String timeStr = rs.getString("time");
                    if (timeStr != null && timeStr.length() == 5) {
                        timeStr = timeStr + ":00";
                    }
                %>
                <td><%= timeStr %></td>
                <td><%= rs.getString("status") %></td>
                <td>
                    <!-- Approve Button -->
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="approveId" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-success btn-sm">Approve</button>
                    </form>
                    
                    <!-- Deny Button -->
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="denyId" value="<%= rs.getInt("id") %>">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to deny and delete this appointment?');">Deny</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Hide the message after 3 seconds
    setTimeout(function() {
        var messageDiv = document.getElementById('message');
        if (messageDiv) {
            messageDiv.classList.add('hide');
        }
    }, 3000);  // 3 seconds
</script>
</body>
</html>
