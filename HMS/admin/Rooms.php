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
                       <h5 class="text-center my-3">Total Rooms</h5>

                       <?php
                          $query = "SELECT * FROM rooms";
                          $res = mysqli_query($con,$query);

                          $output = "";
                          $output .="
                              <table class='table table-bordered'>
                                 <tr>
                                   <th>RoomNum</th>
                                   <th>Capacity</th>     
                                  
   
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
                                     <td>".$row['RoomNum']."</td>
                                     <td>".$row['Capacity']."</td>
                                     <td>
                                     <a href='view2.php?id=".$row['RoomNum']."'>
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

                       
                   </div>
            </div>
        </div>
   </div>
</body>

</html>