// funcion no valid
var diaa = "";
var hora ="";
var idhorario = "";
var tipoid = "";
var eps = "";
var numeroid = "";
var nombres = "";
var apellidos = "";
var direccion = "";
var telefono = "";
var eldia = "";
var lahora = "";
var elidhorario = "";

var idhorarioborrar ="";
var identificacionborrar = "";
var horaborrar = "";
var diaborrar = "";

var borrado = false;

function  deletereserva (idhorarioborrar, identificacionborrar, hora, dia){

  // alert(idhorarioborrar)
  // alert(identificacionborrar)
  // alert(hora)
  // alert(dia)


$.ajax({
  url: 'api/v13/reservas/deletereserva',
  type: 'POST',

  data: {idhorario: idhorarioborrar, identificacion: identificacionborrar, hora: hora, nombredia: dia},
})
.done(function() {
  console.log("success");
})
.fail(function() {
  console.log("error");
})
.always(function() {
  console.log("complete");
});



}

function guardarReserva(tipoid, eps, numeroid, nombres, apellidos, direccion, telefono, eldia, lahora, elidhorario) {
  // alert(tipoid+eps+numeroid+nombres+apellidos+eldia+elidhorario)
  // alert()
  // alert(eps)  numeroid, nombres, eldia, elidhorario);
  // alert(lahora);
  $.ajax({
    url: 'api/v13/reservas/creareserva',
    type: 'POST',
    // dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    data: {
      tipoid: tipoid,
      eps: eps,
      numeroid: numeroid,
      nombres: nombres,
      apellidos: apellidos,
      direccion: direccion,
      telefono: telefono,
      eldia: eldia,
      lahora: lahora,
      elidhorario: elidhorario
    }
  }).done(function(data) {
    // console.log(data)
    // alert(data);
  }).fail(function() {
    console.log("error");
  }).always(function() {
    console.log("complete");
  });
}

function testlogin() {
  return $.ajax({
    url: 'dapi/usuario/obtenerlogin',
    type: 'GET',
  });
}
// function verauth(){
//     var islog;
//   islog = $.ajax({
//                    url: 'dapi/usuario/obtenerlogin',
//                    type: 'GET',
//                    // dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
//                    // data: {param1: 'value1'},
//                 })
//                 .done(function(data) {
//                   // console.log(data);
//                   return  data;
//                    // if (data === 'true'){
//                      // $(".delhorario").hide();
//                       // console.log(data);
//                    // }
//                 })
//                 .fail(function() {
//                    console.log("error");
//                 })
//                 .always(function() {
//                    console.log("complete");
//                 });
//                 return islog;
//                 alert(islog);
// };
function novalid() {
  $('#alert-error').addClass('animated bounce').fadeIn(500);
  setTimeout(function() {
    $('#alert-error').removeClass('animated bounce').fadeOut(500);
  }, 1500);
}

function cargascript() {
  $.getScript("horario/js/scripts-custom.js").done(function(script, textStatus) {
    console.log('se cargo script desde la funcion');
  }).fail(function(jqxhr, settings, exception) {
    // $( "div.log" ).text( "Triggered ajaxError handler." );
  });
  numeroid = "";
  console.log(numeroid);
};
numeroid = '';
// si el usuario es visitante se oculta el borrar horario de lo contrario si el usuario es admin se muestra el borrar horario
//$('.delhorario').hide();
$('.verhorario').on('click', function() {
  var dataid = $(this).attr('data-id');
  idhorario = dataid;
  var processsend = 'process=3&data=' + dataid;
  //$(' .guardarhorario ').hide();
  $.ajax({
    type: 'POST',
    url: 'horario/include/process.php',
    data: processsend,
    beforeSend: function() {
      $('#appenddata').html(' ');
    },
    success: function(data) {
      $('#appenddata').html(data);
      $('#ViewHorario').modal('show');
      $('#canceltask').on('click', function() {
        window.location.href = 'lista';
      })
      numeroid = "";
      //----------------------------------------------------------------------------------------------
      //funcion ver si es user loging
      var promise = testlogin();
      var islogin = promise.success(function(data) {
        // alert(data)
        if (data == 0) {
          $('.changethetime ').hide()
          $('.deltasker').hide();
          //si el user es visitante entoces se oculta la x de la tarea que elimina la tarea 
        } else {
          $('.changethetime ').show()
          $('.deltasker').show();
          $('.deltasker').on('click', function() {

            var element = $(this).parent();

            hora = element.parent()
            hora = hora.parent()
            hora1 = hora.parent()
            hora = hora1.find('td:nth-child( 1 ) div.timeblock').text();
            nombredia = hora1.parent()
            nombredia = nombredia.parent()
             nombredia = nombredia.parent()
             numdia = $(this).closest("td").index() +1
            nombredia = nombredia.find('tr th:nth-child(' + numdia + ') ').text();

             // alert(nombredia);



            // idhorarioborrar = idhorario;
            identificacionborrar = element.parent().text()
            identificaciondelete = identificacionborrar.slice(15);
               // alert(hora)
              
            // alert('has eliminado la reserva, para reservar debes volver a iniciar!!')
            swal({
              title: "Estas seguro de eliminar la reserva?",
              text: "Si Eliminas deberás volver a iniciar!",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "Si, Eliminar",
              closeOnConfirm: false
            }, function() {
              // var element = $(this).parent();
              element.addClass('animated bounceOut');
              element.remove();
              swal("Borrado!");

               idhorarioborrar = idhorario;
              identificacionborrar = identificaciondelete;
               horaborrar = hora;
               // alert(hora)
               diaborrar = nombredia;

               borrado = true;

               //borrar elemento de la base de datos

               


            });
            // tipoid = "";
            // eps = "";
            // numeroid = "";
            // nombres = "";
            // apellidos = "";
            // direccion = "";
            // telefono = "";
            // eldia = "";
            //  elidhorario = "";

         
          });
        }
      });
      // Mostrar Boton Add
      $(".td-line").hover(function() {
        var count = $(this).find('div label').length;
        if (count == 0) $(this).find('button').show();
      }, function() {
        $(this).find('button').hide();
      });
      // Agregar Informacion
      $('.addinfo').on('click', function() {
        numdia = $(this).closest("td").index()
        numdia = numdia + 1; // alert($(this).closest("tr").index())
        var dia = $(this).parent()
        var dia = dia.parent()
        var dia = dia.parent();
         hora = dia.find('td:nth-child( 1 ) div.timeblock').text();
        lahora= hora;
        // alert(hora);
        var myCol = dia.index();
        var $tr = dia.closest('tr');
        var myRow = $tr.index();
        var dia = dia.parent()
        var dia = dia.parent()
        diaa = dia.find('tr th:nth-child(' + numdia + ') ').text();
        // return dia
        // var myCol = $(this).index();
        // alert(myRow)crea
        var dum = $(this).attr('data-row');
        $('#DataEdit').modal('show');
        $('#tede').val(dum);
      });
      var curr = new Date; // get current date
      var first = curr.getDate() - curr.getDay(); // First day is the day of the month - the day of the week
      var last = first + 6; // last day is the first day + 6
      var firstday = new Date(curr.setDate(first)).toUTCString();
      var lastday = new Date(curr.setDate(last)).toUTCString();

       first = new Date(curr.setDate(first)).getDate();
       last = new Date(curr.setDate(last)).getDate();

       // alert(first)
       // alert(last)



      // console.log(curr)
      // console.log(curr.getDate())
      // console.log(curr.getDay())
      // console.log(first)
      // console.log(last)

      // console.log(firstday)
      // console.log(lastday)


      


      // alert (firstday + lastday);
      // Borrar la tarea
      $('.delinfo').on('click', function() {
        var dum = $(this).attr('data-row');
        $('#' + dum).text('').removeClass('purple-label red-label blue-label pink-label').hide();
      });
      // Guardar Tarea
      //                         .click(function() {
      //   alert( "Handler for .click() called." );
      // });
      $('.savetask').click(function() {
         // alert("validado")
        // var validate = false;
        
        $('#taskfrm').validate({ // initialize the plugin
          rules: {
            numeroid: {
              required: true
            },
            nombres: {
              required: true
            },
            apellidos: {
              required: true
            },
            direccion: {
              required: true
            }
          },
          submitHandler: function(form) { // for demo
            validate = true;
            console.log(validate);
            guardartask();
          }
        });

        function guardartask() {
         
          var tede = $('#tede').val();
          var tasker = $('#numeroId').val();
          var color = $('#idcolortask option:selected').val();
          //datos del usuario que reserva en cada cita para guardan en la base de datos 
          // info = {
          //         'tipoid': $('#tipoid option:selected').val(),
          //         'numeroid': $('#numeroId').val(),
          //         'nombre': $('#nombres').val(),
          //         'apellido': $('#apellidos').val(),
          //         'direccion': $('#direccion').val(),
          //         'telefono': $('#telefono').val()
          // };
          // info = JSON.stringify(info);
          tipoid = $('#tipoid option:selected').val();
          eps = $('#eps option:selected').val();
          numeroid = $('#numeroId').val();
          nombres = $('#nombres').val();
          apellidos = $('#apellidos').val();
          direccion = $('#direccion').val();
          telefono = $('#telefono').val();
          eldia = diaa;
          lahora = hora;
          elidhorario = idhorario;
          //hasta aqui me guarda la información
          //antes de dar valide si no esta nada vacio
          // alert(elidhorario)
          $('#DataEdit').modal('toggle');
          $.when($('#' + tede).append('<label class="label-desc red-label">' + 'Reservado por: ' + tasker + ' <a class="deltasker"><i class="fa fa-times"></i></a></label>')).then($('.addinfo').unbind("click"));
          //$('#'+tede).text(tasker).addClass(color).show();
          $('#taskfrm')[0].reset();
          $('.deltasker').on('click', function() {
            var element = $(this).parent();
            // alert('has eliminado la reserva, para reservar debes volver a iniciar!!')
            swal({
              title: "Estas seguro de eliminar la reserva?",
              text: "Si Eliminas deberás volver a iniciar!",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "Si, Eliminar",
              closeOnConfirm: false
            }, function() {
              // var element = $(this).parent();
              element.addClass('animated bounceOut');
              element.remove();
              swal("Borrado!");
              $('.guardarhorario').trigger('click');
            });
            tipoid = "";
            eps = "";
            numeroid = "";
            nombres = "";
            apellidos = "";
            direccion = "";
            telefono = "";
            eldia = "";
            lahora = "";
            elidhorario = "";
            
          });
        }
        // cargascript();
      });
      $('.changethetime').on('click', function() {
        var theparent = $(this).attr('data-time');
        $('.hideedittime').hide();
        $('.timeblock').show();
        $('#parent' + theparent).hide();
        $('#edit' + theparent).show();
      });
      $('.savetime').on('click', function() {
        var savetime = $(this).attr('data-save');
        var datasavetime = $('#input' + savetime).val();
        $('#edit' + savetime).hide();
        $('#parent' + savetime).show();
        $('#data' + savetime).text(datasavetime);
        $('#data' + savetime).addClass('animated flash');
        setTimeout(function() {
          $('#data' + savetime).removeClass('flash');
        }, 1000);
      });
      $('.deleteblock').on('click', function() {
        var block = $(this).attr('data-block');
        $('#tr' + block).addClass('animated bounceOutLeft');
        setTimeout(function() {
          $('#tr' + block).remove();
        }, 1000);
      });
      $('.canceledit').on('click', function() {
        $('.hideedittime').hide();
        $('.timeblock').show();
      });
      $('.guardarhorario').on('click', function() {
        var btnsave = $(this);
        var descripcion = $('#descripcioninput').val();
        var nombre = $('#nombreinput').val();
        var horario = $('#edithorariotabledata').html();
        var iddata = $('#inputidedit').val();
        // tipoid=$('#tipoid option:selected').val();
        //  numeroid=$('#numeroId').val();
        //  nombres = $('#nombres').val();
        //  apellidos = $('#apellidos').val();
        //  direccion= $('#direccion').val();
        //  telefono= $('#telefono').val();
        //alert(tipoid + numeroid);
        var horariodata2 = 'process=6&tipoid=' + tipoid + '&numeroid=' + numeroid + '&nombres=' + nombres + '&apellidos=' + apellidos + '&direccion=' + direccion + '&telefono=' + telefono;
        var horariodata = 'process=4&nombre=' + nombre + '&descripcion=' + descripcion + '&horario=' + horario + '&id=' + iddata;
        // console.log(
        $.ajax({
          type: 'POST',
          url: 'horario/include/process.php',
          data: horariodata,
          beforeSend: function() {
            guardarReserva(tipoid, eps, numeroid, nombres, apellidos, direccion, telefono, eldia, lahora, elidhorario);
            
            if(borrado){
              // alert(borrado)

              deletereserva(idhorarioborrar, identificacionborrar, hora, diaborrar)
            }
            btnsave.prop('disabled', true);
            $('#horario-name').addClass('opacityelement');
            $('#thetable').addClass('opacityelement');
          },
          success: function() {
            // cargascript()
            $('#thetable').addClass('animated bounceOut');
            btnsave.prop('disabled', false);
            setTimeout(function() {
              $('#ViewHorario').modal('toggle');
            }, 1000);
            window.location.href = 'lista';
          },
          error: function() {
            novalid();
          }
        });
        $.ajax({
          type: 'POST',
          url: 'horario/include/process.php',
          data: horariodata2,
          success: function() {
            // alert('se envio el json');
            var horariodata = "";
            numeroid = '';
          }
        });;
      });
      //----------------------------------------------------------------------------------------------
    },
    error: function() {
      novalid();
    }
  });
});
$('.delhorario').on('click', function() {
  var horario = $(this).attr('data-id');
  var horariodata = 'process=5&dataid=' + horario;
  var elemento = $('#trhorario' + horario);
  $.ajax({
    type: 'POST',
    url: 'horario/include/process.php',
    data: horariodata,
    beforeSend: function() {
      elemento.find('button').prop('disabled', true);
      elemento.addClass('opacityelement');
    },
    success: function() {
      elemento.addClass('animated bounceOut');
      setTimeout(function() {
        elemento.remove();
      }, 1000)
    },
    error: function() {
      novalid();
    }
  });
});