<?php  

$conn=mysqli_connect('localhost','root','','srl_tool') or die(mysqli_error());


$NOM=$_POST['nom'];
$PRE=$_POST['pre'];
$EML=$_POST['eml'];
$PWD=$_POST['pwd'];
/*
$SUBMIT=$_POST['submit'];
if(isset($SUBMIT)){
      if(empty($NOM))
         $message='<div class="erreur">Nom laissé vide.</div>'; 
      elseif(empty($PRE))
         $message='<div class="erreur">Prénom laissé vide.</div>';
      elseif(empty($EML))
         $message='<div class="erreur">Email laissé vide.</div>';
      elseif(empty($PWD))
         $message='<div class="erreur">Mot de passe laissé vide.</div>';
     }
     else {
*/
$req="INSERT INTO apprenant (nomApprenant,prenomApprenant,email,mot_de_passe) VALUES ('$NOM','$PRE','$EML','$PWD')";

$res=mysqli_query($conn,$req);


?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    SRL - Accueil
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
 
  <!-- CSS Files -->
  <link href="../assets/css/font_style.css" rel="stylesheet" />
  <link href="../assets/css/icon_style.css" rel="stylesheet" />
  <link href="../assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
   
</head>

<body style="background-color: rgb(255, 255, 255);">
  <div class="wrapper">
      <div class="row" style="height: 100vh; width: auto;">
          <div class="col-7" style="background-color: rgba(241, 225, 243, 0.438);"></div>
          <div class="col">
            <form class="border border-light p-5 mt-3" method="POST" >
                <img class="img mx-auto d-block" src="../assets/img/new.png" />
                <p class="h3 mb-4 text-center">Créer un compte</p>
            
                <div class="row">
                    <div class="col"><input type="text" class="form-control mb-4" name="nom" placeholder="Nom"></div>
                    <div class="col"><input type="text" class="form-control mb-4" name="pre" placeholder="Prénom"></div>
                </div>

                <input type="email" class="form-control mb-4" name="eml" placeholder="E-mail">

                <input type="password" class="form-control" name="pwd" placeholder="Mot de passe">
            
                <button class="btn btn-primary btn-block my-4" type="submit" name="submit">S'enregistrer</button>

                <div class="text-center">
                    <p>Vous avez un compte?
                        <a href="connexion.html">Connexion</a> 
                    </p>
                </div>
            </form>
           <!-- <php  
if(isset($_POST["submit"])){  
if(!empty($_POST['name']) && !empty($_POST['surname']) && !empty($_POST['email']) && !empty($_POST['password'])) {  
    $user=$_POST['name'];  
    $surname=$_POST['surname'];  
    $email=$_POST['email']; 
    $pass=$_POST['password']; 
    $con=mysql_connect('localhost','root','') or die(mysql_error());  
    mysql_select_db('srl_tool') or die("cannot select DB");  
  
    $query=mysql_query("SELECT * FROM Apprenant WHERE nameApprenant='".$user."'");  
    $numrows=mysql_num_rows($query);  
    if($numrows==0)  
    {  
    $sql="INSERT INTO Apprenant(nomApprenant,prenomApprenant,email,mot_de_passe,) VALUES('','$user','$surname','$email','$pass')";  
   
    $result=mysql_query($sql);  
        if($result){  
    echo "Account Successfully Created";  
    } else {  
    echo "Failure!";  
    }  
  
    } else {  
    echo "That username already exists! Please try again with another.";  
    }  
  
} else {  
    echo "All fields are required!";  
}  
}  
?>  

-->
          </div>
      </div>
  </div>















<!--<footer class="footer" style="background-color: white;">
    <div class="container-fluid">
      <div class="copyright float-right">
      &copy;
        <script>
          document.write(new Date().getFullYear())
        </script>
      </div>
    </div>
  </footer>-->
</div>
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap-material-design.min.js"></script>
<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

<script src="../assets/js/plugins/moment.min.js"></script>

<script src="../assets/js/plugins/sweetalert2.js"></script>

<script src="../assets/js/plugins/jquery.validate.min.js"></script>

<script src="../assets/js/plugins/jquery.bootstrap-wizard.js"></script>

<script src="../assets/js/plugins/bootstrap-selectpicker.js"></script>

<script src="../assets/js/plugins/bootstrap-datetimepicker.min.js"></script>

<script src="../assets/js/plugins/jquery.dataTables.min.js"></script>

<script src="../assets/js/plugins/bootstrap-tagsinput.js"></script>

<script src="../assets/js/plugins/jasny-bootstrap.min.js"></script>

<script src="../assets/js/plugins/fullcalendar.min.js"></script>

<script src="../assets/js/plugins/jquery-jvectormap.js"></script>

<script src="../assets/js/plugins/nouislider.min.js"></script>

<script src="../assets/js/plugins/arrive.min.js"></script>
 
<script src="../assets/js/plugins/chartist.min.js"></script>

<script src="../assets/js/plugins/bootstrap-notify.js"></script>

<script src="../assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>


</body>

</html>
    
            
            
            
