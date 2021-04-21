<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO factura (id_factura,id_factura_web,pago_total,noproductos,fecha,facturapaga,tipo_pago_id_tpago,empleado_id_empleado,empleado_id_domiciliario,cliente_id_cliente,sede_id_sede,anulacion,referencia_pago,tipo_web) VALUES ('270',0,0,0,'2021/03/01 21:30:58',0,1,'9',0,'63','1',0,'NULL','NULL')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="UPDATE stock SET cantidad=10 WHERE id_stock='37'";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO detalle_factura (cantidad,precio_venta,total_descuento,total_impuesto,total,factura_id_factura,stock_id_stock,descuento_id_descuento,impuesto_id_impuestos,fecha,empleado_id_empleado, producto_anterior) VALUES ('1','19200','0','19','22848','270','37','7','1','2021/03/01 21:30:58','9','NULL')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="UPDATE factura SET empleado_id_domiciliario='7', pago_total='22848', noproductos='1', fecha='2021/03/01 21:31:01', tipo_pago_id_tpago='1' WHERE id_factura='270'";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="UPDATE factura SET referencia_pago='$ 23,000',facturapaga='0', tipo_pago_id_tpago='1' WHERE id_factura='270'";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="UPDATE factura SET referencia_pago='$ 23,000',facturapaga='1', tipo_pago_id_tpago='1' WHERE id_factura='270'";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('NaN','22848','0','0',0,'1','2021/03/01 22:58:11',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('NaN','22848','0','0',0,'1','2021/03/01 22:58:49',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('NaN','22848','0','0',0,'1','2021/03/01 22:59:05',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('NaN','22848','0','0',0,'1','2021/03/01 22:59:07',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('50000','22848','0','0',0,'1','2021/03/01 23:05:29',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('50000','22848','0','0',0,'1','2021/03/01 23:07:51',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
<?php
$conn = mysqli_connect("controler.com.co","control3_cosechafresca2","vk{j@%zq2HWq","control3_cosechafresca2") or die(mysqli_error());
$consulta1="INSERT INTO caja(base_monetaria,ingresos_efectivo,ingresos_electronicos,egresos_efectivo,egresos_electronicos,ventas,fecha,pagos,cierre,empleado_id_empleado,sede_id_sede) VALUES ('50000','22848','0','0',0,'1','2021/03/01 23:09:14',0,0,'9','1')";
$sql1 = mysqli_query($conn,$consulta1) or die(mysqli_error());
?>
