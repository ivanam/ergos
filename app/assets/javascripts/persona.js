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
      $("#datos_persona").removeClass("hide");
      $("#crear_persona").addClass("hide");
      $("#nombre_persona").text(data.apellido + ", " + data.nombre);
      $("#email_persona").text(data.email);
      $("#contra_persona").text("12345678");
    }
    else{
      $("#persona_id").val("");
      $("#crear_persona").removeClass("hide");
      $("#datos_persona").addClass("hide");
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

  
  $("#input_cuil").blur(function(){
     var cuil = $("#input_cuil");
     var dni = $("#input_dni");
     /*validarCUIT(cuil,dni);     */
  });

  

   $("#input_cuil").bind("propertychange change click keyup input paste",function(){
      var cuit = parseInt($("#input_cuil").val(),10);
          $.ajax({
            url: '/personas/buscar_persona_completa/'+cuit,
            type: 'POST',
          })
          .done(function(data) {
            if (data != null) {
             
              /*$("#input_nombres").val(data.nombres); */ //Comentar para no repetir apellido y nombre al buscar y guardar
              $("#input_apellidos").val(data.apellido);
              $("#input_dni").val(data.numero_documento);
              $("#input_nombre").val(data.nombre);
              $("#datepicker1").val(data.fecha_nacimiento);
              $("#select_tipo_documento").val(data.tipo_documento_id);
              $("#input_domicilio").val(data.domicilio);
              $("#input_telefono").val(data.telefono);
              $("#input_email").val(data.email);
            }
            else{
              //alert("La persona no existe. Por favor cargue sus datos");
              $("#input_nombres").val("");
              $("#input_apellidos").val("");
              $("#input_nombre").val("");
              $("#input_dni").val("");
              $("#datepicker1").val("");
              $("#select_tipo_documento").val(4);
              $("#input_domicilio").val("");
              $("#input_telefono").val(""); //ID 5, para tipo de documento DNI
              $("#input_email").val("");
            }
          })
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