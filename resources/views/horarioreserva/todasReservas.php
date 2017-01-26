@extends('admin.template.main4')

@section('title', 'Lista de Afiliaciones')

@section('content')
<?php 
use App\Horario;
 ?>


       <div class = 'container'>
        <div class="clearfix"></div>
        <br>
        <!-- <a class="btn btn-primary btn-flat" href="{!! route('especialidades.create') !!}">Crear Nueva Especialidad</a> -->
            <br>
            <br>
            
    <div class="panel panel-blue">
             <div class="panel-heading">Todas las reservas</div>
              <div class="panel-body">
               <div id="no-more-tables">
                 <table id="table_id" class="table table-hover table-striped table-bordered table-advanced tablesorter display">
                 <thead class="cf">
                    <th>No. Identificación</th>
                    <th>Nombres</th>
                    <th>Fecha Reserva</th>
                    <th>Médico</th>
                    <th>Tipo de cita</th>

                </thead>
                <tbody>
                    @foreach($reservast as $valuet)
                    <?php 
                        $horarios = Horario::where('id','=', $value->idhorario)->get();
                     ?>

                  
          
                    @foreach ($horarios as $h)
                   
                    
                    <tr>
                        <td>{{$valuet->identificacion}}</td>
                        <td>{{$valuet->nombres}} {{$valuet->apellidos}}</td>
                         <td>{{$valuet->fechareserva}} - {{$valuet->diasemana}} - {{$valuet->horareserva}}</td>
                            <td> {{$h->nombre}}</td>
                             <td> {{$h->tipoatencion}}</td>
                     <!--    <td align="center">
                            <div class="demo-btn">

                                <a href = '{!! route('especialidades.edit', [$value->id]) !!}' class = 'btn btn-warning'><i class="fa fa-edit"></i></a>

                                <a href="{!! route('especialidades.delete', [$value->id]) !!}" class = 'btn btn-primary' onclick="return confirm('Desea eliminar esta Especialidad?')"><i class="fa fa-bitbucket"></i></a>



                            </div>
                        </td> -->
                    </tr>
                    @endforeach
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class = 'AjaxisModal'>
        </div>
    </div>

<!-- <div class="container">

<table class="table table-striped">
    <thead>
      <tr>
        <th>No Identificación</th>
        <th>Nombres</th>
        <th>Fecha reserva</th>
      </tr>
    </thead>
    <tbody>
     @foreach($reservas as $value)
      <tr>
        <td>{{$value->identificacion}}</td>
          <td>{{$value->nombres}} {{$value->apellidos}}</td>
           <td>{{$value->fechareserva}} - {{$value->diasemana}} - {{$value->horareserva}}</td>
       
      </tr>
     
       @endforeach
    </tbody>
  </table> -->
<!-- @foreach($reservas as $value)
	
<div class="row">
	
	<div class="col-md-4">
		
		<span>
			{{$value->identificacion}}
		</span>


	</div>
	<div class="col-md-4">
		
			<span>
			{{$value->nombres}} {{$value->apellidos}}
		</span>

		
	</div>
	<div class="col-md-4">
		
		<span>
				{{$value->fechareserva}} -- {{$value->horareserva}}
		</span>

		
	</div>
</div>
 @endforeach -->


</div>
@stop
