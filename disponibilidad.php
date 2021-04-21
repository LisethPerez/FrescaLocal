<?php
session_start();

include 'conexionGene.php';
$id_Sede = $_SESSION['idSede'];
//$id_usuario = $_SESSION['idUser'];
$producto = $_GET['var'];
$cantidad = $_POST['var2'];
$idStock = array();
$datos = array();
$cant = array();
$cant_total = 0;
$idS = 0;

$consult = "SELECT * FROM producto INNER JOIN categoria_productos ON producto.categoria_id_categoria=categoria_productos.id_categoria WHERE producto.nombre='{$producto}'";
$sql = mysqli_query($conn,$consult) or die(mysqli_error($conn));

if($numFilas = $sql->num_rows>0){
    $result = $sql->fetch_object();
    $id = $result->id_producto;

    include 'conexionBD.php';
    $consulta = "SELECT * FROM stock WHERE producto_id_producto={$id} AND sede_id_sede={$id_Sede}";
    $sql1 = mysqli_query($conn,$consulta) or die(mysqli_error($conn));

    if($num = $sql1->num_rows>0){
        while($resultado = mysqli_fetch_assoc($sql1)){
            $diponibilidad = $resultado['disponibilidad'];
            if($diponibilidad == "1"){
                array_push($idStock, $resultado['id_stock']);
            }  
        }

        $array_num = count($idStock);

        if(!empty($array_num)){
            for($i=0; $i<$array_num; $i++){
                $ids = $idStock[$i];
                //echo $ids;
                $consulta1 = "SELECT * FROM stock WHERE id_stock={$ids} ORDER BY id_stock DESC LIMIT 1";
                $sql2 = mysqli_query($conn,$consulta1) or die(mysqli_error($conn));
                $result = $sql2->fetch_object();
                $cantidad_produ = $result->cantidad;
                $cant_total = $cantidad_produ + $cant_total;
            }
                    
            if($cant_total<$cantidad){
                $mensaje = "Excede la disponibilidad del producto";

            }else{
                $mensaje = "Hay disponibilidad";
            }
        }else{
            $mensaje = "No se encuentra disponibilidad del producto";
           
        }

        
        /*$idStock = array_values($idStock);
        
        $num2 = count($idStock);
        for($i=0; $i<$num2; $i++){
            array_push($datos, $idStock[$i]);
        }
        
        $num1 = count($datos);
        //echo $num1;
        if(empty($datos)){
            $mensaje = "Excede la disponibilidad del producto";
        }else{
            for($j=0;$j<$num1;$j++){
                $idDes = $datos[0];      
            }      
            $mensaje = $idDes;
        }*/
        
    }else{
        $mensaje = "El producto no se encuentra en stock";
    }
    
    /*if($num = $sql1->num_rows>0){
        $resultado = $sql1->fetch_array();
        $diponibilidad = $resultado['disponibilidad'];
        echo $resultado['id_stock'];

        if($diponibilidad == "1"){
            $cantidad_produ = $resultado['cantidad'];

            

            if($cantidad<=$cantidad_produ AND $cantidad_produ>0){
                echo "Hay disponibilidad";
            }
            else{
                echo "Excede la disponibilidad del producto";
            }
        }else{
            echo "No se encuentra disponibilidad del producto";
        }

    }else{
        echo "El producto no se encuentra en stock";
    }*/

}else{
    $mensaje = "El producto no existe";
}

echo $mensaje;
//id_producto -> producto

?>