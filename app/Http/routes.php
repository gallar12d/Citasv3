<?php

use App\Http\Middleware\Authenticate;






 


Route::group(['middleware' => 'web'], function () {
    Route::auth();
    Route::get('/home', 'HomeController@index');
    Route::get('/home', function () {
    return view('home');
})->middleware('auth');

//empresa Resources
/********************* empresa ***********************************************/
Route::resource('empresa','EmpresaController');
Route::post('empresa/{id}/update','EmpresaController@update');
Route::get('empresa/{id}/delete','EmpresaController@destroy');
Route::get('empresa/{id}/deleteMsg','EmpresaController@DeleteMsg');
/********************* empresa ***********************************************/
//Route::get('/api/v13/employees444/obtdepto','')
Route::post('/api/v13/employees/obtenerdepto',
'UsuarioController@showdepto');
Route::post('/api/v13/employees/obtenermunic',
'UsuarioController@showmunic');
/* Rutas Afiliaciones */
Route::resource('afiliaciones','AfiliacionController');
Route::post('afiliaciones/{id}/update','AfiliacionController@update');
Route::get('afiliaciones/{id}/delete','AfiliacionController@destroy');
Route::get('afiliaciones/{id}/delete', [ 'as' => 'afiliaciones.delete', 'uses' => 'AfiliacionController@destroy' ]);
Route::post('/api/v13/afiliaciones/crear','AfiliacionController@crearvarios');



/* Rutas Afiliaciones */

/* Rutas especialidades */
Route::resource('especialidades','EspecialidadController');
Route::post('especialidades/{id}/update','EspecialidadController@update');
Route::get('especialidades/{id}/delete','EspecialidadController@destroy');
Route::get('especialidades/{id}/delete', [ 'as' => 'especialidades.delete', 'uses' => 'EspecialidadController@destroy' ]);

/* Rutas especialidades  */

//medico Resources
/********************* medico ***********************************************/
Route::resource('medico','MedicoController');
Route::post('medico/{id}/update','MedicoController@update');
Route::get('medico/{id}/delete','MedicoController@destroy');
Route::get('medico/{id}/delete', [ 'as' => 'medico.delete', 'uses' => 'MedicoController@destroy' ]);


//Eventos Calendario
Route::resource('calendario','CalendarController');
Route::get('cargaEventos{id?}','CalendarController@index');
Route::post('guardaEventos', array('as' => 'guardaEventos','uses' => 'CalendarController@create'));
Route::post('actualizaEventos','CalendarController@update');
Route::post('eliminaEvento','CalendarController@delete');
Route::post('calendario', [ 'as' => 'calendario.agendamiento', 'uses' => 'CalendarController@agendamiento' ]);

//Agenda doctores
Route::resource('agendamiento','AgendadoctorController');
Route::post('/api/v13/agendamiento/crearagendamiento',
'AgendadoctorController@crearAgendamiento');
Route::post('/api/v13/agendamiento/obtenerHorario',
'AgendadoctorController@obtenerHorario');
Route::post('agendamiento', [ 'as' => 'doctores.agendamiento', 'uses' => 'AgendadoctorController@agendamiento' ]);
Route::post('/api/v13/agendamiento/crearagenda',
'AgendadoctorController@creacion');
Route::post('/api/v13/agendamiento/creacionagenda',
'AgendadoctorController@creacionagenda');
Route::post('/api/v13/agendamiento/insertaragenda',
'AgendadoctorController@insertaragenda');
Route::post('/api/v13/reservas/creareserva',
'HorarioreservaController@crearReserva');
Route::get('medico/api/v13/medico/obtenermunic',
'MedicoController@showmunic');

Route::get('/Horarioreserva',
'HorarioreservaController@index');
Route::post('/api/v13/reservas/deletereserva',
'HorarioreservaController@deleteReserva');
Route::get('/lista','AgendadoctorController@lista');
Route::get('/salir', function(){

    Auth::logout();
    return redirect()->back();
});

Route::get('dapi/usuario/obtenerlogin', function () {

    if (Auth::check()) {
    return 1;
}
else
{
    return 0;
}



});



Route::get('medico/{id}/show','MedicoController@show');
/********************* medico ***********************************************/

Route::get('avatars/{avatar}', function ($avatar = null) {
    $url = storage_path() . "/app/public/avatars/{$avatar}";
    if (file_exists($url)) {
        return Response::download($url);
    }
});



Route::group(['prefix' => 'admin'], function(){
Route::resource('/user', 'UserController');
Route::resource('/post', 'PostController');
   });

});

Route::group(['middleware' => 'web'], function () {
Route::auth();
Route::group(['prefix' => 'admin', 'middleware' => ['auth']], function(){
Route::resource('users','UserController');
Route::resource('roles','RoleController');
Route::controller('permisos','PermissionController');
 });
  });
