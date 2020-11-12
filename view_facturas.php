<?php
    session_start(); 
    if (empty($_SESSION['username'])): header("Location: page-login.php");
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

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php"><i class="menu-icon fa fa-laptop"></i>FRESCA</a>
                    </li>
                    <li class="menu-title">Administración</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>CLIENTES</a>
                        <ul class="sub-menu children dropdown-menu">                            
                            <li><i class=""></i><a href="view_cliente.php">Lista clientes</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>VENTAS</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class=""></i><a href="view_ventas.php">Lista ventas</a></li>
                    
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th active"></i>FACTURACIÓN</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class=""></i><a href="view_facturas.php">Lista facturas</a></li>
                        
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
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="salir.php"><i class="fa fa-power-off"></i>Logout</a>
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
                                    <div class="card bg-flat-color-8 border border-secondary">
                           
                                        <div class="card-header bg-dark">
                                            <strong class="card-title text-light">Información venta</strong>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-row">
                                                <div class="col">
                                                    <button class="btn btn-outline-primary btn-sm mb-2" id="" type="button" data-toggle="modal" data-target="#infoCliente">Información cliente</button>
                                                </div>
                                                <div class="col">
                                                    <button class="btn btn-outline-primary btn-sm mb-2" id="" type="button" data-toggle="modal" data-target="#infoProductos">Información productps</button>
                                                </div>
                                            </div>
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

                                                                    <form  methop="POST" id="formulario" class="form-inline">
                                                                        <div class="form-group mx-sm-3">       
                                                                            <label for="staticEmail2">Número de identidad</label>
                                                                            <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Número">
                                                                        </div>   
                                                                        <br><br>
                                                                        <button type="button" id="buscar1" class="btn btn-outline-primary btn-sm mb-2"> Buscar</button>
                                                                        <button type="button" id="ingresar" data-toggle="modal" data-target="#cliente" class="btn btn-outline-success btn-sm mb-2" disabled> Ingresar</button> 

                                                                    </form>

                                                                    <form class="needs-validation" novalidate>
                                                                        <div class="form-row">
                                                                            <div class="col">
                                                                                <label for="validationCustom01">Fecha</label>
                                                                                <input type="datetime" class="form-control" id="" value="<?php echo date("Y/m/d H:i"); ?>" disabled required>
                                                                                <div class="invalid-feedback">
                                                                                    Seleccione fecha
                                                                                </div>
                                                                            </div>
                                                                            <div class="col">
                                                                                <label for="validationCustom03">Empleado</label>
                                                                                <select class="form-control" id="Empleado" required>
                                                                                        <!-- <option value="0" selected="selected">Seleccione...</option>-->
                                                                                    <?php 
                                                                                        include 'conexionGene.php';
                                                                                        $consulta = "SELECT * FROM users";
                                                                                        $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                                                                    ?>
                                                                                    <?php foreach($sql as $opciones): ?>
                                                                                        <option value="<?php echo $opciones['name']?>" selected="selected"><?php echo $opciones['name']?></option>
                                                                                    <?php endforeach ?>
                                                                                </select>
                                                                                <div class="invalid-feedback">
                                                                                    Seleccione empleado
                                                                                </div> 
                                                                            </div>
                                                                            <div class="col">
                                                                               <label for="validationCustom03">Tipo pago</label>
                                                                                <select class="form-control" id="Empleado" placeholder="First name"  required>
                                                                                    <?php 
                                                                                        include 'conexionBD.php';
                                                                                        $consulta = "SELECT * FROM tipo_pago";
                                                                                        $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                                                                    ?>
                                                                                    <?php foreach($sql as $opciones): ?>
                                                                                        <option value="<?php echo $opciones['nombre']?>" selected="selected"><?php echo $opciones['nombre']?></option>
                                                                                    <?php endforeach ?>
                                                                                </select>
                                                                                <div class="invalid-feedback">
                                                                                    Seleccione tipo de venta
                                                                                </div>
                                                                            </div>
                                                                                    
                                                                        </div>
                                                                        <div class="form-row">
                                                                            <button class="btn btn-outline-primary btn-sm mb-2" id="verificar" type="button">Verificar</button>
                                                                        </div>
                                                                    </form>
                                                                </div><!--card-bod-->
                                                            </div><!--card-border-->
                                                        </div><!--model-body-->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            <button type="button" class="btn btn-primary" id="confirmar">Confirm</button>
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
                                                                <div class="form-row">
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
                                                                </div>
                                                                <!--<button class="btn btn-outline-success btn-sm" type="submit">Buscar</button>-->
                                                        
                                                    </div> <!--modal-body-->
                                                    <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">Cancel</button>
                                                            <button type="button" class="btn btn-outline-success btn-sm" id="registrar2">Confirm</button>
                                  
                                                    </div> <!--modal-footer-->
                                                    </form>
                                                </div><!--modal-content-->
                                            </div><!--modal-dialog-->
                                            </div> <!--modal-fade-->

                                            <form class="needs-validation" novalidate>
                                                <div class="form-row">
                                                                <!--<div class="col">
                                                                    <label for="validationCustom01">EAN</label>
                                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark" required><br>
                                                                </div>
                                                                <div class="col">
                                                                    <label for="validationCustom03">Nombre</label>
                                                                    <input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark" required><br>
                                                                </div>-->
                                                    <div id="resultado"class="col">

                                                    </div>

                                                </div>      
                                            </form>
                                            <form class="needs-validation" novalidate >      
                                                <div class="form-row">
                                                    <div class="col">
                                                        <label for="validationCustom03">Número factura</label>
                                                        <input type="number" class="form-control" id="validationCustom01" placeholder="Número Factura" required disabled>
                                        
                                                    </div>
                                                    <div class="col">
                                                        <label for="validationCustom03">Precio unitario</label>
                                                        <input type="number" class="form-control" id="precio" placeholder="Precio" required disabled>
                                        
                                                    </div>
                                                    <div class="col">
                                                        <label for="validationCustom03">Impuesto</label>
                                                        <select class="form-control" id="Impuesto" placeholder="First name"  required>
                                                            <?php 
                                                                include 'conexionGene.php';
                                                                $consulta = "SELECT * FROM impuestos";
                                                                $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                                            ?>
                                                            <?php foreach($sql as $opciones): ?>
                                                                <option value="<?php echo $opciones['nombre']?>" selected="selected"><?php echo $opciones['nombre']?></option>
                                                            <?php endforeach ?>
                                                        </select>
                                        
                                                    </div>
                                                    <div class="col">
                                                        <label for="validationCustom03">Descuento</label>
                                                        <select class="form-control" id="Descuento" placeholder="First name"  required>
                                                            <?php 
                                                                include 'conexionBD.php';
                                                                $consulta = "SELECT * FROM descuento";
                                                                $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                                            ?>
                                                            <?php foreach($sql as $opciones): ?>
                                                                <option value="<?php echo $opciones['nombre']?>" selected="selected"><?php echo $opciones['nombre']?></option>
                                                            <?php endforeach ?>
                                                        </select>
                                                                    
                                                        <div class="invalid-feedback">
                                                            Seleccione descuento
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <label for="validationCustom03">Fecha</label>
                                                        <input type="datetime" class="form-control" id="validationCustom01" placeholder="Fecha" value="<?php echo date("Y/m/d H:i"); ?>" disabled required>
                                                        <div class="invalid-feedback">
                                                            Seleccione fecha
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <label for="validationCustom03">Peso</label>
                                                        <input type="number" class="form-control" id="validationCustom01" placeholder="Peso" required disabled>
                                        
                                                    </div>
                                                    <div class="col">
                                                        <label for="validationCustom03">Cantidad</label>
                                                        <input type="number" class="form-control" id="cantidad" placeholder="Cantidad" required disabled><br>
                                                        <div class="invalid-feedback">
                                                            Seleccione la cantidad
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="con" class="form-row">
                                                    <div class="col-lg-6 col-xl-12">
                                                        <button type="button"  id="sele1" class="btn btn-outline-secondary btn-sm" value="1">1</button>
                                                        <button type="button"  id="sele2" class="btn btn-outline-secondary btn-sm" value="2">2</button>
                                                        <button type="button"  id="sele3" class="btn btn-outline-secondary btn-sm" value="3">3</button>
                                                    </div>
                                                </div>
                                                <div id="con" class="form-row">
                                                    <div class="col-lg-6 col-xl-12">
                                                        <button type="button" id="sele4" class="btn btn-outline-secondary btn-sm" value="4">4</button>
                                                        <button type="button" id="sele5" class="btn btn-outline-secondary btn-sm" value="5">5</button>
                                                        <button type="button" id="sele6" class="btn btn-outline-secondary btn-sm" value="6">6</button>
                                                        </div>
                                                    </div>     
                                                    <div id="con" class="form-row">
                                                        <div class="col-lg-6 col-xl-12">
                                                            <button type="button" id="sele7" class="btn btn-outline-secondary btn-sm" value="7">7</button>
                                                            <button type="button" id="sele8" class="btn btn-outline-secondary btn-sm" value="8">8</button>
                                                            <button type="button" id="sele9" class="btn btn-outline-secondary btn-sm" value="9">9</button>
                                                        </div>
                                                    </div>        
                                                        <div id="con" class="form-row">
                                                            <div class="col-lg-6 col-xl-12">
                                                                <button type="button" id="sele0" class="btn btn-outline-secondary btn-sm" value="0">0</button>
                                                                <button type="button" id="seleEli" class="btn btn-outline-secondary btn-sm">&larr;</button>
                                                            </div>
            
                                                        </div>
                                                        <div  class="form-row">
                                                            <button class="btn btn-outline-success btn-sm mb-2" type="submit">Registrar producto</button>  
                                                        </div>  
                                                </form>
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
                                        <div class="card-header bg-dark">
                                            <strong class="card-title text-light">Categorías</strong>
                                        </div>
                                        <div class="card-text">
                                            <?php 
                                                include 'conexionGene.php';
                                                $consulta = "SELECT * FROM categoria_productos";
                                                $sql = mysqli_query($conn,$consulta) or die(mysqli_error($conn));
                                            ?>
                                            <div  class="btn-group alignment" id="my_radiogroup">
                                                <?php foreach($sql as $opciones): ?>
                                                    <button class="btn btn-outline-success btn-sm mb-2" value="<?php echo $opciones['nombre']?>" selected="selected" name="<?php echo $opciones['nombre']?>"><?php echo $opciones['nombre']?></button>
                                                                                                
                                                <?php endforeach ?>
                                                <script>
                                                    $(".alignment .btn").click(function() {
                                                      
                                                        var datos = $(this).val();
                                                            $.ajax({
                                                            url: "get_var.php?var= '" + datos + "'",
                                                                success: function( data ) {
                                                                $('#productos').html(data);
                                                                }
                                                            })
                                                        }); 
                                                </script>
                                            </div>
                                            <br>           
                                            <div class="card-header bg-dark">
                                                <strong class="card-title text-light">Productos</strong>
                                            </div>
                                            <div class="card-text col-12" id="productos">
                                                <div class="form-row">
                                                    <div  class="btn-group alignments col-6" id="">
                                                                            
                                                    </div>
                                                    <div  class="col-6" id="">
                                                        <label>AQUI VAN LAS IMAGENES</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> <!--card-text-->
                                    </div>  <!--card-body-->
                                </div><!--card-border-->
                            </div> <!--COL-LOg-4-->
                        </div> <!--row-->
                    </div><!--COL-LOg-12-->   
                </div><!--orders-->
            </div> <!--CONTainet-->
        </div><!--CONTENT-->
           
            <div class="content">
                <div class="container">
                    
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card border border-secondary">
                            <div class="card-header bg-light">
                                <strong class="card-title text-dark">Información Productos</strong>
                            </div>
                            
                                <div>
                                        <table class="table table-responsive">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th class="serial">#</th>
                                                    <th>ID</th>
                                                    <th>ID Factura</th>
                                                    <th>Producto</th>
                                                    <th>Proveedor</th>
                                                    <th>Cantidad</th>
                                                    <th>Precio unitario</th>
                                                    <th>Impuesto</th>
                                                    <th>Descuento</th>
                                                    <th>Pago total</th>
                                                    <th>Opciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                            
                        </div>
                    </div><!-- /# column -->
                </div>
            
            </div>
        </div>
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
<script src="assets/js/jQuery.js"></script>
<script src="assets/js/sweetalert2.min.js"></script>
<script src="assets/js/script_Index.js"></script>


</body>
</html>
<?php endif; ?>