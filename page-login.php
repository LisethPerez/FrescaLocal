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
    <style>
        body {
            font-family: 'Lato';
        }
        .fa-btn {
            margin-right: 6px;
        }
 .grid-1 {
  display: grid;
  width: 100%;
  max-width: 1060px;
  margin: 0 auto;
  margin-top: 20px;
  grid-template-columns: repeat(6, 2fr);
  grid-template-rows: repeat(6, 85px);
  grid-gap: 20px;
}
.grid-2 {
  display: grid;
  width: 100%;
  max-width: 650px;
  margin: 0 auto;
  grid-template-columns: repeat(2, 2fr);
  grid-template-rows: repeat(5, 64px);
  grid-gap: 20px;
}
/* items */
.grid-1 div {
  color: black;
  }
/* specific item styles */
.item-1 {
  background: white;
  grid-column: 2 / span 4;
  grid-row: 2 / span 4;
}
.item-botones {
  background: white;
  grid-column: 1 / span 1;
  grid-row: 3 / span 3;
}
.item-imagenD {
  background: white;
  grid-column: 2 / span 1;
  grid-row: 1 / span 5;
}
.item-imagenI {
  background: white;
  grid-column: 1 / span 1;
  grid-row: 1 / span 2;
}

.botonimagen{
  background-image:url(images/entrar.png);
  width: 220px;
  height:30px;
}
    </style>
</head>
<body id="app-layout" background="images/bck.png">
 
<section class="grid-1">

<div class="item-1" style="align:right;">

  <section class="grid-2">
      <div class="item-imagenI"><img src="images/controler.png" width="290" height="160" style="">
        <label style="color: black"></label>
      </div>

      <div class="item-botones" style="align:center;">
        <div style="align:center;">
          
        <form class="form-horizontal" method="POST" id="formulario_ingreso">
                        
                <div style="align:center;">
                        <div class="col-md-12" style="align:center;">
                            <div class="col-md-12">
                            <br>
                                <label style="color:  #2980b9 ">Ingresa tus datos por favor</label>
                           
                            </div>
                            <div class="form-group" style="align:center;">
                                <div class="col-md-12">
                                    <input id="email" type="email" class="form-control" name="email" value="" placeholder="Usuario" style="width: 230px; height: 30px;">
                                </div>
                            </div>
                            <div class="form-group" style="align:center;">
                           
                                <div class="col-md-12" style="align:center;">
                                    <input id="password" type="password" class="form-control" name="pass" placeholder="Contraseña" style="width: 230px; height: 30px">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <button type="button" id="ingresar_login"  height="25" width="240" style="background:white; border:none">
                                        <img src="images/entrar.png" style="height:25px; width:240px;">
                                    </button>

                                </div>
                            </div>
                        </div>
                </div> 
            </form>
        </div>

        </div>

        <div class="item-imagenD" style="align:right;" ><img src="images/derecha.png" width="350" height="400" style="margin-left: 20px"></div>
  </section>
 
     

</div>

</section>
    <!--<div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.html">
                        <img class="align-content" src="images/logo.png" alt="">
                    </a>
                </div>
                <div class="login-form">
                    <form class="needs-validation" method="POST" id="formulario_ingreso" novalidate>
                        <div class="form-group">
                            <label>Dirección de correo</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Password">
                        </div>
                        
                        <button type="button" id="ingresar_login" class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
                        
                        
                    </form>
                </div>
            </div>
        </div>
    </div>-->

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
