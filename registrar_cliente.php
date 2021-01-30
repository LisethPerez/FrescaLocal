<?php
session_start();

    $id_Sede = $_SESSION['idSede'];
    $id_usuario = $_SESSION['idUser'];
    $nombre = $_POST['nombre'];
    $documento = $_POST['documento'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $correo = $_POST['correo'];
    $empresa = $_POST['empresa'];
    $categoria_id_cliente = $_GET['var'];
    $fecha = date('Y/m/d');
    $nit = $_POST['nit'];
    $nit1 = $_POST['nit1'];


    if(empty($empresa)){
        $empresa = '-';
    }
    if(empty($direccion)){
        $direccion = '-';
    }
    if(empty($correo)){
        $correo = '-';
    }
    //---------------------------------
    if(empty($telefono)){
        $telefono = 0;
    }
    if(empty($nit)){
        $nit = 0;
    }
    if(empty($nit1)){
        $nit1 = 0;
    }

    require 'conexionBD.php';
    $consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
    $sqlUser = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
    $resultadoUser = $sqlUser->fetch_object();
    $idEmple = $resultadoUser->id_empleado;

    $consulta = "INSERT INTO cliente (nombre,nombre_empresa,direccion,telefono,correo,documento,nit,verificacion_nit,categoria_cliente_id_categoria,sede_id_sede,fecha,empleado_id_empleado) VALUES ('{$nombre}','{$empresa}','{$direccion}',$telefono,'{$correo}',$documento,'{$nit}','{$nit1}',$categoria_id_cliente,$id_Sede,'{$fecha}',$idEmple)";

    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));


    $consulta1 = "INSERT INTO cliente (nombre,nombre_empresa,direccion,telefono,correo,documento,nit,verificacion_nit,categoria_cliente_id_categoria,sede_id_sede,fecha,empleado_id_empleado) VALUES ('{$nombre}','{$empresa}','{$direccion}',$telefono,'{$correo}',$documento,'{$nit}','{$nit1}',$categoria_id_cliente,$id_Sede,'{$fecha}',$idEmple)";
   

    if($sql){
        echo "Datos ingresados";
    }

    $username="control3_cosechafresca2";
    $password="vk{j@%zq2HWq";

    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $sql1 = mysqli_query($conn1,$consulta1);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$consulta1.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }
   

    /*if($conn1){
        echo "Hay conexión";
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error($conn1));
    }else{
        echo "No se tiene conexión con el servidor";

        
    }*/

    
?>