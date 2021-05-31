<?php
session_start();
$id_Sede = $_SESSION['idSede'];
$id_usuario = $_SESSION['idUser'];
$dato = $_POST['var'];
$datos = json_decode(json_encode($dato),true);
$fecha = date('Y/m/d H:i:s');
$cedula = $_GET['cliente'];
//$idStock = $_POST['var2'];
//$ids = json_decode(json_encode($idStock),true);

$idStock = array();

include 'conexionBD.php';

//Consulta de la última factura
/*$consultUltima = "SELECT * FROM factura ORDER BY id_factura DESC LIMIT 1";
$sqlUltima = mysqli_query($conn,$consultUltima) or die(mysqli_error($conn));
$facUltima = $sqlUltima->fetch_object();
$idUltimo = $facUltima->id_factura;
$idFactu = $idUltimo+1;*/
$consultt = "SELECT * FROM factura ORDER BY id_factura DESC LIMIT 1";
$sqll = mysqli_query($conn,$consultt) or die(mysqli_error($conn));
$fac = $sqll->fetch_object();
$idUltimo = $fac->id_factura;
$idFactu = $idUltimo + 1;

//Consulta para obtener el id del cliente en la base de datos
$consultCliente= "SELECT * FROM cliente WHERE documento='{$cedula}'";
$sqlCliente = mysqli_query($conn,$consultCliente) or die(mysqli_error($conn));
$resulCliente = $sqlCliente->fetch_object();
$clienteId = $resulCliente->id_cliente;

//Consulta para obtener el id del empleados en la base de datos 
$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultadoUser = $sqlUser->fetch_object();
$idEmple = $resultadoUser->id_empleado;

//Creación de la factura con la mayoria de campos por defecto
$consultaFac = "INSERT INTO factura (id_factura,id_factura_web,pago_total,noproductos,fecha,facturapaga,tipo_pago_id_tpago,empleado_id_empleado,empleado_id_domiciliario,cliente_id_cliente,sede_id_sede,anulacion,referencia_pago,tipo_web) VALUES ({$idFactu},0,0,0,'{$fecha}',0,1,'{$idEmple}',0,'{$clienteId}','{$id_Sede}',0,'NULL','NULL')";
$sqlFact = mysqli_query($conn,$consultaFac) or die(mysqli_error($conn));

//Obtención del id de la factura generada anteriormente para la asignación de los productos del dettalle


$consultaFac1 = "INSERT INTO factura (id_factura,id_factura_web,pago_total,noproductos,fecha,facturapaga,tipo_pago_id_tpago,empleado_id_empleado,empleado_id_domiciliario,cliente_id_cliente,sede_id_sede,anulacion,referencia_pago,tipo_web) VALUES ('{$idFactu}',0,0,0,'{$fecha}',0,1,'{$idEmple}',0,'{$clienteId}','{$id_Sede}',0,'NULL','NULL')";

if($sqlFact){
    $username="control3_cosechafresca2";
    $password="vk{j@%zq2HWq";
        
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_prueba2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($consultaFac1);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_prueba2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$consultaFac1.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
}

foreach ($datos as $product) {
    //Guardar cada una de los datos del JSON del detalle de productos
    /*$nombre_producto = $product['producto'];
    $cantidad_pro = $product['cantidad'];
    $precio = $product['precio'];
    $peso = $product['peso'];
    $impuesto = $product['impuesto'];
    $descuento = $product['descuento'];
    $total = $product['total'];*/
    $nombre_producto = $product['producto'];
    $cantidad_pro = $product['cantidad'];
    $precio = $product['precio'];
    $impuesto = $product['impuesto'];
    $descuento = $product['descuento'];
    $total = $product['total'];

    $cantTota = 0;
    $cantt= $cantidad_pro;
    $cantTota = $cantidad_pro;
    /*if($cantidad_pro == undefined){
        $cantt= $cantidad_pro;
        $cantTota = $cantidad_pro;
    }*/
    /*if($cantidad_pro == 'NaN'){
        $cantt= $peso;
        $cantTota =  $peso;
    }  */
        
      

    include 'conexionGene.php';
    $consultPro = "SELECT * FROM producto INNER JOIN categoria_productos ON producto.categoria_id_categoria=categoria_productos.id_categoria WHERE producto.nombre='{$nombre_producto}'";
    $sqlPro = mysqli_query($conn,$consultPro) or die(mysqli_error($conn));
    $resultPro = $sqlPro->fetch_object();
    $idPro = $resultPro->id_producto;

    include 'conexionBD.php';
    $consulta = "SELECT * FROM stock WHERE producto_id_producto={$idPro} AND sede_id_sede={$id_Sede}";
    $sql1 = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($num = $sql1->num_rows>0){
        while($resultado = mysqli_fetch_assoc($sql1)){
            $diponibilidad = $resultado['disponibilidad'];
            if($diponibilidad == "1"){
                array_push($idStock, $resultado['id_stock']);
            }   
        }
    
    $numA = count($idStock);

        for($i=0;$i<$numA;$i++){
            //$cantidad1 = 0;
            $consult = "SELECT * FROM stock WHERE id_stock={$idStock[$i]}";
            $sql1 = mysqli_query($conn,$consult) or die(mysqli_error($conn));
            if($numFilas1 = $sql1->num_rows>0){
                $result1 = $sql1->fetch_object();
                $cantidad = $result1->cantidad;
                $precio = $result1->total;

                if($cantTota<=$cantidad){
                    
                    $cantidad1 = $cantidad - $cantTota;
                    $totalNuevo = $precio - $total;

                    $mensaje = $result1->id_stock;
                    //$consult5 = "UPDATE stock SET cantidad={$cantidad1}, total={$totalNuevo} WHERE id_stock='{$mensaje}'";
                    $consult5 = "UPDATE stock SET cantidad={$cantidad1} WHERE id_stock='{$mensaje}'";
                    break;
                    
                }else{
                   // echo "Entro al else";
                    $residuo = $cantTota - $cantidad;
                    $totalNuevo1 = $precio - $total;
                   // echo $residuo;
                    if($residuo>0){
                        //$residuo = $residuo*(-1);
                        //echo "Entro al nuevo if";
                        //echo $idStock[$i];
                       // $consult2 = "UPDATE stock SET cantidad=0, total={$totalNuevo1} WHERE id_stock={$idStock[$i]}";
                        $consult2 = "UPDATE stock SET cantidad=0 WHERE id_stock={$idStock[$i]}";
                        $sql2 = mysqli_query($conn,$consult2) or die(mysqli_error($conn));
                        $cantTota = $residuo;
                        $cantidad_pro = $residuo;
                        $peso = $residuo;

                    if($sql2){
                            $username="control3_cosechafresca2";
                            $password="vk{j@%zq2HWq";
                            try {
                                $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_prueba2',$username,$password, array(PDO::ERRMODE_WARNING));
                                $mbd->query($consult2);
                            } catch (PDOException $e) {
                                //echo 'Falló la conexión: ' . $e->getMessage();
                                
                                //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
                                
                                $file = fopen("sincronizacion/sentenciasBD.txt","a+");
                                //$file = fopen('sentencias.txt', 'w');
                                fwrite($file, '<?php'. PHP_EOL);
                                fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_prueba2") or die(mysqli_error());'. PHP_EOL);
                                fwrite($file, '$consulta1="'.$consult2.'";' . PHP_EOL);
                                fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
                                fwrite($file, '?>'. PHP_EOL);
                                fclose($file); 
                            }
                        }
                        //echo $cantTota;
                    }
                }
                
                /*if($peso == 'NaN'){
                    $cantidad = $cantidad - $cantidad_pro;
                }
                if($cantidad_pro == 'NaN'){
                    $cantidad = $cantidad - $peso;
                }    */
            }
        }

    $sql5 = mysqli_query($conn,$consult5) or die(mysqli_error($conn));
    if($sql5){
        $username="control3_cosechafresca2";        
        $password="vk{j@%zq2HWq";
        try {    
            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_prueba2',$username,$password, array(PDO::ERRMODE_WARNING));
            $mbd->query($consult5);
        } catch (PDOException $e) {
            
            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
            fwrite($file, '<?php'. PHP_EOL);
            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_prueba2") or die(mysqli_error());'. PHP_EOL);
            fwrite($file, '$consulta1="'.$consult5.'";' . PHP_EOL);
            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
            fwrite($file, '?>'. PHP_EOL);
            fclose($file); 
        }
    }
    unset($idStock);
    $idStock = array();
     //unset($idStock);
    /*if($peso=='NaN'){
        $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$cantidad_pro}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','$mensaje','{$resultPro->descuento_id_descuento}','{$resultPro->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
    } 
    if($cantidad_pro=='NaN'){
        $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$peso}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','$mensaje','{$resultPro->descuento_id_descuento}','{$resultPro->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
    }*/

    
    $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado, producto_anterior) VALUES ('{$cantt}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','$mensaje','{$resultPro->descuento_id_descuento}','{$resultPro->impuestos_id_impuestos}','{$fecha}','{$idEmple}','NULL')";

    $sqlFact1 = mysqli_query($conn,$consult3) or die(mysqli_error($conn));


    if($sqlFact1){
        $username="control3_cosechafresca2";
        $password="vk{j@%zq2HWq";

        try {
            $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_prueba2',$username,$password, array(PDO::ERRMODE_WARNING));
            $mbd->query($consult3);
        } catch (PDOException $e) {
            //echo 'Falló la conexión: ' . $e->getMessage();
            
            //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
            
            $file = fopen("sincronizacion/sentenciasBD.txt","a+");
            //$file = fopen('sentencias.txt', 'w');
            fwrite($file, '<?php'. PHP_EOL);
            fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_prueba2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
            fwrite($file, '$consulta1="'.$consult3.'";' . PHP_EOL);
            fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
            fwrite($file, '?>'. PHP_EOL);
            fclose($file); 
        }
    }

    }

    //echo $cantidad;
    //Consulta para la obtención del id del producto desde la base de datos mediante el nombre del producto
   /*include 'conexionGene.php';
    $consulta = "SELECT * FROM producto WHERE nombre='{$nombre_producto}'";
    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($numFilas = $sql->num_rows>0){
        $result = $sql->fetch_object();
        $id = $result->id_producto;
    }

    //consulta para obtener la cantidad y posterior descuento del stock por medio del id anterior del producto y a la sede a la que pertenece el empleado
    include 'conexionBD.php';
    //$consult = "SELECT * FROM stock WHERE producto_id_producto='{$id}' AND sede_id_sede='{$id_Sede}'";
    $consult = "SELECT * FROM stock WHERE id_stock={$idStock}";
    $sql1 = mysqli_query($conn,$consult) or die(mysqli_error($conn));
    if($numFilas1 = $sql1->num_rows>0){
        $result1 = $sql1->fetch_object();
        $cantidad = $result1->cantidad;
        
        if($peso == 'NaN'){
            $cantidad = $cantidad - $cantidad_pro;
        }
        if($cantidad_pro == 'NaN'){
            $cantidad = $cantidad - $peso;
        }    
    }

    //Modificar información del stock existente de los productos 
    //$consult1 = "UPDATE stock SET cantidad={$cantidad} WHERE producto_id_producto='{$id}' AND sede_id_sede='{$id_Sede}'";
    $consult1 = "UPDATE stock SET cantidad={$cantidad} WHERE producto_id_producto='{$id}' AND sede_id_sede='{$id_Sede}' AND id_stock={$idStock}";
    $sql2 = mysqli_query($conn,$consult1) or die(mysqli_error($conn));
   
    //Validación de campos para la creación del detalle de factura según los productos ingresados por el empleado
        if($peso=='NaN'){
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$cantidad_pro}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$result1->id_stock}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
        } 
        if($cantidad_pro=='NaN'){
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$peso}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$result1->id_stock}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
        }
        /*include 'conexionBD.php';
        
        if($peso=='NaN'){
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$cantidad_pro}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$id}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
        } 
        if($cantidad_pro=='NaN'){
            $consult3 ="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado) VALUES ('{$peso}','{$precio}','{$descuento}','{$impuesto}','{$total}','{$idFactu}','{$id}','{$result->descuento_id_descuento}','{$result->impuestos_id_impuestos}','{$fecha}','{$idEmple}')";
        }*/
    
        //$sqlFact = mysqli_query($conn,$consult3) or die(mysqli_error($conn));*/
}
$mensaje = 0;

//Devuelve el id factura creado con anterior, para su posterior modificación de su anulación o pago
echo $idFactu;

?>