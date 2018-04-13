<!DOCTYPE html>
<html>
  <head lang="es">
    <title>Servicio Web</title>
    <meta charset="utf-8" />
    
  </head>
  <body>
    <header>
      <section class="container">
        
        <h1>Lab 24</h1>
        <br>
        <h2>Preguntas</h2>
        <p>¿A qué se refiere la descentralización de servicios web?</p>
        <p>A que toda la información no se procese en un mismo punto, sino que se distribuya a distintos lugares</p>
        <p>¿Cómo puede implementarse un entorno con servicios web disponibles aún cuando falle un servidor?</p>
        <p>Creando replicas e instancias de un servidor cada que una esté próxima a fallar y luego redirigir el tráfico a éstas</p>
        <br>
        <h3>Bienvenido a mi súper laboratorio, lo hice con mucho amor y poco tiempo.</h3>
        
        <p>Te daré un breve recorrido por el proyecto. La siguiente imagen muestra el ciclo de vida de un elote desde un módulo de servicio web llamado 'elote'. </p>
        <?php 
            $url = "https://pruebas-daw-martinhda.c9users.io/labService/public/elote"; //Route to the REST web service
            $c = curl_init($url);
            $response = curl_exec($c);
            curl_close($c);
        ?>
        
        
        Muy bien, ahora que te he mostrado el ciclo de vida del elote y algunos de sus derivados, hablaré de los panqueques.
        
        <?php 
            $url = "https://pruebas-daw-martinhda.c9users.io/labService/public/panqueques"; //Route to the REST web service
            $c = curl_init($url);
            $response = curl_exec($c);
            curl_close($c);
            //var_dump($response); 
        ?>
        
      </section>
    </header>

  </body>
  <footer>
    <strong>Hecho por A01701813</strong>
  </footer>
</html>
