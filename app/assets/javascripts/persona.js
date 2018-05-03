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
      $("#nombre_persona").val(data.nombre);
    }
    else{
      $("#persona_id").val("");
      $("#crear_persona").removeClass("hide");
      $("#datos_persona").addClass("hide");
    }
  })
}