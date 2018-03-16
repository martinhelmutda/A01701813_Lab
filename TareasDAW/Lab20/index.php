<?php
session_start();
include("_header.html");

//OJO CON ESTO Llamamos la base de datos
require_once("util.php");

if (isset($_SESSION['usuario'])) {
  include("_add_product.html");
  include("_cuestionario.html");
}else {
  //Si no se ha iniciado la sesión se conduce a la página para hacerlo
  header("location:page.php");
}
include("_footer.html");
?>
