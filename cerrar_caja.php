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

$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";

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
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($consultCaja);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$consultCaja.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}else{
    echo "Ha ocurrido un error";
}
//$idEmple = $resultadoUser->id_empleado;

?>