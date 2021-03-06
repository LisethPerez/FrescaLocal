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

$id_usuario = $_SESSION['idUser'];
$id_Sede = $_SESSION['idSede'];

$fechaBus = $_POST['repo'];
$fechaBus = str_replace("/", "-", $fechaBus);

$fechaAc = date('Y-m-d H:i:s');
$fechaCompleta = $fechaBus. " 00:00:00";
$diaSiguiente = date("Y-m-d", strtotime("+1 day", strtotime($fechaCompleta))) . " 00:00:00";

require 'conexionBD.php';

$consultEmple = "SELECT * FROM empleado WHERE user_id_user='{$id_usuario}'";
$sqlEmple = mysqli_query($conn,$consultEmple) or die(mysqli_error($conn));
$resultEmple = $sqlEmple->fetch_object();
$idEmpleado = $resultEmple->id_empleado; 

$consulFac = "SELECT COUNT(*) total FROM factura WHERE empleado_id_empleado='{$idEmpleado}' AND sede_id_sede='{$id_Sede}' AND fecha BETWEEN '{$fechaCompleta}' AND '{$diaSiguiente}'";
$sqlTama = mysqli_query($conn,$consulFac) or die(mysqli_error($conn));
$resulTama = $sqlTama->fetch_assoc();
$total = $resulTama['total'];

$consulFac1 = "SELECT * FROM factura WHERE empleado_id_empleado='{$idEmpleado}' AND fecha BETWEEN '{$fechaCompleta}' AND '{$diaSiguiente}' ORDER BY id_factura DESC LIMIT 1";
$sqlTama1 = mysqli_query($conn,$consulFac1) or die(mysqli_error($conn));
$resulTama1 = $sqlTama1->fetch_assoc();
$ultimo = $resulTama1['id_factura'];

$consulFac2 = "SELECT * FROM factura WHERE empleado_id_empleado='{$idEmpleado}' AND fecha BETWEEN '{$fechaCompleta}' AND '{$diaSiguiente}' ORDER BY id_factura LIMIT 1";
$sqlTama2 = mysqli_query($conn,$consulFac2) or die(mysqli_error($conn));
$resulTama2 = $sqlTama2->fetch_assoc();
$primero = $resulTama2['id_factura'];

$caja = "SELECT * FROM caja WHERE fecha LIKE '%{$fechaBus}%'";
$sqlCaja = mysqli_query($conn,$caja) or die(mysqli_error($conn));

if($numFilas = $sqlCaja->num_rows>0){
    $resulCaja = $sqlCaja->fetch_assoc();
    $base = $resulCaja['base_monetaria'];
    $efectivo = $resulCaja['ingresos_efectivo'];
    $electronico = $resulCaja['ingresos_electronicos'];
    $egresos = $resulCaja['egresos_efectivo'];
    $web = $resulCaja['egresos_electronicos'];
    $cajaTo = ($base + $efectivo) - $egresos;

    $pdf = new PDF_AutoPrint($orientation='P',$unit='mm', array(80,130));

    $pdf->AddPage();
    $pdf->Image('./images/logoCo1.png',20,3,40);
    $pdf->Ln(10);  
    $pdf->SetFont('Helvetica','',11);
    $pdf->Cell(60,4,'INVERSIONES AGROINDUSTRIALES',0,1,'C');
    $pdf->Cell(60,4,'COSECHA FRESCA SAS',0,1,'C');
    $pdf->Ln(4);
    $pdf->SetFont('Helvetica','',9);
    $pdf->Cell(60,4,'CONSOLIDADO DE VENTAS',0,1,'C');

    $pdf->SetMargins(2, 0 , 0);
    $pdf->Ln(8);
    $pdf->Cell(44,4,utf8_decode('FECHA DE GENERACIÓN: '),0,0);
    $pdf->Cell(30,4,$fechaAc,0,1,'L',0);
    $pdf->SetFont('Helvetica','',8);
    $pdf->Ln(3);
    $pdf->Cell(75,0,'','T');
    $pdf->Ln(3);
    $pdf->Cell(50,4,'BASE MONETARIA: ',0,0);
    $pdf->Cell(30,4,'$ '. number_format($base),0,1,'L',0);
    $pdf->Cell(50,4,'EGRESOS: ',0,0);
    $pdf->Cell(30,4,'$ '. number_format($egresos),0,1,'L',0);
    $pdf->Cell(50,4,'TOTAL EFECTIVO:',0,0);
    $pdf->Cell(30,4,'$ '. number_format($efectivo),0,1,'L',0);
    $pdf->Cell(50,4,'TOTAL TARJETAS:',0,0);
    $pdf->Cell(30,4,'$ '. number_format($electronico),0,1,'L',0);
    $pdf->Cell(50,4,'TOTAL WEB:',0,0);
    $pdf->Cell(30,4,'$ '. number_format($web),0,1,'L',0);
    $pdf->Cell(50,4,'DINERO TOTAL CAJA:',0,0);
    $pdf->Cell(30,4,'$ '. number_format($cajaTo),0,1,'L',0);
    $pdf->Ln(3);
    $pdf->Cell(75,0,'','T');
    $pdf->Ln(3);

    //$pdf->Cell(20,4,utf8_decode('CÓDIGO: '),0,0);
    $pdf->Cell(40,4,'TRANSACCIONES',0,1,'L',0);
    $pdf->Ln(2);
    $pdf->Cell(50,4,utf8_decode('NÚMERO DE FACTURAS: '),0,0);
    $pdf->Cell(30,4, number_format($total),0,1,'L',0);
    $pdf->Cell(50,4,'FACTURA INICIAL:',0,0);
    $pdf->Cell(30,4,number_format($primero),0,1,'L',0);
    $pdf->Cell(50,4,'FACTURA FINAL:',0,0);
    $pdf->Cell(30,4,number_format($ultimo),0,1,'L',0);
    $pdf->Cell(50,4,'TOTAL DOCUMENTO:',0,0);
    $pdf->Cell(30,4,number_format($total),0,1,'L',0);
    $pdf->Ln(1);
    $pdf->Cell(75,0,'','T');
    $pdf->Ln(2);
    /*header('Content-type: application/pdf');
    $pdf->Output('D','Factura.pdf','UTF-8');*/

    $pdf->AutoPrint(true);
    $pdf->Output();
}else{
    //echo '<script>alert("No se encuentran registros con la fecha seleccionada")</script>';
    $pdf = new PDF_AutoPrint($orientation='P',$unit='mm', array(80,100));

    $pdf->AddPage();
    $pdf->Image('./images/logoCo1.png',20,3,40);
    $pdf->Ln(10);  
    $pdf->SetFont('Helvetica','',11);
    $pdf->Cell(60,4,'INVERSIONES AGROINDUSTRIALES',0,1,'C');
    $pdf->Cell(60,4,'COSECHA FRESCA SAS',0,1,'C');
    $pdf->Ln(4);
    $pdf->SetFont('Helvetica','',9);
    $pdf->Cell(60,4,'CONSOLIDADO DE VENTAS',0,1,'C');

    $pdf->SetMargins(2, 0 , 0);
    $pdf->Ln(8);
    $pdf->Cell(44,4,utf8_decode('FECHA DE GENERACIÓN: '),0,0);
    $pdf->Cell(30,4,$fechaAc,0,1,'L',0);
    $pdf->SetFont('Helvetica','',8);
    $pdf->Ln(3);
    $pdf->Cell(75,0,'','T');
    $pdf->Ln(3);

    $pdf->SetMargins(10, 0 , 0);
    $pdf->Ln(1);
    $pdf->Cell(60,4,'NO SE ENCUENTRAN RESULTADOS CON',0,1,'C');
    $pdf->Cell(60,4,'LA FECHA SELECCIONADA',0,1,'C');

    $pdf->AutoPrint(true);
    $pdf->Output();

}




//echo $pdf;
?>