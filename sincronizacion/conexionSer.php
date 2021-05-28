<?php
$servidor="controler.com.co";
$username="control3_cosechafresca1";
$password="ctj9jN7ePPt@";
$db="control3_prueba1";
//$db="dbfresca";

$conn = mysqli_connect($servidor,$username,$password,$db) or die(mysqli_error());
/*if(!$conn){
    die('Error de conexión:'. $conn->connet_error());
}
else{
    print "Conexión exitosa\n" ;
}
exit(1);*/
?>
