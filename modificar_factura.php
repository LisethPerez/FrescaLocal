<?php
$sipaga = $_POST['var'];
$tipoPa = $_POST['var2'];
$referencia = $_POST['var3'];
$idFac = $_POST['var4'];

$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";

include 'conexionBD.php';
if($tipoPa=="Efectivo"){
    $ModiFac = "UPDATE factura SET facturapaga='{$sipaga}', tipo_pago_id_tpago='{$tipoPa}' WHERE id_factura='{$idFac}'";
}else{
   
    $ModiFac = "UPDATE factura SET referencia_pago='{$referencia}',facturapaga='{$sipaga}', tipo_pago_id_tpago='{$tipoPa}' WHERE id_factura='{$idFac}'";
}

$sql = $sqlMoodi = mysqli_query($conn, $ModiFac) or die(mysqli_error($conn));
if($sql){
    echo "Modificación de estado de la factura correcta";
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($ModiFac);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$ModiFac.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}else{
    echo "Modificación de estado de la factura incorrecta";
}
?>
