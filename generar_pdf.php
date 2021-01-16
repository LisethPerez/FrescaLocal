<?php

session_start();
//require('fpdf/fpdf.php');
require('pdf_js.php');

class PDF_AutoPrint extends PDF_JavaScript{
    function AutoPrint($dialog=false){
        $param=($dialog ? 'true' : 'false');
        $script="print($param);";
        $this->IncludeJS($script);
    }

    function AutoPrintToPrinter($server, $printer, $dialog=false){
        $script="var pp = getPrintParams():";
        if($dialog){
            $script .= "pp.interactive = pp.constants.interactionLevel.full;";
        }else{
            $script .= "pp.interactive = pp.constants.interactionLevel.automatic;";
            $script .= "pp.printerName = '\\\\\\\\".$server."\\\\".$printer."';";
            $script .= "printer(pp)";
            $this->IncludeJS($script);
        }
    }
}
require 'conexionBD.php';

$id_usuario = $_SESSION['idUser'];
$idFac = $_POST['var'];
$valorIngre = $_POST['var2'];
//echo $idFac;
// Tamaño tickt 80mm x 150 mm (largo aprox)
$consultTama = "SELECT COUNT(*) cantidad FROM detalle_factura WHERE factura_id_factura={$idFac}";
$sqlTama = mysqli_query($conn,$consultTama) or die(mysqli_error($conn));
$resulTama = $sqlTama->fetch_assoc();
$tama = $resulTama['cantidad'];
$nuevo = $tama*9;

$x=150;
$pdf = new PDF_AutoPrint($orientation='P',$unit='mm', array(80,$x+$nuevo));
//$pdf = new FPDF($orientation='P',$unit='mm', array(80,$x+$nuevo));
$pdf->AddPage();
$pdf->Image('./images/logoCo1.png',20,3,40);
$pdf->Ln(10);  
$pdf->SetFont('Helvetica','',11);
$pdf->Cell(60,4,'INVERSIONES AGROINDUSTRIALES',0,1,'C');
$pdf->Cell(60,4,'COSECHA FRESCA SAS',0,1,'C');
$pdf->SetFont('Helvetica','',8);
$pdf->Cell(60,4,'NIT 901.274.543-1',0,1,'C');
$pdf->Cell(60,4,'CRA 5 # 71-45 LOCAL 103',0,1,'C');
$pdf->Ln(2);
$pdf->Cell(60,4,'RES N. 18764000999047 FECHA:2020/07/18',0,1,'C');
$pdf->Cell(60,4,'DEL N. P00001 AL N. P50000',0,1,'C');

$consulEmple = "SELECT * FROM empleado WHERE user_id_user={$id_usuario}";
$sqlEmple = mysqli_query($conn,$consulEmple) or die(mysqli_error($conn));
$resulEmple = $sqlEmple->fetch_assoc();
$nombreEmple = $resulEmple['nombre'];
$idEmpleado = $resulEmple['id_empleado'];
$str = utf8_decode($nombreEmple);


/*$consultt = "SELECT * FROM factura WHERE empleado_id_empleado='{$idEmpleado}' ORDER BY id_factura DESC LIMIT 1 ";
$sqll = mysqli_query($conn,$consultt) or die(mysqli_error($conn));
$fac = $sqll->fetch_object();
$idFactu = $fac->id_factura;
$total = $fac->pago_total;*/

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
$str1 = utf8_decode($nombreCliente);

$pdf->SetMargins(2, 0 , 0);
$pdf->Ln(5);
$pdf->Cell(14,3,'FECHA: ',0,0);
$pdf->Cell(30,3,$fechaFac,0,1,'L',0);
$pdf->Cell(30,3,'FACTURA DE VENTA: ',0,0);
$pdf->Cell(30,3,$idFac,0,1,'L',0);
$pdf->Cell(14,3,'NIT:',0,0);
$pdf->Cell(30,3,'123456779',0,1,'L',0);
$pdf->Cell(14,3,'CLIENTE:',0,0);
$pdf->Cell(30,3,$str1,0,1,'L',0);
$pdf->Cell(14,3,'CAJERO:',0,0);
$pdf->Cell(30,3,$str,0,1,'L',0);

$pdf->SetFont('Helvetica','B', 7);
$pdf->Cell(52, 10, 'DETALLE',0,0,'C');
$pdf->Cell(9, 10, 'CANT.',0,0,'C');
$pdf->Cell(10, 10, 'VALOR',0,0,'C');
$pdf->Cell(5, 10, 'IVA',0,0,'L');
$pdf->Ln(8);
$pdf->Cell(75,0,'','T');
$pdf->Ln(0);


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

        $consulProducto = "SELECT * FROM producto WHERE id_producto={$idProducto}";
        $sqlProducto = mysqli_query($conn,$consulProducto) or die(mysqli_error($conn));
        $resulProducto = $sqlProducto->fetch_assoc();
        $nombreProducto = $resulProducto['nombre'];

        $pdf->SetFont('Helvetica','', 6);
        $pdf->Cell(52, 5,$nombreProducto,0,0,'L',0);
        $pdf->Cell(9, 5,$row['cantidad'],0,0,'C',0);
        $pdf->Cell(10, 5,number_format($row['total']),0,0,'C',0);
        $pdf->Cell(5, 5,$nombreImpuesto,0,1,'C',0);
        /*$pdf->Cell(30, 10,$nombreProducto,0,0,'L',0);
        $pdf->Cell(5, 10,$row['cantidad'],0,0,'L',0);
        $pdf->Cell(10, 10,$row['total'],0,0,'C',0);
        $pdf->Cell(15, 10,$nombreImpuesto,0,1,'C',0);*/
        $des = $precio * $descu;

        
        if($nombreImpuesto==0){    
            $iva_0 = ($precio * $porcentaje * $cantidad);
            $baseIva_0 = ($precio - $des) * $cantidad;
            $valor_0 =  ($baseIva_0 + $iva_0);
        }
        else if($nombreImpuesto==5){
            $iva_5 = ($precio * $porcentaje * $cantidad);
            $baseIva_5 = ($precio - $des) * $cantidad;
            $valor_5 =  ($baseIva_5 + $iva_5);
        }
        else if($nombreImpuesto==19){
            $iva_19 = ($precio * $porcentaje * $cantidad);
            $baseIva_19 = ($precio - $des) * $cantidad ;
            $valor_19 =  ($baseIva_19 + $iva_19);
        }

        $iva0 = $iva_0 + $iva0; $baseIva0 = $baseIva_0 + $baseIva0; $valor0 = $valor_0 + $valor0;
        $iva5 = $iva_5 + $iva5; $baseIva5 = $baseIva_5 + $baseIva5; $valor5 = $valor_5 + $valor5;
        $iva19 = $iva_19 + $iva19; $baseIva19 = $baseIva_19 + $baseIva19; $valor19 = $valor_19 + $valor19;

    }
    
    $pdf->Cell(75,0,'','T');
    $pdf->Ln(3);  
    $pdf->Cell(15, 3, '%',0,0,'C');
    $pdf->Cell(18, 3, 'VALOR',0,0,'C');
    $pdf->Cell(12, 3, 'IMPOCON',0,0,'C');
    $pdf->Cell(18, 3, 'BASE IVA',0,0,'C');
    $pdf->Cell(12, 3, 'IVA',0,1,'C');
    $pdf->Cell(15, 3, '(00)%',0,0,'C');
    $pdf->Cell(18, 3, number_format($valor0),0,0,'C');
    $pdf->Cell(12, 3, '0',0,0,'C');
    $pdf->Cell(18, 3, number_format($baseIva0),0,0,'C');
    $pdf->Cell(12, 3, number_format($iva0),0,1,'C');
    $pdf->Cell(15, 3, '(0.5)%',0,0,'C');
    $pdf->Cell(18, 3, number_format($valor5),0,0,'C');
    $pdf->Cell(12, 3, '0',0,0,'C');
    $pdf->Cell(18, 3, number_format($baseIva5),0,0,'C');
    $pdf->Cell(12, 3, number_format($iva5),0,1,'C');
    $pdf->Cell(15, 3, '(0.19)%',0,0,'C');
    $pdf->Cell(18, 3, number_format($valor19),0,0,'C');
    $pdf->Cell(12, 3, '0',0,0,'C');
    $pdf->Cell(18, 3, number_format($baseIva19),0,0,'C');
    $pdf->Cell(12, 3, number_format($iva19),0,1,'C');
    $pdf->Ln(2);  
    $pdf->Cell(75,0,'','T');

$vueltas=$valorIngre-$total;

$pdf->Cell(65,0,'','T');
$pdf->Ln(2);   
$pdf->SetFont('Arial','B', 6.5);
$pdf->Cell(25,3,'TOTAL A PAGAR: ',0,0,'R');
$pdf->Cell(25,3,"$ ".number_format($total),0,1,'L',0);
$pdf->SetFont('Arial','I', 6.5);
$pdf->Cell(25,3,'RECIBIDO: ',0,0,'R');
$pdf->Cell(25,3,"$ ".number_format($valorIngre),0,1,'L',0);
$pdf->Cell(25,3,'CAMBIO: ',0,0,'R');
$pdf->Cell(25,3,"$ ".number_format($vueltas),0,1,'L',0);
}

//header('Content-type: application/pdf');
//$pdf->Output('D','Factura.pdf','UTF-8');
$pdf->AutoPrint(true);
$pdf->Output();


//echo $pdf;
?>