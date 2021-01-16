<?php 

session_start();
$idFac = $_GET['var'];
$id_Sede = $_SESSION['idSede'];
$id_usuario = $_SESSION['idUser'];
$fecha = date('Y/m/d H:i:s');

include 'conexionBD.php';

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultadoUser = $sqlUser->fetch_object();
$idEmple = $resultadoUser->id_empleado;

$consultFact = "SELECT * FROM detalle_factura WHERE factura_id_factura={$idFac}";
$sqlFact = mysqli_query($conn,$consultFact) or die(mysqli_error($conn));

if($num = $sqlFact->num_rows>0){
    while($resultado = mysqli_fetch_assoc($sqlFact)){
        $cantidad = $resultado['cantidad'];
        $idStock = $resultado['stock_id_stock'];

        $consultStock = "SELECT * FROM stock WHERE id_stock={$idStock}";
        $sqlStock = mysqli_query($conn,$consultStock) or die(mysqli_error($conn));
        $resultStock = $sqlStock->fetch_object();
        $cantStock = $resultStock->cantidad;

        $nuevaCant = $cantidad + $cantStock;

        $modiStock = "UPDATE stock SET cantidad={$nuevaCant} WHERE id_stock={$idStock}";
        $sqlModi = mysqli_query($conn,$modiStock) or die(mysqli_error($conn));

        if($sqlStock){
            echo "Stock actualizado";
        }else{
            echo "No se actulizó el stock";
        }
    }

}

$modiFact = "UPDATE factura SET anulacion=1 WHERE id_factura={$idFac}";
$sqlFact = mysqli_query($conn,$modiFact) or die(mysqli_error($conn));

if($sqlFact){
    echo "Factura anulada";
}else{
    echo "Factura no anulada";
}

$createAnula = "INSERT INTO nota_credito(fecha,factura_id_factura,empleado_id_empleado,sede_id_sede) VALUES ('{$fecha}','{$idFac}','{$idEmple}','{$id_Sede}')";
$sqlAnula = mysqli_query($conn,$createAnula) or die(mysqli_error($conn));

if($sqlFact){
    echo "Nota crédito creada";
}else{
    echo "Nota crédito no creada";
}


?>