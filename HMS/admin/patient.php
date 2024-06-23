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
                          $query = "SELECT * FROM patient";
                          $res = mysqli_query($con,$query);

                          $output = "";
                          $output .="
                              <table class='table table-bordered'>
                                 <tr>
                                   <th>patient_id</th>
                                   <th>FirstName</th>      
                                   <th>LastName</th>
                                    <th>Departement</th>
                                  
   
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
                                     <td>".$row['patient_id']."</td>
                                     <td>".$row['FirstName']."</td>
                                     <td>".$row['LastName']."</td>
                                     <td>".$row['Departement']."</td>
                                     <td>
                                     <a href='view.php?id=".$row['patient_id']."'>
                                     <button class='btn btn-info'>View</button>
                                     </a>
                                 </td>
                                     
                                
                                    
                                 </tr>
                                 
                              
                              ";
                          }

                          $output .="
                             
                             </table>
                          ";

                          echo $output;
                       ?>
                       <a href="apply3.php"><input type="submit" name="apply" value="Add Patient" class="btn btn-success" >
                        </a></

                       
                   </div>
            </div>
        </div>
   </div>
</body>

</html>
