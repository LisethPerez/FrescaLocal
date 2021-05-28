<?php 

$servidor="127.0.0.1";
$username="root";
$password="";
$db="basefresca";

$dump = 'mysql -h' .$servidor .' -u' .$username.' ' .$db .'< sincronizacion/control3_prueba2.sql'; 
exec($dump, $output);
echo "Base de datos general actulizada";


//Copia general = base de datos con mayor cantidad de tablas

/*$conn1 = mysqli_connect($servidor,$username,$password,$db) or die(mysqli_error());

$consult ="SELECT COUNT(*) AS total FROM Information_Schema.Tables where TABLE_TYPE = 'BASE TABLE' and table_schema = '{$db}'";
$sql5 = mysqli_query($conn1,$consult) or die(mysqli_error($conn1));

if($sql5){
    $resultPro = $sql5->fetch_assoc();
    $idPro = $resultPro['total'];

    if($idPro==0){
        $dump = 'mysql -h' .$servidor .' -u' .$username.' ' .$db .'< sincronizacion/control3_cosechafresca2.sql'; 
        exec($dump, $output);
        $mensaje = "Base de datos actulizada";
    }else{
        
        $consult2 ='DROP DATABASE '.$db.'';
        $sql = mysqli_query($conn1,$consult2) or die(mysqli_error($conn1));
        
        $consult3 ='CREATE DATABASE '.$db.'';
        $sql1 = mysqli_query($conn1,$consult3) or die(mysqli_error($conn1));

        if($sql1){
            
            $dump = 'mysql  -h' .$servidor .' -u' .$username.' ' .$db .'< sincronizacion/control3_cosechafresca2.sql'; 
            exec($dump, $output);
            $mensaje = "Base de datos actulizada";
        }else{
            $mensaje = "La base de datos no se pudo crear";
        }
    
    }
}else{
    $mensaje = "Ocurrió un error";
}

echo $mensaje;*/
//$salida_sql = $d.'sql';

//$dump = 'mysqldump -v -h' .$servidor. ' -u' .$username.' -p '.$password. ' --opt ' .$db. ' –-single-transaction > $salida_sql';
/*$dump = 'mysqldump  -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .'< control3_cosechafresca1'; 

//echo $dump;
exec($dump, $output);*/
?>