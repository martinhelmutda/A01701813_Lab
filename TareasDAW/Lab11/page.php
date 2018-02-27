<?php

  include("_header.html");
  // echo "Bienvenido ".$_POST["usuario"];
  include("_despliega.html");
  // Ya está blindado chicos

  if((isset($_POST['nameField'])) && (isset($_POST['commentField']))){
    $nombre=htmlspecialchars($_POST['nameField']);
    $coment=htmlspecialchars($_POST['commentField']);
  }else {
    $nombre;;
    $coment;
  }

  if ($nombre && $coment){
      echo "Yujuu!! :D";
      include("_cuestionario.html");
  }else {
    echo "Por Favor Ingresa Datos Válidos";
  }
  include("_footer.html");


?>
