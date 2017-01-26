<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HorarioReserva extends Model
{
    public $timestamps = true;
    protected $table = 'horarioreserva';
    protected $primarykey = 'id';
    protected $fillable = ['tipoid','identificacion', 'eps','nombres', 'apellidos', 'direccion', 'telefono', 'idhorario', 'fechareserva', 'horareserva', 'diasemana', 'estado'];
}
