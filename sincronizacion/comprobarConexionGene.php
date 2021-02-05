<?php 
$username="control3_cosechafresca1";
$password="ctj9jN7ePPt@";
    
try {
    $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca1',$username,$password);
    $mbd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    echo "Esta conectado";
} catch (PDOException $e) {
    echo 'Falló la conexión: ' . $e->getMessage();
}

?>