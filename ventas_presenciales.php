<?php 
session_start();

$tipo = $_POST['var'];
$idSede = $_SESSION['idSede'];
$idUser = $_SESSION['idUser'];
$fecha = date("Y-m-d") . " 00:00:00";
$diaSiguiente = date("Y-m-d", strtotime("+1 day", strtotime($fecha))) . " 00:00:00";

include 'conexionBD.php';

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$_SESSION['idUser']}'";
$sqlEmple = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultEmple = $sqlEmple->fetch_object();
$idEmpleado = $resultEmple->id_empleado; 


if($tipo=="presenciales"){
    $consult ="SELECT * FROM factura WHERE id_factura_web=0 AND facturapaga=1 AND empleado_id_empleado='{$idEmpleado}' AND empleado_id_domiciliario=0 AND anulacion=0 AND fecha BETWEEN '{$fecha}' AND '{$diaSiguiente}'";
}

if($tipo=="domicilio"){
    $consult ="SELECT * FROM factura WHERE id_factura_web=0 AND facturapaga=1 AND empleado_id_empleado='{$idEmpleado}' AND empleado_id_domiciliario!=0 AND anulacion=0 AND fecha BETWEEN '{$fecha}' AND '{$diaSiguiente}'";
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
        if($pago == "Tarjeta crédito"){
            $totalCre = $row['pago_total'] + $totalCre;
        }
        if($pago == "Tarjeta débito"){
            $totalDe = $row['pago_total'] + $totalDe;
        }
        if($pago == "Link de pago"){
            $totalLinks = $row['pago_total'] + $totalLinks;
            
        }
    $total = $totalLinks+$totalEfectivo+$totalDe+$totalDe;
      
    }
    echo '<div class="form-row">';
    echo '<div class="col">';
    echo '<label>Efectivo</label>';
    echo '<input type="hidden" id="pagosEfec" name="pagosEfec" value="'.$totalEfectivo.'">';
    echo '<input type="text" class="form-control" id="pagosEfe" style="font-size:150%;" name="pagosEfe" value="$'.number_format($totalEfectivo).'" onkeypress="return onlyNums(event)" disabled>';
    echo '</div>';
    echo '<div class="col">';
    echo '<label>Tarjeta crédito</label>';
    echo '<input type="hidden" id="pagosCred" name="pagosCred" value="'.$totalCre.'">';
    echo '<input type="text" class="form-control" id="pagosCre" style="font-size:150%;" name="pagosCre" value="$'.number_format($totalCre).'" onkeypress="return onlyNums(event)" disabled>';
    echo '</div>';
    echo '<div class="col">';
    echo '<label>Tarjeta débito</label>';
    echo '<input type="hidden" id="pagosDeb" name="pagosDeb" value="'.$totalDe.'">';
    echo '<input type="text" class="form-control" id="pagosDe" style="font-size:150%;" name="pagosCre" value="$'.number_format($totalDe).'" onkeypress="return onlyNums(event)" disabled>';
    echo '</div>';
    echo '<div class="col">';
    echo '<label>Links de pago</label>';
    echo '<input type="hidden" id="pagosLinks" name="pagosLinks" value="'.$totalLinks.'">';
    echo '<input type="text" class="form-control" id="pagosLink" style="font-size:150%;" name="pagosLink" value="$'.number_format($totalLinks).'" onkeypress="return onlyNums(event)" disabled>';
    echo '</div>';
    echo '</div>';
    
    
}else{
    echo '<label>No existen ventas con el tipo de venta seleccionado el día de hoy.</label>';
}

?>


<script>

$('#pagosEfe').on('change', () => {
    const value = $('#pagosEfe').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#pagosEfe').val("$ " + newValue);
});
    
$('#pagosCre').on('change', () => {
    const value = $('#pagosCre').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#pagosCre').val("$ " + newValue);
});

$('#pagosDe').on('change', () => {
    const value = $('#pagosDe').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#pagosDe').val("$ " + newValue);
});

$('#pagosLink').on('change', () => {
    const value = $('#pagosLink').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#pagosLink').val("$ " + newValue);
});
</script>