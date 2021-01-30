<?php 

$servidor="controler.com.co";
$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";
$db="control3_cosechafresca2";

$salida_sql = $db.'.sql';

//$dump = 'mysqldump -v -h' .$servidor. ' -u' .$username.' -p '.$password. ' --opt ' .$db. ' –-single-transaction > $salida_sql';
$dump = 'mysqldump --routines --events --opt -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .'  --no-tablespaces> ' .$salida_sql; 

//echo $dump;
if(exec($dump, $output)){
    echo "Importación realizada de forma correcta";
}else{
    echo "No se pudo realizar la importación";
}
?>