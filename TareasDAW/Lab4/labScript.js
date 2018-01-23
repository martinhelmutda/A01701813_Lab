


function myFunction(a, b) {
    document.getElementById("demo").innerHTML=a * b;
}


function genera_tabla() {
  var num = prompt("Ingresa un número entero", "Número");
  document.write("Yeah, ¡ésto es una tabla!")
  var rows;
  var cols;

  function table(rows, cols) {
    document.write('<table border="1">');
    for (i = 0; i < rows; i++) {
      document.write('<tr>');
      document.write('<td>' + i + '</td>');
      for (j = 0; j < cols; j++) {
        if(j==1){
          document.write('<td>' + i*i + '</td>');
        }else if (j==2) {
          document.write('<td>' + i*i*i + '</td>');
        }
      }
      document.write('</tr>');
    }
    document.write('</table>');
  }
  table(num, 3);
}


function problema(){
  var x= Math.round(Math.random()*100);
  var y= Math.round(Math.random()*100);
  var num = prompt("El número es "+x + " + " + y, "Ingresa el resultado")
  var seconds = new Date().getTime() / 1000;
  if (num==x+y){
    var seconds2 = new Date().getTime() / 1000;
    document.write("Bien, tardaste " + (seconds2-seconds) +" segundos");

  }else {
    document.write("Intenta de nuevo");
  }
}

function contador(){

  var arreglo = [30, -2, 5, 78, 0 ,89, -45, 23, 98, 34, 20]
  var cero=0;
  var negativo=0;
  var positivo=0;
  for(i=0;i < arreglo.length; i++){
    document.write(arreglo[i]+", ");
    if (arreglo[i]==0){
      cero++;
    } else if(arreglo[i]<0){
      negativo++;
    } else if(arreglo[i]>0){
      positivo++;
    }
  }
  document.write("Hay "+cero+" ceros, "+ negativo+" negativos y "+positivo+" positivos");
}
