<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Agendadoctor;
use App\Agendamiento;
use App\Afiliacion;
use App\Medico;
use App\Horario;
use DateTime;
use DateInterval;


class AgendadoctorController extends Controller
{
     public function __construct()
    {
       $this->middleware('auth',  ['except' => ['lista']]);
    }


public function index(){

    $medicos = Medico::all();
    $agenda = Agendadoctor::all();
    return view('agendadoctor.index', compact('medicos','agenda'));

}


public function creacion(Request $request){

  $data =($_POST['param1']);
  $data2 = ($_POST['param2']);

      Agendadoctor::create([
        'medico_id' => $data,
        'start' => $data2

      ]);
       return response()->json([
          "mensaje" => "creado"
        ]);



}


public function creacionagenda(Request $request){

if (isset($_POST['process'])) {
#---------------------------------------------------------------------------------------------------

// Var Process
$process = $_POST['process'];


if ($process == 1) {
#---------------------------------------------------------------------------------------------------

// Dias
$dias = explode(',', $_POST['days']);
$pd =  strip_tags($_POST['pd']);
$ud =  strip_tags($_POST['ud']);

// if($pd>$ul){
// $estemes = date("m", strtotime("+1 month"));
// }
// else{
//   $estemes = date("m");
// }
$estemes = date("m");

$esteano = date("y");
$semana = "Semana del ".$pd."/".$estemes."/".$esteano." al ".$ud."/".$estemes."/".$esteano;
// echo $semana;
$ndias= sort($dias, SORT_NUMERIC ); 


// Contar dias
$countdays = count($dias);

$name = strip_tags($_POST['nombre']);
$tipoatencion = strip_tags($_POST['tipoAtencion']);


// Acomodar Dias
echo'
<h3 class="horario-name"><i class="fa fa-calendar" aria-hidden="true"></i> '.$name.'</h3>
<h3 id="tipoatencion"> '.$tipoatencion.'</h3>
<h3 id="semana"> '.$semana.'</h3>
<input style="display: none;" id="pd" name="pd" size="50" type="text" value="'.$pd.'">
<input style="display: none;" id="ud" name="ud" size="50" type="text" value="'.$ud.'">

<table id="thetable" class="table table-bordered">
<thead class="thead">
<th class="horarioheader"><i class="fa fa-clock-o"></i> Horario</th>
';
for ($i=0; $i < $countdays; $i++) {
 if ($dias[$i] == 1) {
  echo '<th><i class="fa fa-angle-right"></i> Lunes</th>';
 }elseif ($dias[$i] == 2){
  echo '<th><i class="fa fa-angle-right"></i> Martes</th>';
 }elseif ($dias[$i] == 3){
  echo '<th><i class="fa fa-angle-right"></i> Miercoles</th>';
 }elseif ($dias[$i] == 4){
  echo '<th><i class="fa fa-angle-right"></i> Jueves</th>';
 }elseif ($dias[$i] == 5){
  echo '<th><i class="fa fa-angle-right"></i> Viernes</th>';
 }elseif ($dias[$i] == 6){
  echo '<th><i class="fa fa-angle-right"></i> Sabado</th>';
 }elseif ($dias[$i] == 7){
  echo '<th><i class="fa fa-angle-right"></i> Domingo</th>';
 }
}
echo '
</thead>
<tbody>';

///////////////////////////////////////////////////////
// Hora Inicio 24 Horas
$inicio24 = date('G:i', strtotime($_POST['tiempo1']));

// Hora Final 24 Horas
$final24 = date('G:i', strtotime($_POST['tiempo2']));
///////////////////////////////////////////////////////
function resum($in,$fin,$minutos,$columnas){
$time = new DateTime($in);
$time->add(new DateInterval('PT' . $minutos . 'M'));
$stamp = $time->format('h:i a');
$format24 = $time ->format('G:i');

$uniq = str_replace(' ', '', str_replace(':', '', $stamp));
$reverse = strrev($uniq);
echo '<tr id="tr'.sha1($in).'">
<td class="td-time">
<div id="parent'.sha1($in).'" class="timeblock">
<strong id="data'.sha1($in).'">'.date('h:i a', strtotime($in)). ' - ' .$stamp.'</strong>
<button data-time="'.sha1($in).'" class="changethetime btn btn-primary btn-xs pull-right"><i class="fa fa-pencil"></i></button>
</div>

<div id="edit'.sha1($in).'" class="hideedittime text-center">
  <input id="input'.sha1($in).'" type="text" class="form-control" value="'.date('h:i a', strtotime($in)). ' - ' .$stamp.'"><p></p><button data-save="'.sha1($in).'" class="savetime btn btn-block btn-xs btn-primary"><i class="fa fa-floppy-o"></i> Guardar</buttton><button data-block="'.sha1($in).'" class="deleteblock btn btn-block btn-xs btn-warning"><i class="fa fa-ban"></i> Eliminar </button><button class="canceledit btn btn-block btn-xs btn-danger"><i class="fa fa-times"></i> Cancelar</buttton>
</div>

</td>';

for ($i=1; $i < $columnas; $i++) {
  echo'
       <td class="td-line">
         <div id="'.$reverse.$i.'" class="col-sm-12 nopadding"></div>
         <div class="col-sm-12 text-center">
            <button style ="display: none;" id="edit-'.$reverse.$i.'" data-row="'.$reverse.$i.'" class="  addinfo btn btn-xs btn-primary"><i class="fa fa-plus"></i></button>
         </div>
      </td>
  ';
}

echo '</tr>';
sumtime($format24,$fin,$minutos,$columnas);
}
function sumtime($in,$fin,$minutos,$columnas){
$parse1 = new DateTime($in);
$parse2 = new DateTime($fin);
if ($parse2 <= $parse1){
  return;
}else{
$time = new DateTime($in);
$time->add(new DateInterval('PT' . $minutos . 'M'));
$stamp = $time->format('h:i a');
$format24 = $time ->format('G:i');
$uniq = str_replace(' ', '', str_replace(':', '', $stamp));
$reverse = strrev($uniq);

echo '<tr id="tr'.sha1($in).'">

<td class="td-time">

<div id="parent'.sha1($in).'" class="timeblock">
<strong id="data'.sha1($in).'">'.date('h:i a', strtotime($in)). ' - ' .$stamp.'</strong>
<button data-time="'.sha1($in).'" class="changethetime btn btn-primary btn-xs pull-right"><i class="fa fa-pencil"></i></button>
</div>

<div id="edit'.sha1($in).'" class="hideedittime text-center">
  <input id="input'.sha1($in).'" type="text" class="form-control" value="'.date('h:i a', strtotime($in)). ' - ' .$stamp.'"><p></p><button data-save="'.sha1($in).'" class="savetime btn btn-block btn-xs btn-primary"><i class="fa fa-floppy-o"></i> Guardar</buttton><button data-block="'.sha1($in).'" class="deleteblock btn btn-block btn-xs btn-warning"><i class="fa fa-ban"></i> Eliminar </button><button class="canceledit btn btn-block btn-xs btn-danger"><i class="fa fa-times"></i> Cancelar</buttton>
</div>

</td>';
for ($i=1; $i < $columnas; $i++) {
  echo'
       <td class="td-line">
         <div  id="'.$reverse.$i.'" class="col-sm-12 nopadding"></div>
         <div class="col-sm-12 text-center">
            <button style ="display: none;" id="edit-'.$reverse.$i.'" data-row="'.$reverse.$i.'" class="addinfo btn btn-xs btn-primary"><i class="fa fa-plus"></i></button>
         </div>
      </td>
  ';
}
echo'</tr>';
    resum($format24,$fin,$minutos,$columnas);
  }
}
///////////////////////////////////////////////////////
sumtime($inicio24,$final24,$_POST['minutos'],$countdays);
///////////////////////////////////////////////////////
echo '</tbody></table>

<input type="hidden" id="descripcioninput" value="'.$_POST['descripcion'].'">
<input type="hidden" id="nombreinput" value="'.$_POST['nombre'].'">

<button class="guardarhorario btn btn-lg btn-success pull-right"><i class="fa fa-floppy-o"></i> Guardar</button>
<button type="button"  id ="canceltask"class="canceltask btn btn-danger" data-dismiss="modal" data-backdrop="false"><i class="fa fa-times"></i> Cancelar</button>



';


#--------------------------------------------------------------------------------------------------
}elseif ($process == 2) {
#--------------------------------------------------------------------------------------------------

if(empty($_POST['nombre']) || empty($_POST['horario']) || empty($_POST['descripcion'])){
  exit();
}
if(ctype_space($_POST['nombre']) || ctype_space($_POST['horario']) || ctype_space($_POST['descripcion'])){
  exit();
}
}

}
}


public function insertaragenda(Request $request)
{

$fecha = date('Y-m-d');
$data = $_POST['horario'];
$nombre = $_POST['nombre'];
$tipoatencion = $_POST['tipoatencion'];
$descripcion = $_POST['descripcion'];
// $semana = $_POST['descripcion'];
$pd = $_POST['pd'];
$ud = $_POST['ud'];
$estemes = date("m");
$esteano = date("y");
$semana = "Semana del ".$pd."/".$estemes."/".$esteano." al ".$ud."/".$estemes."/".$esteano;
// echo $pd;
// echo $pd;

Horario::create([
  'nombre' => $nombre,
  'descripcion' => $descripcion,
   'tipoatencion' => $tipoatencion,
  'horario' => $data,
  'semana' => $semana,
  'fecha' => $fecha,
  'primerdia' => $pd,
  'ultimodia' => $ud
  ]);
  return response()->json([
 "mensaje" => "creado"
  ]);

}
public function crearAgendamiento(Request $request){

  $data =($_POST['param1']);
  $data2 = ($_POST['param2']);

foreach ($data2 as $key => $value) {

      Agendadoctor::create([
        'medico_id' => $data,
        'start' => $value

      ]);
       return response()->json([
          "mensaje" => "creado"
        ]);
}


}

public function lista()
{
  $medicos = Medico::all();
   $afiliaciones = Afiliacion::all();
    //$agenda = Agendadoctor::all();
  return view('agendadoctor.lista', compact('medicos', 'afiliaciones'));
}




public   function obtenerHorario (Request $request){
$id =($_POST['id']);
//hacer consulta para q traiga los horarios no trabajados con este Id
//SELECT start FROM `agendadoctores` WHERE `medico_id` = 2
print_r (
      json_encode (

      $start = Agendadoctor::select('start')->where('medico_id', '=', $id)->get()

)
      );
}





}
