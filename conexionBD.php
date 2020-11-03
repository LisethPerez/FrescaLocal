<?php
$servidor="127.0.0.1";
$username="root";
$password="";
$db="dbfresca";

$conn = mysqli_connect($servidor,$username,$password,$db) or die(mysqli_error());
/*if(!$conn){
    die('Error de conexión:'. $conn->connet_error());
}
else{
    print "Conexión exitosa\n" ;
}
exit(1);*/
?>
