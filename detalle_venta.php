<?php
session_start();

$id_Sede = $_SESSION['idSede'];
$id_usuario = $_SESSION['idUser'];
$dato = $_POST['var'];
$datos = json_decode(json_encode($dato),true);
$fecha = date('Y-m-d');

include 'conexionBD.php';
$consultaExi = "SELECT * FROM detalle_factura ORDER BY id_detallef DESC LIMIT 1";
$sqlExi = mysqli_query($conn,$consultaExi) or die(mysqli_error($conn));

if($num = $sqlExi->num_rows>0){
    $resultExi = $sqlExi->fetch_object();
    $numero = $resultExi->factura_id_factura;
    $numero = $numero+1;

}else{
    $numero = 1;
}

foreach ($datos as $product) {

    $nombre_producto = $product['producto'];
    $cantidad_pro = $product['cantidad'];
    $precio = $product['precio'];
    $peso = $product['peso'];
    $impuesto = $product['impuesto'];
    $descuento = $product['descuento'];
    $total = $product['total'];

   // print_r($product);

   include 'conexionGene.php';
    $consulta = "SELECT * FROM producto WHERE nombre='{$nombre_producto}'";
    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($numFilas = $sql->num_rows>0){
        $result = $sql->fetch_object();
        $id = $result->id_producto;
    }

    include 'conexionBD.php';
    $consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
    $sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
    $resultado = $sqlUser->fetch_object();

    $consult = "SELECT * FROM stock WHERE producto_id_producto='{$id}' AND sede_id_sede='{$id_Sede}'";
    $sql1 = mysqli_query($conn,$consult) or die(mysqli_error($conn));
    if($numFilas1 = $sql1->num_rows>0){
        $result1 = $sql1->fetch_object();
        $cantidad = $result1->cantidad;
        $cantidad = $cantidad - $cantidad_pro;
       

        //echo $cantidad;
    }

    $consult1 = "UPDATE stock SET cantidad={$cantidad} WHERE producto_id_producto='{$id}' AND sede_id_sede='{$id_Sede}'";
    $sql2 = mysqli_query($conn,$consult1) or die(mysqli_error($conn));

        if($peso=='NaN'){
        
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura, stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$cantidad_pro}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$numero}','{$result1->id_stock}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$resultado->id_empleado}')";
        } 
        if($cantidad_pro=='NaN'){
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura, stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ($peso,$precio,$descuento,$impuesto,$total,$con_fact,$result1->id_stock,$result->decuento_id_descuento,'$result->impuestos_id_impuestos','{$fecha}',$resultado->id_empleado)";
        }
    
        $sqlFact = mysqli_query($conn,$consult3) or die(mysqli_error($conn));
}
//$numero = $numero + 1;

echo $numero;

?>