<%@ taglib uri="/WEB-INF/tlds/m" prefix="Vaccination" %>  
<%@page import="org.health.system.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Vaccine tracker</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />
  </head>
  <body>
 
      
      
      
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
       
          <ul class="navbar-nav navbar-nav-right">
            
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="assets/images/user.png" alt="image">
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black"><% User user = (User) session.getAttribute("logUser");
    if(session.getAttribute("logUser") == null){
        response.sendRedirect("index.jsp");
    }
     out.println(user.getName());
%></p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown dropdown-menu-right p-0 border-0 font-size-sm" aria-labelledby="profileDropdown" data-x-placement="bottom-end">
                <div class="p-3 text-center bg-primary">
                  <img class="img-avatar img-avatar48 img-avatar-thumb" src="assets/images/user.png" alt="">
                </div>
                <div class="p-2">
                  
                  <h5 class="dropdown-header text-uppercase  pl-2 text-dark mt-2">Actions</h5>
                  
                  <a class="dropdown-item py-1 d-flex align-items-center justify-content-between" href="LogoutServlet">
                    <span>Log Out</span>
                    <i class="mdi mdi-logout ml-1"></i>
                  </a>
                </div>
              </div>
            </li>
            
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
             <li class="nav-item nav-category">Main</li>
            <li class="nav-item">
              <a class="nav-link" href="welcome.jsp">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                <span class="menu-title">Dashboard</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="icon-bg"><i class="mdi mdi-hospital-building menu-icon"></i></span>
                <span class="menu-title">Health Centre</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="addhealthcentre.jsp">Add</a></li>
                  <li class="nav-item"> <a class="nav-link" href="viewhealthcentre.jsp">View</a></li>
                  
                </ul>
              </div>
            </li>
            
            
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="a">
                <span class="icon-bg"><i class="mdi mdi-briefcase menu-icon"></i></span>
                <span class="menu-title">Vaccine Inventory</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="addvaccine.jsp"> Add </a></li>
                  <li class="nav-item"> <a class="nav-link" href="viewvaccine.jsp"> View</a></li>
                  
                </ul>
              </div>
            </li>
              <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="au">
                <span class="icon-bg"><i class="mdi mdi-account-multiple-outline menu-icon"></i></span>
                <span class="menu-title">Vaccine Administration</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="vaccineadministration.jsp"> Add </a></li>
                  <li class="nav-item"> <a class="nav-link" href="viewvaccinations.jsp"> View </a></li>
                  
                </ul>
              </div>
            </li>
              <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="aut">
                <span class="icon-bg"><i class="mdi mdi-calendar-check menu-icon"></i></span>
                <span class="menu-title">Booking and Advisory</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
              
                  <li class="nav-item"> <a class="nav-link" href="viewbooking.jsp"> View </a></li>
                 
                </ul>
              </div>
            </li>
         
      
           
       
            <li class="nav-item sidebar-user-actions">
              <div class="sidebar-user-menu">
                <a href="LogoutServlet" class="nav-link"><i class="mdi mdi-logout menu-icon"></i>
                  <span class="menu-title">Log Out</span></a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title">Add booking</h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Booking and Advisory</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Add Booking</li>
                </ol>
              </nav>
            </div>
            <div class="row">
           
             
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    
                  
                    <form class="forms-sample" method="post" action="addbooking.jsp">
                      <div class="form-group">
                        <label for="exampleInputName1">Name Of Provider</label>
                        <input type="text" class="form-control" id="exampleInputName1" placeholder="Name" name="provider" required="required">
                      </div>
                     
                     <div class="form-group">
                        <label for="exampleSelectGender">Health Centre</label>
                        <select class="form-control" id="exampleSelectGender" name="centre">
                          <Vaccination:vaccinename table="centres"/>
                        </select>
                      </div>
                          <div class="form-group">
                        <label for="exampleInputEmail3">Date</label>
                        <input type="date" class="form-control" id="exampleInputEmail3" placeholder="Date" name="date" required="required">
                      </div>
                          <div class="form-group">
                        <label for="exampleSelectGender">Name of Vaccine</label>
                        <select class="form-control" id="exampleSelectGender" name="vaccine">
                          <Vaccination:vaccinename table="inventory"/>
                        </select>
                      </div>
                      <button type="submit" class="btn btn-primary mr-2">Submit</button>
                      <button class="btn btn-light">Cancel</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="footer-inner-wraper">
              <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © Vaccine Tracker 2021</span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> <a href="index.jsp" target="_blank">Get Vaccinated</a></span>
              </div>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>