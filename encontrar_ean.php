<?php 
$codigo = $_GET['var'];

include 'conexionGene.php';
$consult = "SELECT * FROM producto WHERE ean='{$codigo}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));

if($numFilas = $sql->num_rows>0){
    $result = $sql->fetch_object();
    echo $result->nombre;
}else{
    echo "No existe producto con el código ingresado";
}

?>