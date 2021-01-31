<?php
    session_start(); 
    if (empty($_SESSION['username'])): header("Location: login_page.php");
    else: 
?>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Cosecha Fresca</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/sweetalert2.min.css">
    <link rel="stylesheet" href="assets/fontawesome/css/all.css">
    <link rel="shortcut icon" href="images/favico.png"> 
    <script src="assets/js/jQuery.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet"/>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <script src="assets/jquery-ui/typeahead.js"></script>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style>
    .my-custom-scrollbar {
    position: relative;
    height: 380px;
    overflow: auto;
    }
    .table-wrapper-scroll-y {
    display: block;
    }
    thead tr th{
    position: sticky;
    top: 0;
    z-index: 10;
    }
</style>

</head>
<body>
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            
        <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="index.php"><i class="menu-icon fa fa-laptop active"></i>FRESCA</a>
                    </li>
                    <li class="menu-title">Administración</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>CLIENTES</a>
                        <ul class="sub-menu children dropdown-menu">                            
                            <li><i class=""></i><a href="view_cliente.php">Lista clientes</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>FACTURACIÓN</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class=""></i><a href="view_ventas.php">Realizadas</a></li>
                            <li><i class=""></i><a href="view_facturas.php">Anuladas</a></li>
                            <li><i class=""></i><a href="view_facturas_pendientes.php">Pendientes</a></li>
                            <li><i class=""></i><a href="view_facturas_web.php">Web</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa fa-cogs"></i>CAJA</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class=""></i><a href="caja.php">Cierre caja</a></li>
                            
                        </ul>
                    </li>
                    
                    <hr>
                    <li class="menu-title">Salir</li><!-- /.menu-title -->
                    <li>
                        <a href="salir.php" class="nav-link"> <i class="menu-icon fa fa-power-off"></i>Cerrar sessión</a>
                        
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

    <header id="header" class="header">
           <!-- <div class="top-left">
                <div class="navbar-header" style="background:#F0A744">
                    <a class="navbar-brand" style="background:#F0A744" href="./"><img src="images/logoo1.png" alt="Logo"></a>
                 
                    <a id="menuToggle" class="menutoggle" style="background:#F0A744;"><i class="fa fa-bars" style=" color:#FFF"></i></a>
                    
                </div>
            </div>-->
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./"><img src="images/logoCo1.png" alt="Logo"><img src="images/texto.png" alt="Logo"></a>
                 
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                    
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                   
                    <br>
                        <label>Bienvenido: <?php echo $_SESSION['nombreEmple']?></label>
                    </div>
                    <div class="user-area dropdown float-right">
                    <a href="#"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                            <img class="" src="images/controler2.jpg" style="width: 110px; height: 50px;">
                        </a>
                    </div>
                </div>
            </div>
            
        </header><!-- /header -->
        <!-- Header-->

        <!--<div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>Dashboard</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">Dashboard</a></li>
                                    <li><a href="#">Forms</a></li>
                                    <li class="active">Basic</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        <div class="container">
                <div class="clearfix"></div>
                    <div class="row">
                    <div class="col-lg-12">
                        <div class="card border border-secondary">
                            <div class="card-header bg-light">
                                <strong class="card-title text-dark">Información Facturas</strong>
                            </div>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="row">
                                        <div id="selección">
                                            <div class="row">
                                                <div class="col">
                                               
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <strong>Ingrese número de factura</strong>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                   
                                                    <input class="form-check-input" type="text" name="numberFac" id="numberFac" value="">
                                        
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <!--<button type="button" id="buscarFac" class="btn btn-primary btn-sm mb-2"> Buscar</button>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>  <br>
                                
                                    <div class=""> 
                                    <table class="table table-responsive table-wrapper-scroll-y my-custom-scrollbar" id="taable">
                                            <thead class="thead-dark">
                                                <tr>    
                                                    <th>ID</th>
                                                    <th>Total</th>
                                                    <th>#Productos</th>
                                                    <th>Fecha</th>
                                                    <th>Tipo_pago</th>
                                                    <th>Empleado</th>
                                                    <th>Cliente</th>
                                                    <th>Sede</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody id="pro">
                                            <?php
                                                include 'ver_fact.php';
                                            ?>
                                            
                                            </tbody>
                                        </table>
                                </div>
                               
                                </div>
                            </div>   
                        </div> 
                    
                    </div><!-- /# column -->
                </div>
                <div class="modal fade bd-example-modal-lg" id="productos" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static">
                                            <div class="modal-dialog modal-lg " role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"><strong>Información venta</strong></h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                            </button>
                                                    </div>
                                                    <div class="modal-body">
                                                    <table class="table table-responsive table-wrapper-scroll-y my-custom-scrollbar" id="tabla">
                                            <thead class="thead-dark">
                                                <tr>    
                                                    <th>Cantidad</th>
                                                    <th>Producto</th>
                                                    <th>Precio</th>
                                                    <th>Total</th>
                                                    <th>Descuento</th>
                                                    <th>Impuesto</th>
                                                    <th>Fecha</th>
                                                    <th>Empleado</th>
                                                    <th style="display:none">id_Detalle</th>
                                                 
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="cont_productos">
                                            
                                            </tbody>
                                        </table>
                                                    </div>
                                                    <div class="modal-footer">
                                                            <button type="button" id="" class="btn btn-danger btn-sm mb-2 atras" data-dismiss="modal">ATRÁS</button>
                                                           
                                                        </div>
                                                    
                                                </div><!--modal-content-->
                                            </div><!--modal-dialog-->
                                        </div> <!--modal-fade-->

                <div class="modal fade" id="modificarProd" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true" data-backdrop="static">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><strong>Modificación de producto</strong></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            <div class="form-row">
                                                <div class="col">
                                                    <label for="staticEmail2">Buscar producto</label>
                                                    <input autocomplete="off"  type="text" class="form-control active select" id="producto2" name="producto2" placeholder="Número o nombre" style="width:400px; height:35px; font-size:110%;" data-minChars="1">
                                                    
                                                </div>
                                                <div class="col">
                                                        <label><a id="obte" class="">Peso (KG)</a></label>
                                                        <input type="hidden" id="peso3" name="peso3"></input>
                                                        <input type="text" class="form-control select" id="pesooo2" name="pesooo2" style="height:35px; font-size:160%;" required>
                                                       <!--<input type="text" class="form-control selec" name="peso" id="peso" placeholder="Peso" style="height:30px" required>-->
                                                </div>
                                            </div><br>
                                            <div class="form-row">
                                                <div class="col">
                                                        <label for="staticEmail2">Buscar por código</label>
                                                        <input type="text" class="form-control" id="producto3" name="producto3" placeholder="Número o nombre" style="width:400px; height:35px; font-size:110%;">
                                                </div>
                                                <div class="col">
                                                    <label for="validationCustom03">Cantidad</label>
                                                    <input type="text" class="form-control select" id="cantidad2" name="cantidad2" style="height:35px; font-size:110%;" placeholder="Cantidad" onkeypress="return onlyNums(event)" required><br>
                                                       
                                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="" class="btn btn-danger btn-sm mb-2" data-dismiss="modal">ATRÁS</button>
                            </div>
                        </div><!--modal-content-->
                    </div><!--modal-dialog-->
               </div> <!--modal-fade-->       
            </div>
            </div>
        
       </div>         <!--  /Traffic -->

    <div class="clearfix"></div>
                <!--  /Traffic -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    Copyright &copy; 2018 Ela Admin
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div>
    </footer>

</div><!-- /#right-panel -->

<!-- Right Panel -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/fontawesome/js/all.js"></script>

<script src="assets/js/sweetalert2.min.js"></script>
<script src="assets/js/script_Index.js"></script>
<script charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script>
$('.modiProdu').click(function(){
    alert("Entro");
    $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
        alert(datos[0]+" - " + datos[8]+" - " + datos[9]);
    /*$.ajax({
        type:"POST",
        url: "anulacion.php?var="+datos[0],
        success: function(data) {
            alert(data);
        
        }

    });*/
    
    
});
</script>
</body>
</html>
<?php endif; ?>
