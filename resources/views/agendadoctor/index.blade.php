@extends('admin.template.main4')
@section('title', 'Agendamiento')
@section('content')

<link href="{{ asset('horario/style.css') }}" rel="stylesheet">

 <div class = 'container'  style="width: 100%;">
   <div class="clearfix"></div>
    <br>

    <!-- menu -->
    <div id="menu" class="col-md-12 ">
      <div class="container" >
      <div class="row">
        
        <div class="col-md-12 ">
          
        <h1>
          Agendamiento de Citas médicas y gestion de Reservas
        </h1>
        <p>
          En esta sección se puede generar horarios por médico para que el publico pueda reservar a través de nuestro múdolo de citas online.
        </p>

        </div>
      </div>

          <a class="btn btn-primary" href="lista"><i class="fa  fa-calendar-check-o" aria-hidden="true"></i> Agendar una Cita</a>
          <a class="btn btn-primary" href="Horarioreserva"><i class="fa  fa-calendar-check-o" aria-hidden="true"></i> Ver las Reservas</a>
          <button class="btn btn-success" data-toggle="modal" data-target="#myModal"><i class="fa fa-calendar"></i> Crear un horario de citas</button>
      </div>
    </div>
    <!-- menu -->


    <!-- container -->
      <div class="container " style="width: 100%;">
       <div id="clockindex" class="col-sm-12 text-center">
         <i class="fa fa-calendar-plus-o icon-clock-index animated infinite pulse" aria-hidden="true"></i>
       </div>
       <div id="mynew" class="col-sm-12">

       </div>
      </div>
    <!-- container -->

<!-- modal nuevo horario -->
<div class="modal fade animated bounceInLeft" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close cancel-new" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-calendar"></i> Agendamiento por Medico</h4>
      </div>
      <div class="modal-body">
<!-- calendario semanal -->

<form id="horariofrm">
  <label>Medico:</label>
  <select id="nombre" name="nombre" data-style="btn-primary" class="form-control">
   <option selected value="">Seleccione...</option>
    @foreach($medicos as $medic)
     <option id="{{ $medic->id }}" value="{{ $medic->Nombres }} {{ $medic->Apellidos }}">{{ $medic->Nombres }} {{ $medic->Apellidos }}</option>
    @endforeach
  </select>

<div class="clearfix"></div>
<br>
<label>Jornada Atención:</label>
<select id="jornada" name="descripcion" data-style="btn-primary" class="form-control">
    <option>Única</option>    
</select>
<br>
<label>Tipo de Atención:</label>
<select id="tipoAtencion" name="tipoAtencion" data-style="btn-primary" class="form-control">
    <option>Materno</option>  
    <option>General</option> 
    <option>Urgencias</option>   
</select>

<div class="clearfix"></div>
<br>
     <label>Seleccione Dias en que Realiza Consulta:</label>
       <div id='fechaSemana'>
          <h2 style=" text-align: center"></h2>
       </div>
        <div id="days-list" class="col-sm-12">
               <a data-day="1" class="day-option">Lunes</a>
               <a data-day="2" class="day-option">Martes</a>
               <a data-day="3" class="day-option">Miercoles</a>
               <a data-day="4" class="day-option">Jueves</a>
               <a data-day="5" class="day-option">Viernes</a>
               <a data-day="6" class="day-option">Sabado</a>
               <a data-day="7" class="day-option">Domingo</a>
            </div>
<input id="days-chose" class="form-control" type="text" name="days" >
<div class="clearfix"></div>
<br>
  <label>Inicio:</label>
   <input class="form-control" type="text" id="time1" name="tiempo1">
  <label>Final:</label>
   <input class="form-control" type="text" id="time2" name="tiempo2">
  <label>Dividir Entre:</label>
  <select class="form-control" name="minutos">
                <option></option>
                <option value="20">20 Minutos</option>
                <option value="40">40 minutos</option>
                <option value="60">1 Hora</option>
            </select>
         </form>

  </div>
      <div class="modal-footer">
        <button type="button" class="create-horario btn btn-success"><i class="fa fa-check-square"></i> Crear</button>
        <button type="button" class="cancel-new btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
      </div>
    </div>
  </div>
</div>
<!-- modal nuevo horario -->


<!-- append modal set data -->
<!-- <div class="modal fade" id="DataEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close canceltask" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-thumb-tack"></i> Agregar Tarea</h4>
      </div>
      <div class="modal-body">

        <form id="taskfrm">
           <label>Tarea</label>
           <input class="form-control" type="text" id="nametask" >
           <label>Color:</label>
           <select class="form-control" id="idcolortask">
              <option value="purple-label">Purpura</option>
              <option value="red-label">Rojo</option>
              <option value="blue-label">Azul</option>
              <option value="pink-label">Rosa</option>
              <option value="green-label">Verde</option>
           </select>
          <input id="tede" type="hidden" name="tede" >
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="savetask btn btn-success"><i class="fa fa-floppy-o"></i> Guardar</button>
        <button type="button" class="canceltask btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
      </div>
    </div>
  </div>
</div> -->
<!-- append modal set data -->



<!-- alert danger -->
<div id="alert-error"><i class="fa fa-times fa-2x"></i></div>
<!-- alert danger -->
</div>
@section('js')
<script src="{{ asset('horario/js/script.js') }}"></script>

  <script type="text/javascript">
  $(document).ready(function() {


  $('.wc-scrollable-grid').remove();


  $(".wc-day-column-header").click(function(){
    var texto = $(this).text();
    var str = "Hello world!";
var res = texto.slice(-10);
    alert(res);
});
});

 </script>
@endsection
@stop
