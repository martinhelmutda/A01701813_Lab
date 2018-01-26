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
