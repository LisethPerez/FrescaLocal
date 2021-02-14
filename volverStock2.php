<?php

//include 'conexionGene.php';
//$dato = $_GET['var'];
session_start();

$codigo = $_GET['codigo'];
$id_usuario = $_SESSION['idUser'];
$id_Sede = $_SESSION['idSede'];
$dato = $_POST['var'];
$datos = json_decode(json_encode($dato),true);
$elementos = count($datos);
$tota_pro = 0;
$fecha = date('Y-m-d H:i:s');
$cedula = $_POST['var3'];
$idPago = $_POST['var4'];
$paga = $_POST['var5'];
$web = $_POST['var6'];

$idStock = array();

include 'conexionBD.php';

$consultCliente= "SELECT * FROM cliente WHERE documento='{$cedula}'";
$sqlCliente = mysqli_query($conn,$consultCliente) or die(mysqli_error($conn));
$resulCliente = $sqlCliente->fetch_object();
$clienteId = $resulCliente->id_cliente;

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultadoUser = $sqlUser->fetch_object();
$idEmple = $resultadoUser->id_empleado;

//Creación de la factura con la mayoria de campos por defecto
$consultaFac = "INSERT INTO factura (id_factura_web,pago_total,noproductos,fecha,facturapaga,tipo_pago_id_tpago,empleado_id_empleado,empleado_id_domiciliario,cliente_id_cliente,sede_id_sede,anulacion,referencia_pago,tipo_web) VALUES ('{$codigo}',0,0,'{$fecha}','{$paga}','{$idPago}','{$idEmple}',0,'{$clienteId}','{$id_Sede}',0,'NULL','{$web}')";
$sqlFact = mysqli_query($conn,$consultaFac) or die(mysqli_error($conn));

//Obtención del id de la factura generada anteriormente para la asignación de los productos del dettalle
$consultt = "SELECT * FROM factura ORDER BY id_factura DESC LIMIT 1";
$sqll = mysqli_query($conn,$consultt) or die(mysqli_error($conn));
$fac = $sqll->fetch_object();
$idFactu = $fac->id_factura;

$consultaFac1 = "INSERT INTO factura (id_factura,id_factura_web,pago_total,noproductos,fecha,facturapaga,tipo_pago_id_tpago,empleado_id_empleado,empleado_id_domiciliario,cliente_id_cliente,sede_id_sede,anulacion,referencia_pago,tipo_web) VALUES ('{$idFactu}','{$codigo}',0,0,'{$fecha}','{$paga}','{$idPago}','{$idEmple}',0,'{$clienteId}','{$id_Sede}',0,'NULL','{$web}')";

if($sqlFact){
    $username="control3_cosechafresca2";
    $password="vk{j@%zq2HWq";
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($consultaFac1);
    } catch (PDOException $e) {
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$consultaFac1.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}

foreach ($datos as $product) {

    $nombre_producto = $product['producto'];
    $cantidad_pro = $product['cantidad'];
    $precio = $product['precio'];
    $peso = $product['peso'];
    $impuesto = $product['impuesto'];
    $descuento = $product['descuento'];
    $total = $product['total'];

    if($peso == 'NaN'){
        $cantt= $cantidad_pro;
        $cantTota = $cantidad_pro;
    }
    if($cantidad_pro == 'NaN'){
        $cantt= $peso;
        $cantTota =  $peso;
    }  

   // print_r($product);
   include 'conexionGene.php';
    $consulta = "SELECT * FROM producto WHERE nombre='{$nombre_producto}'";
    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($numFilas = $sql->num_rows>0){
        $result = $sql->fetch_object();
        $id = $result->id_producto;
    }
    include 'conexionBD.php';
    $consult = "SELECT * FROM stock WHERE producto_id_producto='{$id}' AND sede_id_sede='{$id_Sede}'";
    $sql1 = mysqli_query($conn,$consult) or die(mysqli_error($conn));
    
    if($numFilas1 = $sql1->num_rows>0){
        while($result1 = mysqli_fetch_assoc($sql1)){
            $diponibilidad = $result1['disponibilidad'];
            if($diponibilidad == "1"){
                array_push($idStock, $result1['id_stock']);
            }   
        }

        $numA = count($idStock);

        for($i=0;$i<$numA;$i++){
            $consultS = "SELECT * FROM stock WHERE id_stock={$idStock[$i]}";
            $sqlS = mysqli_query($conn,$consultS) or die(mysqli_error($conn));
            if($numFilas2 = $sqlS->num_rows>0){
                $resultS = $sqlS->fetch_object();
                $cantidad = $resultS->cantidad;

                if($cantTota<=$cantidad){
                    $cantidad1 = $cantidad - $cantTota;

                    $mensaje = $resultS->id_stock;
                    //echo "Se descontará del stock ".$mensaje." la cantidad de ".$cantidad1;
                    $consult5 = "UPDATE stock SET cantidad={$cantidad1} WHERE id_stock='{$mensaje}'";
                    break;
                }else{
                    $residuo = $cantTota - $cantidad;
                     //echo $residuo;
                     if($residuo>0){
                         //echo "El id ".$idStock[$i]." quedara en ceros y la cantidad a descontar restante es ".$residuo;
                        $consult2 = "UPDATE stock SET cantidad=0 WHERE id_stock={$idStock[$i]}";
                        $sql2 = mysqli_query($conn,$consult2) or die(mysqli_error($conn));
                        $cantTota = $residuo;
                        $cantidad_pro = $residuo;
                        $peso = $residuo;

                        if($sql2){
                            $username="control3_cosechafresca2";
                            $password="vk{j@%zq2HWq";
                            try {
                                $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
                                $mbd->query($consult2);
                            } catch (PDOException $e) {
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
            $username="control3_cosechafresca2";        
            $password="vk{j@%zq2HWq";
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
        unset($idStock);
        $idStock = array();
    }

    

    $tota_pro = $tota_pro + $total;

    $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado, producto_anterior) VALUES ('{$cantt}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$mensaje}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}','NULL')";

   //if($peso=='NaN'){
        
       // $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$cantidad_pro}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$result1->id_stock}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
    //} 
    //if($cantidad_pro=='NaN'){
      //  $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$peso}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$result1->id_stock}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
    //}

    $sqlDeta = mysqli_query($conn,$consult3) or die(mysqli_error($conn));  
    if($sqlDeta) {
        try {
            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
            $mbd->query($consult3);
        } catch (PDOException $e) {
            //echo 'Falló la conexión: ' . $e->getMessage();
            
            //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
            
            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
            //$file = fopen('sentencias.txt', 'w');
            fwrite($file, '<?php'. PHP_EOL);
            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
            fwrite($file, '$consulta1="'.$consult3.'";' . PHP_EOL);
            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
            fwrite($file, '?>'. PHP_EOL);
            fclose($file); 
        }
    }
}

    $consulModiFac = "UPDATE factura SET pago_total=$tota_pro, noproductos=$elementos WHERE id_factura='{$idFactu}'";
    $sqlModiFact = mysqli_query($conn,$consulModiFac) or die(mysqli_error($conn));

    if($sqlModiFact){
        echo "Cambios realizados";
        try {
            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
            $mbd->query($consulModiFac);
        } catch (PDOException $e) {
            //echo 'Falló la conexión: ' . $e->getMessage();
            
            //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
            
            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
            //$file = fopen('sentencias.txt', 'w');
            fwrite($file, '<?php'. PHP_EOL);
            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
            fwrite($file, '$consulta1="'.$consulModiFac.'";' . PHP_EOL);
            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
            fwrite($file, '?>'. PHP_EOL);
            fclose($file); 
        }
    }else {
        echo "No se realizaron cambios";
    }

//echo $mensaje;

?>