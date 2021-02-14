<?php
include 'conexionGene.php';


$tipo = $_GET['var'];
$cont = $_GET['var2'];
$producto_1 = $_POST['producto'];
$peso = $_POST['peso2'];
$codigo = $_POST['producto1'];
$cantidad = $_POST['cantidad'];


$total = 0;

if(empty($codigo)){
    $consult = "SELECT *, producto.nombre AS nombreEmple FROM producto INNER JOIN descuento ON producto.descuento_id_descuento=descuento.id_descuento INNER JOIN impuestos ON producto.impuestos_id_impuestos=impuestos.id_impuestos WHERE producto.nombre='{$producto_1}'";
      
}else{
    $consult = "SELECT *, producto.nombre AS nombreEmple  FROM producto INNER JOIN descuento ON producto.descuento_id_descuento=descuento.id_descuento INNER JOIN impuestos ON producto.impuestos_id_impuestos=impuestos.id_impuestos WHERE producto.ean='{$codigo}'";
}

$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
if($numFilas = $sql->num_rows>0){
    $result = $sql->fetch_assoc();
    $impuesto = intval($result['valor_impuesto']);
    $descuento = intval($result['valor_descuento']);
    
    $impuesto1 = $impuesto/100;
    $descuento1 = $descuento/100;
    
    if($tipo=="1"){
        $precio = $result['precio_1'];
    }
    else if($tipo=="2"){
        $precio = $result['precio_2'];

    }else if($tipo=="3"){
        $precio = $result['precio_3'];
        
    }else if($tipo=="4"){
        $precio = $result['precio_4'];
    }

    if(empty($peso)){
       // $total = round($cantidad*($precio+(($impuesto*$precio)/100)-(($descuento*$precio)/100)));
       $precioNuevo = round((($precio-($precio*$descuento1))*$cantidad));
       $total = round($precioNuevo+($precioNuevo*$impuesto1));
    }
    if(empty($cantidad)){
        //$total = round($peso*($precio+(($impuesto*$precio)/100)-(($descuento*$precio)/100)));
        $precioNuevo1 = round((($precio-($precio*$descuento1))*$peso));
        $total = round($precioNuevo1+($precioNuevo1*$impuesto1));
    }
    $datos[] = array(
        "id"=>$cont,
        "codigo"=>$result['ean'],
        "cantidad"=>$cantidad,
        "producto"=>$result['nombreEmple'],
        "peso"=>$peso,
        "precio"=>$precio,//$result->costo_compra,
        "total"=>$total,
        "impuesto"=>$impuesto,
        "descuento"=>$descuento,
        "opcion"=>'<button class="btn btn-danger btn-sm eliRows" id="eliminar_pro"><i class="fa fa-trash" aria-hidden="true"></i></button>'
    );
       
    echo json_encode($datos);
}
?>
