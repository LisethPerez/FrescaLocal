<?php
session_start();

$id_Sede = $_SESSION['idSede'];
$id_usuario = $_SESSION['idUser'];
$dato = $_POST['var'];
$datos = json_decode(json_encode($dato),true);
$fecha = date('Y-m-d H:i:s');
$cedula = $_GET['cliente'];

include 'conexionBD.php';


$consultCliente= "SELECT * FROM cliente WHERE documento='{$cedula}'";
$sqlCliente = mysqli_query($conn,$consultCliente) or die(mysqli_error($conn));
$resulCliente = $sqlCliente->fetch_object();
$clienteId = $resulCliente->id_cliente;

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultadoUser = $sqlUser->fetch_object();
$idEmple = $resultadoUser->id_empleado;

$consultaFac = "INSERT INTO factura (pago_total,noproductos,fecha,facturapaga,tipo_pago_id_tpago,empleado_id_empleado,cliente_id_cliente,sede_id_sede) VALUES (0,0,'{$fecha}',0,1,'{$idEmple}','{$clienteId}','{$id_Sede}')";
$sqlFact = mysqli_query($conn,$consultaFac) or die(mysqli_error($conn));

$consultt = "SELECT * FROM factura";
$sqll = mysqli_query($conn,$consultt) or die(mysqli_error($conn));
$fac = $sqll->fetch_object();
$idFactu = $fac->id_factura;
$consultaExi = "SELECT * FROM detalle_factura ORDER BY id_detallef DESC LIMIT 1";
$sqlExi = mysqli_query($conn,$consultaExi) or die(mysqli_error($conn));

/*if($num = $sqlExi->num_rows>0){
    $resultExi = $sqlExi->fetch_object();
    $numero = $resultExi->factura_id_factura;
    $numero = $numero+1;

}else{
    $numero = 1;
}*/

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
        
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$cantidad_pro}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$result1->id_stock}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
        } 
        if($cantidad_pro=='NaN'){
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura, stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ($peso,$precio,$descuento,$impuesto,$total,$idFactu,$result1->id_stock,$result->decuento_id_descuento,'$result->impuestos_id_impuestos','{$fecha}','{$idEmple}')";
        }
    
        $sqlFact = mysqli_query($conn,$consult3) or die(mysqli_error($conn));
}
//$numero = $numero + 1;

echo $idFactu;

?>