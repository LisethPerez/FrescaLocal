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
        }
    });

    /*if($('#tipo_cliente').val()==="Normal"){
        $('#info_insti').hide();
    }*/
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

//Enviar datos por con enter
$('.selec').keypress(function (e) {
    var producto = $('#producto').val();
    var cantidad = $('#cantidad').val();
    var peso = $('#peso').val();
    var codigo = $('#producto1').val();
     
    if(e.which == 13) {
        if(cantidad===''){
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
        }else{
            $.ajax({
                type: "POST",
                url: "ingresar_tabla.php",
                data: $("#venta").serialize(),
                success: function(data) {
                    var DataArray = JSON.parse(data);
                    createRow(DataArray);
                    $('#producto').val('');
                    $('#cantidad').val('');
                    $('#peso').val('');
                    $('#producto1').val('');

                    deleteRow();
                }
            });
        }          
    }    
});

function deleteRow(){
    
    $('.eliRows').click(function () {
        $(this).closest('tr').remove();
    });
}

function createRow(data) {                              //dynamically adding rows to the Table
                    //design this according to your requirement    
    for(var i=0; i<data.length; i++){
    var trElement = `<tr>
    <td>`+data[i].codigo+`</td>
    <td>`+data[i].cantidad+`</td>
    <td>`+data[i].producto+`</td>
    <td>`+data[i].peso+`</td>
    <td>`+data[i].precio+`</td>
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
