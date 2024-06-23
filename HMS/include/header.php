<?php
/*session_start();*/
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" integrity="sha512-RXf+QSDCUQs5uwRKaDoXt55jygZZm2V++WUZduaU/Ui/9EGp3f/2KZVahFZBKGH0s774sd3HmrhUy+SgOFQLVQ==" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />

    <link rel="stylesheet" href="">
</head>
<body >

     <!--Setting a navbar & making it collapsable, (navbar-expand-lg) or (navbar-expand-sm) or (navbar-expand-xl))
         with color scheme classes like (navbar-dark bg-dark),(navbar-dark bg-primary),(navbar-light" style="background-color: #e3f2fd;")
         (navbar-info bg-info).
     -->
     <nav class="navbar navbar-expand-lg navbar-info bg-info">
         <!--Title for the website-->
         <h5 class="text-white">Hospital Management System</h5>

         <!--Setting (Margin-right) to shift the nav-links to the right side -->
         <div class="mr-auto"></div>
          <!--(navbar-nav) used for To add links inside the navbar, use a <ul> element with class="navbar-nav".
          Then add <li> elements with a .nav-item class followed by an <a> element with a .nav-link class:-->
         <ul class="navbar-nav" >
           <!--  <li class="nav-item"><a href="adminlogin.php" class="nav-link text-white">Admin</a></li>
             <li class="nav-item"><a href="#" class="nav-link text-white">Doctor</a></li>
             <li class="nav-item"><a href="#" class="nav-link text-white">Patient</a></li>-->


             <!-- This PHP Section takes care of a backend condition. Meaning a login Form has been created which takes a condition that
                  If a user logins and the credential is indeed correct as an Admin, keep his username in session, and and set the variable to be true
                  and not NULL.
                    1. the 1st condition will display two(2) links on a Page created for Admin, that's if credential is entered in the form
                    2. The Else condition will pick the (links) in its scope to display that in the nav-bar if (user) hasnt logged in.

             -->
             
         </ul>
     </nav>

</body>
</html>