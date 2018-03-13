<?php
require_once("util.php");
$pattern=strtolower($_GET['pattern']);
$words=getAtributos('producto');
$words;

$response="";
$size=0;


    if (mysqli_num_rows($words)>0){
      while ($row=mysqli_fetch_assoc($words)) {
      $size++;
        echo "<td>". $row["atributos"]."</td>";
        $response.="<option value=". $row["atributos"].">". $row["atributos"]."</option>";
      }
    }
    echo "<select id=\"list\" size=$size onclick=\"selectValue()\">$response</select>";
// if (mysqli_num_rows($words)>0){
//   while ($row=mysqli_fetch_assoc($words)) {
//     $size++;
//     $word=$words[$i];
//     $response.="<option value=\"$word\">$word</option>";
//     $i++;
//   }
//   echo "<select id=\"list\" size=$size onclick=\"selectValue()\">$response</select>";
// }
?>
