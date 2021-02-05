<?php 
//$cantidadPro = $_POST['var'];
session_start();

$id_Sede = $_SESSION['idSede'];
$id_usuario = $_SESSION['idUser'];
$idDetalle = $_POST['var2'];
//$idStock = $_POST['var3'];
$cantidadNueva = $_POST['var4'];
$producto = $_POST['var5'];
$id_Stock = array();

$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";

include 'conexionGene.php';
$consultPro = "SELECT * FROM producto WHERE nombre='{$producto}'";
$sqlPro = mysqli_query($conn,$consultPro) or die(mysqli_error($conn));
$resultPro = $sqlPro->fetch_object();
$idPro = $resultPro->id_producto;
$precio = $resultPro->precio_1;
$impuesto = $resultPro->impuestos_id_impuestos;
$descuento = $resultPro->descuento_id_descuento;

$consultIm = "SELECT * FROM impuestos WHERE id_impuestos='{$impuesto}'";
$sqlIm = mysqli_query($conn,$consultIm) or die(mysqli_error($conn));
$resultIm = $sqlIm->fetch_object();
$valorImpu = $resultIm->valor_impuesto;

$consultDes = "SELECT * FROM descuento WHERE id_descuento='{$descuento}'";
$sqlDes = mysqli_query($conn,$consultDes) or die(mysqli_error($conn));
$resultDes = $sqlDes->fetch_object();
$valorDes = $resultDes->valor_descuento;

$total = round($cantidadNueva*($precio+(($valorImpu*$precio)/100)-(($valorDes*$precio)/100)));

include 'conexionBD.php';
$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultadoUser = $sqlUser->fetch_object();
$idEmple = $resultadoUser->id_empleado;

$consultDetalle = "SELECT * FROM detalle_factura WHERE id_detallef={$idDetalle}";
$sqlDetalle = mysqli_query($conn,$consultDetalle) or die(mysqli_error($conn));
$resul = $sqlDetalle->fetch_object();
$cantidadPro = $resul->cantidad;
$idStock = $resul->stock_id_stock;
$idFact = intval($resul->factura_id_factura);

$consultStock = "SELECT * FROM stock WHERE id_stock={$idStock}";
$sqlStock = mysqli_query($conn,$consultStock) or die(mysqli_error($conn));
$result = $sqlStock->fetch_object();
$cantidadStock = $result->cantidad;

//echo $cantidadStock." - " .$cantidadPro." - ".$idStock;

$nuevaCan = $cantidadPro + $cantidadStock;

$modiStock = "UPDATE stock SET cantidad={$nuevaCan} WHERE id_stock={$idStock}";
$sqlModi = mysqli_query($conn,$modiStock) or die(mysqli_error($conn));

if($sqlModi){
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

$consulta = "SELECT * FROM stock WHERE producto_id_producto={$idPro} AND sede_id_sede={$id_Sede}";
$sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($num = $sql->num_rows>0){
        while($resultado = mysqli_fetch_assoc($sql)){
            $diponibilidad = $resultado['disponibilidad'];
            if($diponibilidad == "1"){
                array_push($id_Stock, $resultado['id_stock']);
            }   
        }
    }
    $numA = count($id_Stock);

    for($i=0;$i<$numA;$i++){
        //$cantidad1 = 0;
        $consult = "SELECT * FROM stock WHERE id_stock={$id_Stock[$i]}";
        $sql1 = mysqli_query($conn,$consult) or die(mysqli_error($conn));
        if($numFilas1 = $sql1->num_rows>0){
            $result1 = $sql1->fetch_object();
            $cantidad = $result1->cantidad;

            if($cantidadNueva<$cantidad){
                
                $cantidad1 = $cantidad - $cantidadNueva;

                $mensaje = $result1->id_stock;
                //echo $mensaje;
                $consult5 = "UPDATE stock SET cantidad={$cantidad1}, producto_id_producto={$idPro} WHERE id_stock='{$mensaje}'";
                break;
            }else{
                $residuo = $cantidadNueva - $cantidad;
                if($residuo>0){
                    $consult2 = "UPDATE stock SET cantidad=0, producto_id_producto={$idPro} WHERE id_stock={$idStock[$i]}";
                    $sql2 = mysqli_query($conn,$consult2) or die(mysqli_error($conn));
                    $cantidadNueva = $residuo;

                    if($sql2){
                        try {
                            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
                            $mbd->query($consult2);
                        } catch (PDOException $e) {
                            //echo 'Falló la conexión: ' . $e->getMessage();
                            
                            //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
                            
                            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
                            //$file = fopen('sentencias.txt', 'w');
                            fwrite($file, '<?php'. PHP_EOL);
                            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
                            fwrite($file, '$consulta1="'.$consult2.'";' . PHP_EOL);
                            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
                            fwrite($file, '?>'. PHP_EOL);
                            fclose($file); 
                        }
                    }
                }
            }
        }
    }

    $sql5 = mysqli_query($conn,$consult5) or die(mysqli_error($conn));

    if($sql5){
        try {
            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
            $mbd->query($consult5);
        } catch (PDOException $e) {
            //echo 'Falló la conexión: ' . $e->getMessage();
            
            //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
            
            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
            //$file = fopen('sentencias.txt', 'w');
            fwrite($file, '<?php'. PHP_EOL);
            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
            fwrite($file, '$consulta1="'.$consult5.'";' . PHP_EOL);
            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
            fwrite($file, '?>'. PHP_EOL);
            fclose($file); 
        }
    }
    unset($id_Stock);
    $id_Stock = array();

$modiDetalle = "UPDATE detalle_factura SET cantidad={$cantidadNueva}, precio_venta={$precio}, total_impuesto={$valorImpu}, total_descuento={$valorDes}, total={$total}, stock_id_stock={$mensaje}, descuento_id_descuento={$descuento}, impuesto_id_impuestos={$impuesto}, empleado_id_empleado={$idEmple} WHERE id_detallef={$idDetalle}";
$sqlDetalle = mysqli_query($conn,$modiDetalle) or die(mysqli_error($conn));

if($sqlDetalle){
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($modiDetalle);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$modiDetalle.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}


$consultaExi = "SELECT COUNT(*) contar, SUM(total) cant FROM detalle_factura WHERE factura_id_factura='{$idFact}'";
$sqlExi = mysqli_query($conn,$consultaExi) or die(mysqli_error($conn));

if($num = $sqlExi->num_rows>0){
    //echo "Existe detalle de venta";

    $resultExi = $sqlExi->fetch_assoc();
    $cantidadProductos =  intval($resultExi['contar']);
    $totalPro = intval($resultExi['cant']);


    $consultaModi = "UPDATE factura SET pago_total='{$totalPro}', noproductos='{$cantidadProductos}' WHERE id_factura='{$idFact}'";
    $sqlMosiFac = mysqli_query($conn,$consultaModi) or die(mysqli_error($conn));

    if($sqlMosiFac){
        try {
            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
            $mbd->query($consultaModi);
        } catch (PDOException $e) {
            //echo 'Falló la conexión: ' . $e->getMessage();
            
            //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
            
            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
            //$file = fopen('sentencias.txt', 'w');
            fwrite($file, '<?php'. PHP_EOL);
            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
            fwrite($file, '$consulta1="'.$consultaModi.'";' . PHP_EOL);
            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
            fwrite($file, '?>'. PHP_EOL);
            fclose($file); 
        }
    }

    if($sqlMosiFac AND $sqlDetalle AND $sql5 AND $sqlModi){
        echo "Cambios exitosos";

    }else{
        echo "Ha ocurrido un problema";
    }

}else{
    echo "No se encontraron registros del detalle con ese número de factura";
}




//Modificar el valor total de la factura generada con anterioridad**************


//echo $cantidadPro." - ".$idDetalle." - ".$idStock." - ".$cantidadNueva." - ".$producto;
?>