<?php
include 'conexionGene.php';

$producto_1 = $_POST['producto'];
$peso = $_POST['peso'];
$codigo = $_POST['producto1'];
$cantidad = $_POST['cantidad'];


if(empty($codigo)){
    $consult = "SELECT * FROM producto WHERE nombre='{$producto_1}'";
      
}else{
    $consult = "SELECT * FROM producto WHERE ean='{$cate}'";
}

$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
if($numFilas = $sql->num_rows>0){
    $result = $sql->fetch_object();
    
    $datos[] = array(
        "codigo"=>$result->ean,
        "cantidad"=>$cantidad,
        "producto"=>$producto_1,
        "peso"=>$peso,
        "precio"=>$result->precio,
        "opcion"=>'<button class="btn btn-danger btn-sm eliRows" id="eliminar_pro"><i class="fa fa-ban" aria-hidden="true"></i></button>'
    );
       
    echo json_encode($datos);
}
?>
