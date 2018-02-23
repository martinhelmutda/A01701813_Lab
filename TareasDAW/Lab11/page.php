<?php

  include("_header.html");
  // echo "Bienvenido ".$_POST["usuario"];
  include("_despliega.html");
  if (isset($_POST['nameField'])){
    echo "Yujuu!! :D";
    include("_cuestionario.html");
  }
  include("_footer.html");


?>
