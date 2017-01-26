<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\HorarioReserva;
use App\Horario;
// use App\HorarioReserva;
use Illuminate\Support\Facades\DB;

class HorarioreservaController extends Controller
{

      function __construct()
   {
        
          $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
     $hoy = date("y-m-d"); 
         $reservas = HorarioReserva::where('estado','=','activo')->whereRaw('fechareserva >= CURDATE()')->orderBy('fechareserva')->get();
                

          
            return view('horarioreserva.index', compact('reservas'));
    }




    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function deleteReserva(Request $request){

        $idhorario = $_POST['idhorario'];
        $identificacion =  $_POST['identificacion'];
        $horareserva = $_POST['hora'];
        $dia = $_POST['nombredia'];


        Horarioreserva::where('idhorario','=',trim($idhorario))->where('identificacion','=',trim($identificacion))->where('horareserva','=',trim($horareserva))->where('diasemana','=',trim($dia))->update(['estado' => 'borrada']);
    }

     public function crearReserva(Request $request)
    {

        // echo $request;
        // echo ( $_POST['tipoid']);

        // $users = DB::table('users')->where('votes', 100)->get();
  
        $tipoid =  $_POST['tipoid'];
            $numeroid =  $_POST['numeroid'];
         $eps =  $_POST['eps'];
        
         $nombres =  $_POST['nombres'];
        
         $apellidos =  $_POST['apellidos'];
        
         $direccion =  $_POST['direccion'];
         $telefono =  $_POST['telefono'];
         $idhorario =  $_POST['elidhorario'];
         $dia= $_POST['eldia'];
         $horareserva = $_POST['lahora'];
         $horareserva = trim($horareserva);

         $numdia=trim($dia);

         switch (trim($dia)) {
            case "Lunes":
                $numdia = 1;
                break;
                case "Martes":
                $numdia = 2;
                break;
                case "Miercoles":
                $numdia = 3;
                break;
                case "Jueves":
                $numdia = 4;
                break;
                case "Viernes":
                $numdia = 5;
                break;
                case "Sabado":
                $numdia = 6;
                break;
                case "Domingo":
                $numdia = 7;
                break;
            
}



// dd($numdia);


          // $users = DB::table('horarios')->get();
           // $pd = DB::table('horarios')->where('id', $idhorario)->get();

           
           $horarios= DB::table('horarios')->where('id', '=', $idhorario)->get();

         foreach ($horarios as $h ) {
            
            $pd = $h->primerdia;
            // $ud = $h->ultimodia;
   
         }

         $diareserva = (int)$pd + (int)$numdia -1;
         $estemes = date("m");
          $diames  = cal_days_in_month(CAL_GREGORIAN, date("n"), date("Y"));
         // if(sumadias  > cuenta de este mes) entonces pasa al otro mes
         if($diareserva > $diames)
         {

            $estemes = date("m")+1;
            $diareserva = $diareserva - $pd - 1;

         }


         // $fechareserva = "'".$diareserva."'/'".$estemes."'/'".date("Y")."'";
          // $fechareserva = "" .$diareserva. "-".$estemes."-".date("Y");
                $fechareserva = "".date("Y")."-".$estemes."-".$diareserva;

         //armar la fecha ya tenemos primer dia, ultimo dia y el numero del dia 




        
        HorarioReserva::create([
        'tipoid' => $tipoid,
        'identificacion' => $numeroid,
        'eps' => $eps,
        'nombres' => $nombres,
        'apellidos' => $apellidos,
        
        'direccion'=> $direccion,
        'telefono' => $telefono,
        'idhorario' => $idhorario,
        'fechareserva' => $fechareserva,
        'horareserva'  =>  $horareserva,
        'diasemana' => trim($dia),
        'estado' => 'activo'
        // 'start' => $value

      ]);


          
      //   echo $request;
    }

           public function todasReservas()
    {
     // $hoy = date("y-m-d"); 
         
        $reservas = HorarioReserva::where('estado','=','activo')->orderBy('fechareserva')->get();

          
            return view('horarioreserva.index', compact('reservas'));
    }
}
