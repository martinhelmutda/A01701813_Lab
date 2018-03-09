

<?php
  include("util.php");
  $porEliminar=$_POST[borra];

  matarProducto($porEliminar);
  header("location:index.php");

?>
