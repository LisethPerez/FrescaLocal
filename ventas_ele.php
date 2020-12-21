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

$consult ="SELECT SUM(pago_total) total FROM factura WHERE id_factura_web!=0 AND facturapaga=1 AND anulacion=0 AND fecha BETWEEN '{$fecha}' AND '{$diaSiguiente}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));
$result = $sql->fetch_assoc();
$total = $result['total'];

echo $total;

/*$totalEfectivo = 0;
$totalDe = 0;
$totalCre = 0;
$totalLinks = 0;

if($num = $sql->num_rows>0){
    
    while($row = mysqli_fetch_assoc($sql)){

        $idPago = $row['tipo_pago_id_tpago'];
        $consultPago = "SELECT * FROM tipo_pago WHERE id_tpago='{$idPago}'";
        $sqlPago = mysqli_query($conn,$consultPago) or die(mysqli_error($conn));
        $resultPago = $sqlPago->fetch_assoc();
        $pago = $resultPago['nombre'];

        if($pago == "Efectivo"){
            $totalEfectivo = $row['pago_total'] + $totalEfectivo;
        }
    }
    echo $totalEfectivo;
    
}else{
    echo '<label>No existen registros</label>';
}*/

?>
