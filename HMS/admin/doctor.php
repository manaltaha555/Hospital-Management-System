<?php
session_start() ;

?>

<!DOCTYPE html>
<html>

<head>
      <title></title>
</head>
<body>

<?php

     include ("../include/header.php");
    include ("../include/connection.php");
?>

       <div class="container-fluid">
           <div class="col-md-12">
                <div class="row">
                      <div class="col-md-2" style="margin-left: -30px ">
                           <!---->
                          <?php

                              include("sidenav.php");
                          ?>

                      </div>
                       <div class="col-md-10" style="margin-top: 50px">
                           <h5 class="text-center">Total Doctors</h5>
                           <?php
                               $query = "SELECT * FROM doctors D join staff S on D.Doctor_ID=S.ID;";
                               $res = mysqli_query($con, $query);



                           $output = "";

                           $output .="
                          <table class='table table-bordered'>
                                       <tr>
                                          <th>ID</th>
                                          <th>Firstname</th>
                                          <th>LastName</th>
                                          <th>Email</th>
                                          <th>Phone</th>
                                          <th>Street</th>
                                          <th>City</th>
                                          <th>BirthDate</th>
                                          <th>Departement</th>
                                          <th>Gender</th> 
                                          <th>EducationDegree</th> 
                                       </tr>
       
                                    ";

                           if(mysqli_num_rows($res) < 1){

                               $output .="
                                          <tr>
                                            <td colspan='10' class='text-center '>No job Request Yet</td>
                                          </tr>
                                         ";
                                                 }

                           while ($row = mysqli_fetch_array($res) ){

                               $output .= "
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
                                        <td>".$row['EducationDegree']."</td>
                                      </tr>         
                                      ";
                           }

                           $output .="
                       </table>
                          ";

                           echo $output;
                           ?>

                   <a href="apply.php"><input type="submit" name="apply" value="Add doctor" class="btn btn-success" >
                        </a></div>
                </div>
           </div>
       </div>

</body>
</html>