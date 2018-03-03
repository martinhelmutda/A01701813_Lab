<?php
  session_start();

  //Llamamos la base de datos
  require_once("bases.php");


  include("_header.html");
  // echo "Bienvenido ".$_POST["usuario"];

  include("_despliega.html");
  // Ya está blindado chicos

  if((isset($_POST['user'])) && (isset($_POST['password']))){
    $nombre=htmlspecialchars($_POST['user']);
    $password=htmlspecialchars($_POST['password']);
  }

  if ($nombre=='robleManzano' && $password=='paralelepipedo' && $_POST['age']=='14-17'){
      echo "Yujuu!! :D";
      echo $_POST['age'];
      //Declaremos la existencia de una sesiones
      $_SESSION['usuario']=$_POST['user'];

      header("location:index.php");
  }else {
    echo "
    <section class=container>
      Por Favor Ingresa Datos Válidos
    </section>
    ";
  }
  include("_footer.html");


?>
