<?php 
session_start();

$idSede = $_SESSION['idSede'];
$idUser = $_SESSION['idUser'];
$fecha = date("Y-m-d") . " 00:00:00";
$diaSiguiente = date("Y-m-d", strtotime("+1 day", strtotime($fecha))) . " 00:00:00";

include 'conexionBD.php';

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$_SESSION['idUser']}'";
$sqlEmple = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultEmple = $sqlEmple->fetch_object();
$idEmpleado = $resultEmple->id_empleado; 


$consult ="SELECT SUM(total) totall FROM stock WHERE noFactura!=0 AND empleado_id_empleado='{$idEmpleado}' AND fecha_registro BETWEEN '{$fecha}' AND '{$diaSiguiente}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
$result = $sql->fetch_assoc();
$total = $result['totall'];

echo $total;

?>
