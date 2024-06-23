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
                       <h5 class="text-center my-3">Total Staff</h5>

                       <?php
                          $query = "SELECT * FROM staff";
                          $res = mysqli_query($con,$query);
                          $output = "";
                          $output .="
                              <table class='table table-bordered'>
                                 <tr>
                                   <th>ID</th>
                                   <th>FirstName</th>      
                                   <th>LastName</th>
                                   <th>Email</th>
                                   <th>Phone</th>
                                    <th>Street</th>
                                    <th>City</th>
                                    <th>BirthDate</th>
                                    <th>Departement</th>
                                    <th>Gender</th>
                                    <th>Type</th>
                                 
   
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
                            $ide = $row['ID']; 

                            $query2="SELECT Doctor_ID from Doctors where Doctor_ID='$ide' " ;
                            $res3=mysqli_query($con, $query2);
                            if (mysqli_num_rows($res3) >0){
                             $type="Doctor";}
 
                             $query3="SELECT Nurse_ID from nurse where Nurse_ID='$ide' " ;
                             $res4=mysqli_query($con, $query3);
                             if (mysqli_num_rows($res4) >0){
                             $type="Nurse";}
                            
                             $query4="SELECT ID from wardboys where ID='$ide' " ;
                             $res5=mysqli_query($con, $query4);
                             if (mysqli_num_rows($res5) >0){
                             $type="wardboys";}
                            


                            
                              $output .="
                                 <tr>
                                     <td>".$row['ID']."</td>
                                     <td>".$row['FirstName']."</td>
                                     <td>".$row['LastName']."</td>
                                     <td>".$row['Email']."</td>
                                     <td>".$row['Phone']."</td>
                                     <td>".$row['Street']."</td>
                                     <td>".$row['City']."</td>
                                     <td>".$row['BirthDate']."</td>
                                     <td>".$row['Departement']."</td>
                                     <td>".$row['Gender']."</td>
                                     <td>$type</td>
                                    
                                     
                                
                                    
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
