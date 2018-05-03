function buscar_persona(){
  var cuil = parseInt($("#buscar_cuil").val(),10);
  //$("#datos_persona").show();
  $.ajax({
    url: '/personas/buscar_persona/'+cuil,
    type: 'POST',
  })
  .done(function(data) {
    if (data != null) {
      $("#persona_id").val(data.id);
    }
    else{
      $("#persona_id").val("");
    }
  })
}

$(document).ready(function($) {


  $(".solo_numerico").on("keypress keyup blur",function (event) {    
     $(this).val($(this).val().replace(/[^\d].+/, ""));
     if ( event.which == 8) {
         
     }else{
      if (event.which < 48 || event.which > 57) {
                event.preventDefault();
      }
    }          
  });

  $("#input_cuil").on("keypress keyup blur",function (event) {    
     if (( event.which == 8 ) || ( event.which == 45)) {
         
     }else{
      if (event.which < 48 || event.which > 57) {
                event.preventDefault();
           }
    }
          
  });

  $("#input_cuil").blur(function(){
     var cuil = $("#input_cuil");
     var dni = $("#input_dni");
     /*validarCUIT(cuil,dni);     */
  });

   $("#input_dni").bind("propertychange change click keyup input paste",function(){
      var elem = $(this);
      elem.data('oldVal', elem.val());
      if (elem.data('oldVal') != elem.val()) {alert("cambio");}
       var dni = parseInt($("#input_cuil").val(),11);
       if (!Number.isNaN(dni)) //Verifico que se haya ingresaod un dni 
        console.log(dni);
       { 
         $("#datos_persona").show();
          $.ajax({
            url: '/util/buscar_persona/'+dni,
            type: 'POST',
          })
          .done(function(data) {
            if (data != null) {
              /*$("#input_nombres").val(data.nombres); */ //Comentar para no repetir apellido y nombre al buscar y guardar
              $("#input_apellidos").val(data.apellido);
              $("#input_dni").val(data.numero_documento);
              $("#input_nombre").val(data.nombre);
              $("#datepicker1").val(data.fecha_nacimiento.split("-")[2]+"-"+data.fecha_nacimiento.split("-")[1]+"-"+data.fecha_nacimiento.split("-")[0]);
              $("#select_tipo_documento").val(data.tipo_documento_id);
              $("#input_domicilio").val(data.domicilio);
              $("#input_telefono").val(data.telefono);
            }
            else{
              //alert("La persona no existe. Por favor cargue sus datos");
              $("#input_nombres").val("");
              $("#input_apellidos").val("");
              $("#input_nombre").val("");
              $("#input_dni").val("");
              $("#datepicker1").val("");
              $("#select_tipo_documento").val(5);
              $("#input_domicilio").val("");
              $("#input_telefono").val(""); //ID 5, para tipo de documento DNI
            }
          })
       } 
    });

});

function validarCUIT (expresion, dni) {
  //    ^\d{2}31343209\d{1}$
  patt = new RegExp("^\\d{2}"+dni.val()+"\\d{1}$");
  if (patt.test(expresion.val())){
  }else{
    alert('CUIL incorrecto')
  }
}