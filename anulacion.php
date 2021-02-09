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

        if($sqlModi){
            $username="control3_cosechafresca2";
            $password="vk{j@%zq2HWq";
            try {
                $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
                $mbd->query($modiStock);
            } catch (PDOException $e) {
                //echo 'Falló la conexión: ' . $e->getMessage();
                
                //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
                
                $file = fopen("sincronizacion/sentenciasBD.txt","a+");
                //$file = fopen('sentencias.txt', 'w');
                fwrite($file, '<?php'. PHP_EOL);
                fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
                fwrite($file, '$consulta1="'.$modiStock.'";' . PHP_EOL);
                fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
                fwrite($file, '?>'. PHP_EOL);
                fclose($file); 
            }
        }

        

    }

}

$modiFact = "UPDATE factura SET anulacion=1 WHERE id_factura={$idFac}";
$sqlFact = mysqli_query($conn,$modiFact) or die(mysqli_error($conn));

if($sqlFact){
    $username="control3_cosechafresca2";
    $password="vk{j@%zq2HWq";

    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($modiFact);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$modiFact.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}
   

$createAnula = "INSERT INTO nota_credito(fecha,factura_id_factura,empleado_id_empleado,sede_id_sede) VALUES ('{$fecha}','{$idFac}','{$idEmple}','{$id_Sede}')";
$sqlAnula = mysqli_query($conn,$createAnula) or die(mysqli_error($conn));

if($sqlAnula){

    $username="control3_cosechafresca2";
    $password="vk{j@%zq2HWq";
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($createAnula);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$createAnula.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}

if($sqlFact AND $sqlAnula AND $modiStock){
    echo "Proceso correcto";
}else{
    echo "Ha ocurrido un error";
}


?>