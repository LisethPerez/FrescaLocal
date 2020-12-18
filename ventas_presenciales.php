<?php 
session_start();

$tipo = $_POST['var'];
$idSede = $_SESSION['idSede'];
$idUser = $_SESSION['idUser'];

include 'conexionBD.php';

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$_SESSION['idUser']}'";
$sqlEmple = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultEmple = $sqlEmple->fetch_object();
$idEmpleado = $resultEmple->id_empleado; 


if($tipo=="presenciales"){
    $consult ="SELECT * FROM factura WHERE id_factura_web=0 AND facturapaga=1 AND empleado_id_empleado='{$idEmpleado}' AND empleado_id_domiciliario=0 AND anulacion=0";
}

if($tipo=="domicilio"){
    $consult ="SELECT * FROM factura WHERE id_factura_web=0 AND facturapaga=1 AND empleado_id_empleado='{$idEmpleado}' AND empleado_id_domiciliario!=0 AND anulacion=0";
}

$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));

$totalEfectivo = 0;
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
        if($pago == "Tarjeta credito"){
            $totalCre = $row['pago_total'] + $totalCre;
        }
        if($pago == "Tarjeta debito"){
            $totalDe = $row['pago_total'] + $totalDe;
        }
        if($pago == "Link de pago"){
            $totalLinks = $row['pago_total'] + $totalLinks;
            
        }

      
    }
    echo "Pagos efectivo: ".$totalEfectivo. " credito: " .$totalCre. " debito: ".$totalDe. " links: ".$totalLinks;
    
}







?>