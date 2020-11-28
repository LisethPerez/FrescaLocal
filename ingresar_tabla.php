<?php
include 'conexionGene.php';


$tipo = $_GET['var'];
$cont = $_GET['var2'];
$producto_1 = $_POST['producto'];
$peso = $_POST['peso'];
$codigo = $_POST['producto1'];
$cantidad = $_POST['cantidad'];


if(empty($codigo)){
    $consult = "SELECT *, producto.nombre AS nombreEmple FROM producto INNER JOIN descuento ON producto.descuento_id_descuento=descuento.id_descuento INNER JOIN impuestos ON producto.impuestos_id_impuestos=impuestos.id_impuestos WHERE producto.nombre='{$producto_1}'";
      
}else{
    $consult = "SELECT *, producto.nombre AS nombreEmple  FROM producto INNER JOIN descuento ON producto.descuento_id_descuento=descuento.id_descuento INNER JOIN impuestos ON producto.impuestos_id_impuestos=impuestos.id_impuestos WHERE producto.ean='{$codigo}'";
}

$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
if($numFilas = $sql->num_rows>0){
    $result = $sql->fetch_assoc();

    if($tipo=="1"){
        $precio = $result['precio_2'];
    }
    if($tipo=="2"){
        $precio = $result['precio_1'];
    }
    $datos[] = array(
        "id"=>$cont,
        "codigo"=>$result['ean'],
        "cantidad"=>$cantidad,
        "producto"=>$result['nombreEmple'],
        "peso"=>$peso,
        "precio"=>$precio,//$result->costo_compra,
        "impuesto"=>$result['valor_impuesto'],
        "descuento"=>$result['valor_descuento'],
        "opcion"=>'<button class="btn btn-danger btn-sm eliRows" id="eliminar_pro"><i class="fa fa-trash" aria-hidden="true"></i></button>'
    );
       
    echo json_encode($datos);
}
?>
