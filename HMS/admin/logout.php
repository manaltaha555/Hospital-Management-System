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
                         $query1 = "SELECT ID from staff where Email='mariom@gmail.com' ";
                        //  $row = mysqli_fetch_array($res2);
                        //  $ide .= $row['ID'];



                          $query = "SELECT * FROM patient";
                          $res = mysqli_query($con,$query1);

                          $output = "";
                         
                          if (mysqli_num_rows($res) < 1){
                                $output .= "
                                  
                                  <tr>
                                     <td class='text-center' colspan='10'>No Patient Yet</td>
                                  </tr>
                                 
                                
                                ";
                          }

                          $row = mysqli_fetch_array($res);
                          $ide = $row['ID'];
                          $output .="$ide"
                                     
                                
                                    
                                 
                                 
                              
                              ;
                          

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
