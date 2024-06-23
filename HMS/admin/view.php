<?php
session_start();

?>

<!DOCTYPE html>
<html>
<head>
    <title>View Patient Details</title>
</head>

<body>
<?php
    include("../include/header.php");
    include("../include/connection.php");

?>

  <div class="col-fluid">
       <div class="col-md-12">
            <div class="row">
                 <div class="col-md-2" style="margin-left: -30px">
                     <?php
                         include("sidenav.php");
                     ?>
                 </div>
                 <div class="col-md-10">
                       <h5 class="text-center my-3">View Patient Details</h5>
                     <?php
                       if (isset($_GET['id'])){

                           $id = $_GET['id'];
                           $query = "SELECT * FROM patient WHERE patient_id='$id'";

                           $query2="SELECT b.patientID ,c.diseaseName FROM patientdisease b   
                           join disease c on b.diseaseID=c.DiseaseID;";
                           
                           $res = mysqli_query($con,$query);
                           $res2=mysqli_query($con,$query2);
                           $row = mysqli_fetch_array($res);
                           $row2=mysqli_fetch_array($res2);

                       }
                     ?>
                      
                     <div class="col-md-12">
                          <div class="row">
                              <div class="col-md-3">
                                  
                              </div>
                              <div class="col-md-6">
                               

                                  <table class="table table-bordered">
                                        <tr>
                                            <th class="text-center" colspan="2">Details</th>
                                        </tr>
                                        <tr>
                                           <td>patient_id</td>
                                          <td><?php echo $row['patient_id']?></td>
                                          
                                      </tr>
                                      <tr>
                                           <td>Firstname</td>
                                          <td><?php echo $row['FirstName']?></td>
                                          
                                      </tr>

                                      <tr>
                                          <td>Surname</td>
                                          <td><?php echo $row['LastName']?></td>
                                      </tr>
                                      <tr>
                                          <td>Email</td>
                                          <td><?php echo $row['Email']?></td>
                                      </tr>

                                      <tr>
                                          <td>Phone</td>
                                          <td><?php echo $row['Phone']?></td>
                                      </tr>

                                      <tr>
                                          <td>Street</td>
                                          <td><?php echo $row['Street']?></td>
                                      </tr>

                                      <tr>
                                          <td>Country</td>
                                          <td><?php echo $row['City']?></td>
                                      </tr>

                                      <tr>
                                          <td>BirthDate</td>
                                          <td><?php echo $row['BirthDate']?></td>
                                      </tr>
                                      <tr>
                                          <td>Departement</td>
                                          <td><?php echo $row['Departement']?></td>
                                      </tr>
                                      <tr>
                                          <td>Gender</td>
                                          <td><?php echo $row['Gender']?></td>
                                      </tr>
                                      <tr>
                                          <td>doctor_id</td>
                                          <td><?php echo $row['doctor_id']?></td>
                                      </tr>
                                      <tr>
                                          <td>RoomNum</td>
                                          <td><?php echo $row['RoomNum']?></td>
                                      </tr>
                                      <tr>
                                          <td>diseaseName</td>
                                          <td><?php echo $row2['diseaseName']?></td>
                                      </tr>

                                  </table>


                              </div>
                          </div>
                         
                     </div>
                     


                 </div>
            </div>
       </div>
  </div>

</body>

</html>