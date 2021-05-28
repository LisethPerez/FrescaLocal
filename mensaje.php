<?php 
$cantidad = $_GET['var'];

$producto_1 = $_POST['producto'];
$peso = $_POST['peso2'];
$codigo = $_POST['producto1'];

$total = 0;
include 'conexionGene.php';
if(empty($codigo)){
    $consult = "SELECT * FROM producto WHERE nombre='{$producto_1}'";
      
}else{
    $consult = "SELECT * FROM producto WHERE ean='{$codigo}'";
}

$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
if($numFilas = $sql->num_rows>0){
    $result = $sql->fetch_object();
    $stock_minimo = $result->stock_minimo;
    $idProduc = $result->id_producto;

    include 'conexionBD.php';
    $consult1 = "SELECT * FROM stock WHERE producto_id_producto='{$idProduc}'";
    $sql1 = mysqli_query($conn,$consult1) or die(mysqli_error($conn));
    //$result1 = $sql1->fetch_object();
    //$cantidadStock = $result1->cantidad;

    $cantidadTotal = 0;

    while($result1 = mysqli_fetch_assoc($sql1)){
        $cantidadStock = $result1['cantidad'];
        $cantidadTotal = $cantidadStock + $cantidadTotal;         
    }

    //echo $cantidadTotal;

    if($cantidadTotal<$stock_minimo){
        echo "Hay pocas unidades del producto";
    }


}
?>