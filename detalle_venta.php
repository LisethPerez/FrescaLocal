<?php
include 'conexionBD.php';
include 'conexionGene.php';
//$dato = $_GET['var'];
$dato = $_POST['var'];
$datos = json_decode(json_encode($dato),true);

foreach ($datos as $product) {
    
    print_r($product);
}


?>