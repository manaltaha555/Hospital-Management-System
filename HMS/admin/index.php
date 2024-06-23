<?php

session_start();

?>



<!DOCTYPE html>
<html lang="en">
      <head>
           <title>Admin Dasboard</title>
      </head>
<body>

<?php

/*including the header file which contains the menus. Double dots means (step out of its folder, & access the header.php file in another folder*/
include("../include/header.php");
/*including the header file which contains the menus. Double dots means (step out of its folder, & access the header.php file in another folder*/
include("../include/connection.php");
?>


<!--The container-fluid occupies full width of the screen -->
<div class="container-fluid">
      <div class="col-md-12"><!--setting the element to the total length columns of a browser-->
          <!--.-->
          <div class="row">
                 <!---->
                 <div class="col-md-2" style="margin-left: -30px">

                     <!--Sidenav-->
                    <!-- <div class="list-group bg-info" style="height: 90vh">
                         <a href="index.php" class="list-group-item list-group-item-action bg-info text-center">Dashboard</a>
                         <a href="admin.php" class="list-group-item list-group-item-action bg-info text-center">Administrators</a>
                         <a href="" class="list-group-item list-group-item-action bg-info text-center">Doctors</a>
                         <a href="" class="list-group-item list-group-item-action bg-info text-center">Patients</a>
                     </div>-->
                     <!--END Sidenav-->
                     <?php
                        /*pasted the above in a different file.*/
                         include("sidenav.php");
                     ?>


                 </div>

              <!--This is the second column created -->
              <div class="col-md-10">
                     <!--Giving a title description to Columns-->
                     <h4 class="my-2">Admin Dashboard</h4>

                  <!--Inside the 2nd Column for the dashboard, we set a column divider to total 12-->
                     <div class="col-md-12 my-1">
                         <!--bootstrap row to arrange items in rows-->
                          <div class="row">
                              <!--First row for the parent column is set to Medium 3, gave it a success colour, and an interval of 2px-->

                              <div class="col-md-3 bg-info mx-2" style="height: 130px">
                                       <!--After Accepting/rejecting Application using the code in (ajax_approve.php)
                                           (ajax_reject.php)(ajax_show_jo_request.php) to either (reject) or (accept),
                                            it will update each of the request in the database table named (doctors) from (Pending) to (Approve)
                                            or (Pending) to (Reject)

                                        -->
                                  <?php
                                     $doctor = mysqli_query($con, "SELECT * FROM doctors ");
                                     $num2  = mysqli_num_rows($doctor);
                                  ?>
                                  <div class="col-md-12">
                                      <div class="row">
                                          <div class="col-md-8">
                                              <!--<h5 class="my-2 text-white" style="font-size:30px">0</h5>-->
                                              <h5 class="my-2 text-white" style="font-size:30px"><?php echo $num2?></h5>
                                              <h5>Total</h5>
                                              <h5>Doctors</h5>
                                          </div>

                                          <div class="col-md-4">
                                              <a href="doctor.php"><i class="fa fa-user-md fa-3x my-4" style="color: white"></i></a>
                                          </div>

                                      </div>
                                  </div>

                              </div>

                              <div class="col-md-3 bg-warning mx-2" style="height: 130px">
                                  <div class="col-md-12">
                                      <div class="row">
                                          <div class="col-md-8">
                                              <?php
                                                  $p = mysqli_query($con, "SELECT * FROM patient");
                                                  $pp = mysqli_num_rows($p);
                                              ?>

                                              <h5 class="my-2 text-white" style="font-size:30px"><?php echo $pp?></h5>
                                              <h5>Total</h5>
                                              <h5>Patients</h5>
                                          </div>

                                          <div class="col-md-4">
                                              <a href="patient.php"><i class="fa fa-procedures fa-3x my-4" style="color: white"></i></a>
                                          </div>

                                      </div>
                                  </div>
                              </div>  
                                <div class="col-md-3 bg-danger mx-2 my-2" style="height: 130px">

                                  <div class="col-md-12">
                                      <div class="row">
                                          <div class="col-md-8">

                                              <?php
                                                $re = mysqli_query($con, "SELECT * FROM staff");

                                                $rep = mysqli_num_rows($re);
                                              ?>
                                              <h5 class="my-2 text-white" style="font-size:30px"><?php echo $rep ?></h5>
                                              <h5>Total</h5>
                                              <h5>staff</h5>
                                          </div>

                                          <div class="col-md-4">
                                              <a href="staff.php"><i class="fa fa-flag fa-3x my-4" style="color: white"></i></a>
                                          </div>

                                      </div>
                                  </div>

                              </div>
                              <div class="col-md-3 bg-success mx-2 my-2" style="height: 130px">
                                  <div class="col-md-12">
                                      <div class="row">
                                          <div class="col-md-8">

                                               <?php

                                                $in = mysqli_query($con, "SELECT sum(TreatmentPrice) as profit FROM treatmentbills");
                                                $row = mysqli_fetch_array($in);
                                                $inc = $row['profit'];
                                              ?>
                                              <h5 class="my-2 text-white" style="font-size:30px"><?php echo "EGP $inc"; ?></h5>
                                              <h5>Total</h5>
                                              <h5>Bills</h5>
                                          </div>

                                          <div class="col-md-4">
                                              <a href="Bills.php"><i class="fa fa-money-check-alt fa-3x my-4" style="color: white"></i></a>
                                          </div>

                                      </div>
                                  </div>
                              </div>
                                <div class="col-md-3 bg-danger mx-2 my-2" style="height: 130px">

                                  <div class="col-md-12">
                                      <div class="row">
                                          <div class="col-md-8">

                                              <?php
                                                $re = mysqli_query($con, "SELECT * FROM rooms");

                                                $rep = mysqli_num_rows($re);
                                              ?>
                                              <h5 class="my-2 text-white" style="font-size:30px"><?php echo $rep ?></h5>
                                              <h5>Total</h5>
                                              <h5>Rooms</h5>
                                          </div>

                                          <div class="col-md-4">
                                              <a href="Rooms.php"><i class="fa fa-door fa-3x my-4" style="color: white"></i></a>
                                          </div>

                                      </div>
                                  </div>

                              </div>
                              

                                      </div>
                                  </div>

                              </div>

                              

                          </div>
                      </div>

              </div>
          </div>

      </div>

  </div>


</body>
</html>







.
