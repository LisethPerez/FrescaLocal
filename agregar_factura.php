<?php 
include 'conexionBD.php';

$id_fact = $_GET['var'];
$total = 0;
$fecha = date('Y-m-d H:i:s');
//$id_usuario = $_SESSION['idUser'];
//$id_Sede = $_SESSION['idSede'];
$tipo_pago = $_POST['tipo_pago'];
//$cedula = $_POST['cliente'];

$consultaExi = "SELECT COUNT(*) contar, SUM(total) cant FROM detalle_factura WHERE factura_id_factura='{$id_fact}'";
$sqlExi = mysqli_query($conn,$consultaExi) or die(mysqli_error($conn));

if($num = $sqlExi->num_rows>0){
    $resultExi = $sqlExi->fetch_assoc();
    /*while($resultExi = $sqlExi->fetch_object()){
        $total = $total + $resultExi->total;
    }*/
    //$num = $sqlExi->num_rows;
   

    $consultPago= "SELECT * FROM tipo_pago WHERE nombre='{$tipo_pago}'";
    $sqlPago = mysqli_query($conn,$consultPago) or die(mysqli_error($conn));
    $resulPago = $sqlPago->fetch_object();
    $pagoId = $resulPago->id_tpago;


    $cantidadProductos =  $resultExi['contar'];
    $totalPro = $resultExi['cant'];

    $consultaModi = "UPDATE factura SET pago_total={$totalPro}, noproductos={$cantidadProductos}, fecha='{$fecha}', facturapaga=1, tipo_pago_id_tpago='{$pagoId}' WHERE id_factura={$id_fact}";
    $sqlMoodi = mysqli_query($conn,$consultaModi) or die(mysqli_error($conn));
    if($sqlMoodi){
        echo "Cambios de factura" .$id_fact. " realizado";
    }
    else{
        echo "No se hicieron cambios";
    }
    //echo $total;

}else{
    echo "No hay detalle de venta";
}

?>