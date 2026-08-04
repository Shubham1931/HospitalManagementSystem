<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .nav-link {
        transition: color 0.3s ease, font-weight 0.3s ease; /* Smooth transition for color and font weight */
    }

    .nav-link:hover {
        color: #0392ce; /* Change to primary color on hover */
        font-weight: bold; /* Bold text on hover */
        text-decoration: none; /* No underline effect on hover */
    }
.nav-link {
        /* Change to primary color on hover */
        font-weight: bold; /* Bold text on hover */
        text-decoration: none; /* No underline effect on hover */
    }
    .navbar {
        background-color: #f8f9fa; /* Maintain background color */
    }
      .info-box {
            padding: 20px;
            border-radius: 5px;
            background-color: #f8f9fa;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
            height: 100%;
        }
        .info-box:hover {
            transform: translateY(-5px);
        }
        .info-box h4 {
            font-weight: bold;
        }</style>
</head>
<body>
<div id="adminNav" class="navbar navbar-expand-lg navbar-light bg-light shadow-sm" style="background-color: #f8f9fa;">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="admin.jsp">Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbarContent" aria-controls="adminNavbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="adminNavbarContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
           
                <li class="nav-item">
                    <a class="nav-link" href="managePatient.jsp">Manage Patients</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="doctors.jsp">Manage Doctors</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="appointments.jsp">Appointments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#timetable">Manage Timetable</a>
                </li>
                
            </ul>
            <div class="d-flex align-items-center">
                <button class="btn btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#addPatientModal">Add New Patient</button>
                <button class="btn btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#newAppointmentModal">Add New Appointment</button>
                <!-- Admin Profile Image -->
                <img src="img/doctor.jpg" alt="Admin Profile" style="width: 40px; height: 40px; border-radius: 50%; cursor: pointer; border: 2px solid #007bff;" data-bs-toggle="modal" data-bs-target="#adminProfileModal">
           <a href="#" onclick="confirmLogout()" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Modal code for New Patient, New Appointment, Admin Profile, and Edit Profile remains the same as previously shared -->


<!-- New Patient Modal -->
<!-- Add New Patient Modal -->
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

<!-- Add New Appointment Modal -->
<div class="modal fade" id="newAppointmentModal" tabindex="-1" aria-labelledby="newAppointmentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newAppointmentModalLabel">Add New Appointment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="addnewAppointment" method="post">
                    <div class="mb-3">
                        <label for="patientNameAppointment" class="form-label">Patient Name</label>
                        <input name="patientName" type="text" class="form-control" id="patientNameAppointment" placeholder="Enter patient name" required>
                    </div>
                      <div class="mb-3">
                        <label for="patientNameAppointment" class="form-label">Patient Email</label>
                        <input name=patientEmail type="email" class="form-control" id="patientNameAppointment" placeholder="Enter patient email" >
                    </div>
                    <div class="mb-3">
                        <label for="appointmentDate" class="form-label">Appointment Date</label>
                        <input name="appointmentDate" type="date" class="form-control" id="appointmentDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="department" class="form-label">Department</label>
                        <select name="department" class="form-select" id="department" required>
                            <option value="">Select Department</option>
                            <option value="cardiology">Cardiology</option>
                            <option value="neurology">Neurology</option>
                            <option value="orthopedics">Orthopedics</option>
                            <option value="pediatrics">Pediatrics</option>
                            <option value="dermatology">Dermatology</option>
                            <option value="gastroenterology">Gastroenterology</option>
                            <option value="radiology">Radiology</option>
                            <option value="urology">Urology</option>
                            <option value="gynecology">Gynecology</option>
                            <option value="psychiatry">Psychiatry</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="doctor" class="form-label">Doctor</label>
                        <select name="doctors" class="form-select" id="doctor" required>
                            <option value="">Select Doctor</option>
                            <option value="dr_smith">Dr. John Smith</option>
                            <option value="dr_jones">Dr. Mary Jones</option>
                            <option value="dr_williams">Dr. James Williams</option>
                            <option value="dr_brown">Dr. Patricia Brown</option>
                            <option value="dr_johnson">Dr. Robert Johnson</option>
                            <option value="dr_davis">Dr. Jennifer Davis</option>
                            <option value="dr_miller">Dr. Charles Miller</option>
                            <option value="dr_moore">Dr. Linda Moore</option>
                            <option value="dr_taylor">Dr. Michael Taylor</option>
                            <option value="dr_anderson">Dr. Elizabeth Anderson</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="appointmentTime" class="form-label">Appointment Time</label>
                        <input name="appointmentTime" type="time" class="form-control" id="appointmentTime" required>
                    </div>
                       <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button  type=submit class="btn btn-primary">Add Appointment</button>
            </div>
                </form>
            </div>
         
        </div>
    </div>
</div>


<!-- Admin Profile Modal -->
<!-- Admin Profile Modal -->
<div class="modal fade" id="adminProfileModal" tabindex="-1" aria-labelledby="adminProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <img src="img/doctor.jpg" alt="Admin Profile" style="width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;">
                <h5 class="modal-title" id="adminProfileModalLabel">Admin Profile</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="adminProfileForm">
                    <div class="mb-3">
                        <label for="adminName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="adminName" placeholder="Enter your name" value="Admin Name" readonly required>
                    </div>
                    <div class="mb-3">
                        <label for="adminEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="adminEmail" placeholder="Enter your email" value="admin@example.com" readonly required>
                    </div>
                    <div class="mb-3">
                        <label for="adminPhone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="adminPhone" placeholder="Enter your phone number" value="123-456-7890" readonly required>
                    </div>
                    <div class="mb-3">
                        <label for="adminAddress" class="form-label">Address</label>
                        <input type="text" class="form-control" id="adminAddress" placeholder="Enter your address" value="123 Admin St, City, Country" readonly required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeButton">Close</button>
                <button type="button" class="btn btn-primary" id="editButton">Edit</button>
                <button type="button" class="btn btn-success d-none" id="saveButton">Save Changes</button> <!-- Initially hidden -->
            </div>
        </div>
    </div>
</div>


<!-- Edit Admin Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editProfileModalLabel">Edit Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="editAdminName" class="form-label">Name</label>
            <input type="text" class="form-control" id="editAdminName" value="Admin Name">
          </div>
          <div class="mb-3">
            <label for="editAdminEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="editAdminEmail" value="admin@example.com">
          </div>
          <div class="mb-3">
            <label for="editAdminPhone" class="form-label">Phone Number</label>
            <input type="text" class="form-control" id="editAdminPhone" value="+1234567890">
          </div>
          <!-- Add additional fields for editing -->
          <button type="submit" class="btn btn-success">Save Changes</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
    document.getElementById('editButton').addEventListener('click', function() {
        // Enable the input fields
        document.getElementById('adminName').removeAttribute('readonly');
        document.getElementById('adminEmail').removeAttribute('readonly');
        document.getElementById('adminPhone').removeAttribute('readonly');
        document.getElementById('adminAddress').removeAttribute('readonly');

        // Toggle button visibility
        this.classList.add('d-none'); // Hide edit button
        document.getElementById('saveButton').classList.remove('d-none'); // Show save button
    });

    document.getElementById('saveButton').addEventListener('click', function() {
        // Disable the input fields after saving
        document.getElementById('adminName').setAttribute('readonly', true);
        document.getElementById('adminEmail').setAttribute('readonly', true);
        document.getElementById('adminPhone').setAttribute('readonly', true);
        document.getElementById('adminAddress').setAttribute('readonly', true);

        // Logic to save changes can be implemented here

        // Toggle button visibility
        this.classList.add('d-none'); // Hide save button
        document.getElementById('editButton').classList.remove('d-none'); // Show edit button
    });

    // Reset the fields when the modal is closed
    document.getElementById('closeButton').addEventListener('click', function() {
        resetFields();
    });

    // Reset fields and button visibility
    function resetFields() {
        // Disable the input fields
        document.getElementById('adminName').setAttribute('readonly', true);
        document.getElementById('adminEmail').setAttribute('readonly', true);
        document.getElementById('adminPhone').setAttribute('readonly', true);
        document.getElementById('adminAddress').setAttribute('readonly', true);

        // Toggle button visibility
        document.getElementById('editButton').classList.remove('d-none'); // Show edit button
        document.getElementById('saveButton').classList.add('d-none'); // Hide save button
    }

    // Reset fields when the modal is hidden
    $('#adminProfileModal').on('hidden.bs.modal', function () {
        resetFields();
    });
</script>
<script type="text/javascript">
    function confirmLogout() {
        var confirmation = confirm("Are you sure you want to logout?");
        if (confirmation) {
            window.location.href = "LogoutServlet";  // Redirect to the LogoutServlet if confirmed
        }
    }
</script>
</body>
</html>