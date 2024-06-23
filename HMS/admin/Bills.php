<?php
session_start();
?>


<!DOCTYPE html>
<html>
<head>
    <title>Total Patient</title>
</head>

<body>
<?php
   include("../include/header.php");
   include ("../include/connection.php");

?>

   <div class="container-fluid">
        <div class="col-md-12">
            <div class="row">
                  <div class="col-md-2 " style="margin-left: -30px">
                      <?php
                        include("sidenav.php");
                      ?>
                  </div>
                   <div class="col-md-10">
                       <h5 class="text-center my-3">Total Patients</h5>

                       <?php
                       

                          $query = "SELECT * FROM treatmentbills";
                          $res = mysqli_query($con,$query);

                          $output = "";
                          $output .="
                              <table class='table table-bordered'>
                                 <tr>
                                   <th>patient_id</th>
                                   <th>BillID</th>      
                                   <th>TreatmentPrice</th>
                                   <th>Description</th>
                                   <th>NUMofDays</th>
                                    
   
                                 </tr>
                                 
                              
                             
                          ";
                          if (mysqli_num_rows($res) < 1){
                                $output .= "
                                  
                                  <tr>
                                     <td class='text-center' colspan='10'>No Patient Yet</td>
                                  </tr>
                                 
                                
                                ";
                          }

                          while ($row = mysqli_fetch_array($res)){
                              $output .="
                                 <tr>
                                     <td>".$row['patientID']."</td>
                                     <td>".$row['BillID']."</td>
                                     <td>".$row['TreatmentPrice']."</td>
                                     <td>".$row['Description']."</td>
                                     <td>".$row['NUMofDays']."</td>
                                     
                                     
                                
                                    
                                 </tr>
                                 
                              
                              ";
                          }

                          $output .="
                             
                             </table>
                          ";

                          echo $output;
                       ?>

                       
                   </div>
            </div>
        </div>
   </div>
</body>

</html>
