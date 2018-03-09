<?php
    function connectDb() {
      $servername= "localhost";
      $username= "martin";
      $password="yosoymartin";
      $dbname="ejemplo";

      $ENV = "dev";
      if ($ENV == "dev") {
          $mysql = mysqli_connect($servername,$username,$password,$dbname);
          // var_dump($mysql);
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
                              </tr>';
            }
            $html .= '</table>';
            echo $html;           //Muestra la concatenación

            mysqli_free_result($results);
            closeDb($db);
            return true;
        }
        return true;
    }


?>
