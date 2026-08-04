<%@ page import="com.hospital.web.project.entites.PatientData" %>
<%
    request.getSession();
    PatientData currentPatient = (PatientData) session.getAttribute("currentPatient");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hospital web</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">

  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <style>
    #icon2{
	 display: flex;
	  align-items: center;
  justify-content: center;
}
body.modal-open {
    padding-right: 0 !important;
  }
#nav1{
  height: 60px;
  width: 100%;
  display: flex;
  gap: 10vw;
  width: 100%;
  align-items: center;
  justify-content: center;
  background-color: #fcfcfc;
  border-bottom: 1px solid #f0f0f0;
  }
  #icon2 img{
  margin-top:4px;
  }
    /* Modal styling */
#availabilityModal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 400px;
    z-index: 1000;
}

.modal-content {
    display: flex;
    flex-direction: column;
}

#availableTimes {
    margin-top: 20px;
    font-size: 16px;
}

.hidden {
    display: none;
}
        .custom-time-input {
            position: relative;
            width: 200px;
        }
        .time-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }
        .dropdown {
            display: none;
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            z-index: 1;
            width: 100%;
            max-height: 150px;
            overflow-y: auto;
        }
        .dropdown div {
            padding: 10px;
            cursor: pointer;
        }
        .dropdown div:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body >

  <!-- <---Container Start--->
  <div class="">
    <div class="upwarbox">
      <a href="#nav1"><span class="material-symbols-outlined" style="color:#0392CE; font-size:30px">
        arrow_upward
        </span></a>
    </div>

    <div class="floatingNav" id="floatingNav1">
      <span class="material-symbols-outlined  cross"  onclick="hello2()">
        close
        </span>
      <ul>
        <li> <a href="#nav1" onclick="hello2()">Home</a></li>
        <li data-bs-toggle="modal" data-bs-target="#aboutHospitalModal"> <a  onclick="hello2()">About Us</a> </li>
        <li> <a href="#medicalDepartmentBlock" onclick="hello2()">Departments</a>z</li>
        <li> <a href="#facilitiesBlock" onclick="hello2()">facilites</a> </li>
        <li> <a href="" onclick="hello2()">News</a></li>
        <li> <a href="" onclick="hello2()">Shop</a></li>
        <li> <a href="#appointmentBlock" onclick="hello2()"> Contact Us</a> </li>
      </ul>
    </div>
    <header>
     <div id="nav1">
     
    <div id="icon1">
    
        <div id="iconImg">
            <span class="material-symbols-outlined">medical_services</span>
        </div>
        <div id="quote">24 hours emergency & ambulance Service: +321 789 01 2345</div>
    </div>
    <div id="icon2">
        <img src="img/facebook-2935402_1280-removebg-preview.png" alt="" height="40px" width="40px">
        <img src="img/instagram-2935404_1280-removebg-preview.png" alt="" height="40px" width="40px">
        <img src="img/linkedin-2935407_1280-removebg-preview.png" alt="" height="40px" width="40px">
        <img src="img/twitter-2935414_1280-removebg-preview.png" alt="" height="40px" width="40px">
        <img src="img/hamburger.png" class="hamburger" id="ham" height="42px" onclick="navShow()">

    <div class="container mt-4">
    <%
        if (currentPatient != null) {
    %>
        <div class="d-flex align-items-center" style="margin-bottom:30px;">
            <img src="img/<%= currentPatient.getProfilePic() %>" alt="Profile Picture" class="profile-pic rounded-circle me-3" width="50" height="50" data-bs-toggle="modal" data-bs-target="#patientModal">
            <p class="mb-0">Welcome, <%= currentPatient.getName() %>!</p>
            <a href="LogoutServlet" class="btn btn-danger ms-3" style="width:70px"  onclick="return confirmLogout()">Logout</a>
        </div>
         <!-- Patient Details Modal -->
        <div class="modal fade" id="patientModal" tabindex="-1" aria-labelledby="patientModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="patientModalLabel">Patient Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="patientDetailsForm">
                            <div class="mb-3">
                                <label for="patientName" class="form-label">Name</label>
                                <input type="text" class="form-control" id="patientName" value="<%= currentPatient.getName() %>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="patientId" class="form-label">Patient ID</label>
                                <input type="text" class="form-control" id="patientId" value="<%= currentPatient.getId() %>" disabled>
                            </div>
                            <div class="mb-3">
                                <label for="patientEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="patientEmail" value="<%= currentPatient.getEmail() %>" disabled>
                            </div>
                            <div class="mb-3 d-none" id="profilePicSection">
                                <label for="profilePic" class="form-label">Change Profile Picture</label>
                                <input type="file" class="form-control" id="profilePic">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="editBtn">Edit</button>
                        <button type="button" class="btn btn-success d-none" id="saveBtn">Save Changes</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    <%
        } else {
    %>
        <a href="main.jsp" class="btn btn-primary" style="width: 43%;    margin-bottom: 22px;
}">Login</a>
       
<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#signupModal" style="width: 45%;     margin-bottom: 22px;
}">
  Signup
</button>

<!-- Bootstrap Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="signupModalLabel">Sign Up</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Signup Form -->
        <form action="signupServlet" method="POST">
          <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
          </div>
          <button type="submit" class="btn btn-primary" style="width: 45%;" >Sign Up</button>
        </form>
      </div>
    </div>
  </div>
</div>
    <%
        }
    %>
</div>
    </div>
</div>
      <div id="nav2">
        <div class="item1">
          <img src="imghttp://st.ourhtmldemo.com/new/Hospitals/images/resources/logo.png" alt="">
        </div>
        <div class="item2">
          <span class="material-symbols-outlined" style="font-size: 50px; color: #0392CE; font-weight: 100;">
            phone_iphone
          </span>
          <div class="info">
            <h3 id="">Call us now</h3>
            <p>+1-888-987-6543</p>
          </div>
        </div>
        <div class="item3">
          <span class="material-symbols-outlined hello " style="font-size: 50px; color: #0392CE; font-weight: 100;">
            location_on
          </span>
          <div class="info2">
            <h3>121 Park Drive</h3>
            <p>Varick St, Newyork 1006</p>
          </div>
        </div>
        <div class="item4">
          <span class="material-symbols-outlined" style="font-size: 50px; color: #0392CE; font-weight: 100;">
            calendar_month
          </span>
          <div class="info3">
            <h3>Mon - Saturday</h3>
            <p>09.00am to 8.00pm</p>
          </div>
        </div>
      
      </div>
      <div id="mainNav">
        <ul>
          <li>Home</li>
          <li data-bs-toggle="modal" data-bs-target="#aboutHospitalModal" style="cursor:pointer">About Us</li>
          <li> <a href="#medicalDepartmentBlock" style="text-decoration:none; color:black;">Departments</a> </li>
          <li>Time Table</li>
          <li>News</li>
          <li>Shop</li>
          <li>Contact Us</li>
        </ul>
        <div class="cartIcon">
          <span class="material-symbols-outlined" style="font-size: 22px;">
            shopping_cart
          </span>
      
        </div>
        <button class="btn2" data-bs-toggle="modal" data-bs-target="#consultationModal">For consultation</button>
        <!-- start of modal -->
        
        <div class="modal fade" id="consultationModal" tabindex="-1" aria-labelledby="consultationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="consultationModalLabel" >Book a Consultation</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="patientName" class="form-label">Your Name</label>
            <input type="text" class="form-control" id="patientName" required>
          </div>
          <div class="mb-3">
            <label for="patientEmail" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="patientEmail" required>
          </div>
          <div class="mb-3">
            <label for="consultationDate" class="form-label">Preferred Date</label>
            <input type="date" class="form-control" id="consultationDate" required>
          </div>
          <div class="mb-3">
            <label for="consultationTime" class="form-label">Preferred Time</label>
            <input type="time" class="form-control" id="consultationTime" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
      </div>
    </div>
  </div>
</div>
         <!-- end of modal -->
        
      </div>
    </header>
    <div id="carouselExampleCaptions" class="carousel slide">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
          aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
          aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
          aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active carouselHeight">
          <img src="http://st.ourhtmldemo.com/new/Hospitals/images/slides/2.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <div class="carousel-content">
              <h3 style="color: black; padding-top: 20px;"> Hospitals providing total healthcare <span>solutions</span></h3>
              <p style="color: black; padding-top:15px; font-size: 18px;" >Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consequatur corrupti,
                rem accusantium placeat perferendis impedit!</p>
              <div id="btn">
                <button id="btn1" data-bs-toggle="modal" data-bs-target="#aboutHospitalModal">Read More</button>
            <!-- start of modal -->    
            
            
<div class="modal fade" id="aboutHospitalModal" tabindex="-1" aria-labelledby="aboutHospitalModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="aboutHospitalModalLabel" style="color:black;">Hospital Name</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="color:black;">
        <h6>Our Mission</h6>
        <p>
          At [Hospital Name], our mission is to provide compassionate, high-quality healthcare to every patient. 
          We strive to enhance the health and well-being of our community through exceptional service and innovative care.
        </p>
        
        <h6>Our Vision</h6>
        <p>
          To be the leading healthcare provider in our community, recognized for our commitment to patient-centered care, 
          advanced medical technology, and outstanding clinical outcomes.
        </p>

        <h6>Core Values</h6>
        <ul>
          <li>Compassion</li>
          <li>Excellence</li>
          <li>Integrity</li>
          <li>Teamwork</li>
          <li>Innovation</li>
        </ul>

        <h6>Comprehensive Services</h6>
        <p>
          From routine check-ups to specialized treatments, [Hospital Name] offers a wide range of services designed to meet 
          the diverse needs of our patients. Our dedicated team of healthcare professionals is committed to delivering 
          personalized care in a comfortable environment.
        </p>
        
        <h6>Community Commitment</h6>
        <p>
          As a cornerstone of our community, [Hospital Name] is dedicated to improving health and wellness through 
          community outreach programs, health education, and preventive care initiatives.
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary w-50" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  <!-- end of modal -->    
                
            
             <a href="#medicalDepartmentBlock"><button id="btn2"> Departments </button></a>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item carouselHeight">
          <img src="http://st.ourhtmldemo.com/new/Hospitals/images/slides/3.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <div class="carousel-item carouselHeight">
          <img src="http://st.ourhtmldemo.com/new/Hospitals/images/slides/1.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <!-- <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p> -->
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
        data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
        data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
          
<form action="hospitalform" method="post" id="appointmentformalert3">
    <div class="appointment" id="appointmentBlock">
      <div class="appointmentCont">
       <div>
      <div class="boxMargin">
        <span class="material-symbols-outlined " style=" font-size: 50px; color: white;" >
          calendar_month
          </span>
      </div>
       <h4 id="appointHead">make an appointment</h4>
       </div>
      </div>

      <div class="appointForm">
     
        <div class="appointformcont">
          <input type="text" name="name" id="inputName" placeholder="Enter Name">
           <input type="text" name="patientEmail" id="inputName" placeholder="Enter Email">
<select id="DepartmentOpt" name="department" style=" color: #a8a7a7;">
  <option value="Cardiology">Cardiology</option>
  <option value="Pulmonology">Pulmonology</option>
  <option value="Gynecology">Gynecology</option>
  <option value="Neurology">Neurology</option>
  <option value="Laboratory">Laboratory</option>
  <option value="Pediatrician">Pediatrician</option>
  <option value="Gastrology">Gastrology</option>
  <option value="Urology">Urology</option>
</select>
        </div>
<div class="appointformcont2">
  <select id="doctorName" name="doctorName" style=" color: #a8a7a7;">
    <option value="Alen-Bailey">Alen Bailey</option>
    <option value="Giles Franklin">Giles Franklin</option>
    <option value="Edgar Denzil">Edgar Denzil</option>
    <option value="Basil Andrew">Basil Andrew</option>
      </select>
   <input name="date" id="inputDate" type="date" style="color: #a8a7a7;" placeholder="ENTER DATE">
    <div class="custom-time-input">
        <input name="appointmentTime" type="text" id="timeInput" class="time-input" placeholder="Select Time" readonly>
        <div id="timeDropdown" class="dropdown">
            <!-- Time Options -->
            <div data-value="07:00 AM">07:00 AM</div>
            <div data-value="08:00 AM">08:00 AM</div>
            <div data-value="09:00 AM">09:00 AM</div>
            <div data-value="10:00 AM">10:00 AM</div>
             <div data-value="11:00 AM">11:00 AM</div>
            <div data-value="12:00 PM">12:00 PM</div>
              <div data-value="01:00 PM">01:00 PM</div>
            <div data-value="02:00 PM">02:00 PM</div> 
             <div data-value="03:00 PM">03:00 PM</div>
            <div data-value="04:00 PM">04:00 PM</div>  
            <div data-value="05:00 PM">05:00 PM</div>
            <div data-value="06:00 PM">06:00 PM</div>
              <div data-value="07:00 PM">07:00 PM</div>
            <div data-value="08:00 PM">08:00 PM</div> 
             <div data-value="09:00 PM">09:00 PM</div>
           
        </div>
    </div>

</div>
      </div>
     <div class="btnclass" style="display: flex; gap:10px;">
      <button type="submit" class="btn3"><span class="material-symbols-outlined" >
        send
        </span></button>
           <button type="button" id="timebtn" class="btn3" data-bs-toggle="modal" data-bs-target="#checkAvailabilityModal" >
            <span class="material-symbols-outlined">search</span> Check Available Times
        </button>
     
     </div>
  <div class="modal fade" id="checkAvailabilityModal" tabindex="-1" aria-labelledby="checkAvailabilityModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="checkAvailabilityModalLabel" >Check Available Times</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="checkDate">Enter Date:</label>
                <input type="date" id="checkDate" class="form-control">
	<select  name="doctorName" id="drName">
    <option value="Alen-Bailey">Alen Bailey</option>
    <option value="Giles Franklin">Giles Franklin</option>
    <option value="Edgar Denzil">Edgar Denzil</option>
    <option value="Basil Andrew">Basil Andrew</option>
    </select>
                <!-- Area to display available times -->
                <div id="availableTimes" class="mt-3">
                    <!-- Available times will be displayed here -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="    width: 120px;">Close</button>
                <button type="button" id="checkTimesBtn" class="btn btn-primary" style="    width: 120px;">Check Times</button>
            </div>
        </div>
    </div>
</div>
        
    </div>
    </form>
    <section class="medicalDepartment" id="medicalDepartmentBlock">
      <div class="lineAni">
        <h1 class="medicalHeading">medical Department</h1>
      </div>
      <div id="cardContainer">
        <div class="card" style="width: 18rem;">
          <span class="material-symbols-outlined  text-center text-center " style="font-size: 100px; font-weight: 100;">
            neurology
            </span>
          <div class="card-body">
            <h5 class="card-title text-center">Neurology</h5>
            <p class="card-text text-center">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <div class="flex">
              <button id="btn1" class=" text-center " data-bs-toggle="modal" data-bs-target="#readMoreModal" >Read More</button>
              
      <!-- start of modal -->
      
      <div class="modal fade" id="readMoreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content text-center">
      <div class="modal-header ">
        <h5 class="modal-title" id="exampleModalLabel">Neurology</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Content Layout: Text on Left, Image on Right -->
        <div class="row">
          <!-- Text on the left -->
          <div class="col-md-6">
            <p>
             Neurology is a medical specialty that focuses on the diagnosis and treatment of diseases and conditions that affect the nervous system. The nervous system is a complex system that controls and coordinates the body's activities, and includes the brain, spinal cord, and peripheral nerves
            </p>
          </div>
          <!-- Image on the right -->
          <div class="col-md-6">
            <img src="img/neurology.jpg" alt="Your Image" class="img-fluid">
          </div>
        </div>
      </div>
          </div>
  </div>
</div>
        <!-- end of modal -->
            </div>
          </div>
        </div>
        <div class="card" style="width: 18rem;">
          <span class="material-symbols-outlined  text-center text-center " style="font-size: 100px; font-weight: 100;">
            gynecology
            </span>
          <div class="card-body">
            <h5 class="card-title text-center"> Gynecology</h5>
            <p class="card-text text-center">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <div class="flex">
              <button id="btn1" class=" text-center" data-bs-toggle="modal" data-bs-target="#readMoreModal2">Read More</button>
              <!-- start of modal -->
              
              
                <div class="modal fade" id="readMoreModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content text-center">
      <div class="modal-header ">
        <h5 class="modal-title" id="exampleModalLabel">Gynecology</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Content Layout: Text on Left, Image on Right -->
        <div class="row">
          <!-- Text on the left -->
          <div class="col-md-6">
            <p>
            Gynecology is a medical specialty that focuses on the health of the female reproductive system, including the diagnosis, prevention, and treatment of diseases and disorders. Gynecologists are fully trained medical doctors who have at least eight years of medical study and training.
            </p>
          </div>
          <!-- Image on the right -->
          <div class="col-md-6">
            <img src="img/gynecology.jpeg" alt="Your Image" class="img-fluid">
          </div>
        </div>
      </div>
          </div>
  </div>
</div>
              <!-- end of modal -->
            </div>
          </div>
        </div><div class="card" style="width: 18rem;">
          <span class="material-symbols-outlined  text-center text-center " style="font-size: 100px; font-weight: 100;">
            Urology
            </span>
          <div class="card-body">
            <h5 class="card-title text-center"> urology</h5>
            <p class="card-text text-center">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <div class="flex">
              <button id="btn1" class=" text-center"  data-bs-toggle="modal" data-bs-target="#readMoreModal3">Read More</button>
              <!-- start of modal -->
              
                <div class="modal fade" id="readMoreModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content text-center">
      <div class="modal-header ">
        <h5 class="modal-title" id="exampleModalLabel">Urology</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Content Layout: Text on Left, Image on Right -->
        <div class="row">
          <!-- Text on the left -->
          <div class="col-md-6">
            <p>
            Urology, also known as genitourinary surgery, is a medical specialty that focuses on the diagnosis and treatment of diseases of the urinary and reproductive systems:

            </p>
          </div>
          <!-- Image on the right -->
          <div class="col-md-6">
            <img src="img/urology.jpeg" alt="Your Image" class="img-fluid">
          </div>
        </div>
      </div>
          </div>
  </div>
</div>
              
              <!-- end of modal -->
            </div>
          </div>
        </div><div class="card" style="width: 18rem;">
          <span class="material-symbols-outlined  text-center text-center " style="font-size: 100px; font-weight: 100;">
            pulmonology
            </span>
          <div class="card-body">
            <h5 class="card-title text-center">pulmonology</h5>
            <p class="card-text text-center">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <div class="flex">
              <button id="btn1" class=" text-center"  data-bs-toggle="modal" data-bs-target="#readMoreModal4">Read More</button>
              <!-- end of modal -->
              
                <div class="modal fade" id="readMoreModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content text-center">
      <div class="modal-header ">
        <h5 class="modal-title" id="exampleModalLabel">Pulmonology</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Content Layout: Text on Left, Image on Right -->
        <div class="row">
          <!-- Text on the left -->
          <div class="col-md-6">
            <p>
            Pulmonology is considered a branch of internal medicine, and is related to intensive care medicine. Pulmonology often involves managing patients who need life support and mechanical ventilation. Pulmonologists are specially trained in diseases and conditions of the chest, particularly pneumonia, asthma, tuberculosis, emphysema, and complicated chest infections
            </p>
          </div>
          <!-- Image on the right -->
          <div class="col-md-6">
            <img src="img/pulmonology.jpeg" alt="Your Image" class="img-fluid">
          </div>
        </div>
      </div>
          </div>
  </div>
</div>
              <!-- end of modal -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="services"> 
      <div class="servicesContainer">
        <div class="serviceImg"> <img src="img/doctor.jpg" alt=""></div>
        <div>
          <div class="serviceInfo">
            <div class="serviceDes">
              <div class="lineAni2">
                <h1 class="medicalHeading">Our <span>services</span></h1>
              </div>
              <h3>Laboratory Analysis</h3>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. A, vitae! Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium repudiandae hic quis natus veritatis fugit quas id culpa eligendi consequuntur?</p>
              <button id="btn1" class=" text-center labBtn">Read More</button>
              
             
              <!-- start of modal -->
              
                <div class="modal fade" id="readMoreModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content text-center">
      <div class="modal-header ">
        <h5 class="modal-title" id="exampleModalLabel">Neurology</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Content Layout: Text on Left, Image on Right -->
        <div class="row">
          <!-- Text on the left -->
          <div class="col-md-6">
            <p>
             Neurology is a medical specialty that focuses on the diagnosis and treatment of diseases and conditions that affect the nervous system. The nervous system is a complex system that controls and coordinates the body's activities, and includes the brain, spinal cord, and peripheral nerves
            </p>
          </div>
          <!-- Image on the right -->
          <div class="col-md-6">
            <img src="img/neurology.jpg" alt="Your Image" class="img-fluid">
          </div>
        </div>
      </div>
          </div>
  </div>
</div>
              
               <!-- end of modal -->
            </div>
            <div class="serviceImg2">
              <img src="img/service-big-2.jpg" alt="" style="margin-top: 10vw; margin-right: 5vw;">
            </div>
          </div>
          <div>
          <div class="shortCard">
        <div class="img1">
          <img src="img/service-small-1.jpg" alt="">
          <h5 style="text-align: center;">Opthalmology</h5>
          <div class="overlay" >
            <span class="material-symbols-outlined" style="color: white;font-size: 50px;">
              add
              </span>
          </div>
        </div>
        <div class="img2">
          <img src="img/service-small-2.jpg" alt="">
          <h5 style="text-align: center;">Laboratory</h5>
          <div class="overlay" >
            <span class="material-symbols-outlined" style="color: white;font-size: 50px;">
              add
              </span>
          </div>
        </div>  
        <div class="img3">
          <img src="img/service-small-3.jpg" alt="">
          <h5 style="text-align: center;">Cardiac Clinic</h5>
          <div class="overlay" >
            <span class="material-symbols-outlined" style="color: white;font-size: 50px;">
              add
              </span>
          </div>
        </div>
        <div class="img4">
            <img src="img/service-small-4.jpg" alt="">
          <h5 style="text-align: center;">OutPatient</h5>
          <div class="overlay" >
            <span class="material-symbols-outlined" style="color: white;font-size: 50px;">
              add
              </span>
          </div>
        </div>
          </div>
          </div>

        </div>
      </div>
    </section>
    <section class="consultation" id="consultaionBlock">
      <div class="lineAni3">
        <h1 class="medicalHeading"><span>team</span> of Consultants</h1>
      </div>
      <div class="team">
        <div class="imgCont">
          <img src="img/1.jpg" alt="">
          <div class="overlay2">
            <h4>Marc Parcival</h4>
           <p>Newyork</p>
          </div>
          <div class="overlay3">
            <div class="overlayInfo">
              <p>Marc Parcival</p>
              <p style="font-size: 15px;">Newyork</p>
              <p>+090239932</p>
              <p style="font-size: 15px;"> Bailey@Hospitals.com</p>
            </div>
          </div>
        </div>
        <div class="imgCont">
          <img src="img/2.jpg" alt="">
          <div class="overlay2">
            <h4>Marc Parcival</h4>
            <p>Newyork</p>
          </div>
          <div class="overlay3">
            <div class="overlayInfo">
              <p>Marc Parcival</p>
              <p style="font-size: 15px;">Newyork</p>
              <p>+090239932</p>
              <p style="font-size: 15px;"> Bailey@Hospitals.com</p>
            </div>
          </div>
        </div>
        <div class="imgCont">
          <img src="img/3.jpg" alt="">
          <div class="overlay2">
            <h4>Alen Bailey</h4>
            <p>Newyork</p>
          </div>
           <div class="overlay3">
            <div class="overlayInfo">
              <p>Alen Bailey</p>
              <p style="font-size: 15px;">Newyork</p>
              <p>+090239932</p>
              <p style="font-size: 15px;"> Bailey@Hospitals.com</p>
            </div>
           </div>
        </div>
        <div class="imgCont">
          <img src="img/4.jpg" alt="">
          <div class="overlay2">
            <h4>Edgar Denzil</h4>
            <p>Newyork</p>
          </div>
           <div class="overlay3">
            <div class="overlayInfo">
              <p>Edgar Denzil</p>
              <p style="font-size: 15px;">Newyork</p>
              <p>+090239932</p>
              <p style="font-size: 15px;"> Bailey@Hospitals.com</p>
            </div>
           </div>
        </div>
      </div>
    </section>
    <section class="hospitalInfo" id="changeingnum">
        <h1 class="text-center " id="hospitalInfohead">Keep Your Headup & Be Patient</h1>  
      <p class=" fs-5 mt-3" id="hospitalInfopara"> Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsum nam eveniet fuga placeat porro perspiciatis sunt molestias expedita dolorum nisi!</p>
     <div class="d-flex justify-content-evenly flexcont flexColumn">
      <div class="d-flex justify-content-center align-items-center flex-column  bor"><span class="material-symbols-outlined" style="font-size: 13vh;">
        healing
        </span> <h4 id="changeingnum1"> </h4>
      <p>Years Of Experience</p></div>
      <div class="d-flex justify-content-center align-items-center flex-column bor"><span class="material-symbols-outlined" style="font-size: 13vh;">
        sentiment_satisfied
        </span>
      <h4 id="changeingnum2"> </h4>
    <p>Well Smiley Faces
    </p></div>
      <div class="d-flex justify-content-center align-items-center flex-column bor "><span class="material-symbols-outlined"style="font-size: 13vh;">
        cardiology
        </span>  <h4 id="changeingnum3"> </h4>
        Heart Transplant</div>
      <div class="d-flex justify-content-center align-items-center flex-column bor">
        <span class="material-symbols-outlined" style="font-size: 13vh;">
          emoji_events
          </span>
          <h4 id="changeingnum4"> </h4>
          Awards Holded
      </div>
     </div>
    </section>
    <section class="facilities position-relative" id="facilitiesBlock">
      <h1  class="position-absolute my-4 facilitiesHead "> Our <span style="color: #0392CE;">Facilities</span></h1>
      <div class="facilitiesinfo">
          <div class="facilites1 d-flex align-items-center justify-content-center m-xl-3">
            <div class="icon"><span class="material-symbols-outlined " style="font-size: 40px;">
              ambulance
              </span></div>
            <div class="facilitiesinfo1">
              <h3>24 Hrs Ambulance</h3>
             <p class="facilitespara"> How all this mistaken idea denoucing pleasure and praisings pain was born complete account expound.</p>
            </div>
          </div>
          <div class="facilites2  d-flex align-items-center justify-content-center m-xl-3">
            <div class="icon">
              <span class="material-symbols-outlined" style="font-size: 40px;">
                restaurant_menu
                </span>
            </div>
         <div class="facilitiesinfo2">
          <h3>Food &amp; Dietary</h3>
          <p class="facilitespara">The Dietitian plans the diet based on the therapeutic needs of the patient, Local specialties, Continental.</p>
         </div>
          </div>
          <div class="facilites3  d-flex align-items-center justify-content-center my-3 m-xl-3" >
            <div class="icon">
              <span class="material-symbols-outlined" style="font-size: 40px;">
                medication
                </span>
            </div>
            <div class="facilitiesinfo3">
              <h3>Special Nurses</h3>
              <p class="facilitespara">Special nurse services can be arranged through Nursing , master of human happiness.</p>
            </div>
          </div>
          <div class="facilites4  d-flex align-items-center justify-content-center my-3 m-xl-3">
            <div class="icon">
              <span class="material-symbols-outlined" style="font-size: 40px;">
                temple_hindu
                </span>
            </div>
            <div class="facilitiesinfo4">
              <h3>Places of Worship</h3>
              <p class="facilitespara">There is a temple of Goddess Krishna mariamman in the hospital premises, a Namaz room &amp; Prayer cell</p>
            </div>
          </div>
      </div>
      <form action="hospitalform" method="post" id="appointmentformalert2">
      <div class="appointform2">
        <h4 class="text-uppercase ">make an <span style="color: #0392CE;">appointment</span></h4>
        <div class="d-flex justify-content-center flex-column align-items-center">
          <input id="namefield" name="name" type="text" placeholder="ENTER YOUR NAME" style="color: #c0bebd;">
        <input type="email" name="patientEmail" id="inputemail1" placeholder="ENTER YOUR EMAIL" style="color: #c0bebd;">
        <select id="DepartmentOpt1" name="department">
          <option id="hello" value="Cardiology">Select Department</option>
          <option value="Cardiology">Cardiology</option>
          <option value="Pulmonology">Pulmonology</option>
          <option value="Gynecology">Gynecology</option>
          <option value="Neurology">Neurology</option>
          <option value="Laboratory">Laboratory</option>  
          <option value="Pediatrician">Pediatrician</option>
          <option value="Gastrology">Gastrology</option>
          <option value="Urology">Urology</option>
        </select>
        <select id="doctorOpt1" name="doctorName">
          <option value="Alen-Bailey">Select Doctor</option>
          <option value="Alen-Bailey">Alen Bailey</option>
          <option value="Giles Franklin">Giles Franklin</option>
          <option value="Edgar Denzil">Edgar Denzil</option>
          <option value="Basil Andrew">Basil Andrew</option>
        </select>
        <input name="date" id="inputDate1" type="date" style="color: #a8a7a7;" placeholder="ENTER DATE">
    <div class="custom-time-input">
        <input name="appointmentTime" type="text" id="timeInput1" class="time-input" placeholder="Select Time" readonly>
        <div id="timeDropdown1" class="dropdown">
            <!-- Time Options -->
            <div data-value="07:00 AM">07:00 AM</div>
            <div data-value="08:00 AM">08:00 AM</div>
            <div data-value="09:00 AM">09:00 AM</div>
            <div data-value="10:00 AM">10:00 AM</div>
             <div data-value="11:00 AM">11:00 AM</div>
            <div data-value="12:00 PM">12:00 PM</div>
              <div data-value="01:00 PM">01:00 PM</div>
            <div data-value="02:00 PM">02:00 PM</div> 
             <div data-value="03:00 PM">03:00 PM</div>
            <div data-value="04:00 PM">04:00 PM</div>  
            <div data-value="05:00 PM">05:00 PM</div>
            <div data-value="06:00 PM">06:00 PM</div>
              <div data-value="07:00 PM">07:00 PM</div>
            <div data-value="08:00 PM">08:00 PM</div> 
             <div data-value="09:00 PM">09:00 PM</div>
           
        </div>
    </div>


        <button class="submitBtn" type="submit" class="fs-6 text-uppercase">Submit</button>
        </div>
      </div>
      </form>
    </section>
    <section class="quote d-flex justify-content-center align-items-center ">
      <img src="img/latest-blog-1.jpg" alt="">
     <div class="quoteinfo d-flex justify-content-center align-items-center flex-column">
      <h1 class="mb-5">You’re In Good Hands</h1>
      <p>We believe in bringing the most modern techniques and delivering extraordinary care to ailing population with the highest levels of ethics and standards. We are committed to continuing medical education, through our fellowship and DNB programs.

        We organize atleast one conference a month and support research foundation for continued advancement.</p>
     </div>
    </section>
    <footer>
      <div class="foot-panel2">
        <ul>
          <h4 style="margin-top: 12px;">Get Know Us</h4>
          <a>Careers</a> 
            <a>Blog</a>
            <a>About hospital</a>
            <a>Investor Relations</a>
            <a>hospital Devices</a>
            <a>hospital Science</a>
        </ul>
        <ul>
          <h4 style="margin-top: 12px;">Usefull Links</h4>
          <a>About Us</a> 
            <a>Awards</a>
            <a>Consultants</a>
            <a>Working Hours</a>
            <a> Procedure</a>
            <a>Special Offer</a>
            <a>FAQ's</a>
            <a>Healthy Food</a>
          
        </ul>
        <ul>
          <h4 style="margin-top: 12px;">Contact Details</h4>
          <p class="d-flex justify-content-center align-items-center">
            <span class="material-symbols-outlined">
              home
              </span>
            Park Drive, Varick Str New York,
            NY 10012, USA</p>
            <p class="d-flex justify-content-center align-items-center footerPara1">
              <span class="material-symbols-outlined">
                mail
                </span>
              Getwell@Hospitals.com</p>
              <p class="d-flex justify-content-center align-items-center footerPara2 "> 
                <span class="material-symbols-outlined">
                call
                </span>(123) 0200 12345 & 7890</p>
              <p class="d-flex justify-content-center align-items-center footerPara3"> 
                <span class="material-symbols-outlined">
                calendar_month
                </span>Mon-Satday: 9am to 18pm</p>
        </ul>

        <div class="appointform3" >
                <form action="Hospital" method="post" id="appointmentformalert2">
          <h4 class="text-uppercase " style="color: white;text-align: center;">make an appointment</h4>
          <div class="d-flex justify-content-center flex-column align-items-center">
            <input id="
" name="name" type="text" placeholder="ENTER YOUR NAME" style="color: #c0bebd; background-color: #222222; border: none;">
          <input type="email" name="email" id="" placeholder="ENTER YOUR EMAIL" style="color: #c0bebd;background-color: #222222; border: none;">
          <select id="DepartmentOpt3" name="department">
            <option id="hello" value="Cardiology">Select Department</option>
            <option value="Cardiology">Cardiology</option>
            <option value="Pulmonology">Pulmonology</option>
            <option value="Gynecology">Gynecology</option>
            <option value="Neurology">Neurology</option>
            <option value="Laboratory">Laboratory</option>  
            <option value="Pediatrician">Pediatrician</option>
            <option value="Gastrology">Gastrology</option>
            <option value="Urology">Urology</option>
          </select>
          <select id="doctorOpt3" name="doctorName">
            <option value="Alen-Bailey">Select Doctor</option>
            <option value="Alen-Bailey">Alen Bailey</option>
            <option value="Giles Franklin">Giles Franklin</option>
            <option value="Edgar Denzil">Edgar Denzil</option>
            <option value="Basil Andrew">Basil Andrew</option>
          </select>
          <button type="submit" id="btn4" class="fs-6 text-uppercase" style="width: 10vw;">Submit</button>
          </div>
           </form>
        </div>
          
      </div>
   
      <div class="foot-panel4">
        <div class="pages">
          <a>Condition of use</a>
          <a>Privacy Notice</a>
          <a>Your Ads Privacy Choices</a>
        </div>
        <div class="copyright">
          © 1996-2023, hospital.com, Inc. or its affiliates
        </div>
      </div>
    </footer>
    </div>
    <!-- <---Container End--->
  <script src="script.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
function confirmLogout() {
    if (confirm("Are you sure you want to log out?")) {
        // If the user confirms, proceed with logout
        return true;
    } else {
        // If the user cancels, prevent the logout
        return false;
    }
}
console.log("running");

function myFunction1(){
    var num = 1;
    timer = setInterval(() => {
        if(num<31){
            var change = document.getElementById('changeingnum1');
            change.innerHTML = num ;
            num++;
        }
    }, 100);
}
// myFunction1();
function myFunction2(){
    var num = 1;
    timer = setInterval(() => {
        if(num<1001){
            var change2 = document.getElementById('changeingnum2');
            change2.innerHTML = num ;
            num++;
        }
    }, 5);
}
// myFunction2();
function myFunction3(){
    var num = 1;
    timer = setInterval(() => {
        if(num<41){
            var change3 = document.getElementById('changeingnum3');
            change3.innerHTML = num ;
            num++;
        }
    }, 80);
}
// myFunction3();
function myFunction4(){
    var num = 1;
    timer = setInterval(() => {
        if(num<21){
            var change4 = document.getElementById('changeingnum4');
            change4.innerHTML = num ;
            num++;
        }
    }, 100);
}
// myFunction4();
var mMove  = document.getElementById('changeingnum');
mMove.addEventListener("mousemove",function(){
    myFunction4();
    myFunction1();
    myFunction2();
    myFunction3();    
}, {once : true})
navShow = ()=>{
    var hello = document.querySelector("#floatingNav1")
    hello.style.display = "block"
    // console.log(hello)
}
hello2 = ()=>{
    var hello = document.querySelector("#floatingNav1")
    hello.style.display = "none"
}
</script>
<script>
$(document).ready(function() {
   

    // Same logic for the third form
    $('#appointmentformalert3').on('submit', function(event) {
        event.preventDefault();

        var name3 = $('#inputName').val().trim();
        var appointmentDate = $('#inputDate').val().trim();
        var appointmentTime = $('#timeInput').val().trim();

        if (name3 === "") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please enter your name!',
            });
        } else {
           
            $.ajax({
                type: 'POST',
                url: 'CheckAppointmentsServlet',
                data: {
                    date: appointmentDate,
                    appointmentTime: appointmentTime
                },
                success: function(response) {
                   
                    if (response.trim() === "available") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Appointment Available!',
                            text: 'Your appointment form 3 is being submitted.',
                        }).then(() => {
                            $('#appointmentformalert3')[0].submit();
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Time Unavailable',
                            text: 'The selected time is already booked. Please choose another time.',
                        });
                    }
                },
                error: function() {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error occurred while checking appointment availability. Please try again later.',
                    });
                }
            });
        }
    });
    // Same logic for the secomd form
    $('#appointmentformalert2').on('submit', function(event) {
        event.preventDefault();

        var name3 = $('#namefield').val().trim();
        var appointmentDate = $('#inputDate1').val().trim();
        var appointmentTime = $('#timeInput1').val().trim();

        if (name3 === "") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please enter your name!',
            });
        } else {
           
            $.ajax({
                type: 'POST',
                url: 'CheckAppointmentsServlet',
                data: {
                    date: appointmentDate,
                    appointmentTime: appointmentTime
                },
                success: function(response) {
                   
                    if (response.trim() === "available") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Appointment Available!',
                            text: 'Your appointment form 3 is being submitted.',
                        }).then(() => {
                            $('#appointmentformalert2')[0].submit();
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Time Unavailable',
                            text: 'The selected time is already booked. Please choose another time.',
                        });
                    }
                },
                error: function() {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error occurred while checking appointment availability. Please try again later.',
                    });
                }
            });
        }
    });
});


</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Toggle the dropdown on input click
    document.getElementById('timeInput1').addEventListener('click', function () {
        var dropdown = document.getElementById('timeDropdown1');
        dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
    });

    // Close the dropdown when clicking outside
    window.onclick = function (event) {
        if (!event.target.matches('#timeInput1')) {
            var dropdown = document.getElementById('timeDropdown1');
            if (dropdown.style.display === 'block') {
                dropdown.style.display = 'none';
            }
        }
    };

    // Set the input value when a time option is clicked
    var timeOptions = document.querySelectorAll('#timeDropdown1 div');
    timeOptions.forEach(function (option) {
        option.addEventListener('click', function () {
            document.getElementById('timeInput1').value = option.getAttribute('data-value');
            document.getElementById('timeDropdown1').style.display = 'none'; // Hide dropdown
        });
    });
</script>
<script>
    // Toggle the dropdown on input click
    document.getElementById('timeInput').addEventListener('click', function () {
        var dropdown = document.getElementById('timeDropdown');
        dropdown.style.display = (dropdown.style.display === 'none' || dropdown.style.display === '') ? 'block' : 'none';
    });

    // Close the dropdown when clicking outside
    window.onclick = function (event) {
        if (!event.target.matches('#timeInput')) {
            var dropdown = document.getElementById('timeDropdown');
            if (dropdown.style.display === 'block') {
                dropdown.style.display = 'none';
            }
        }
    };

    // Set the input value when a time option is clicked
    var timeOptions = document.querySelectorAll('#timeDropdown div');
    timeOptions.forEach(function (option) {
        option.addEventListener('click', function () {
            document.getElementById('timeInput').value = option.getAttribute('data-value');
            document.getElementById('timeDropdown').style.display = 'none'; // Hide dropdown
        });
    });
</script>
<script>
$(document).ready(function() {
    // Event handler for checking available times
    $('#checkTimesBtn').click(function() {
        const checkDate = $('#checkDate').val();
        const drName = $('#drName').val();
        

        // Ensure that a date is selected
        if (!checkDate) {
            alert("Please select a date.");
            return;
        }

        // Make an AJAX request to the servlet
        $.ajax({
            url: 'CheckAvailableTimesServlet',
            type: 'POST',
            data: {
                date: checkDate,
                doctorName:drName
            },
            success: function(response) {
                // Populate the available times in the modal
                $('#availableTimes').html(response);
            },
            error: function() {
                $('#availableTimes').html('Error retrieving available times.');
            }
        });
    });
});
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>

</html>