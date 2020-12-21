<?php 
$base = $_POST['var'];
$ingresosEfe = $_POST['var2'];
$ingresosElec = $_POST['var3'];
$fecha = date("Y-m-d") . " 00:00:00";
$diaSiguiente = date("Y-m-d", strtotime("+1 day", strtotime($fecha))) . " 00:00:00";

include 'conexionBD.php';
/*$consultPago ="SELECT * FROM tipo_pago WHERE nombre='Efectivo'";
$sqlPago = mysqli_query($conn,$consultPago) or die(mysqli_error($conn));
$resultPago = $sqlPago->fetch_object();
$idEfec = $resultPago->id_tpago;*/

$consult ="SELECT COUNT(*) total FROM factura WHERE id_factura_web=0 AND facturapaga=1 AND anulacion=0 AND fecha BETWEEN '{$fecha}' AND '{$diaSiguiente}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
$result = $sql->fetch_assoc();
$total = $result['total'];

echo $base." - ".$ingresosEfe." - ".$ingresosElec." - ".$total;

?>