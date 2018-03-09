<?php

include("util.php");
$producto=$_POST['productoN'];
$atributo=$_POST['atributoN'];
$descripcion=$_POST['descripcionN'];
$porCambiar=$_POST['edita'];

// echo "$producto";
// echo "$atributo";
// echo "$descripcion";
echo "$porCambiar";

  include("_header.html");
  include("_edit_product.html");
  include("_footer.html");
  actualizar($producto,$descripcion, $atributo, $porCambiar);
  if (isset($_POST['productoN'])) {
    header("location: index.php");
  }


?>
