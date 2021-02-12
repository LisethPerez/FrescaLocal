<?php
 session_start();

 $nombreEmple = $_POST['var3'];
 $idFac = $_POST['var'];
 //$idFac = 238;
 //$valorIngre = 42000;
 $valorIngre = $_POST['var2'];


require __DIR__ . '/autoload.php';; //Nota: si renombraste la carpeta a algo diferente de "ticket" cambia el nombre en esta línea
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


try {
    $nombre_impresora = "prueba"; 
    $connector = new WindowsPrintConnector($nombre_impresora);
    $printer = new Printer($connector);

	
	//$printer->initialize();
	$printer->setJustification(Printer::JUSTIFY_CENTER);
	$logo = EscposImage::load("./images/logoCo1.png",false);
	$printer->bitImage($logo, Printer::IMG_DOUBLE_WIDTH | Printer::IMG_DOUBLE_HEIGHT);
	//$printer->feed();
	$printer->setFont(Printer::FONT_B);
	$printer->setTextSize(2, 2);
	$printer->text("INVERSIONES AGROINDUSTRIALES\n");
	$printer->text("COSECHA FRESCA SAS\n");
	$printer->setFont(Printer::FONT_C);
	$printer->setTextSize(1, 1);
	$printer->text("NIT 901.274.543-1\n");
	$printer->text("CRA 5 # 71-45 LOCAL 103\n\n");
	//$printer->feed(1);
	$printer->text("RES N. 18764000999047 FECHA:2020/07/18\n");
	$printer->text("DEL N. P00001 AL N. P50000\n\n\n");

	require 'conexionBD.php';

	/*$consulEmple = "SELECT * FROM empleado WHERE user_id_user={$idd}";
	$sqlEmple = mysqli_query($conn,$consulEmple) or die(mysqli_error($conn));
	$resulEmple = $sqlEmple->fetch_assoc();
	$nombreEmple = $resulEmple['nombre'];
	$idEmpleado = $resulEmple['id_empleado'];*/
	$str = $nombreEmple;

	$consultFact = "SELECT * FROM factura WHERE id_factura={$idFac}";
	$sqlFact = mysqli_query($conn,$consultFact) or die(mysqli_error($conn));
	$resulFact = $sqlFact->fetch_object();
	$fechaFac = $resulFact->fecha;
	$total = $resulFact->pago_total;
	$idCliente = $resulFact->cliente_id_cliente;

	$consulCliente = "SELECT * FROM cliente WHERE id_cliente={$idCliente}";
	$sqlCliente = mysqli_query($conn,$consulCliente) or die(mysqli_error($conn));
	$resulCliente = $sqlCliente->fetch_object();
	$nombreCliente = $resulCliente->nombre;
	$str1 = $nombreCliente;

	$printer->setJustification(Printer::JUSTIFY_LEFT);
	$printer->text("FECHA:   ".$fechaFac."\n");
	$printer->text("FACTURA DE VENTA:  ".$idFac."\n");
	$printer->text("NIT:     123456779"."\n");
	$printer->text("CLIENTE: ".$str1."\n");
	$printer->text("CAJERO:  ".$str."\n\n");

	$printer->setFont(Printer::FONT_B);
	$printer->setTextSize(1, 2);
	$printer->text("                   DETALLE                 CANT.    VALOR    IVA\n");
	$printer->text("----------------------------------------------------------------\n");

	$consult = "SELECT * FROM detalle_factura WHERE factura_id_factura={$idFac}";
	$sqlDeta = mysqli_query($conn,$consult) or die(mysqli_error($conn));

	$valor0 = 0; $baseIva0 = 0; $iva0=0; 
	$valor5 = 0; $baseIva5 = 0; $iva5=0; 
	$valor19 = 0; $baseIva19 = 0; $iva19=0; 

	if($num = $sqlDeta->num_rows>0){

		while($row = mysqli_fetch_assoc($sqlDeta)){
			
			$valor_0 = 0; $baseIva_0 = 0; $iva_0=0;
			$valor_5 = 0; $baseIva_5 = 0; $iva_5=0; 
			$valor_19 = 0; $baseIva_19 = 0; $iva_19=0;
			
			$idDescuento = $row['descuento_id_descuento'];
			$idImpuesto =  $row['impuesto_id_impuestos'];
			$idStock =  $row['stock_id_stock'];
			$precio = $row['precio_venta'];
			$cantidad = $row['cantidad'];
			$total2 = $row['total'];
	
			require 'conexionBD.php';
			$consulStock = "SELECT * FROM stock WHERE id_stock={$idStock}";
			$sqlStock = mysqli_query($conn,$consulStock) or die(mysqli_error($conn));
			$resulStock = $sqlStock->fetch_assoc();
			$idProducto = $resulStock['producto_id_producto'];
	
			require 'conexionGene.php';
	
			$consulDescu = "SELECT * FROM descuento WHERE id_descuento={$idDescuento}";
			$sqlDescu = mysqli_query($conn,$consulDescu) or die(mysqli_error($conn));
			$resulDescu = $sqlDescu->fetch_assoc();
			$nombreDescu = intval($resulDescu['valor_descuento']);
			$descu = $nombreDescu/100;
	
			$consulImpuesto = "SELECT * FROM impuestos WHERE id_impuestos={$idImpuesto}";
			$sqlImpuesto = mysqli_query($conn,$consulImpuesto) or die(mysqli_error($conn));
			$resulImpuesto = $sqlImpuesto->fetch_assoc();
			$nombreImpuesto = intval($resulImpuesto['valor_impuesto']);
			$porcentaje = $nombreImpuesto/100;
			$iva_tasa = $porcentaje+1;
	
			$consulProducto = "SELECT * FROM producto WHERE id_producto={$idProducto}";
			$sqlProducto = mysqli_query($conn,$consulProducto) or die(mysqli_error($conn));
			$resulProducto = $sqlProducto->fetch_assoc();
			$nombreProducto = $resulProducto['nombre'];
			$caracteres =  strlen($nombreProducto);

			if($caracteres>=30){
				$nombreProducto = substr($nombreProducto, 0, 30); 
			}
			
			$printer->setFont(Printer::FONT_C);
			$printer->setTextSize(1, 1);
			$printer->text(str_pad($nombreProducto,31)." ".str_pad($row['cantidad'],4," ", STR_PAD_BOTH)."".str_pad(number_format($row['total']),10," ", STR_PAD_BOTH)."".str_pad($nombreImpuesto,3," ", STR_PAD_BOTH)."\n");
			
			$des = $precio * $descu;
	
			
			if($nombreImpuesto==0){    
			
				$valor_0 = $total2;
				$baseIva_0 = $valor_0/$iva_tasa;
				$iva_0 = $baseIva_0*$porcentaje;
			}
			else if($nombreImpuesto==5){
			   
				$valor_5 = $total2;
				$baseIva_5 = $valor_5/$iva_tasa;
				$iva_5 = $baseIva_5*$porcentaje;
			}
			else if($nombreImpuesto==19){
				
				$valor_19 = $total2;
				$baseIva_19 = $valor_19/$iva_tasa;
				$iva_19 = $baseIva_19*$porcentaje;
			}
	
			$iva0 = $iva_0 + $iva0; $baseIva0 = $baseIva_0 + $baseIva0; $valor0 = $valor_0 + $valor0;
			$iva5 = $iva_5 + $iva5; $baseIva5 = $baseIva_5 + $baseIva5; $valor5 = $valor_5 + $valor5;
			$iva19 = $iva_19 + $iva19; $baseIva19 = $baseIva_19 + $baseIva19; $valor19 = $valor_19 + $valor19;
	
		}

		$printer->setFont(Printer::FONT_B);
		$printer->setTextSize(1, 2);
		$printer->text("----------------------------------------------------------------\n");
		$printer->text("     %        VALOR      IMPOCON       BASE IVA        IVA\n");
		$printer->setFont(Printer::FONT_C);
		$printer->setTextSize(1, 1);
		$printer->text(" (0.0)% ".str_pad(number_format($valor0),10," ", STR_PAD_BOTH)."   0    ".str_pad(number_format($baseIva0),10," ", STR_PAD_BOTH)."  ".str_pad(number_format($iva0),10," ", STR_PAD_BOTH)."\n");
		$printer->text(" (0.5)% ".str_pad(number_format($valor5),10," ", STR_PAD_BOTH)."   0    ".str_pad(number_format($baseIva5),10," ", STR_PAD_BOTH)."  ".str_pad(number_format($iva5),10," ", STR_PAD_BOTH)."\n");
		$printer->text("(0.19)% ".str_pad(number_format($valor19),10," ", STR_PAD_BOTH)."   0    ".str_pad(number_format($baseIva19),10," ", STR_PAD_BOTH)."  ".str_pad(number_format($iva19),10," ", STR_PAD_BOTH)."\n");
		$printer->setFont(Printer::FONT_B);
		$printer->setTextSize(1, 2);
		$printer->text("----------------------------------------------------------------\n\n");
		
		
		$vueltas=$valorIngre-$total;

		$printer->setFont(Printer::FONT_C);
		$printer->setTextSize(1, 1);
		$printer->text("   TOTAL A PAGAR:  ".number_format($total)."\n");
		$printer->setFont(Printer::FONT_C);
		$printer->setTextSize(1, 1);
		$printer->text("        RECIBIDO:  ".number_format($valorIngre)."\n");
		$printer->text("          CAMBIO:  ".number_format($vueltas)."\n");
	
	}
	$printer->cut();
    $printer -> close();
} catch (Exception $e) {
    echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
}
?>