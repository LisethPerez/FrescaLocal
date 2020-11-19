<?php 
include 'conexionBD.php';

$id_fact = $_GET['var'];
$total = 0;
$fecha = date('Y-m-d');
$id_usuario = $_SESSION['idUser'];
$id_Sede = $_SESSION['idSede'];
$tipo_pago = $_POST['pago'];
$cedula = $_POST['cliente'];

$consultaExi = "SELECT COUNT(*) contar, SUM(total) cant FROM detalle_factura WHERE factura_id_factura='{$id_fact}'";
$sqlExi = mysqli_query($conn,$consultaExi) or die(mysqli_error($conn));

if($num = $sqlExi->num_rows>0){
    $resultExi = $sqlExi->fetch_assoc();
    /*while($resultExi = $sqlExi->fetch_object()){
        $total = $total + $resultExi->total;
    }*/
    //$num = $sqlExi->num_rows;
    $consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
    $sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
    $resultado = $sqlUser->fetch_object();
    $empleadoId = $resultado->id_empleado;

    $consultCliente= "SELECT * FROM cliente WHERE documento='{$cedula}'";
    $sqlCliente = mysqli_query($conn,$consultCliente) or die(mysqli_error($conn));
    $resulCliente = $sqlCliente->fetch_object();
    $clienteId = $resulCliente->id_cliente;

    $consultPago= "SELECT * FROM tipo_pago WHERE nombre='{$tipo_pago}'";
    $sqlPago = mysqli_query($conn,$consultPago) or die(mysqli_error($conn));
    $resulPago = $sqlPago->fetch_object();
    $pagoId = $resulPago->id_tpago;


    echo $resultExi['contar'];
    echo $resultExi['cant'];
    //echo $total;

}else{
    echo "No hay detalle de venta";
}

?>