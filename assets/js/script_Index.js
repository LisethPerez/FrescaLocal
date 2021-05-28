//Función que solo permite el ingreso de números
function onlyNums(e) {
    const code = window.event ? e.which : e.ketCode;
    return !(code < 48 || code > 57);
}

//Función que solo permite el ingreso de letras
function onlyLetters(e) {
    const code = window.event ? e.which : e.ketCode;
    return code < 48 || code > 57;
}

//Metodo para capturar el valor del boton de la calculadora
$('.calcu').click(function () {
    var cant = $('#cantidad').val();
    $('#cantidad').focus();
    $('#cantidad').val(cant + $(this).val());
});
   

//Eliminar el último valor del input de cantidad
$('#seleEli').click(function () {
    var cadena = $('#cantidad').val();
    cadena = cadena.substring(0, cadena.length - 1);
    $('#cantidad').val(cadena);
     
});

//Encontrar cedula del cliente por medio al preciosar shift
$('#cedula').keydown(function(f){
    var cedula = $('#cedula').val();
    if(f.shiftKey==1){
        if(cedula === ''){
            Swal.fire({
                icon: 'error',
                text: 'Ingrese el número de cedula a buscar',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                },
                showConfirmButton: false,
                timer: 2000
            });     
        }else{
            $.ajax({
                type: "POST",
                url: "encontrar_cedula.php",
                data: $('#formulario').serialize(),
                success: function(data) {
                                    
                    if (data === "No existe ese registro"){
                        //$('#cedula').val('');
                        $('#resultado').html('');
                        Swal.fire({
                            icon: 'error',
                            text: 'No existen registros con la búsqueda',
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            },
                            showConfirmButton: false,
                            timer: 2000
                        });     
                        $('#ingresar').prop('disabled', false);
                        $('#documento').val($('#cedula').val());
                        $('#confi').prop('disabled', true);
                    }else{
                        $('#resultado').html(data);  
                        $('#confi').prop('disabled', false);
                    }
                }
            });
        }
    }
});

//Buscar cedula para la existencia del cliente (botón)
$('#buscar1').click(function () {
    var cedula = $('#cedula').val();

    if(cedula === ''){
        Swal.fire({
            icon: 'error',
            text: 'Por favor ingrese la cedula',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            showConfirmButton: false,
            timer: 2000
        });     
    }else{
        $.ajax({
            type: "POST",
            url: "encontrar_cedula.php",
            data: $('#formulario').serialize(),
            success: function(data) {
    
                if (data === "No existe ese registro"){
                    //$('#cedula').val();
                    $('#resultado').html('');
                    Swal.fire({
                        icon: 'error',
                        text: 'No existen registros con la búsqueda',
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        },
                        showConfirmButton: false,
                        timer: 2000
                    });     
                    $('#ingresar').prop('disabled', false);
                    $('#documento').val($('#cedula').val());
                    $('#confi').prop('disabled', true);
                }else{              
                    $('#resultado').html(data);
                    $('#confi').prop('disabled', false);
                }
            }
        });
    }
     
});

var cedula_cliente;
var tipo_cliente=0;
//Obtener el tipo de cliente según la cedula ingresada
$('#confi').click(function () {
    cedula_cliente = $('#cedula1').val();
    $('#nom_clie').text(" -------- Cliente: " +$('#cedula2').val());
    //alert($('#cedula2').val());
    $.ajax({
        type: "POST",
        url: "obtener_tipo.php?var="+cedula_cliente,
        data: $('#formulario').serialize(),
        success: function(data) {          
            tipo_cliente = data;  
            document.getElementById("cerrar").click();         
        }
    });
});

//Buscar datos de clientes para su modificacion
/*$('#buscar3').click(function () {
    $.ajax({
        type: "POST",
        //url: "buscar_cliente.php?var='"+ valor+ "'",
        url: 'buscar_cliente.php?var='+ valor,
        data: $('#formularioCliente').serialize(),
        success: function(data) {
            if(data === "No existen registros"){
                Swal.fire({
                    icon: 'error',
                    text: 'No existen registros con la búsqueda',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                });     
            }else{
                var contenido = document.getElementById("conte_tabla");
                contenido.innerHTML = "";
                var datosEnco = JSON.parse(data);
                createRow1(datosEnco);
                $('#inlineRadio1').val('');
                $('#inlineRadio2').val('');
                
            }
            //alert(data);
            //$('#tabla').html(data);
            
        }
    });
     
});*/
//Agregar contenido del array del cliente a la tabla 
function createRow1(data) {                              //dynamically adding rows to the Table
    //design this according to your requirement    
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td>`+data[i].id+`</td>
    <td>`+data[i].nombre+`</td>
    <td>`+data[i].empresa+`</td>
    <td>`+data[i].direccion+`</td>
    <td>`+data[i].telefono+`</td>
    <td>`+data[i].correo+`</td>  
    <td>`+data[i].documento+`</td>
    <td>`+data[i].nit+`</td>    
    <td>`+data[i].fecha+`</td>    
    <td>`+data[i].opcion+`</td>    
    </tr>`;
    $('#conte_tabla').append(trElement);
    
    }  

}

//Metodo pata borrar datos del formulario de ingreso de cliente
function clearCliente(){
    $("#nombre").val('');
    $("#documento").val('');
    $("#telefono").val('');
    $("#direccion").val('');
    $("#correo").val('');
    $("#empresa").val('');
    $("#nit").val('');
    $("#nit1").val('');
}

//Metodo para el ingreso de los datos del formulario de cliente 
$('.nuevoCli').keypress(function (e) {   
    var tipo_cle = $('#tipo_cliente option:selected').val();
    var nombre = $('#nombre').val();
    var documento= $('#documento').val();
    var telefono= $('#telefono').val();
    var dirección = $('#direccion').val();
    var correo = $('#correo').val();
    var empresa = $('#empresa').val();
    var nit = $('#nit').val(); 
    var nit1 = $('#nit1').val(); 

    if(e.which == 13) {
        if(tipo_cle === '' || nombre===''||  documento===''){
            Swal.fire({
                icon: 'error',
                text: 'Por favor ingrese los datos marcados con *',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });     
        }else{
            $.ajax({
                type: "POST",
                url: "registrar_cliente.php?var="+tipo_cle,
                data: $("#form_cliente").serialize(),
                success: function(data) {
                    //alert(data);
                    if(data==='Datos ingresados'){
                        Swal.fire({
                            icon: 'success',
                            text: "Datos ingresados",
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            },
                            showConfirmButton: false,
                            timer: 2000
                        }); 
                        $('#cedula').val($('#documento').val());    
                        clearCliente(); 
                        document.getElementById("ocu").click();
    
                    }else{
                        alert(data);
                    }
                    
                    
                }
            });
        }
    }
});

//Método para el ingreso a la aplicación por medio del login
$('#ingresar_login').click(function () {   
    var correo = $('#email').val();
    var password = $('#password').val();

    if(correo==='' || password===''){
        Swal.fire({
            icon: 'error',
            text: 'Por favor ingrese los datos',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            showConfirmButton: false,
            timer: 2000
        });     
    }else{
    $.ajax({
        type: "POST",
        url: "../login.php",
        data: $("#formulario_ingreso").serialize(),
        success: function(data) {  
            
            if(data === "Datos correctos"){
                window.location.href="../index.php";
                
            }else{
                Swal.fire({
                    icon: 'error',
                    text: data,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                });  
                $('#email').val('');
                $('#password').val(''); 
            }
        }
    });
    }
});

//Obtener el id de la fatura de la tabla para ver los detalles 
var id_factu;
$('.view_products').click(function () {
    $tr=$(this).closest('tr');
    var datos = $tr.children("td").map(function (){
        return $(this).text();
    });
    id_factu = datos[0];
    //alert(datos[0]);
    $.ajax({
        url: "../detalle_productos.php?var="+id_factu,
        type: "POST",
        success: function(data){
            //alert(JSON.parse(data));
            var produ = document.getElementById("cont_productos");
            produ.innerHTML = "";
            var datosPro = JSON.parse(data);
            createRow2(datosPro);       
        }
    });    
 });

 //Ver los productos de la factura especificada
 $('.view_products1').click(function () {
    $tr=$(this).closest('tr');
    var datos = $tr.children("td").map(function (){
        return $(this).text();
    });
    id_factu = datos[0];
    //alert(datos[0]);
    $.ajax({
        url: "../detalle_productos1.php?var="+id_factu,
        type: "POST",
        success: function(data){
            //alert(JSON.parse(data));
            var produ = document.getElementById("cont_productos");
            produ.innerHTML = "";
            var datosPro = JSON.parse(data);
            createRow5(datosPro);       
        }
    });    
 });

 //Mostrar los productos que vienen del array de detalle
 function createRow5(data) {                              //dynamically adding rows to the Table
    //design this according to your requirement    
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td>`+data[i].cantidad+`</td>
    <td>`+data[i].producto+`</td>
    <td>`+data[i].precio_venta+`</td>
    <td>`+data[i].precio_total+`</td>
    <td>`+data[i].descuento+`</td>
    <td>`+data[i].impuesto+`</td>
    <td>`+data[i].fecha+`</td>  
    <td>`+data[i].empleado+`</td>
    <td style="display:none">`+data[i].idDetalle+`</td>   
    <td>`+data[i].opcion+`</td> 
    </tr>`;
    $('#cont_productos').append(trElement);  
    }  

}

//Mostrar datos de la factura especificada
 function createRow2(data) {                              //dynamically adding rows to the Table
    //design this according to your requirement    
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td>`+data[i].cantidad+`</td>
    <td>`+data[i].producto+`</td>
    <td>`+data[i].precio_venta+`</td>
    <td>`+data[i].precio_total+`</td>
    <td>`+data[i].descuento+`</td>
    <td>`+data[i].impuesto+`</td>
    <td>`+data[i].fecha+`</td>  
    <td>`+data[i].empleado+`</td>
    </tr>`;
    $('#cont_productos').append(trElement);  
    }  

}

//Buscar factura por el número de factura

//Borrar contenido del modal de productos
$('.atras').click(function(){  
    var contenidoFac = document.getElementById("cont_productos");
    contenidoFac.innerHTML = "";
});

var tipo_;
var id_;
//Editar información de las facturas que son generadas por domicilios
$('.editarDomi').click(function(){
    $tr=$(this).closest('tr');
    var datos = $tr.children("td").map(function (){
        return $(this).text();
    });
    id_= datos[0];
    var total = datos[1];
    tipo_ = datos[4];
    var sipaga = datos[9];
    referencia_pago = datos[10];

    var chain = String(total.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    total = "$ " + newValue;

    $.ajax({
        url: "../detalle_factura.php",
        type: "POST",
        data:{var: id_, var2: sipaga, var3: referencia_pago, var4: tipo_, var5: total},
        success: function(data){
            var contenido = document.getElementById("cambiosFact");
            contenido.innerHTML = "";
            $('#cambiosFact').html(data);      
        }
    });

});

//Mostrar el total de ventas presenciales
$('.presen').click(function(){
    $('.presen').removeClass("btn-success");
    $(this).addClass("btn-success");
    var presen= $(this).val();
    $.ajax({
        url: "../ventas_presenciales.php",
        type: "POST",
        data:{var: presen},
        success: function(data){
            //alert(data);
            $('#ventas_pre').html(data);
        }
    });
});

//Mostrar el total de ventas web
$('.webb').click(function(){
    $('.webb').removeClass("btn-success");
    $(this).addClass("btn-success");
    
    var web= $(this).val();
    $.ajax({
        url: "../ventas_web.php",
        type: "POST",
        data:{var: web},
        success: function(data){
            //alert(data);
            $('#ventas_web').html(data);
        }
    });
});

var totalCaja = 0;
//var tota;
//Colocar el valor de la base monetaria en caja
$('#baseMo').keyup(function (e) {
    var myVar = setInterval(myTimer2, 1000);
});    

//Función para obtener el valor total de la caja
function myTimer2() {
    var totalBase = parseInt($('#baseMo').val().replace(/[^a-zA-Z0-9]/g, '')); 
    var tota = parseInt($('#totalEfe').val().replace(/[^a-zA-Z0-9]/g, '')); 
    var egresos = parseInt($('#totalEgr').val().replace(/[^a-zA-Z0-9]/g, '')); 
    //alert(tota);
    $('#dineCaja').val((totalBase+tota)-egresos);
   

    var total2 = $('#dineCaja').val();
    var chain = String(total2.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#dineCaja').val("$ " + newValue);
}

//Enviar datos de cierre de caja a la base de datos
$('#cerrar').click(function(){
    var ingresosEfe = parseInt($('#totalEfe').val().replace(/[^a-zA-Z0-9]/g, ''));
    var ingresosEle = parseInt($('#totalTarj').val().replace(/[^a-zA-Z0-9]/g, ''));
    var egresos = parseInt($('#totalEgr').val().replace(/[^a-zA-Z0-9]/g, ''));
    
    if($('#baseMo').val() === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese la base monetaria',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        });  
    
    }else{
        var base = parseInt($('#baseMo').val().replace(/[^a-zA-Z0-9]/g, ''));
        //alert("Todo bien");
        $.ajax({
            url: "../cerrar_caja.php",
            type: "POST",
            data:{var: base, var2:ingresosEfe, var3:ingresosEle, var4: egresos},
            success: function(data){
                //alert(data);
                if(data==="Caja correcta"){
                    Swal.fire({
                        icon: 'success',
                        text: 'Cierre de caja exitoso',
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });  
                    $('#baseMo').val(0);
                    $('#totalEfe').val(0);
                    $('#totalTarj').val(0);
                    $('#totalEgr').val(0);
                    $('#dineCaja').val(0);

                }else if(data==="Ha ocurrido un error"){
                    Swal.fire({
                        icon: 'error',
                        text: 'Ha ocurrido un error',
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });  
                }
                        
            }
        });
    }
});

//Ingreso a aplicación por medio del enter
$('.form-control-user').keypress(function (e) {

    var correo = $('#email').val();
    var password = $('#password').val();

    if(e.which == 13) {
        if(correo==='' || password===''){
            Swal.fire({
                icon: 'error',
                text: 'Por favor ingrese los datos',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                },
                showConfirmButton: false,
                timer: 2000
            });     
        }else{
        $.ajax({
            type: "POST",
            url: "../login.php",
            data: $("#formulario_ingreso").serialize(),
            success: function(data) {  
                
                if(data === "Datos correctos"){
                    window.location.href="../index.php";
                    
                }else{
                    Swal.fire({
                        icon: 'error',
                        text: data,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        },
                        showConfirmButton: false,
                        timer: 2000
                    });  
                    $('#email').val('');
                    $('#password').val(''); 
                }
            }
        });
        }
    }
});

//Modificación del estado pendiente de las facturas
$('#modificar').click(function(){
    var paga = $('#pagaa option:selected').val();
    var tipo = $('#tipoo option:selected').val();
    var tipo2 = $('#tipoo option:selected').text();
   

    if(tipo2==="Efectivo"){
        refe = $('#valor_ingresado').val();

    }else{
         refe = $('#ref').val();
    }

    if(refe === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese el dato marcado con *',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            showConfirmButton: false,
            timer: 2000
        });
    }else{
        $.ajax({
            url: "../modificar_factura.php",
            type: "POST",
            data:{var: paga, var2: tipo, var3: refe, var4: id_},
            success: function(data){
             
               if(data==="Modificación de estado de la factura correcta"){
                Swal.fire({
                    icon: 'success',
                    text: 'Modificación correcta',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                });  
                window.location.href="view_facturas_pendientes.php"; 
               }else{
                Swal.fire({
                    icon: 'error',
                    text: 'Ha ocurrido un error',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                }); 
               }
            }
        });
    }

});

$('#modificar1').click(function(){
    var paga = $('#pagaa option:selected').val();
    var tipo = $('#tipoo option:selected').val();
    var tipo2 = $('#tipoo option:selected').text();
   

    if(tipo2==="Efectivo"){
        refe = $('#valor_ingresado').val();

    }else{
         refe = $('#ref').val();
    }

    if(refe === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese el dato marcado con *',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            showConfirmButton: false,
            timer: 2000
        });
    }else{
        $.ajax({
            url: "../modificar_factura.php",
            type: "POST",
            data:{var: paga, var2: tipo, var3: refe, var4: id_},
            success: function(data){
             
               if(data==="Modificación de estado de la factura correcta"){
                Swal.fire({
                    icon: 'success',
                    text: 'Modificación correcta',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                });  
                window.location.href="view_facturas_restaurante.php"; 
               }else{
                Swal.fire({
                    icon: 'error',
                    text: 'Ha ocurrido un error',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                }); 
               }
            }
        });
    }

});

$('#modificar2').click(function(){
    var paga = $('#pagaa option:selected').val();
    var tipo = $('#tipoo option:selected').val();
    var tipo2 = $('#tipoo option:selected').text();
   

    if(tipo2==="Efectivo"){
        refe = $('#valor_ingresado').val();

    }else{
         refe = $('#ref').val();
    }

    if(refe === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese el dato marcado con *',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            showConfirmButton: false,
            timer: 2000
        });
    }else{
        $.ajax({
            url: "../modificar_factura.php",
            type: "POST",
            data:{var: paga, var2: tipo, var3: refe, var4: id_},
            success: function(data){
             
               if(data==="Modificación de estado de la factura correcta"){
                Swal.fire({
                    icon: 'success',
                    text: 'Modificación correcta',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                });  
                window.location.href="view_facturas_web.php"; 
               }else{
                Swal.fire({
                    icon: 'error',
                    text: 'Ha ocurrido un error',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    },
                    showConfirmButton: false,
                    timer: 2000
                }); 
               }
            }
        });
    }

});



//Agregar los datos de la fila seleccionada el formulario
$('.editbtn').click(function () {
    $tr=$(this).closest('tr');
    var datos = $tr.children("td").map(function (){
        return $(this).text();
    });
    $('#update_id').val(datos[0]);
    $('#nombre1').val(datos[1]);
    $('#empresa1').val(datos[2]);
    $('#direccion1').val(datos[3]);
    $('#telefono1').val(datos[4]);
    $('#correo1').val(datos[5]); 
    $('#documento1').val(datos[6]);
    $('#nit2').val(datos[7]);
    $('#nit3').val(datos[8]);
 });

 var tipo_domi;

//Cambiar clase de los botones según la selección
$('.groupTipo').click(function(){
    $('.groupTipo').removeClass("btn-primary");
    $(this).addClass("btn-primary");

    tipo_domi = $(this).val();
    if(tipo_domi === "Presencial" || tipo_domi==="Restaurante"){
        $('.pago').show();
    }else{
        $('.pago').hide();
    }
});

var emple;
//Cambiar informacion según la opción de compra
$('#domiciliario').click(function(){
    emple = $('#domi').val();
    $('.pago').show();
});

var pago;
var referencia;
//Esconder div de método de pago en efectivo
 $('.groupPago').click(function () {
    $('.groupPago').removeClass("btn-success");
    $(this).addClass("btn-success");

    pago = $(this).val();
    if(tipo_domi === "Presencial"){
        if(pago === "Efectivo"){
            $('#efectivo').show();
            $('#credito').hide();
            $('#debito').hide();
            $('#links').hide();
    
        }
        if(pago === "Tarjeta débito"){
            $('#efectivo').hide();
            $('#credito').hide();
            $('#links').hide();
    
            Swal.fire({
                title: '¿Se aprobó la transacción?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: ' #25A01B',
                cancelButtonColor: '#d33',
                confirmButtonText: '¡OK!'
              }).then((result) => {
                if (result.isConfirmed) {
                    $('#debito').show();
                    const value = $('#total').val();
                    var chain = String(value.replace(/\D/g, ""));
                    const newValue = new Intl.NumberFormat('en-US').format(chain);
                    $('#total_venDe').val("$ " + newValue);
    
                } else if (
                    result.dismiss === Swal.DismissReason.cancel
                  ) {
                    $('#debito').hide();
                  }
              })
        }
        if(pago === "Tarjeta crédito"){
            $('#efectivo').hide();
            $('#debito').hide();
            $('#links').hide();
            Swal.fire({
                title: '¿Se realizó la transacción?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: ' #25A01B',
                cancelButtonColor: '#d33',
                confirmButtonText: '¡OK!'
              }).then((result) => {
                if (result.isConfirmed) {
                    $('#credito').show();
                    const value = $('#total').val();
                    var chain = String(value.replace(/\D/g, ""));
                    const newValue = new Intl.NumberFormat('en-US').format(chain);
                    $('#total_venCre').val("$ " + newValue);
     
                } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel
                  ) {
                    $('#credito').hide();   
                  }
              })    
        }
        if(pago === "Link de pago"){
            $('#efectivo').hide();
            $('#debito').hide();
            $('#credito').hide();
            Swal.fire({
                title: '¿Se realizó la transacción?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: ' #25A01B',
                cancelButtonColor: '#d33',
                confirmButtonText: '¡OK!'
              }).then((result) => {
                if (result.isConfirmed) {
                    $('#credito').show();
                    const value = $('#total').val();
                    var chain = String(value.replace(/\D/g, ""));
                    const newValue = new Intl.NumberFormat('en-US').format(chain);
                    $('#total_venCre').val("$ " + newValue);
     
                } else if (
                    /* Read more about handling dismissals below */
                    result.dismiss === Swal.DismissReason.cancel
                  ) {
                    $('#links').hide();   
                  }
              })    
        }

    }else if(tipo_domi === "Domicilios"){
        $('#efectivo').hide();
        $('#credito').hide();
        $('#debito').hide();
        $('#links').hide();

    }
    
 });

 //Colocar signo de $ y comas 
 $('#valor_ingre').on('keyup', () => {
    const value = $('#valor_ingre').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#valor_ingre').val("$ " + newValue);

});

 //Colocar signo de $ y comas 
$('#baseMo').on('keyup', () => {
    const value = $('#baseMo').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#baseMo').val("$ " + newValue);

});

 //Colocar signo de $ y comas 
$('#prueba').click(function(){
    const value = $('#total').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#total_web').val("$ " + newValue);
});

//Bloquear opción para editar
$('#total_web').keydown(function(e){
    e.preventDefault();
    try {                
        if ((e.keyCode == 8 || e.keyCode == 46))
            return false;
        else
            return true;  
                   
    }
    catch (Exception)
    {
        return false;
    }

});
var nombre_producto;
var tipo;
var nombre_producto1;
var tipo1;


//Método que ejecuta las sentencias guardadas en el archivo de texto
function verificarConexion(){
    $.ajax({
        url: "sincronizacion/comprobarConexionBD.php",
        type: "POST",
        success: function(data){
           if(data === 'Esta conectado'){
                //alert("Esta conectado");
                $.ajax({
                    url: "sincronizacion/verificarContBD.php",
                    type: "POST",
                    success: function(data){
                        if(data==='El archivo tiene contenido'){
                            Swal.fire({
                                icon: 'warning',
                                title: 'Espere un momento mientras se realizar la sincronización y se evidencia el mensaja de éxito',
                                showConfirmButton: false,
                                timer: 100000
                              });
                            $.ajax({
                                url: "sincronizacion/ejecutarBD.php",
                                type: "POST",
                                success: function(data){
                                    //alert(data);
                                    if(data==='Sentencias ejecutadas'){
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Sincronización correcta',
                                            showConfirmButton: false,
                                            timer: 2000
                                          });
                                          var myVar = setInterval(myTimer, 2000);

                                    }
                                }
                            });
                        }else{
                            Swal.fire({
                                icon: 'success',
                                title: 'No hay sentencias pendientes a sincronizar',
                                showConfirmButton: false,
                                timer: 2000
                              });
                              var myVar = setInterval(myTimer, 2000);
                        }
                    }
                });

                /**/
           }else{
                Swal.fire({
                    icon: 'error',
                    title: 'Por el momento no tiene acceso al servidor. Por favor intente más tarde',
                    showConfirmButton: false,
                    timer: 2000
                }); 
                var myVar = setInterval(myTimer, 2000);
           }
        }

    });
}
function myTimer() {
    window.location.href="index.php"; 
}

//Función para la sincronización de bases de datos
$('#sincro').click(function(){   
    //Desahilitar acciones 
    $('.selec').prop("disabled",true);
    $('.calcu').prop("disabled",true);
    $('#cli').prop("disabled",true);
    $('#realizar_pago').prop("disabled",true);
    $('#prueba').prop("disabled",true);
    $('#producto1').prop("disabled",true);

    //Empezar sincronización
      $.ajax({
        url: "sincronizacion/comprobarConexionBD.php",
        type: "POST",
        success: function(data){
            if(data === 'Esta conectado'){
                Swal.fire({
                    icon: 'warning',
                    title: 'Por favor espere mientras se realiza la sincronización y se evidencie el mensaje de exito',
                    showConfirmButton: false,
                    timer: 100000
                  });
                  $.ajax({
                    url: "exportar.php",
                    type: "POST",
                    success: function(data){
                        if(data ==='Importación realizada de forma correcta'){
                            //alert("Exportación hecha de la base de datos general");
                            $.ajax({
                                url: "importar.php",
                                type: "POST",
                                success: function(data){
                                    //alert(data);                     
                                }
            
                            });
                        }else{
                            alert("Error en la exportanción de la base de datos general");
                        }
                    }
                });
            
                $.ajax({
                    url: "exportar2.php",
                    type: "POST",
                    success: function(data){
                        if(data ==='Importación realizada de forma correcta'){
                            //alert("Exportación hecha de la base de datos de fresca");
                            $.ajax({
                                url: "importar2.php",
                                type: "POST",
                                success: function(data){
                                    //alert(data);
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Sincronización exitosa',
                                        showConfirmButton: false,
                                        timer: 1500
                                      });
                                    var myVar = setInterval(myTimer, 1500);  
                                }
            
                            });
                        }else{
                            alert("Error en la exportanción de la base de datos de fresca");
                        }
                    }
                });       
            }else{
                Swal.fire({
                    icon: 'error',
                    title: data,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }         
                  });
            }
        }
    });  

});//setInterval('verificarConexion()',5000);
//Esconder formulario de busqueda
$(document).ready(function(){
    
    //setInterval('actualizacion()',12000);

    //$('#menuToggle').trigger('click')
    document.getElementById("menuToggle").click();
    //Esconder formulario de busqueda 
    //Esconder duv de metodo de pago efectivo
    $('#efectivo').hide();
    $('#credito').hide();
    $('#debito').hide();
    $('#total').val(0);
    $('.pago').hide();
    $('#links').hide();

    $('#producto').focus();

     //Autocompletar de productos
    $('#producto').typeahead({
        source: function(query,result){
            $.ajax({
                url:"get_var.php",
                method:"POST",
                data:{query:query},
                dataType:"json",
                success:function(data){
                    result($.map(data,function(item){
                        return item;
                    }));
                    
                }
            });
        },
        updater : function(item) {
            this.$element[0].value = item;
            nombre_producto = item;
            $.ajax({
                url:"get_image.php?var="+item,
                method:"POST",    
                success:function(data){
                    //alert(data);   
                    $('#productos').html(data);        
                }
            });

            $.ajax({
                url:"ocultar.php?var="+nombre_producto,
                method:"POST",    
                success:function(data){ 
                     tipo = data;   
                     //alert(data);
                     if(tipo==="cantidad"){
                        $('#cantidad').focus();
                        $("#pesooo").val('');
                    }
                    if(tipo==="peso"){
                        $('#pesooo').focus();
                        $("#cantidad").val('');
                       
                    }        
                }
            });
            
            return item;    
        }
    });

    //Autocompletado para el cambio de productos
    $('#producto2').typeahead({
        source: function(query,result){
            $.ajax({
                url:"../get_var.php",
                method:"POST",
                data:{query:query},
                dataType:"json",
                success:function(data){
                    result($.map(data,function(item){
                        return item;
                    }));
                    
                }
            });
        },
        updater : function(item) {
            this.$element[0].value = item;
            nombre_producto1 = item;
            
            $.ajax({
                url:"../ocultar.php?var="+nombre_producto1,
                method:"POST",    
                success:function(data){ 
                     tipo1 = data;   
                     //alert(tipo);
                     if(tipo1==="cantidad"){
                        $('#cantidad2').focus();
                        $("#pesooo2").val('');
                    }
                    if(tipo1==="peso"){
                        $('#pesooo2').focus();
                        $("#cantidad2").val('');
                       
                    }        
                }
            });
            
            return item;    
        }
    });

    //Autocompletado para el nombre de empleados
    $('#domi').typeahead({
        source: function(query,result){
            $.ajax({
                url:"get_empleado.php",
                method:"POST",
                data:{query:query},
                dataType:"json",
                success:function(data){
                    result($.map(data,function(item){
                        return item;
                    }));
                    
                }
            });
        },
        updater : function(item) {
            this.$element[0].value = item;
            nombre_producto = item;
            $.ajax({
                url:"get_image.php?var="+item,
                method:"POST",    
                success:function(data){
                    //alert(data);   
                    $('#productos').html(data);        
                }
            });

            return item;    
        }
    });
    //Obtener el total de ingresos diarios 
    $.ajax({
        url: "../egresos.php",
        type: "POST",
        success: function(data){
            //alert(data);
            $('#totalEg').val(data);
            //tota = parseInt(data);
            var chain = String(data.replace(/\D/g, ""));
            const newValue = new Intl.NumberFormat('en-US').format(chain);
            $('#totalEgr').val("$ " + newValue);        
        }
    }); 
    //Ontener el total de ventas en efectivo del día
    $.ajax({
        url: "../ventas_efe.php",
        type: "POST",
        success: function(data){
            //alert(data);
            $('#totalEfec').val(data);
            //tota = parseInt(data);
            var chain = String(data.replace(/\D/g, ""));
            const newValue = new Intl.NumberFormat('en-US').format(chain);
            $('#totalEfe').val("$ " + newValue);          
        }
    }); 
    //Obtener el total de ventas por tarjetas del dia
    $.ajax({
        url: "../ventas_tarjetas.php",
        type: "POST",
        success: function(data){
            //alert(data);
            $('#totalTar').val(data);
            //tota = parseInt(data);
            var chain = String(data.replace(/\D/g, ""));
            const newValue = new Intl.NumberFormat('en-US').format(chain);
            $('#totalTarj').val("$ " + newValue);         
        }
    }); 
    //Obtener el total de ventas electronicas del día 
    $.ajax({
        url: "../ventas_ele.php",
        type: "POST",
        success: function(data){
            //alert(data);
            $('#totalEle').val(data);
            //tota = parseInt(data);
            var chain = String(data.replace(/\D/g, ""));
            const newValue = new Intl.NumberFormat('en-US').format(chain);
            $('#totalElec').val("$ " + newValue);          
        }
    }); 
    /*var f = new Date();
    $('#fechaAc').val(f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear());*/

});

//Método para encontrar producto por EAN 
$('#producto1').keypress(function (f) {
    tipo = "";
    var produ = $('#producto1').val();
    if(f.which == 13){
        $("#pesooo").val('');
        $("#peso2").val('');
        
        $.ajax({
            type: "POST",
            url: "encontrar_ean.php?var="+produ,
            success: function(data) {
                //alert(data);
                nombre_producto = data;
            }
        });

        $.ajax({
            url:"ocultar2.php?var="+produ,
            method:"POST", 
            success:function(data){
                 tipo = data;   
                 $("#pesooo").val('');
                 $("#peso2").val('');      
                 if(tipo==="cantidad"){
                    $('#cantidad').focus();
                    $("#pesooo").val('');
                }
                if(tipo==="peso"){
                    $('#pesooo').focus();
                    $("#cantidad").val('');
                    
                }      
            }
        }); 
       
    }
});

//Buscar el producto por medio de su EAN
$('#producto3').keypress(function (f) {
    tipo1 = "";
    var produ1 = $('#producto3').val();
    if(f.which == 13){
        $("#pesooo2").val('');
        $("#peso3").val('');
        
        $.ajax({
            type: "POST",
            url: "encontrar_ean.php?var="+produ1,
            success: function(data) {
               // alert(data);
                nombre_producto1 = data;
            }
        });

        $.ajax({
            url:"ocultar2.php?var="+produ1,
            method:"POST", 
            success:function(data){
               // alert(data);
                 tipo1 = data;   
                 $("#pesooo").val('');
                 $("#peso2").val('');      
                 if(tipo1==="cantidad"){
                    $('#cantidad2').focus();
                    $("#pesooo2").val('');
                }
                if(tipo1==="peso"){
                    $('#pesooo2').focus();
                    $("#cantidad2").val('');
                    
                }      
            }
        }); 
       
    }
});
//Desabilitar editar y eliminación del datos dentro del input
//keydown
//Bloquear opciones de edición al peso
/*$('#pesooo').keypress(function (evt) {
    //evt.preventDefault();
    if(evt.keyCode==110 || evt.keyCode > 48 && evt.keyCode < 57){
        return true;
    }
    else{
        return false;
    }
    /*try {                
        if ((evt.keyCode == 8 || evt.keyCode == 46))
            return false;
        else
            return true;  
                   
    }
    catch (Exception)
    {
        return false;
    }
})*/

//Bloquear opciones de edición en el total de ventas credito
$('#total_venCre').keypress(function (evt) {
    evt.preventDefault();
    try {                
        if ((e.keyCode == 8 || e.keyCode == 46))
            return false;
        else
            return true;               
    }
    catch (Exception)
    {
        return false;
    }
});

//Bloquear opciones de edición en el total de ventas debito
$('#total_venDe').keypress(function (evt) {
    evt.preventDefault();
    try {                
        if ((e.keyCode == 8 || e.keyCode == 46))
            return false;
        else
            return true;               
    }
    catch (Exception)
    {
        return false;
    }
});

//Capturar el peso de forma actomática cuando se situe el cursos dentro del input
$("#pesooo").focus(function(e) {
    /*$('#pesooo').val(0.93);    
    $('#peso2').val(0.93);*/
    $.ajax({     
        url: "lectura.php",
        success: function(data) {
            var valor = data.substring(0,6);
             if(valor==='<br />'){
                
                //$('#producto1').focus();
                $('#pesooo').val("Digite el peso");
                //$('#peso2').val('');
             }else{
                 //alert("Se cargará automaticamente");
                $('#pesooo').val(data);
                $('#peso2').val(data);
             }
        }
    }); 
}); 

//Solo se permiten números decimales en el input pesooo
function isNumberKey(evt)
{
  var charCode = (evt.which) ? evt.which : evt.keyCode;
  if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
    return false;

  return true;
}

//Límite de decimales en el input de pesooo
function limitDecimalPlaces(e, count) {
    if (e.target.value.indexOf('.') == -1) { return; }
    if ((e.target.value.length - e.target.value.indexOf('.')) > count) {
      e.target.value = parseFloat(e.target.value).toFixed(count);
    }
  }

$("#pesooo2").focus(function(e) {
    /*$('#pesooo2').val(0.9);    
    $('#peso3').val(0.9);*/

    $.ajax({     
        url: "../lectura.php",
        success: function(data) {
            var valor = data.substring(0,6);
             if(valor==='<br />'){
                
                //$('#producto1').focus();
                $('#pesooo2').val("Digite el peso");
             }else{
                 //alert("Se cargará automaticamente");
                $('#pesooo2').val(data);
                $('#peso3').val(data);
             }
        }
    });
});   


var datos = [];
var DataArray = [];
var total=0;
var cant;
var cont = 0;
var idStock = 0;
//var descuento = 0, impuesto = 0;
//Enviar datos por con enter
$('.selec').keypress(function (e) {
    var producto = $('#producto').val();
    var cantidad = $('#cantidad').val();
    var peso = $('#peso2').val();
    var peso1 = $('#pesooo').val();
    var codigo = $('#producto1').val();

    if(e.which == 13) {

        if(peso === '' && peso1!='Digite el peso'){
            $('#peso2').val(peso1);
            peso = $('#pesooo').val();
        }
        
        if(tipo==="cantidad" && cantidad===''){  
            $('#cantidad').focus();      
            Swal.fire({
                icon: 'error',
                text: 'Por favor ingrese la cantidad',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                } 
            });     
            $('#peso2').val('');  
            $('#pesooo').val(''); 
        }else if(tipo==="peso" && peso===''){
            $('#pesooo').focus(); 
            Swal.fire({
                icon: 'error',
                text: 'Por favor ingrese el peso',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });         
            $('#cantidad').val('');
        }else{
            if(tipo_cliente===0){
                Swal.fire({
                    icon: 'error',
                    text: 'Por favor ingrese cliente',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                });     
            }else{ 

                if(tipo==="cantidad"){
                    $('#peso2').val('');
                    $('#pesooo').val('');
                    $('#cantidad').focus();
                }else{
                    $('#cantidad').val('');
                    //$('#pesooo').focus();
                }

                if(peso === ''){
                    cant = cantidad;
                }
                if(cantidad === ''){
                    cant = peso;
                }

                
                //Verificar la disponibilidad del producto seleccionado 
                $.ajax({
                    type: "POST",
                    url: "disponibilidad.php?var="+nombre_producto,
                    data:{var2: cant},
                    success: function(data) {
                        //alert(data);

                        if(data==="Excede la disponibilidad del producto" || data==="No se encuentra disponibilidad del producto" || data === "El producto no se encuentra en stock" || data ==="El producto no existe"){
                            Swal.fire({
                                icon: 'error',
                                text: data,
                                showClass: {
                                    popup: 'animate__animated animate__fadeInDown'
                                },
                                hideClass: {
                                    popup: 'animate__animated animate__fadeOutUp'
                                }
                            }); 
                            $('#peso2').val('');   
                        }else{
                            //Mostrar mensaje de alerta de pocas unidades
                            $.ajax({
                                type: "POST",
                                url: "mensaje.php?var="+cant,
                                data: $("#venta").serialize(),
                                success: function(data) {
                                    //alert(data);
                                    if(data==="Hay pocas unidades del producto"){
                                        Swal.fire({
                                            icon: 'warning',
                                            position: 'top',
                                            title: data,
                                            showConfirmButton: false,
                                            timer: 1000
                                          });
                                    }
                                }
                            });
                            //Ingresar pruductos a la tabla de ventas
                            cont = cont + 1;
                             $.ajax({
                                    type: "POST",
                                    url: "ingresar_tabla.php?var="+tipo_cliente+"&var2="+cont,
                                    data: $("#venta").serialize(),
                                    success: function(data) {
                                       //alert(data);
                                        DataArray = JSON.parse(data);  
                                        //alert(JSON.stringify(DataArray));
                                         
                                        createRow(DataArray);
                                        deleteRow(datos);  
                                        //alert(JSON.stringify(DataArray));
                                        //Recorrer el array temporal para llenar el nuevo JSON
                                        $.each(DataArray, function(i, _data) {
                                            var id = _data.id;
                                            var codigo =  _data.codigo;
                                            //var cantidad =  parseInt( _data.cantidad);
                                            var cantidad =  parseFloat( _data.cantidad);
                                            var producto =  _data.producto;
                                            //var peso =  parseFloat(_data.peso);
                                            var precio = parseFloat(_data.precio);
                                            var impuesto =  parseInt(_data.impuesto);
                                            var descuento = parseInt(_data.descuento);
                                            var total = parseFloat(_data.total);
                                            
                                        
                                            /*datos.push({
                                                'id': id,
                                                'codigo': codigo,
                                                'cantidad': cantidad,
                                                'producto': producto,
                                                'peso': peso,
                                                'precio' : precio,
                                                'impuesto': impuesto,
                                                'descuento': descuento,
                                                'total' : total
                                            })*/
                                            datos.push({
                                                'id': id,
                                                'codigo': codigo,
                                                'cantidad': cantidad,
                                                'producto': producto,
                                                'precio' : precio,
                                                'impuesto': impuesto,
                                                'descuento': descuento,
                                                'total' : total
                                            })
                                    
                                        });
                                        //Suma de los total por productos seleccionados
                                        $.each(datos, function(i, _data) {
        
                                            total += parseFloat(_data.total);
                                        });
                                        
                                        $('#producto').val('');
                                        $('#cantidad').val('');
                                        $('#peso').val('');
                                        $('#peso2').val('');
                                        $('#producto1').val('');
                                        
                                        
                                        const newValue = new Intl.NumberFormat('en-US').format(total.toString());
                                        
                                        if(datos.length===0){
                                            $('#total').val('');
                                        }else{
                                            $('#total').val("$" + newValue);
                                        } 
                                        total = 0;
                                        //cont = 0;
                                    }   
                                   
                                });
                                //Sincronizar los nuevos productos con la eliminación y agregación
                                venta = datos;
                                $('#pesooo').val('');
                                $('#peso2').val('');
                                $('#producto').focus();
                        }
                    }
                    
                });               
            }       
        } //IF DE VALIDAR DATOS VACIOS
    }//IF DEL ENTER

});
var venta = [];

//Cambio de la caja del pago en efectivo
$('#valor_ingre').keypress(function (e) {
    var totaal = parseInt($('#total').val().replace(/[^a-zA-Z0-9]/g, ''));
    var valor_ingre = parseInt($('#valor_ingre').val().replace(/[^a-zA-Z0-9]/g, ''));
    if(e.which == 13) {
        if(valor_ingre<totaal){
            Swal.fire({
                icon: 'error',
                text: 'El valor ingresado debe ser mayor al total a pagar',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });  
            
        }else{
            var residuo = valor_ingre-totaal;
            const newValue = new Intl.NumberFormat('en-US').format(residuo.toString().replace(/\D/g, ""));
            $('#vueltas').val("$" + newValue);
        }
        
    }
});   

//Ingreso de JSON de los productos para descontarlos de stock y realizar la posterior venta
var id_factura;

//Realizar modificaciones de la facrtura y hacer el pago de la compra 
$('#pagar').click(function(){  
    //verificarConexion();
    $(this).prop("disabled",true);

    if($('#id_factCre').val()===''){
        referencia =  referencia = $('#id_factDe').val();
        $('#id_factDe').val('');
    }else{
        referencia =  referencia = $('#id_factCre').val();
        $('#id_factCre').val('')
    }
    //console.log(datos);
    
    $.ajax({
        type:"POST",
        url: "detalle_venta.php?cliente="+cedula_cliente,
        data: {var: venta},  
        success: function(data) {
            //alert(data);
            id_factura = data;
            Swal.fire({
                icon: 'success',
                title: 'Se esta generando la factura, ¡por favor espere un momento!',
                showConfirmButton: false,
                timer: 4000
              });
            $('#ggg').val(data);
            
            var cost = parseInt($('#valor_ingre').val().replace(/[^a-zA-Z0-9]/g, ''));
            var total = parseInt($('#total').val().replace(/[^a-zA-Z0-9]/g, ''));

            if(tipo_domi ==="Presencial"){
                if(pago==="Efectivo"){
                    $('#g2').val(cost);
                }else{
                    $('#g2').val(total);
                }
            }else{
                $('#g2').val(total);
            }
            
                $.ajax({
                type:"POST",
                url: "agregar_factura.php",
                data:{tipo_pago: pago, id:  id_factura, refe: referencia, var2: tipo_domi, var3: emple},
                //data:{tipo_pago: pago, id:  id_factura, refe: referencia},
                success: function(data) {
                    if(data==="No se hicieron cambios" || data==="No hay detalle de venta"){
                        Swal.fire({
                            icon: 'error',
                            text: data,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            }
                        });     
                    }else{
                        //verificarConexion();
                        document.getElementById("submitButton1").click();
                        var myVar = setInterval(myTimer, 1500);
                        //verificarConexion();
                    }
                }
                
            });
        
        }
    });
   
});

//Realizar descuento de la disponibilidad del producto (si se requiere)
$('#volver_stock').click(function(){
    var myVar = setInterval(myTimer, 200); 
});
  
//Descontar del inventario para pagos por las otras plataformas electrónicas
$('#descontar').click(function(){
    //alert(JSON.stringify(venta));
    var codigo = $('#codigo_inve').val();
    var tipo_pa = $('#tipoPa option:selected').val();
    var paga = $('#paga option:selected').val();
    var tipo_web = $('#tipo_web option:selected').text();
    if(codigo === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese número de factura',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            },
            showConfirmButton: false,
            timer: 2000
        });     

    }else{
        $.ajax({
            type:"POST",
            url: "volverStock2.php?codigo="+codigo,
            data: {var: venta, var3: cedula_cliente, var4: tipo_pa, var5: paga, var6: tipo_web},
            success: function(data) {
                //alert(data);
                //alert(data);
                if(data==="Cambios realizados"){
                    Swal.fire({
                        icon: 'success',
                        text: data,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });   
                    $('#codigo_inve').val('');  
                    window.location.href="index.php"; 
                }
                if(data ==="No se realizaron cambios"){
                    Swal.fire({
                        icon: 'error',
                        text: data,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });  
                    $('#codigo_inve').val('');    
                }
            }
        });
    }
});

//Buscardor en tiempo real para la búsqueda de facturas
$("#numberFac").keyup(function(){
    _this = this;
    $.each($("#taable tbody tr"), function() {
        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
           $(this).hide();
        else
           $(this).show();                
    });
}); 

//Buscardos en tiempo real para la búsqueda de facturas anuladas
$("#numberFac2").keyup(function(){
    _this = this;
    $.each($("#taaable tbody tr"), function() {
        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
           $(this).hide();
        else
           $(this).show();                
    });
}); 

//Buscador en tiempo real para la búsqueda de cliente
$("#num").keyup(function(){
    _this = this;
    // Muestra los tr que concuerdan con la busqueda, y oculta los demás.
    $.each($("#tabla tbody tr"), function() {
        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
           $(this).hide();
        else
           $(this).show();                
    });
}); 

var idFac;
//Acción para la generación de facturas en formato pdf

/*$('.impri').click(function(){
    /*$tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
    idFac = datos[0];*/
    //var prueba = document.getElementById("gg").value;
    //alert(prueba);
    //var prueba = document.getElementById('submitButton').value();
    //window.open("generar_pdf.php");
    /*$.ajax({
        url:"generar_pdf.php?var=4",
        method: "GET",
        success: function(data){
            //alert(data);
            window.open("generar_pdf.php");
        }
    });
});*/

//Eliminar registro del pedido y del array
function deleteRow(data){  
    $('.eliRows').click(function () {
        $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
        var cod = datos[0];
     
        for(var i=0; i<data.length;i++) {
            if(String(data[i].id)===cod){
                var cost = parseInt($('#total').val().replace(/[^a-zA-Z0-9]/g, ''));
                var nuevo = cost-data[i].total;
                nuevo = new Intl.NumberFormat('en-US').format(nuevo.toString());
                $('#total').val("$"+nuevo);
                data.splice(i, 1);    
            }
        }  
        venta = JSON.parse(JSON.stringify(data));
        
        $(this).closest('tr').remove();
    });
}

//Agregar dinaminicamente columnas a la tabla del array de producto
function createRow(data) {                             
                     
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td style="display:none">`+data[i].id+`</td>
    <td>`+data[i].codigo+`</td>
    <td>`+data[i].cantidad+`</td>
    <td>`+data[i].producto+`</td>
    <td>`+data[i].precio+`</td>
    <td>`+data[i].impuesto+`</td>
    <td>`+data[i].descuento+`</td>
    <td>`+data[i].total+`</td>
    <td>`+data[i].opcion+`</td>  
    
    </tr>`;
    /*var trElement = `<tr>
    <td style="display:none">`+data[i].id+`</td>
    <td>`+data[i].codigo+`</td>
    <td>`+data[i].cantidad+`</td>
    <td>`+data[i].producto+`</td>
    <td>`+data[i].peso+`</td>
    <td>`+data[i].precio+`</td>
    <td>`+data[i].impuesto+`</td>
    <td>`+data[i].descuento+`</td>
    <td>`+data[i].total+`</td>
    <td>`+data[i].opcion+`</td>  
    
    </tr>`;*/
    $('#cont_ventas').append(trElement);
    //trElement += "<td >" + data[i] + "</td>";
    }  
    //return trElement;
}



/*$('#groupBotones').click(function () {
    categorias = $(this).val();
    alert(categorias);
    /*$.ajax({
        type: "POST",
        url: 'get_var.php?var='+categorias,
        success: function(data) {
            productos = data;
        }
    });
});*/
var idFacc;
$('.impri').click(function(){
    $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
    idFacc = datos[0];
    $('#id_Factu').val(idFacc);
    document.getElementById("submitButton").click();
    
});

var idFacc1;
$('.impriCa').click(function(){
    $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
    idFacc1 = datos[0];
    $('#id_Factu1').val(idFacc1);
    document.getElementById("submitButton1").click();
    
});



$('.anula').click(function(){
    $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
        
        
    $.ajax({
        type:"POST",
        url: "../anulacion.php?var="+datos[0],
        success: function(data) {
            if(data==="Proceso correcto"){
                Swal.fire({
                    icon: 'success',
                    text: 'Anulación realizada',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    } 
                });    
                window.location.href="view_ventas.php"; 
            }else{
                Swal.fire({
                    icon: 'error',
                    text: data,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    } 
                });     
            }
        
        }
    });
 
});
var idDetalle;
$(document).on("click", ".modiProdu", function(event){
    //alert("Entro");
    $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
    idDetalle=datos[8];
        //alert(datos[0]+" - " + datos[8]+" - " + datos[9]);
    /*$.ajax({
        type:"POST",
        url: "notaDebito.php",
        data:{var: can, var2: datos[8], var3: datos[9]},
        success: function(data) {
            alert(data);
        
        }

    });*/
});
var cant1;
$('.select').keypress(function (e) {
    var producto = $('#producto2').val();
    var cantidad = $('#cantidad2').val();
    var peso = $('#peso3').val();
    var peso1 = $('#pesooo2').val();
    var codigo = $('#producto3').val();

    if(e.which == 13) {
        if(peso === '' && peso1!='Digite el peso'){
            $('#peso3').val(peso1);
            peso = $('#pesooo2').val();
        }
        if(tipo1==="cantidad" && cantidad===''){  
            $('#cantidad2').focus();      
            Swal.fire({
                icon: 'error',
                text: 'Por favor ingrese la cantidad',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                } 
            });     
            $('#peso3').val('');  
            $('#pesooo2').val(''); 
        }else if(tipo1==="peso" && peso===''){
            $('#pesooo2').focus(); 
            Swal.fire({
                icon: 'error',
                text: 'Por favor ingrese el peso',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });         
            $('#cantidad2').val('');
        }

        if(tipo1==="cantidad"){
            $('#peso3').val('');
            $('#pesooo2').val('');
            $('#cantidad2').focus();
        }else{
            $('#cantidad2').val('');
            //$('#pesooo').focus();
        }

        if(peso === ''){
            cant1 = cantidad;
        }
        if(cantidad === ''){
            cant1 = peso;
        }

        $.ajax({
            type: "POST",
            url: "../disponibilidad.php?var="+nombre_producto1,
            data:{var2: cant1},
            success: function(data) {
                if(data==="Excede la disponibilidad del producto" || data==="No se encuentra disponibilidad del producto" || data === "El producto no se encuentra en stock" || data ==="El producto no existe"){
                    Swal.fire({
                        icon: 'error',
                        text: data,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    }); 
                    $('#peso3').val('');   
                }else{
                    $.ajax({
                        type:"POST",
                        url: "../cambiarProducto.php",
                        data:{var2: idDetalle, var4: cant1, var5:nombre_producto1},
                        success: function(data) {
                            if(data==="Cambios exitosos"){
                                Swal.fire({
                                    icon: 'success',
                                    text: "Cambios realizados",
                                    showClass: {
                                        popup: 'animate__animated animate__fadeInDown'
                                    },
                                    hideClass: {
                                        popup: 'animate__animated animate__fadeOutUp'
                                    }
                                }); 
                                window.location.href="view_ventas.php";

                            }else{
                                Swal.fire({
                                    icon: 'error',
                                    text: data,
                                    showClass: {
                                        popup: 'animate__animated animate__fadeInDown'
                                    },
                                    hideClass: {
                                        popup: 'animate__animated animate__fadeOutUp'
                                    }
                                });  
                            }
            
                        }
    
                    });
                }
            }
        });
        //alert(producto + " - " + cantidad + " - " + peso + " - " + codigo);
        
    }
});