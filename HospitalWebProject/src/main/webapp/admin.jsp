<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.getSession(false); // Don't create a new session
    if (session == null || session.getAttribute("isAdminLoggedIn") == null) {
        response.sendRedirect("main.jsp");
    }
%>

<% 
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital-Admin-Panel</title>
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
</head>
<style>
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
        }
        canvas {
   max-width: 80%;
            margin: 0 auto;
            display: block;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
 .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            height: 350px; /* Reduce height */
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            border-radius: 15px 15px 0 0;
            height: 150px; /* Reduce image height */
            object-fit: cover;
        }

        .card-footer {
            background-color: #f8f9fa;
        }

        .rating {
            color: #ffd700;
        }

        .social-icons i {
            color: #333;
            margin-right: 10px;
            transition: color 0.3s;
        }

        .social-icons i:hover {
            color: #0392ce;
        }

        /* Custom grid for 5 cards per row */
        @media (min-width: 1200px) {
            .col-lg-custom {
                flex: 0 0 20%;
                max-width: 20%;
            }
        }
</style>

<body>
<%@ include file="adminNav.jsp" %>
<div class="container mt-5">
    <h3 class="mb-4 " style="color:#0392ce">Welcome to the Hospital</h3>
    <p>Welcome to the hospital, life changes here!!!</p>
    <div class="row">
        <div class="col-12 col-md-6 col-lg-3 d-flex align-items-stretch mb-4" style="height:90px">
            <div class="info-box w-100" style="background-color:#eeeeee; color:black; border-radius:30px; cursor:pointer">
                <h4><i class="material-icons">people</i> Total Patients</h4>
                <p>1200</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3 d-flex align-items-stretch mb-4" style="height:90px">
            <div class="info-box w-100" style="background-color:#eeeeee; color:black; border-radius:30px; cursor:pointer">
                <h4><i class="material-icons">local_hospital</i> Doctors</h4>
                <p>50</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3 d-flex align-items-stretch mb-4" style="height:90px">
            <div class="info-box w-100" style="background-color:#eeeeee; color:black; border-radius:30px; cursor:pointer">
                <h4><i class="material-icons">event</i> Appointments</h4>
                <p>450</p>
            </div>
        </div>
        <div class="col-12 col-md-6 col-lg-3 d-flex align-items-stretch mb-4" style="height:90px">
            <div class="info-box w-100" style="background-color:#eeeeee; color:black; border-radius:30px; cursor:pointer">
                <h4><i class="material-icons">attach_money</i> Total Revenue</h4>
                <p>$120,000</p>
            </div>
        </div>
    </div>
</div>

  <h3 style="color:#0392ce">Hospital Revenue Growth</h3>
   <canvas id="revenueChart" width="400" height="200"></canvas>


<div class="container mt-5" style="background-color:#f8f9fa; border-radius:10px">
     <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-left" style="color:#0392ce;">Meet Our Doctors</h3>
        <a href="#" class="text-right" style="color: #0392ce; font-weight: bold; text-decoration: none;">
            View More  <i class="fas fa-arrow-right"></i>
        </a>
    </div>
    <div class="row">
        <!-- Doctor 1 -->
        <div class="col-12 col-md-6 col-lg-custom mb-4">
            <div class="card h-100">
                <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Doctor Image">
                <div class="card-body text-center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <p>4.5/5</p>
                    </div>
                    <h5 class="card-title">Dr. John Doe</h5>
                    <p class="card-text">MD, Cardiology</p>
                </div>
                <div class="card-footer text-center">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctor 2 -->
        <div class="col-12 col-md-6 col-lg-custom mb-4">
            <div class="card h-100">
                <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Doctor Image">
                <div class="card-body text-center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                        <p>4.0/5</p>
                    </div>
                    <h5 class="card-title">Dr. Jane Smith</h5>
                    <p class="card-text">MBBS, General Physician</p>
                </div>
                <div class="card-footer text-center">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctor 3 -->
        <div class="col-12 col-md-6 col-lg-custom mb-4">
            <div class="card h-100">
                <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Doctor Image">
                <div class="card-body text-center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <i class="far fa-star"></i>
                        <p>3.5/5</p>
                    </div>
                    <h5 class="card-title">Dr. Robert Brown</h5>
                    <p class="card-text">MS, Orthopedics</p>
                </div>
                <div class="card-footer text-center">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctor 4 -->
        <div class="col-12 col-md-6 col-lg-custom mb-4">
            <div class="card h-100">
                <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Doctor Image">
                <div class="card-body text-center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <p>5.0/5</p>
                    </div>
                    <h5 class="card-title">Dr. Emily Wilson</h5>
                    <p class="card-text">PhD, Neurology</p>
                </div>
                <div class="card-footer text-center">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Doctor 5 -->
        <div class="col-12 col-md-6 col-lg-custom mb-4">
            <div class="card h-100">
                <img src="https://via.placeholder.com/400x250" class="card-img-top" alt="Doctor Image">
                <div class="card-body text-center">
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                        <p>4.0/5</p>
                    </div>
                    <h5 class="card-title">Dr. William Green</h5>
                    <p class="card-text">MD, Pediatrics</p>
                </div>
                <div class="card-footer text-center">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

 <script>
        window.onload = function() {
            var ctx = document.getElementById('revenueChart').getContext('2d');
            var revenueChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                    datasets: [{
                        label: 'Revenue ($)',
                        data: [10000, 15000, 25000, 30000, 40000, 50000],
                        backgroundColor: 'rgba(54, 162, 235, 0.2)', // Background fill under the line
                        borderColor: 'rgba(54, 162, 235, 1)', // Line color
                        borderWidth: 3, // Line thickness
                        pointBackgroundColor: 'rgba(255, 99, 132, 1)', // Point fill color
                        pointBorderColor: '#fff', // Point border color
                        pointHoverBackgroundColor: '#fff', // Point color when hovered
                        pointHoverBorderColor: 'rgba(255, 99, 132, 1)', // Point border when hovered
                        pointRadius: 5, // Point size
                        pointHoverRadius: 7, // Hovered point size
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: {
                    plugins: {
                        legend: {
                            display: true,
                            labels: {
                                color: '#333', // Legend label color
                                font: {
                                    size: 14
                                }
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0,0,0,0.8)', // Tooltip background
                            titleColor: '#fff', // Tooltip title color
                            bodyColor: '#fff', // Tooltip body color
                            titleFont: {
                                size: 16,
                                weight: 'bold'
                            },
                            bodyFont: {
                                size: 14
                            },
                            borderColor: 'rgba(54, 162, 235, 1)', // Tooltip border color
                            borderWidth: 1
                        }
                    },
                    scales: {
                        x: {
                            ticks: {
                                color: '#666', // X-axis labels color
                                font: {
                                    size: 12
                                }
                            },
                            grid: {
                                color: 'rgba(200, 200, 200, 0.2)', // X-axis grid lines color
                                borderColor: '#ccc'
                            }
                        },
                        y: {
                            beginAtZero: true,
                            ticks: {
                                color: '#666', // Y-axis labels color
                                font: {
                                    size: 12
                                }
                            },
                            grid: {
                                color: 'rgba(200, 200, 200, 0.2)', // Y-axis grid lines color
                                borderColor: '#ccc'
                            }
                        }
                    }
                }
            });
        }
    </script>
<script>
    var ctx = document.getElementById('revenueChart').getContext('2d');
    var revenueChart = new Chart(ctx, {
        type: 'line', // Type of chart
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June'], // X-axis labels (months)
            datasets: [{
                label: 'Revenue ($)', // Label for the line
                data: [10000, 15000, 25000, 30000, 40000, 50000], // Y-axis data (revenue over months)
                backgroundColor: 'rgba(54, 162, 235, 0.2)', // Background color under the line
                borderColor: 'rgba(54, 162, 235, 1)', // Line color
                borderWidth: 2, // Line width
                fill: true, // Fill the area under the line
                tension: 0.4 // Curvature of the line
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true // Y-axis starts at 0
                }
            }
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>