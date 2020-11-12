<?php
require 'conexionBD.php';

$opcion = $_GET['var'];
$number = $_POST['num'];
$fecha = date('Y-m-d');

//$opcion = preg_replace('/[^0-9a-zA-Z]/','', $opcion);

if($opcion == "nombre"){
$consulta = "SELECT * FROM cliente WHERE nombre LIKE '%{$number}%'";
}

if($opcion == "documento"){
    $consulta = "SELECT * FROM cliente WHERE documento={$number}";
}
    
    $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($numFilas = $sql->num_rows>0){

        while($row = mysqli_fetch_object($sql)){
            /*echo '<tr>';    
            echo '<td>'.$row->id_cliente.'</td>';
            echo '<td>'.$row->nombre.'</td>';
            echo '<td>'.$row->empresa.'</td>';
            echo '<td>'.$row->direccion.'</td>';
            echo '<td>'.$row->telefono.'</td>';
            echo '<td>'.$row->correo.'</td>';
            echo '<td>'.$row->documento.'</td>';
            echo '<td>'.$row->verificacion_nit.'</td>';
            echo '<td>'.$row->fecha.'</td>';
            echo '<td>'; 
            echo '<button class="btn btn-primary editbtn" id="obtener" data-toggle="modal" data-target="#actualizar_cliente"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></button>';
            echo '</td>';
            echo '</tr>';*/
            $datos[] = array(
                "id"=>$row->id_cliente,
                "nombre"=>$row->nombre,
                "empresa"=>$row->nombre_empresa,
                "direccion"=>$row->direccion,
                "telefono"=>$row->telefono,
                "correo"=>$row->correo,
                "documento"=>$row->documento,
                "nit"=>$row->verificacion_nit,
                "fecha"=>$row->fecha,
                "opcion"=>'<button class="btn btn-primary editbtn" id="obtener" data-toggle="modal" data-target="#actualizar_cliente"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></button>'
            );
        }
        echo json_encode($datos);
        //echo "el nobre es:" .$result->nombre;
        
    }
    else{
        echo  "No existen registros";
     
    }
?>