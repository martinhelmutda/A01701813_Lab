<?php
    function connectDb() {
      $servername= "localhost";
      $username= "martin";
      $password="yosoymartin";
      $dbname="ejemplo";

      $ENV = "dev";
      if ($ENV == "dev") {
          $mysql = mysqli_connect($servername,$username,$password,$dbname);

                                          //root si estan en windows
      } else  if ($ENV == "prod"){
          $mysql = mysqli_connect($servername,$username,$password,$dbname);

      }

        $mysql->set_charset("utf8");
        return $mysql;
    }

    function closeDb($mysql) {
        mysqli_close($mysql);
    }


    function getProductosTipo($atributo) {
        $db = connectDb();
        if ($db != NULL) {

            //Specification of the SQL query
            $query='SELECT nombre, atributos FROM producto WHERE atributos = "'.$atributo.'"';
            $query;
             // Query execution; returns identifier of the result group
            $results = $db->query($query);
             // cycle to explode every line of the results

           while ($fila = mysqli_fetch_array($results, MYSQLI_BOTH)) {
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both
                    for($i=0; $i<count($fila); $i++) {
                        // use of numeric index
                        echo $fila[$i].' ';
                    }
                    echo '<br>';
            }

            // it releases the associated results
            mysqli_free_result($results);
            closeDb($db);
            return true;
        }
        return true;
    }



    function getProductos() {
        $db = connectDb();
        if ($db != NULL) {

          //Specification of the SQL query
          $query='SELECT * FROM producto';
          $query;
           // Query execution; returns identifier of the result group
          $results = $db->query($query);
           // cycle to explode every line of the results
          $html = '<table>';
           while ($fila = mysqli_fetch_array($results, MYSQLI_BOTH)) {
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both
                    $html .= '<tr>
                                <td>
                                  <p>'.$fila["nombre"].'</p>
                                </td>
                                <td>
                                  <p>'.$fila["descripcion"].'</p>
                                </td>
                                <td>
                                  <form action="elimina.php" method="POST" enctype="multipart/form-data">
                                    <div class="input-field col s6">
                                          <button class="button button-clear" name="borra" value="'.$fila["nombre"].'" type="submit">Eliminar</button>
                                    </div>
                                  </form>
                                </td>
                                <td>
                                  <form action="edita.php" method="POST" enctype="multipart/form-data">
                                    <div class="input-field col s6">
                                          <button class="button button-clear" name="edita" value="'.$fila["nombre"].'" type="submit">Editar</button>
                                    </div>
                                  </form>
                                </td>
                              </tr>';
            }
            $html .= '</table>';
            echo $html;           //Muestra la concatenación

              // <button class="button button-clear" onclick="matarProducto('.$fila["nombre"].')">Eliminar</button>

            mysqli_free_result($results);
            closeDb($db);
            return true;
        }
        return true;
    }

    function insertProduct($nombre, $descripcion, $atributos){

      $db = connectDb();
       if ($db != NULL) {

           // insert command specification
           $query='INSERT INTO producto (nombre, descripcion, atributos) VALUES (?,?,?) ';
           // Preparing the statement
           if (!($statement = $db->prepare($query))) {
               die("Preparation failed: (" . $db->errno . ") " . $db->error);
           }
           // Binding statement params
           if (!$statement->bind_param("sss", $nombre, $descripcion, $atributos)) {
               die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
           }
            // Executing the statement
            if (!$statement->execute()) {
               die("Execution failed: (" . $statement->errno . ") " . $statement->error);
             }


           mysqli_free_result($results);

           closeDb($db);
           return true;
       }
       return false;
    }

  function matarProducto($nombre){
    $db = connectDb();
    if ($db != NULL) {
        $sql='Delete from producto where nombre="'.$nombre.'"';
         $db->query($sql);

        closeDb($db);
        return true;
    }
    return false;
}

function actualizar($nombre, $descripcion, $atributo, $actual){
       $db = connectDb();
       if ($db != NULL) {
           $sql='Update producto set nombre="'.$nombre.'",descripcion="'.$descripcion.'", atributos="'.$atributo.'" where nombre="otro"';
           $db->query($sql);
           closeDb($db);
           return true;
       }
       return false;
   }

function getAtributos($nombre){
  $db = connectDb();
  if ($db != NULL) {
      $sql='SELECT atributos from '.$nombre.'';
      $sql;

      $results = $db->query($sql);

      $atributos= array();

      while ($fila = mysqli_fetch_array($results, MYSQLI_BOTH)) {
          $atributos[] = $fila['atributos'];
       }

      closeDb($db);

      return $atributos;
  }
  return false;
}

?>
