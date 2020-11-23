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
    $('#cantidad').val(cant + $(this).val());
});
   

//Eliminar el último valor del input de cantidad
$('#seleEli').click(function () {
    var cadena = $('#cantidad').val();
    cadena = cadena.substring(0, cadena.length - 1);
    $('#cantidad').val(cadena);
     
});

//Buscar cedula para la existencia del cliente
$('#buscar1').click(function () {
    $.ajax({
        type: "POST",
        url: "encontrar_cedula.php",
        data: $('#formulario').serialize(),
        success: function(data) {
            
            $('#resultado').html(data);
            
            if (data === "No existe ese registro"){
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
                $('#ingresar').prop('disabled', false);
            }
        }
    });
     
});
var cedula_cliente;
var tipo_cliente=0;
$('#confi').click(function () {
    cedula_cliente = $('#cedula1').val()
    $.ajax({
        type: "POST",
        url: "obtener_tipo.php?var="+cedula_cliente,
        data: $('#formulario').serialize(),
        success: function(data) {          
            tipo_cliente = data;           
        }
    });
});
$('#buscar3').click(function () {
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
     
});

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
}

//Metodo para el ingreso de los datos del formulario de cliente 
$('#registrar2').click(function () {   
    var tipo_cle = $('#tipo_cliente option:selected').val();
    var nombre = $('#nombre').val();
    var documento= $('#documento').val();
    var telefono= $('#telefono').val();
    var dirección = $('#direccion').val();
    var correo = $('#correo').val();
    var empresa = $('#empresa').val();
    var nit = $('#nit').val(); 
  
    if(tipo_cle === '' || nombre===''||  documento===''|| telefono===''|| dirección===''|| correo==='' || empresa==='' || nit===''){
        Swal.fire({
            icon: 'error',
            text: 'Por favor ingrese los datos',
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
                clearCliente();
                $('#cedula').val('');
            }
        });
    }
});

$('#ingresar_login').click(function () {   

    var correo = $('#email').val();
    var password = $('#pass').val();

    if(correo==='' || password===''){
        Swal.fire({
            icon: 'error',
            text: 'Por favor ingrese los datos',
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
        url: "login.php",
        data: $("#formulario_ingreso").serialize(),
        success: function(data) {
            
            if(data === "Datos correctos"){
                window.location.href="index.php";
            }
            if(data === "Datos erroneos"){
                Swal.fire({
                    icon: 'error',
                    text: 'Datos erroneos',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                });  
                $('#email').val('');
                $('#password').val('');   
            }
        }
    });
    }
});

var id_factu;
$('.view_products').click(function () {
    $tr=$(this).closest('tr');
    var datos = $tr.children("td").map(function (){
        return $(this).text();
    });
    id_factu = datos[0];
    $.ajax({
        url: "detalle_productos.php?var="+id_factu,
        type: "POST",
        success: function(data){
            //alert(JSON.parse(data));
            /*var produ = document.getElementById("cont_productos");
            produ.innerHTML = "";*/
            var datosPro = JSON.parse(data);
            createRow2(datosPro);
                
        }
    });    
 });

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

var buscar_fac;
$('#buscarFac').click(function(){
    buscar_fac = $('#numberFac').val();

    if(buscar_fac === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese número de búsqueda',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        });  
    }else{
        $.ajax({
            url: "buscar_fact.php?var="+buscar_fac,
            method: "POST",
            success: function(data){
               if(data === "No se encuntran resultados con la búsqueda"){
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
                var contenidoFac = document.getElementById("pro");
                contenidoFac.innerHTML = "";
                var datosFac = JSON.parse(data);
                createRow3(datosFac);
                $('#numberFac').val('');
               }
            }
        });
    }
});

function createRow3(data) {                              //dynamically adding rows to the Table
    //design this according to your requirement    
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td>`+data[i].id+`</td>
    <td>`+data[i].total+`</td>
    <td>`+data[i].productos+`</td>
    <td>`+data[i].fecha+`</td>
    <td>`+data[i].tipo+`</td>
    <td>`+data[i].empleado+`</td>
    <td>`+data[i].cliente+`</td>  
    <td>`+data[i].sede+`</td>   
    <td>`+data[i].opcion+`</td>  
    </tr>`;
    $('#pro').append(trElement);    
    }  
}

var  buscar_fac2;
$('#buscarFac2').click(function(){
    buscar_fac2 = $('#numberFac').val();

    if(buscar_fac === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese número de búsqueda',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        });  
    }else{
        $.ajax({
            url: "buscar_fact.php?var="+buscar_fac2,
            method: "POST",
            success: function(data){
               if(data === "No se encuntran resultados con la búsqueda"){
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
                var contenidoFac = document.getElementById("pro2");
                contenidoFac.innerHTML = "";
                var datosFac = JSON.parse(data);
                createRow3(datosFac);
                $('#numberFac2').val('');
               }
            }
        });
    }
});



function createRow3(data) {                              //dynamically adding rows to the Table
    //design this according to your requirement    
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td>`+data[i].id+`</td>
    <td>`+data[i].total+`</td>
    <td>`+data[i].productos+`</td>
    <td>`+data[i].fecha+`</td>
    <td>`+data[i].tipo+`</td>
    <td>`+data[i].empleado+`</td>
    <td>`+data[i].cliente+`</td>  
    <td>`+data[i].sede+`</td>   
    <td>`+data[i].opcion+`</td>  
    </tr>`;
    $('#pro2').append(trElement);
    
    }  

}

//Agregar los datos de la fila seleccionada

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
    $('#nit1').val(datos[7]);
 });
var pago;

 $('.groupPago').click(function () {
    pago = $(this).val();

    if(pago === "Efectivo"){
        $('#efectivo').show();
    }
    if(pago === "Tarjeta debito" || pago === "Tarjeta credito"){
        $('#efectivo').hide();
        Swal.fire({
            icon: 'info',
            text: 'Realice la transeferencia en el datafono',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        });     
    }
 
 });

 $('#valor_ingre').on('keyup', () => {
    const value = $('#valor_ingre').val();
    var chain = String(value.replace(/\D/g, ""));
    const newValue = new Intl.NumberFormat('en-US').format(chain);
    $('#valor_ingre').val("$ " + newValue);

});
var nombre_producto;
var tipo;
//Esconder formulario de busqueda
$(document).ready(function(){
    //$('#menuToggle').trigger('click')
    
    document.getElementById("menuToggle").click();
    //Esconder formulario de busqueda
    $('#esconder').hide();   
    //Esconder duv de metodo de pago efectivo
    $('#efectivo').hide();
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
                     //alert(tipo);
                }
            });
            return item;
            
        }
    });


});



var valor;
var categorias;
//Capturar el valor del checkbox seleccionado
$('.form-check-inline' ).on( 'click', function() {
    if( $('#inlineRadio1').is(':checked') ){
        valor = $('#inlineRadio1').val();
        $('#label1').text("Ingrese nombre");
        $('#num').attr("placeholder", "Ingrese nombre");
        $('#esconder').show();
    } 
    if ( $('#inlineRadio2').is(':checked') ){
        valor = $('#inlineRadio2').val();
        $('#label1').text("Ingrese documento");
        //$('#num').val($('#inlineRadio2').val());
        $('#num').attr("placeholder", "Ingrese documento");
        $('#esconder').show();
    }

    
});

$('#obte').click(function () {
    $.ajax({
        url: "lectura.php",
        success: function(data) {
            $('#pesooo').val(data);
            $('#peso').val(data);
        }
    }); 
});
var datos = [];
var DataArray = [];
var total=0;
//var descuento = 0, impuesto = 0;
//Enviar datos por con enter
$('.selec').keypress(function (e) {
    var producto = $('#producto').val();
    var cantidad = $('#cantidad').val();
    var peso = $('#peso').val();
    var codigo = $('#producto1').val();
     
    if(e.which == 13) {
        
        if(tipo==="cantidad" && cantidad===''){
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
        }else if(tipo==="peso" && peso===''){
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
                //Verificar la disponibilidad del producto seleccionado
                $.ajax({
                    type: "POST",
                    url: "disponibilidad.php?var="+nombre_producto,
                    data:{var2: cantidad},
                    success: function(data) {
                      
                        if(data==="Hay disponibilidad"){
                            //Si se encuentra disponibilidad de agregar al JSON y la tabla
                             $.ajax({
                                    type: "POST",
                                    url: "ingresar_tabla.php?var="+tipo_cliente,
                                    data: $("#venta").serialize(),
                                    success: function(data) {
                                        DataArray = JSON.parse(data);  
                                                
                                        createRow(DataArray);
                                        deleteRow(datos);  
                                        //alert(JSON.stringify(DataArray));
                                        //Recorrer el array temporal para llenar el nuevo JSON
                                        $.each(DataArray, function(i, _data) {
                                            var codigo =  _data.codigo;
                                            var cantidad =  parseInt( _data.cantidad);
                                            var producto =  _data.producto;
                                            var peso =  parseFloat(_data.peso);
                                            var precio = parseFloat(_data.precio);
                                            var impuesto =  parseInt(_data.impuesto);
                                            var descuento = parseInt(_data.descuento);
                                            
                                            datos.push({
                                                'codigo': codigo,
                                                'cantidad': cantidad,
                                                'producto': producto,
                                                'peso': peso,
                                                'precio' : precio,
                                                'impuesto': impuesto,
                                                'descuento': descuento,
                                                'total' : Math.round(cantidad*(precio+((impuesto*precio)/100)-((descuento*precio)/100)))
                                            })
                                    
                                        });
                                        //Suma de los total por productos seleccionados
                                        $.each(datos, function(i, _data) {
                                            
                                            total += _data.total;
                                        });
                                        
                                        $('#producto').val('');
                                        $('#cantidad').val('');
                                        $('#peso').val('');
                                        $('#producto1').val('');
                                        
                                        
                                        const newValue = new Intl.NumberFormat('en-US').format(total.toString().replace(/\D/g, ""));
                                        
                                        if(datos.length===0){
                                            $('#total').val('');
                                        }else{
                                            $('#total').val("$" + newValue);
                                        } 
                                        total = 0;
                                        
                                        
                                    }   
                                    
                                });
                                //Sincronizar los nuevos productos con la eliminación y agregación
                                venta = datos;

                        //Mensaje de no existencia de disponibilidad del producto
                        }else if(data==="Excede la disponibilidad del producto" || data==="No se encuentra disponibilidad del producto" || data === "El producto no se encuentra en stock" || data ==="El producto no existe"){
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
        }//IF DE VALIDAR DATOS VACIOS
    }//IF DEL ENTER

});
var venta = [];

//Cambio de la caja del pago en efectivo
$('#valor_ingre').keypress(function (e) {
    var totaal = parseInt($('#total').val().replace(/[^a-zA-Z0-9]/g, ''));
    var valor_ingre = parseInt($('#valor_ingre').val().replace(/[^a-zA-Z0-9]/g, ''));
    if(e.which == 13) {
        var residuo = valor_ingre-totaal;
        const newValue = new Intl.NumberFormat('en-US').format(residuo.toString().replace(/\D/g, ""));
        $('#vueltas').val("$" + newValue);
    }
});   

//Ingreso de JSON de los productos para descontarlos de stock y realizar la posterior venta
var id_factura;
$('#realizar_pago').click(function(){
    //alert(JSON.stringify(venta));
    $.ajax({
        type:"POST",
        url: "detalle_venta.php?cliente="+cedula_cliente,
        data: {var: venta},  
        success: function(data) {
            id_factura = data;
            
        }
    });
});

$('#pagar').click(function(){
    $.ajax({
        type:"POST",
        url: "agregar_factura.php?var="+id_factura,
        data:{tipo_pago: pago},
        success: function(data) {
            alert(data);
            var contenidoVen = document.getElementById("cont_ventas");
            contenidoVen.innerHTML = "";
            $('#valor_ingre').val('');
            $('#vueltas').val('');
            $('#efectivo').hide();
            $('#total').val('');

        }
    });
});

$('#volver_stock').click(function(){
    //alert(JSON.stringify(venta));
    $.ajax({
        type:"POST",
        url: "volverStock.php?fac="+id_factura,
        data: {var: venta},
    
        success: function(data) {

            if(data==="Adicción realizada"){
                Swal.fire({
                    icon: 'success',
                    text: 'Stock actualizado',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                });     

            }
            if(data ==="No se realizaron cambios"){
                Swal.fire({
                    icon: 'error',
                    text: 'Cambio de stock incompleto',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                });     
            }
            var contenidoVen = document.getElementById("cont_ventas");
                contenidoVen.innerHTML = "";
              $('#total').val('');   
        }
    });
});
  

$('#descontar').click(function(){
    //alert(JSON.stringify(venta));
    var codigo = $('#codigo_inve').val();
    if(codigo === ''){
        Swal.fire({
            icon: 'error',
            text: 'Ingrese número de factura',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        });     

    }else{
        $.ajax({
            type:"POST",
            url: "volverStock2.php?var="+codigo,
            data: {var: venta},
        
            success: function(data) {
                //alert(data);
                if(data==="Adicción realizada"){
                    Swal.fire({
                        icon: 'success',
                        text: 'Stock actualizado',
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    });   
                    $('#codigo_inve').val('');  

                }
                if(data ==="No se realizaron cambios"){
                    Swal.fire({
                        icon: 'error',
                        text: 'Cambio de stock incompleto',
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

//Eliminar registro del pedido y del array
function deleteRow(data){
    
    $('.eliRows').click(function () {
        $tr=$(this).closest('tr');
        var datos = $tr.children("td").map(function (){
            return $(this).text();
        });
        var cod = datos[0];
        for(var i=0; i<data.length;i++) {
            if(String(data[i].codigo)===cod){

                var cost = parseInt($('#total').val().replace(/[^a-zA-Z0-9]/g, ''));
                var nuevo = cost-data[i].total;
                nuevo = new Intl.NumberFormat('en-US').format(nuevo.toString().replace(/\D/g, ""));
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
    <td>`+data[i].codigo+`</td>
    <td>`+data[i].cantidad+`</td>
    <td>`+data[i].producto+`</td>
    <td>`+data[i].peso+`</td>
    <td>`+data[i].precio+`</td>
    <td>`+data[i].impuesto+`</td>
    <td>`+data[i].descuento+`</td>
    <td>`+data[i].opcion+`</td>  
    </tr>`;
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
