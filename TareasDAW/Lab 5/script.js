function confirma() {
    var usr, psw, text;

    usr = document.getElementById("usuario").value;
    psw = document.getElementById("password").value;

    if (usr==psw) {
        text = "correcto";
    } else {
        text = "incorrecto";
    }
    document.getElementById("respuesta").innerHTML = text;
}


//Para ejerc extra
function solver1() {
  var x = document.getElementById("ej11");
  var b = document.getElementById("ej12");
  var c = document.getElementById("ej13");
  var i = x.selectedIndex;
  var j = b.selectedIndex;
  var k = c.selectedIndex;
  var pic = "images/pic_bulboff.gif"; //debemos definir que el foco siempre esta apagado, mientras no sea la respuesta correcta
  if ((i === 0) && (j === 2) && (k === 1)) {

    pic = "images/pic_bulbon.gif";
  } else {
    alert("Respuesta errada. Intenta de nuevo");
  }
  document.getElementById('foco1').src = pic;
}

//Venta
function sub()
{
  var cant1 = document.getElementById("cantidad1").value;
  var cant2 = document.getElementById("cantidad2").value;
  var cant3 = document.getElementById("cantidad3").value;
  var cant4 = document.getElementById("cantidad4").value;
  var resultado= cant1*19 +cant2*20+cant3*17+cant4*19;

  if(resultado>=100){
    resultado=resultado-10;
    document.getElementById("descuento").innerHTML="Descuento Aplicado";
  }

  document.getElementById("subtotal").innerHTML="$ "+resultado +".00";
  document.getElementById("iva").innerHTML="$ "+resultado*0.16;

 total(resultado);
}

function total(resultado){
  var total= resultado+resultado*.16;
  document.getElementById("total").innerHTML= "$ "+total + " USD";
}
