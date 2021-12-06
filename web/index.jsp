<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/m" prefix="Vaccination" %>  
<!DOCTYPE html>
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
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <img style="width:50px;" src="assets/images/favicon.png">
                </div>
                <h4>Hello! let's get started</h4>
                <h6 class="font-weight-light">Sign in to continue.</h6>
                <form class="pt-3" method="post" action="LoginServlet">
                  <div class="form-group">
                    <input type="email" name="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username">
                  </div>
                  <div class="form-group">
                    <input type="password" name="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                  </div>
                  <div class="mt-3">
                    <button type="submit" value="Login" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN IN</button>
                  </div>
                  <div class="my-2 d-flex justify-content-between align-items-center">
                    <div class="form-check">
                      
                    </div>
                    <a href="#" class="auth-link text-black"></a>
                  </div>
                      </form>
                  <div class="mb-2">
                    <button type="button" class="btn btn-block btn-success auth-form-btn" data-toggle="modal" data-target="#exampleModalCent">
                      <i class="mdi mdi-hospital-marker mr-2"></i>Get Vaccinated Now </button>
                  </div>
                    <!-- Modal -->
<div class="modal fade" id="exampleModalCent" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Book Vaccine</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form class="forms-sample" method="post" action="addbooking.jsp">
                  
                  <div class="form-group">
                        <label for="exampleInputName1">Name Of Recipient</label>
                        <input type="text" class="form-control" id="exampleInputName1" placeholder="Name" name="provider" required="required">
                      </div>
                      <div class="form-group">
                        <label for="exampleSelectGender">Name of Vaccine</label>
                        <select class="form-control" id="exampleSelectGender" name="vaccine">
                          <Vaccination:vaccinename table="inventory"/>
                        </select>
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
                         
                    
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" >Book</button>
      </div>
                      </form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Check next dose Date</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form class="forms-sample" method="post" action="check.jsp">
                  
                      <div class="form-group">
                        <label for="exampleInputEmail3">NIN</label>
                        <input type="text" class="form-control" id="exampleInputEmail3" name="nin" placeholder="Enter Your NIN">
                      </div>
                      
                    
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" >Check Date</button>
      </div>
                      </form>
      </div>
    </div>
  </div>
</div>
                    <div class="mb-2">
                    <button type="button" class="btn btn-block btn-danger auth-form-btn" data-toggle="modal" data-target="#exampleModalCenter">
                      <i class="mdi mdi-alert mr-2"></i>Check Next Dose Date </button>
                  </div>
                  
              
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
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
