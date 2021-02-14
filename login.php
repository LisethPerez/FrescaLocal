<?php
session_start();
include 'conexionGene.php';
$usuario = $_POST['email'];
$contra = $_POST['pass'];
$fecha = $fecha = date('d/m/Y');
$idsModulo = array();

//Consulta a la base de datos
$consult = "SELECT * FROM users WHERE email='{$usuario}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));

if($number = $sql->num_rows>0){
    $result = $sql->fetch_object();
//Verificación de contraseña encriptada con la ingresada 
    if(password_verify($contra, $result->password)) {

        //$idUser = $result->id;
    
        $_SESSION['id_cargo'] = $result->tipo_cargo_id_cargo;
        //echo $_SESSION['id_cargo'];

       include "conexionBD.php";

        $modulo = "SELECT * FROM cargo_modulo WHERE id_cargo='{$_SESSION['id_cargo']}'";
        $sqlModulo = mysqli_query($conn,$modulo) or die(mysqli_error($conn));

        if($num = $sqlModulo->num_rows>0){
            while($resultModulo = mysqli_fetch_assoc($sqlModulo)){
               // $idModulo = $resultModulo['id_modulo'];
                array_push($idsModulo, $resultModulo['id_modulo']);
            }
            //echo json_encode($idsModulo);
            if(in_array(8,$idsModulo)){

               
                    $_SESSION['username'] = $usuario;       
                    $_SESSION['idUser'] = $result->id; 
                    $_SESSION['idSede'] = $result->sede_id_sede; 
                    $_SESSION['fecha'] = $fecha;

                    $consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$_SESSION['idUser']}'";
                    $sqlEmple = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
                    $resultEmple = $sqlEmple->fetch_object();
                
                    $consultSede = "SELECT * FROM sede WHERE id_sede='{$_SESSION['idSede']}'";
                    $sqlSede = mysqli_query($conn,$consultSede) or die(mysqli_error($conn));
                    $resultSede = $sqlSede->fetch_object();
                    
                    $_SESSION['nombreEmple'] = $resultEmple->nombre; 
                    $_SESSION['nombreSede'] = $resultSede->nombre_sede; 

                    echo "Datos correctos";  
            }else{
                echo "No cuenta con permisos de acceder al sistema";
            } 
        }
    }else{   
        //return header("Location: index.php");
        echo "Datos erroneos";        
    }   
}else{
    echo "Datos erroneos";
}
?>