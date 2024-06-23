<?php
include("E:\DB\htdocs\HMS\include\connection.php"); /*Referencing The Database*/

if (isset($_POST['apply'])){ /*Because the form first click is the button, we set by using the Name given to the button & we used $_POST because the
                                HTTP Request is POST.....After setting the button we encapsulate the form fields and with checks which will be done in this scope
                                as below*/
     $FirstName = $_POST['fname'];  /*Create variable to save each INPUT from this field. What's in the $_POST array is the (name) given to this field..Repeat this for all field*/
     $LastName = $_POST['sname'];
     $Email = $_POST['email'];
     $Phone = $_POST['phone'];
     $Street = $_POST['Street'];
     $City = $_POST['City'];
     $BirthDate = $_POST['BirthDate'];
     $Departement = $_POST['Departement'];
     $Gender = $_POST['gender'];
    
     $doctor_id=$_POST['da'];
     $RoomNum=$_POST['rn'];

     $error = array(); /*Create a Variable to save an ARRAY Method in it. */

     if (empty($FirstName)){
         $error['apply'] = "Enter Firstname";
     }elseif (empty($LastName)){

         $error['apply'] = "Enter Surname";
     }elseif (empty($Email)){
         $error['apply'] = "Enter Email Address";
    
     }elseif (empty($Phone)){
         $error['apply'] = "Enter Phone Number";
    }elseif (empty($Street)){
            $error['apply'] = "Enter Phone Street";    
     }elseif ($City == ""){
         $error['apply'] = "Select City";
     }elseif ($Gender == ""){
            $error['apply'] = "Select Your Gender";}
   



       if (count($error)==0){
                  $query = "INSERT INTO `patient` ( `FirstName`, `LastName`, `Email`, `Phone`, `Street`, `City`, `BirthDate`, `Departement`, `Gender`, `doctor_id`, `RoomNum`) 
                  VALUES('$FirstName','$LastName', '$Email','$Phone','$Street','$City','$BirthDate','$Departement','$Gender','$doctor_id','$RoomNum') ";
                  $result = mysqli_query($con, $query);
              

                  if ($result){
                      echo "<script>alert('You have successfully Applied')</script>";

                      header("Location: doctor.php");
                  }
                  else{

                      echo "<script>alert('Failed')</script>";

                  }

       }
}

if (isset($error['apply'])){
    $s = $error['apply'];

    $show = "<h5 class='text-center alert alert-danger'>$s</h5>";
}else{
    $show ="";
}
?>


<!DOCTYPE html>
<html>
<body style="background-image: url(img/hospitalBuilding.jpg); background-size: cover; background-repeat: no-repeat">

<!--Referencing the HEADER in this Page-->
<?php
include("E:\DB\htdocs\HMS\include\header.php")
?>
        <!--Creating Main Fluid Container to contain The entire content-->
        <div class="container-fluid">
            <div class="col-md-12"> <!--SETTING The Page to standard of 12px-->
                 <div class="row"><!--After setting Page seen Above, You need to set ROW to allow you divide the 12px into sections-->
                       <div class="col-md-3"> <!--The Division of 12px for this section if (3px & 6px)-->

                       </div>
                       <div class="col-md-6 jumbotron"> <!--2nd section if (6px) which will contain the Application Form for DOCTORS-->
                            <!--Text Description for the Form & Centered-->
                             <div>
                                 <?php
                                    echo $show;
                                 ?>
                             </div>
                           <form method="post" action=""> <!--Form tag using HTTP Request(POST) which will POST Data into the database Table siting on the serve  -->
                               <div class="form-group"> <!--1st Form Group-->
                                   <label for="">FirstName</label> <!--Label Text Name form-->

                                      <!--The value introduced in the input tag allows users to have whatever they typed in the field showing assuming they make error during typing and needs changes-->
                                    <input type="text" name="fname" class="form-control" autocomplete="off" placeholder="Enter Firstname" value="<?php if (isset($_POST['fname'])) echo $_POST['fname']; ?>">
                               </div>

                               <div class="form-group">
                                   <label for="">Lastname</label>
                                   <input type="text" name="sname" class="form-control" autocomplete="off" placeholder="Enter Surname" value="<?php if (isset($_POST['sname'])) echo $_POST['sname']; ?>">
                               </div>

                            
                               <div class="form-group">
                                   <label for="">Email</label>
                                   <input type="email" name="email" class="form-control" autocomplete="off" placeholder="Enter Email" value="<?php if (isset($_POST['email'])) echo $_POST['email']; ?>">
                               </div>

                               <div class="form-group">
                                   <label for="">Select Gender</label>
                                   <select name="gender" id="" class="form-control"><!--The name is an identity for this field of the form-->
                                       <option value="">Select Gender</option>
                                       <option value="Male">Male</option>
                                       <option value="Male">Female</option>
                                   </select>
                               </div>


                               <div class="form-group">
                                   <label for="">Phone Number </label>
                                   <input type="number" name="phone" class="form-control" autocomplete="off" placeholder="Enter Phone Number" value="<?php if (isset($_POST['phone'])) echo $_POST['phone']; ?>">
                               </div>

                               <div class="form-group">
                                   <label for="">street</label>
                                   <input type="text" name="Street" class="form-control" autocomplete="off" placeholder="Enter your street" value="<?php if (isset($_POST['Street'])) echo $_POST['Street']; ?>">
                               </div>

                               <div class="form-group">
                                   <label for="">BirthDate</label>
                                   <input type="date" name="BirthDate" class="form-control" autocomplete="off" placeholder="Enter your BirthDate" value="<?php if (isset($_POST['BirthDate'])) echo $_POST['BirthDate']; ?>">
                               </div>
                               <div class="form-group">
                                   <label for="">Departement</label>
                                   <input type="text" name="Departement" class="form-control" autocomplete="off" placeholder="Enter your Departement" value="<?php if (isset($_POST['Departement'])) echo $_POST['Departement']; ?>">
                               </div>

                               <div class="form-group">
                                   <label for="">Select city</label>
                                   <select name="City" id="" class="form-control">
                                       <option value="">Select Country</option>
                                       <option value="kafrelsheikh">kafrelsheikh</option>
                                       <option value="alexandria">alexandria</option>

                                   </select>
                               </div>
                              
                               <div class="form-group">
                                   <label for="">Select Doctor</label>
                                   
                                   <select name="da" id="" class="form-control">
                                       <option value="">Select Doctor</option>
                                       <?php 
                                       $query = "SELECT * FROM doctors";
                                       $res = mysqli_query($con,$query);
                                       while ($row = mysqli_fetch_row($res)) {
                                           echo "<option value='" . $row[0] . "'>" . $row[0] . "</option>";
                                       
                                       }?>

                                   </select>
                               </div>
                               <div class="form-group">
                                   <label for="">Select Rooms</label>
                                   
                                   <select name="rn" id="" class="form-control">
                                       <option value="">Select room</option>
                                       <?php 
                                       $query = "SELECT * FROM rooms";
                                       $res = mysqli_query($con,$query);
                                       while ($row = mysqli_fetch_row($res)) {
                                           echo "<option value='" . $row[0] . "'>" . $row[0] . "</option>";
                                       }?>

                                   </select>
                               </div>
                            

                               
                               
                               <input type="submit" name="apply" value="Add Doctor" class="btn btn-success"> <!--Name for the input button will be ISSET in PHP to write the backend-->
                               
                           </form>

                       </div>
                 </div>
            </div>

        </div>


</body>
</html>