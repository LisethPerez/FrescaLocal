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
                    title: 'No se encontraron registros con la búsqueda. Por favor ingrese un nuevo cliente',
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

$('#confi').click(function () {
    alert($('#cedula1').val());
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
                    title: 'No se encontraron registros con la búsqueda',
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
    var nombre = $('#nombre').val();
    var documento= $('#documento').val();
    var telefono= $('#telefono').val();
    var dirección = $('#direccion').val();
    var correo = $('#correo').val();
    var empresa = $('#empresa').val();
    var nit = $('#nit').val(); 
    if(nombre===''||  documento===''|| telefono===''|| dirección===''|| correo==='' || empresa==='' || nit===''){
        Swal.fire({
            icon: 'error',
            title: 'Por favor ingrese los datos',
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
            url: "registrar_cliente.php",
            data: $("#form_cliente").serialize(),
            success: function(data) {
                Swal.fire({
                    icon: 'success',
                    title: data,
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
            title: 'Por favor ingrese los datos',
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
                    title: 'Datos erroneos',
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

 $('.groupPago').click(function () {
    var pago = $(this).val();

    if(pago === "Efectivo"){
        $('#efectivo').show();
    }
    if(pago === "Tarjeta debito" || pago === "Tarjeta credito"){
        $('#efectivo').hide();
        Swal.fire({
            icon: 'info',
            title: 'Realice la transeferencia en el datafono',
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
                }
            });
            return item;
            
        }
    });

});

/*$('#producto').change(function () {    
    var productos = $('#producto').next("ul").find("li.active").data("value");  
    
   $.ajax({
        url:"get_image.php?var="+productos,
        method:"POST",    
        success:function(data){
            alert(data);           
        }
    });
});*/



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
                title: 'Por favor ingrese la cantidad',
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
                title: 'Por favor ingrese el peso',
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
                url: "ingresar_tabla.php",
                data: $("#venta").serialize(),
                success: function(data) {
                    DataArray = JSON.parse(data);  
                   //datos.push(DataArray);              
                    createRow(DataArray);
                    //alert(JSON.stringify(DataArray));
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
                    
                    $.each(datos, function(i, _data) {
                        
                        total += _data.total;
                    });
                    
                    $('#producto').val('');
                    $('#cantidad').val('');
                    $('#peso').val('');
                    $('#producto1').val('');
                    
                    deleteRow(datos);
                    const newValue = new Intl.NumberFormat('en-US').format(total.toString().replace(/\D/g, ""));
                    
                    if(datos.length===0){
                        $('#total').val('');
                    }else{
                        $('#total').val("$"+newValue);
                    }
                    
                    total = 0;
                    alert(JSON.stringify(datos.length));
                
            
                }      
            });
        }
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
        var costo = datos[5];
        for(var i=0; i<data.length;i++) {
            if(String(data[i].codigo)===cod){
                $('#total').val($('#total').val()-data[i].total);
                data.splice(i, 1);    
            }
        }  
        
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
