<?php 
$servidor="controler.com.co";
$username="control3_cosechafresca2";
$password="vk{j@%zq2HWq";
$db="control3_cosechafresca2";

$salida_sql = 'sincronizacion/'.$db.'.sql';

//$dump = 'mysqldump -v -h' .$servidor. ' -u' .$username.' -p '.$password. ' --opt ' .$db. ' –-single-transaction > $salida_sql';
//$dump = 'mysqldump --routines --events --opt -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .'  --no-tablespaces> ' .$salida_sql; 
$dump = 'mysqldump --routines --events --opt -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .' cargo_modulo categoria_cliente categoria_producto_trans cliente empleado modulos m_stock password_resets sede stock tipo_cargo tipo_cuenta tipo_pago --no-tablespaces> ' .$salida_sql; 

//echo $dump;
exec($dump, $output);
if(file_exists('sincronizacion/'.$db.'.sql')){
    echo "Importación realizada de forma correcta";
}else{
    echo "No se pudo realizar la importación";
}
?>