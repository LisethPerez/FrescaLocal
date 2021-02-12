<?php 
    session_start();
    $id_Sede = $_SESSION['idSede'];
    $id_usuario = $_SESSION['idUser'];
    //$dato = $_POST['var'];
    $fecha = date('Y/m/d H:i:s');
    $cedula = $_GET['cliente'];

    echo $id_Sede."-".$id_usuario."-".$cedula;
?>