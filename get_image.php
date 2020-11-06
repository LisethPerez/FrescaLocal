<?php
require 'conexionGene.php';

$produ = $_GET['var'];

$consult = "SELECT * FROM producto INNER JOIN categoria_productos ON producto.categoria_id_categoria=categoria_productos.id_categoria WHERE producto.nombre='{$produ}'";
    
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));

if($numFilas = $sql->num_rows>0){

    $result = $sql->fetch_object();
    //$image = imagecreatefromjpeg($result->imagen);

    echo '<div class="col">';
    echo '<img src="imagen/' .$result->imagen. '">';
    echo '</div>';
    echo '<div class="col">';
    echo $result->nombre;
    echo '</div>';
}


?>