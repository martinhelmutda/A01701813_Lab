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
    <section class="container">
      <p><strong>Genera</strong>
        <?php
        $array1 = array(30, 23, 34, 323, 67, 12);
        $i=0;
        $suma=0;
        while ($i <6) {
            echo $array1{$i}." ";
            $suma=$suma+$array1{$i};
            $i++;
        };
        ?>
      </p>
      <p><strong>El promedio es:</strong>
        <?php
        echo $suma/6;
        ?>
      </p>
      <p>
        <strong>La mediana de: </strong>
        <?php
        sort($array1);
        //Automáticamente ordena
        $j =0;
        while ($j <6) {
            echo $array1{$j}." ";
            $j++;
        };
        echo "<strong>es: </strong>";
        echo($array1{2}+$array1{3})/2;
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
