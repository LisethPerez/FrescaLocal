<?php 
session_start();

$id_Sede = $_SESSION['idSede'];
$id_usuario = $_SESSION['idUser'];
$base = $_POST['var'];
$ingresosEfe = $_POST['var2'];
$ingresosElec = $_POST['var3'];
$egresos = $_POST['var4'];
$fecha1 = date('Y/m/d H:i:s');
$fecha = date("Y-m-d") . " 00:00:00";
$diaSiguiente = date("Y-m-d", strtotime("+1 day", strtotime($fecha))) . " 00:00:00";

include 'conexionBD.php';

$consult ="SELECT COUNT(*) total FROM factura WHERE id_factura_web=0 AND facturapaga=1 AND anulacion=0 AND fecha BETWEEN '{$fecha}' AND '{$diaSiguiente}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
$result = $sql->fetch_assoc();
$total = $result['total'];

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultadoUser = $sqlUser->fetch_object();
$idEmple = $resultadoUser->id_empleado;

echo $base." - ".$ingresosEfe." - ".$ingresosElec." - ".$total. " - " . $egresos;

$consultCaja = "INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('$base','$ingresosEfe','$ingresosElec','$egresos',0,'$total','$fecha1',0,0,'$idEmple','$id_Sede')";
$sqlCaja = mysqli_query($conn,$consultCaja) or die(mysqli_error($conn));
//$resultadoCaja = $sqlCaja->fetch_object();

if($sqlCaja){
    echo "Caja correcta";
}else{
    echo "Ha ocurrido un error";
}
//$idEmple = $resultadoUser->id_empleado;

?>