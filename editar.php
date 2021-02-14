 <?php

    include 'conexionBD.php';
    $id = $_POST['update_id'];
    $nombre = $_POST['nombre1'];
    $documento = $_POST['documento1'];
    $telefono = $_POST['telefono1'];
    $direccion = $_POST['direccion1'];
    $correo = $_POST['correo1'];
    $empresa = $_POST['empresa1'];
    $nit = $_POST['nit2'];
    $verificacion_nit = $_POST['nit3'];
    
    
$consulta1 = "UPDATE cliente SET nombre='{$nombre}', nombre_empresa='{$empresa}', direccion='{$direccion}', telefono='{$telefono}', correo='{$correo}', documento='{$documento}',  nit='{$nit}', verificacion_nit='{$verificacion_nit}' WHERE id_cliente={$id}";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error($conn));

$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";

   
    try {
        $mbd = new PDO('mysql:host=controler.com.co;dbname=control3_cosechafresca2',$username,$password, array(PDO::ERRMODE_WARNING));
        $mbd->query($consulta1);
    } catch (PDOException $e) {
        //echo 'Falló la conexión: ' . $e->getMessage();
        
        //$sql1 = mysqli_query($conn1,$consulta1) or die(mysqli_error());
        
        $file = fopen("sincronizacion/sentenciasBD.txt","a+");
        //$file = fopen('sentencias.txt', 'w');
        fwrite($file, '<?php'. PHP_EOL);
        fwrite($file, '$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());'. PHP_EOL);
        fwrite($file, '$consulta1="'.$consulta1.'";' . PHP_EOL);
        fwrite($file, '$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());' . PHP_EOL);
        fwrite($file, '?>'. PHP_EOL);
        fclose($file); 
    }

    if($sql1){
        return header("Location:views/view_cliente.php");
    }
    
?>                                                                