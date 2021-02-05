<?php
//$archivo = fopen("sentenciasBD.txt", "r");
if(filesize("sentenciasBD.txt") > 0){
echo "El archivo tiene contenido";

} else {
echo "El archivo esta vacio";
}
?>