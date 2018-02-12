<!DOCTYPE html>
<html>
  <head>
    <link type='text/css' rel='stylesheet' href='milligram.css'/>
    <title>PHP!</title>
  </head>
  <body>
    <header>
      <h1>Hola, éste es el nuevo lab</h1>
    </header>
    <br>
    <section class="container">
      <p><strong>Genera</strong>

        <?php
          $array1 = array(30, 23, 34, 323, 67, 12);
          $i=0;
          $suma=0;
          while ($i <6) {
              echo $array1{$i}." ";
              $i++;
          };

          function promedio($arreglo)
          {
              while ($i <6) {
                  $suma=$suma+$arreglo{$i};
                  $i++;
              };
              echo $suma/6;
          }
        ?>

      </p>
      <p><strong>El promedio es:</strong>

        <?php
          promedio($array1);
        ?>

      </p>
      <p>
        <strong>La mediana de: </strong>

        <?php
          sort($array1);
          //Automáticamente ordena
          function mediana($array)
          {
              $j =0;
              while ($j <6) {
                  echo $array{$j}." ";
                  $j++;
              };
              echo "<strong>es: </strong>";
              echo($array{2}+$array{3})/2;
          }
          mediana($array1);
        ?>



      </p>
      <p>

        <?php
          $array2 = array(56, 105, 12, 80, 22, 36);
         ?>

        <strong>El arreglo es:
          <?php
          $i=0;
          $suma=0;
          while ($i <6) {
              echo $array2{$i}." ";
              $i++;
          }; ?>
        </strong>
        <ul>

          <?php
            sort($array2);
              echo "<li>El arreglo ordenado es:";
              foreach ($array2 as $key2) {
                  echo $key2." ";
              }echo "</li>";
            rsort($array2);
              echo "<li>El arreglo ordenado en orden descendiente es:";
              foreach ($array2 as $key2) {
                  echo $key2." ";
              }echo "</li>";
              echo "<li> La mediana de";
              mediana($array1);
              echo "</li>";

              echo "<li> La media es:";
              promedio($array2);
              echo"</li>";
          ?>

        </ul>
      </p>

      <p>
        <?php
          $num=5;
          $i=0; $j=0;
          echo "<table>";
          echo "<thead><td>Número</td><td>Número Cuadrado</td><td>Número Cúbico</td></thead>";
          for ($i=0; $i < $num; $i++) {
              echo "<tr> <td>".$i."</td><td>".$i*$i."</td><td>".$i*$i*$i."</td></tr>";
          }
          echo"</table>";
         ?>
      </p>

      <br>
      <h3>Cuestionario</h3>
        <ul>
          <li>¿Qué hace la función phpinfo()? Describe y discute 3 datos que llamen tu atención.</li>
          Muestra la información de la configuración PHP, así como la versión que tenemos. Incluye opciones de compilación y extensiones. \n
          Datos que llaman mi atención:
            <ul>
              <li>Puedes pedir solamente un módulo de información</li>
              <li>Muestra el charset default</li>
              <li>Tiene alguna extensiones que ya no se usan</li>
            </ul>
          <li>¿Qué cambios tendrías que hacer en la configuración del servidor para que pudiera ser apto en un ambiente de producción?</li>
          Debería de cambiar a FastCGI, donde PHP se ejecute en su propio espacio de memoria.
          <li>¿Cómo es que si el código está en un archivo con código html que se despliega del lado del cliente, se ejecuta del lado del servidor? </li>
          El navegador convierte el código enviado por el servidor en una interfaz gráfica. Al interactuar con la interfaz de una página en realidad estamos haciendo peticiones al servidor, que posteriormente son contestadas
          Dependiendo el lenguaje con el que se trabaje es posible saber si se ejecuta del lado del cliente o del servidor.
        </ul>
      </p>
      <br>
      <h3>Bibliografía</h3>
      <p>php.net/manual/es/faq.installation.php</p>
      <p>www.adelat.org/media/docum/nuke_publico/lenguajes_del_lado_servidor_o_cliente.html</p>
      <p><strong>Aquí salen palabras ordenadas aleatoriamente:<strong></p>

      <blockquote>
        <p><em>

          <?php
          //Mezclar las palabras
            $palabras = array("como ", "serrucho ", "papalote ", "cielo ",
            "decirte ", "quiero ", "tanto ", "nadador ", "millonario ");
            shuffle($palabras);
            foreach ($palabras as $palabra) {
                echo $palabra;
            };
            unset($palabra);
          ?>

        </em></p>
      </blockquote>

    </section>

  </body>
</html>
