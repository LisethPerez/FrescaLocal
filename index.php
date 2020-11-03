<?php
    session_start();
?>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

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

</head>
<body>
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm ">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php"><i class="menu-icon fa fa-laptop active"></i>FRESCA</a>
                    </li>
                    <li class="menu-title">ADMINISTRACIÓN</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>CLIENTES</a>
                        <ul class="sub-menu children dropdown-menu">                            
                            <li><i class=""></i><a href="view_cliente.php">Lista clientes</a></li>
                            
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>VENTAS</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class=""></i><a href="tables-basic.html">Lista ventas</a></li>
                        
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>FACTURACIÓN</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class=""></i><a href="forms-basic.html">Lista facturas</a></li>
                        
                        </ul>
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
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle1" class="menutoggle"><i class="fa fa-bars"></i> </a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i>My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa-cog"></i>Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power-off"></i>Logout</a>
                        </div>
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
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <div class="card bg-flat-color-8 border border-secondary" >
                           
                                        <div class="card-header bg-dark">
                                            <strong class="card-title text-light">Información venta</strong>
                                        </div>
                                        <div class="card-body">
                                        <form id="venta" method="POST">   
                                            <div class="form-row">
                                                <div class="col">
                                                    <label for="staticEmail2">Buscar producto</label>
                                                    <input autocomplete="off"  type="text" class="form-control selec" id="producto" name="producto" placeholder="Número o nombre" style="width:400px;" data-minChars="1">
                                                    
                                                </div>
                                                <div class="col">
                                                        <label><a  id="obte" class="">Peso</a></label>
                                                        <input type="hidden" id="peso" name="peso">
                                                        <input type="text" class="form-control selec" id="pesooo" placeholder="Peso" required disabled>
                                                </div>
                                            </div><br>
                                            <div class="form-row">
                                                <div class="col">
                                                        <label for="staticEmail2">Buscar por código</label>
                                                        <input type="text" class="form-control selec" id="producto1" name="producto1" placeholder="Número o nombre" style="width:400px;">
                                                </div>
                                                <div class="col">
                                                    <label for="validationCustom03">Cantidad</label>
                                                    <input type="text" class="form-control selec" id="cantidad" name="cantidad" placeholder="Cantidad" onkeypress="return onlyNums(event)" required><br>
                                        </form>                
                                                </div>
                                            </div><hr>
                                            <div class="form-row">
                                            <table class="table table-responsive">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>Codigo</th>
                                                        <th>Cantidad</th>
                                                        <th>Producto</th>
                                                        <th>Peso</th>
                                                        <th>Precio</th>
                                                        <th>Opciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="cont_ventas">

                                               
                                                </tbody>
                                                </table>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <strong>Total</strong>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input type="number" class="form-control" id="total" placeholder="Total" required style="width:110px; height:35px;" disabled>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <strong>Impuesto</strong>
                                                    </div>
                                                </div>
                                                    <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input type="number" class="form-control" id="impuesto" placeholder="Impuesto" required style="width:110px;  height:35px;" disabled>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <strong>Descuento</strong>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input type="number" class="form-control" id="descuento" placeholder="Desuento" required style="width:110px;  height:35px;" disabled>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="form-row">
                                                <div class="col">
                                                    <button class="btn btn-primary btn-sm mb-2" id="" type="button" data-toggle="modal" data-target="#infoCliente"><i class="fa fa-user"></i>&nbsp;Cliente</button>
                                                </div>
                                                <div class="col">
                                                    <button class="btn btn-success btn-sm mb-2" type="button" data-toggle="modal" data-target="#infoPago"><i class="fa fa-money"></i>&nbsp;Registrar pago</button> 
                                                </div>
                                                <div class="col">
                                                    <button class="btn btn-danger btn-sm mb-2" type="button"  style="background:#F0A744;"><i class="fa fa-globe"></i>&nbsp;Pagos WEB</button> 
                                                </div>
                                                <!--<div class="col">
                                                <div id="resultado"class="col"></div>
                                                </div>-->
                                            </div><hr>
                                            <div class="modal fade" id="infoCliente" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true" >
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="mediumModalLabel">Información Cliente</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                         </div>
                                                        <div class="modal-body">
                                                            <div class="card border border-secondary">
                                                                <div class="card-header bg-dark">
                                                                    <strong class="card-title text-light">Información general</strong>
                                                                </div>
                                                                <div class="card-body">

                                                                    <form  method="POST" id="formulario" class="form-inline">
                                                                        <div class="form-group mx-sm-3">       
                                                                            <label for="staticEmail2">Número de identidad</label>
                                                                        </div>
                                                                        <div class="form-group mx-sm-3">     
                                                                            <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Número">
                                                                        </div>   
                                                                        <div class="form-group mx-sm-3">   
                                                                            <button type="button" id="buscar1" class="btn btn-primary btn-sm mb-2"> Buscar</button>
                                                                        </div>
                                                                        <div class="form-group mx-sm-1">   
                                                                            <button type="button" id="ingresar" data-toggle="modal" data-target="#cliente" class="btn btn-success btn-sm mb-2" disabled> Ingresar</button> 
                                                                        </div>
                                                                    </form>
                                                                   
                                                                    <hr>
                                                                    <div class="form-row">
                                                                        <div class="col" id="resultado">
                                                                        </div>
                                                                    </div>
                                                                   
                                                                </div><!--card-body-->
                                                            </div><!--card-border-->
                                                        </div><!--model-body-->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-success btn-sm mb-2" data-dismiss="modal">Confirmar</button>
                                                           
                                                        </div>
                                                    </div><!--modal-content-->
                                                </div> <!--modal-dialog-->
                                            </div><!--modal-fade-->

                                            <div class="modal fade" id="cliente" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true" data-backdrop="static">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Información cliente</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                            </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="needs-validation" method="POST" id="form_cliente" novalidate>
                                                            <div class="form-row">
                                                            <div class="col">
                                                                            <label for="validationCustom03">Tipo Cliente</label>
                                                                            <select type="text" class="form-control" id="tipo_cliente" name="tipo_cliente" placeholder="Tipo cliente"  onkeypress="return onlyLetters(event)" style="width:160px;" required>
                                                                                <option value="1">Normal</option>
                                                                                <option value="2">Institucional</option>
                                                                            </select>
                                                                    </div>
                                                            </div>
                                                            <hr>
                                                                <div class="form-row">
                                                                    <div class="col-12">
                                                                        <label for="validationCustom01">Nombre</label>
                                                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre completo" onkeypress="return onlyLetters(event)"  required><br>
                                                                        <div class="invalid-feedback">
                                                                            Ingrese nombre
                                                                    </div>
                                                                </div>
                                                                </div>
                                                                <div class="form-row">
                                                                    <div class="col">
                                                                            <label for="validationCustom03">Documento</label>
                                                                            <input type="text" class="form-control" id="documento" name="documento" placeholder="Documento" onkeypress="return onlyNums(event)" max="10" required><br>
                                                                            <div class="invalid-feedback">
                                                                            Ingrese documento
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <label for="validationCustom03">Telefono</label>
                                                                        <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono" max="10" onkeypress="return onlyNums(event)" required><br>
                                                                        <div class="invalid-feedback">
                                                                            Ingrese telefono
                                                                        </div>
                                                                    </div>
                                                                    
                                                                </div>
                                                                <div class="form-row">
                                                                    <div class="col">
                                                                        <label for="validationCustom03">Dirección</label>
                                                                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Direccion" required><br>
                                                                        <div class="invalid-feedback">
                                                                            Ingrese dirección
                                                                        </div>
                                                                    </div> 
                                                                    <div class="col">
                                                                            <label for="validationCustom03">Correo</label>
                                                                            <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo"  required><br>
                                                                            <div class="invalid-feedback">
                                                                            Ingrese correo
                                                                        </div>
                                                                    </div>    
                                                                 
                                                                </div>
                                                                <div class="form-row" id="info_insti">
                                                                    <div class="col">
                                                                        <label for="validationCustom03">Empresa</label>
                                                                        <input type="text" class="form-control" id="empresa" name="empresa" placeholder="Empresa"  onkeypress="return onlyLetters(event)" required><br>
                                                                        <div class="invalid-feedback">
                                                                            Ingrese nombre empresa
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                            <label for="validationCustom03">Indentificación NIT</label>
                                                                            <input type="number" class="form-control" id="nit" name="nit" placeholder="NIT" value="Mark" onkeypress="return onlyNums(event)" required><br>
                                                                            <div class="invalid-feedback">
                                                                            Ingrese identificación NIT
                                                                            </div>
                                                                    </div> 
                                                                    <!--<div class="col">
                                                                            <label for="validationCustom03">Tipo Cliente</label>
                                                                            <select type="text" class="form-control" id="tipo_cliente" name="tipo_cliente" placeholder="Tipo cliente" value="Mark" onkeypress="return onlyLetters(event)" required>
                                                                                <option value="1">Normal</option>
                                                                                <option value="2">Institucional</option>
                                                                            </select>
                                                                    </div><br>-->
                                                                </div>
                                                                <!--<button class="btn btn-outline-success btn-sm" type="submit">Buscar</button>-->
                                                        
                                                    </div> <!--modal-body-->
                                                    <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancelar</button>
                                                            <button type="button" class="btn btn-success btn-sm" id="registrar2">Confirmar</button>
                                  
                                                    </div> <!--modal-footer-->
                                                    </form>
                                                </div><!--modal-content-->
                                            </div><!--modal-dialog-->
                                            </div> <!--modal-fade-->

                                            <div class="modal fade" id="infoPago" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true" >
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="mediumModalLabel">Información Cliente</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                         </div>
                                                        <div class="modal-body">
                                                            <div class="card border border-secondary">
                                                                <div class="card-header bg-dark">
                                                                    <strong class="card-title text-light">Información de pago</strong>
                                                                </div>
                                                                <div class="card-body">
                                                                    <div class="form-row">
                                                                        <div class="col">
                                                                            <strong> TIPOS DE PAGO</strong>
                                                                        </div>
                                                                    </div><hr>
                                                                    <div class="form-row">
                                                                        <?php 
                                                                            include 'conexionBD.php';
                                                                            $consulta = "SELECT * FROM tipo_pago";
                                                                            $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                                                        ?>
                                                                       
                                                                            <?php foreach($sql as $opciones): ?>
                                                                                <div class="btn-group alignment col">
                                                                                <button type="button" class="btn btn-success btn-sm mb-2 groupPago" value="<?php echo $opciones['nombre']?>" selected="selected" name="<?php echo $opciones['nombre']?>"><?php echo $opciones['nombre']?></button>
                                                                                </div>                                           
                                                                            <?php endforeach ?>
                                                                    </div><br>
                                                                    <div id="efectivo">
                                                                        <div class="form-row">
                                                                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Valor recibido" onkeypress="return onlyNums(event)"><br>        
                                                                        </div><br>
                                                                        <div class="form-row">
                                                                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Valor del cambio" onkeypress="return onlyNums(event)" disabled><br>        
                                                                        </div>
                                                                    </div>    
                                                                    
                                                                    
                                                                   
                                                                </div><!--card-body-->
                                                            </div><!--card-border-->
                                                        </div><!--model-body-->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger btn-sm mb-2" data-dismiss="modal">ATRÁS</button>
                                                            <button type="button" class="btn btn-success btn-sm mb-2" id="eliminar">ELIMINAR</button>
                                                            <button type="button" class="btn btn-success btn-sm mb-2" id="pagar">PAGAR</button>
                                                        </div>
                                                    </div><!--modal-content-->
                                                </div> <!--modal-dialog-->
                                            </div><!--modal-fade-->
                                        </div><!--card-body-->
                       
                                    </div> <!--card bg-->
                                </div>  <!--fomr-group-->   
                            </div> <!--COL-LOg-8-->
                            <div class="col-lg-4">
                                <div class="card border border-secondary">
                                    <div class="card-header bg-dark">
                                        <strong class="card-title text-light">Información Productos</strong>
                                    </div>
                                    <div class="card-body">
                                        <!--<div class="card-header bg-dark">
                                            <strong class="card-title text-light">Categorías</strong>
                                        </div>-->
                                        <div class="card-text">
                                        <!--<strong>CATEGORÍAS</strong>
                                        <br>
                                            <?php 
                                                include 'conexionGene.php';
                                                $consulta = "SELECT * FROM categoria_productos";
                                                $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                            ?>
                                            <div class="btn-group alignment col">
                                                <?php foreach($sql as $opciones): ?>
                                                    <button type="button" class="btn btn-outline-success btn-sm mb-2 groupBotones" value="<?php echo $opciones['nombre']?>" selected="selected" name="<?php echo $opciones['nombre']?>"><?php echo $opciones['nombre']?></button>
                                                                                                
                                                <?php endforeach ?>
                                               
                                            </div>
                                            <hr width="100%" />
                                            <br>   -->        
                                            <!--<div class="card-header bg-dark">
                                                <strong class="card-title text-light">Productos</strong>
                                            </div>-->
                                            <strong>PRODUCTOS</strong><br>
                                            <div class="card-text col-12" >
                                                <div class="form-row">
                                                    <div class="col-8" id="productos">
                                                           
                                                        <label>IMAGENES</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> <!--card-text-->
                                    </div>  <!--card-body-->
                                </div><!--card-border-->
                                <div class="card border border-secondary">
                                   
                                    <div class="card-body">
                                        <table class="table table-sm table-borderless">
                                        <tbody>
                                                                <tr>
                                                                    <td><button type="button"  id="sele1" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="1">1</button></td>
                                                                    <td><button type="button"  id="sele2" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="2">2</button></td>
                                                                    <td> <button type="button" id="sele3" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="3">3</button></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><button type="button" id="sele4" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="4">4</button></td>
                                                                    <td><button type="button" id="sele5" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="5">5</button></td>
                                                                    <td><button type="button" id="sele6" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="6">6</button></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><button type="button" id="sele7" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="7">7</button></td>
                                                                    <td><button type="button" id="sele8" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="8">8</button></td>
                                                                    <td> <button type="button" id="sele9" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;"  value="9">9</button></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><button type="button" id="sele0" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="0">0</button></td>
                                                                    <td><button type="button" id="sele00" class="btn btn-danger btn-sm calcu" style="width:75px; background:#F0A744;" value="00">00</button></td>
                                                                    <td> <button type="button" id="seleEli" class="btn btn-danger btn-sm" style="width:75px; background:#F0A744;">&larr;</button></td>
                                                                </tr>
                                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div> <!--COL-LOg-4-->
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
<script src="assets/js/awesomplete.min.js"></script>
<script src="assets/fontawesome/js/all.js"></script>
<script src="assets/js/jQuery.js"></script>
<script src="assets/js/sweetalert2.min.js"></script>
<script src="assets/js/script_Index.js"></script>
<script src="assets/jquery-ui/typeahead.js"></script>

</body>
</html>
