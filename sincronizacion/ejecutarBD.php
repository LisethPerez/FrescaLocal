<?php 
//$fp = fopen("sentenciasBD.txt", "r+");

rename("sentenciasBD.txt", "sentenciasBD.php");
include "sentenciasBD.php";
rename("sentenciasBD.php", "sentenciasBD.txt");

$borrarContenido = fopen("sentenciasBD.txt", "w+");
fwrite($borrarContenido, "");
fclose($borrarContenido);

if(filesize("sentenciasBD.txt") <= 0){
    echo "Sentencias ejecutadas";
}else{
    echo "Ha ocurrido un error";
}
?>