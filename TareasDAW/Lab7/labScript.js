


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

function promedio(){
  var matriz = [[30, -2, 5, 78],[ 0 ,89, -45, 23],[16, 98, 34, 20]]
  var sum=0;
    document.write('<table border="1">');
    for (i = 0; i < matriz.length; i++) {
      document.write('<tr>');

      for (j = 0; j < matriz[i].length; j++) {
          document.write('<td>' + matriz[i][j]+ '</td>');
          sum=sum+matriz[i][j];
      }
      document.write('<td>'+sum/matriz[i].length+'</td>')
      document.write('</tr>');
      sum=0;
    }
    document.write('</table>');
}

function inverso(){
  var num=prompt("Ingresa el número que quieres invertir", "Número")
  var tam=num.length;
  var inversion="";

   while (tam>=0) {
    inversion=inversion+num.charAt(tam);
    tam--;
  }
    document.write(inversion);
}



var cafe1 = new Object();
cafe1.tueste="Negro intenso";
cafe1.origen="Colombia";

function preparacion(){
  var metodos=["capuccino", "latte", "moka", "esspresso"];
  var opc=Math.round(Math.random()*3);
  document.write("Gracias por comprar el café "+metodos[opc]+ " de "+ cafe1.origen+ " de tueste "+"<br>");
  despedida();
}

function despedida(){
  var adios=["Hasta luego", "adios", "bye", "Gracias por tu compra "];
  var opc=Math.round(Math.random()*3);
  document.write(adios[opc]);
}

function cambiarEstilo(){
  document.getElementById('grant').className='supremo';
}




function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}



function saludo(){
  setInterval(function(){ alert("Hola chavos, ¿qué tal?"); }, 4500);
}
/*Aparece cada tanto tiempo*/

function feliz(){
  setTimeout(function(){ alert("Gracias, ahora soy feliz"); }, 3000);
}
/*Aparece solo una vez después de tanto tiempo*/
