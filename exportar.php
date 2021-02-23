<?php 

$servidor="controler.com.co";
$username="control3_cosechafresca1";
$password="ctj9jN7ePPt@";
$db="control3_cosechafresca1";

$salida_sql = 'sincronizacion/'.$db.'.sql';

//$dump = 'mysqldump -v -h' .$servidor. ' -u' .$username.' -p '.$password. ' --opt ' .$db. ' –-single-transaction > $salida_sql';
$dump = 'mysqldump --routines --events --opt --ignore-table='.$db.'.caja --ignore-table='.$db.'.cargo_modulo --ignore-table='.$db.'.detalle_banco --ignore-table='.$db.'.detalle_factura --ignore-table='.$db.'.factura --ignore-table='.$db.'.modulos --ignore-table='.$db.'.m_stock --ignore-table='.$db.'.nota_credito --ignore-table='.$db.'.proveedor --ignore-table='.$db.'.p_tiempo --ignore-table='.$db.'.reporte_inventario --ignore-table='.$db.'.reporte_ventas --ignore-table='.$db.'.transformacion_stock --ignore-table='.$db.'.t_movimiento -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .'  --no-tablespaces> ' .$salida_sql; 
//$dump = 'mysqldump --routines --events --opt -h' .$servidor .' -u' .$username.' -p' .$password .' ' .$db .' categoria_productos descuento impuestos producto punto_venta users --no-tablespaces> ' .$salida_sql; 

//echo $dump;
exec($dump, $output);
if(file_exists('sincronizacion/'.$db.'.sql')){
    echo "Importación realizada de forma correcta";
}else{
    echo "No se pudo realizar la importación";
}

?>
