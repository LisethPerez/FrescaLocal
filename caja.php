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
    <!--<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">-->

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
    <link rel="stylesheet" href="assets/jquery-ui/jquery-ui.css">
    <script src="assets/js/jQuery.js"></script>
    <script src="assets/jquery-ui/jquery-ui.js"></script>
  <!--  <script src="assets/jquery-ui/typeahead.js"></script>-->
    
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<style>
.my-custom-scrollbar {
position: relative;
height: 200px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
::placeholder {
  font-size: 80%;

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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>CLIENTES</a>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>CAJA</a>
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

        <!-- Header-->
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
        <div class="clearfix"></div>
        <div class="content">
            <div class="container">     
                <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="card bg-flat-color-8 border border-secondary" >
                           
                                        <div class="card-header bg-dark">
                                            <strong class="card-title text-light">Información caja</strong>
                                        </div>
                                        <div class="card-body">
                                        <form id="venta" method="POST">  
                                        <strong>Información general</strong> <br>
                                            <div class="form-row">
                                                <div class="col">
                                                    
                                                    <label for="staticEmail2">Cajero</label>
                                                    <input type="text" class="form-control active" id="cajero" name="cajero" value="<?php echo $_SESSION['nombreEmple'];?>"placeholder="Número o nombre" style="" disabled>
                                                    
                                                </div>
                                                <div class="col">
                                                        <label><a id="obte" class="">Fecha</a></label>
                                                        
                                                        <input type="text" class="form-control" id="fechaAc" name="fechaAc" value="<?php echo $_SESSION['fecha'];?>"style="" disabled>
                                                       <!--<input type="text" class="form-control selec" name="peso" id="peso" placeholder="Peso" style="height:30px" required>-->
                                                </div>
                                                <div class="col">
                                                        <label><a id="obte" class="">Sede</a></label>
                                   
                                                        <input type="text" class="form-control" id="sede" value="<?php echo  $_SESSION['nombreSede'];?>"name="sede" style=";" disabled>
                                                       <!--<input type="text" class="form-control selec" name="peso" id="peso" placeholder="Peso" style="height:30px" required>-->
                                                </div>
                                            </div><hr>
                                            
                                            <div class="form-row">
                                
                                                <div class="col">
                                                    <label for="validationCustom03">Ingrese el valor de la base monetaria</label>
                                                    <input type="text" class="form-control selec" id="baseMo" name="baseMo" style="height:80px; font-size:300%;"  onkeypress="return onlyNums(event)" required><br>
                            
                                                </div>
                                                <div class="col">
                                                    <label>Egresos</label>
                                                    <input type="hidden" id="totalEg" name="totalEg">
                                                    <input type="text" class="form-control" id="totalEgr" name="totalEgr" style="height:80px; font-size:300%;"  onkeypress="return onlyNums(event)" disabled>
                                                </div>
                                                
                                        </form> 
                                            </div><hr>
                                            
                                            <div class="form-row">
                                                <div class="col"></div>
                                                <div class="col">
                                                    <button class="btn btn-primary btn-sm mb-2" id="" type="button" data-toggle="modal" data-target="#ventasPre" style="width:170px; height:50px"><i class="fa fa-shopping-cart"></i>&nbsp;Ventas presenciales</button>
                                                </div>
                                                <div class="col"></div>
                                                <div class="col">
                                                    <button class="btn btn-primary btn-sm mb-2" id="realizar_pago" type="button" data-toggle="modal" data-target="#ventasWeb" style="width:170px; height:50px"><i class="fa fa-shopping-cart"></i>&nbsp;Ventas electrónicas</button> 
                                                </div>
                                                <div class="col"></div>
                                                
                                            </div><hr>
                                            <div class="form-row">
                                                <div class="col">
                                                    <label>Total ventas en efectivo</label>
                                                    <input type="hidden" id="totalEfec" name="totalEfec">
                                                    <input type="text" class="form-control" id="totalEfe" name="totalEfe" style="height:80px; font-size:300%;"  onkeypress="return onlyNums(event)" disabled>
                                                </div>
                                                <div class="col">
                                                    <label>Total ventas de pago electrónico</label>
                                                    <input type="hidden" id="totalTar" name="totalTar">
                                                    <input type="text" class="form-control" id="totalTarj" name="totalTarj" style="height:80px; font-size:300%;"  onkeypress="return onlyNums(event)" disabled>
                                                </div>
                                                <div class="col">
                                                    <label>Total ventas WEB</label>
                                                    <input type="hidden" id="totalEle" name="totalEle">
                                                    <input type="text" class="form-control" id="totalElec" name="totalElec" style="height:80px; font-size:300%;"  onkeypress="return onlyNums(event)" disabled>
                                                </div>
                                                

                                    
                                                <div class="col">
                                                    <label>Dinero total en caja</label>
                                                   
                                                    <input type="text" class="form-control" id="dineCaja" name="dineCaja" style="height:80px; font-size:300%;"  onkeypress="return onlyNums(event)" disabled>
                                                </div>
                                                
                                            </div>
                                            <div class="form-row">
                                                <div class="col"></div>
                                                <div class="col">
                                                <br>
                                                    <button class="btn btn-success btn-sm mb-2" id="cerrar" type="button" style="width:170px; height:50px"><i class="fa fa-shopping-cart"></i>&nbsp;Cerrar caja</button>
                                                </div>
                                                <div class="col"></div>
                                            </div>
                                            <div class="modal fade" id="ventasPre" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true" >
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id=""><strong>Información ventas presenciales</strong></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                         </div>
                                                        <div class="modal-body">
                                                            <div class="card border border-secondary">
                                                                <div class="card-header bg-dark">
                                                                    <strong class="card-title text-light heading">Ventas presenciales</strong>
                                                                </div>
                                                                <div class="card-body">
                                                                    <div class="form-row">
                                                                        <div class="col">
                                                                            <button type="button" id="presenciales" value="presenciales" class="btn btn-success btn-sm mb-2 presen" >Presenciales</button>
                                                                        </div>
                                                                        <div class="col">
                                                                            <button type="button" id="domicilio" value="domicilio" class="btn btn-success btn-sm mb-2 presen" >Domicilios</button>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="form-row">
                                                                        <div class="col" id="ventas_pre">
                                                                        </div>
                                                                    </div>
                                                                   
                                                                </div><!--card-body-->
                                                            </div><!--card-border-->
                                                        </div><!--model-body-->
                                                        <div class="modal-footer">
                                                            <button type="button" id="" class="btn btn-danger btn-sm mb-2" data-dismiss="modal">ATRÁS</button>
                                                           
                                                        </div>
                                                    </div><!--modal-content-->
                                                </div> <!--modal-dialog-->
                                            </div><!--modal-fade-->

                                            <div class="modal fade" id="ventasWeb" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true" >
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id=""><strong>Información ventas elenctónicas</strong></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                         </div>
                                                        <div class="modal-body">
                                                            <div class="card border border-secondary">
                                                                <div class="card-header bg-dark">
                                                                    <strong class="card-title text-light heading">Ventas electónicas</strong>
                                                                </div>
                                                                <div class="card-body">
                                                                    <div class="form-row">
                                                                        <div class="col">
                                                                            <button type="button" id="presenciales" value="aplicacion" class="btn btn-success btn-sm mb-2 webb" >Aplicación</button>
                                                                        </div>
                                                                        <div class="col">
                                                                            <button type="button" id="presenciales" value="paginaWeb" class="btn btn-success btn-sm mb-2 webb" >Página web</button>
                                                                        </div>
                                                                        <div class="col">
                                                                            <button type="button" id="domiciliario" value="mercado" class="btn btn-success btn-sm mb-2 webb" >Mercado en casa</button>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="form-row">
                                                                        <div class="col" id="ventas_web">
                                                                        </div>
                                                                    </div>
                                                                   
                                                                </div><!--card-body-->
                                                            </div><!--card-border-->
                                                        </div><!--model-body-->
                                                        <div class="modal-footer">
                                                            <button type="button" id="" class="btn btn-success btn-sm mb-2" data-dismiss="modal">ATRÁS</button>
                                                           
                                                            <button type="button" id="confi" class="btn btn-success btn-sm mb-2">CONFIRMAR</button>
                                                           
                                                        </div>
                                                    </div><!--modal-content-->
                                                </div> <!--modal-dialog-->
                                            </div><!--modal-fade-->

                                        </div><!--card-body-->
                       
                                    </div> <!--card bg-->
                                </div>  <!--fomr-group-->   
                            </div> <!--COL-LOg-8-->
                            
                        </div> <!--row-->
                    </div><!--COL-LOg-12-->   
                </div><!--orders-->
            </div> <!--CONTainet-->
        </div><!--CONTENT-->
            
    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                   <!-- Copyright &copy; 2018 Ela Admin-->
                    Copyright &copy; 2020 Controler
                </div>
                <div class="col-sm-6 text-right">
                   <!-- Designed by <a href="https://colorlib.com">Colorlib</a>-->
                    Designed by <a href="https://controler.com.co/">Controler</a>
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
<script src="assets/js/awesomplete.min.js"></script>
<script src="assets/fontawesome/js/all.js"></script>
<script src="assets/js/jQuery.js"></script>
<script src="assets/js/sweetalert2.min.js"></script>
<script src="assets/js/script_Index.js"></script>
<script src="assets/jquery-ui/typeahead.js"></script>

</body>
</html>

<?php endif; ?>