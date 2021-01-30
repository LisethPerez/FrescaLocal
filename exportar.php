<?php 

$servidor="controler.com.co";
$username="control3_cosechafresca1";
$password="ctj9jN7ePPt@";
$db="control3_cosechafresca1";

$salida_sql = $db.'.sql';

//$dump = 'mysqldump -v -h' .$servidor. ' -u' .$username.' -p '.$password. ' --opt ' .$db. ' –-single-transaction > $salida_sql';
$dump = 'mysqldump --routines --events --opt -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .'  --no-tablespaces> ' .$salida_sql; 

//echo $dump;
exec($dump, $output);
if(file_exists($db.'.sql')){
    echo "Importación realizada de forma correcta";
}else{
    echo "No se pudo realizar la importación";
}
?>
