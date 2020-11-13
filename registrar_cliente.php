<?php

    $nombre = $_POST['nombre'];
    $documento = $_POST['documento'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $correo = $_POST['correo'];
    $empresa = $_POST['empresa'];
    $veri_nit = $_POST['nit'];
    $categoria_id_cliente = $_GET['var'];
    $sede_id_sede = 1;
    $fecha = date('Y-m-d');
    $empleado_id_empleado = 1;
    $nit = 1;

    //require 'conexionGene.php';


    //echo "El nombre es: " .$nombre. ", el documento es: " .$documento;

    require 'conexionBD.php';
    $consulta = "INSERT INTO cliente (nombre,nombre_empresa,direccion,telefono,correo,documento,nit,verificacion_nit,categoria_cliente_id_categoria,sede_id_sede,fecha,empleado_id_empleado) VALUES ('{$nombre}','{$empresa}','{$direccion}',$telefono,'{$correo}',$documento,$nit,$veri_nit,$categoria_id_cliente,$sede_id_sede,'{$fecha}',$empleado_id_empleado)";

    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($sql){
        echo "Datos ingresados";
    }

    
?>