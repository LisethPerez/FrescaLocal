<?php
/*$servidor="remotemysql.com";
$username="MTvDp0bqcd";
$password="SxQzQi4dyT";
$db="MTvDp0bqcd";*/

/*$servidor="controler.com.co";
$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";
$db="control3_cosechafresca2";*/

$servidor="127.0.0.1";
$username="root";
$password="";
$db="basefresca";

$conn = mysqli_connect($servidor,$username,$password,$db) or die(mysqli_error());
/*if(!$conn){
    die('Error de conexión:'. $conn->connet_error());
}
else{
    print "Conexión exitosa\n" ;
}
exit(1);*/
?>
