<?php
require 'conexionBD.php';

    $nombre = $_POST['nombre'];
    $documento = $_POST['documento'];
    $telefono = $_POST['telefono'];
    $direccion = $_POST['direccion'];
    $correo = $_POST['correo'];
    $empresa = $_POST['empresa'];
    $nit = $_POST['nit'];
    $categoria_id_cliente = 1;
    $sede_id_sede = 1;
    $fecha = date('Y-m-d');
    $empleado_id_empleado = 1;

    //echo "El nombre es: " .$nombre. ", el documento es: " .$documento;

    
    $consulta = "INSERT INTO cliente (nombre,empresa,direccion,telefono,correo,documento,verificacion_nit,categoria_id_clientes,sede_id_sede,fecha,empleado_id_empleado)VALUES ('{$nombre}','{$empresa}','{$direccion}',$telefono,'{$correo}',$documento,$nit,$categoria_id_cliente,$sede_id_sede,'{$fecha}',$empleado_id_empleado)";

    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($sql){
        echo "Datos ingresados";
    }

    
?>