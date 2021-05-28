<?php 
$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";
    
try {
    $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_prueba2',$username,$password);
    $mbd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    echo "Esta conectado";
} catch (PDOException $e) {
    echo 'Falló la conexión: ' . $e->getMessage();
}

?>