<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketComentarioArchivo extends Model
{
    use HasFactory;

    protected $table = 'ticket_comentario_archivos';
    public $timestamps = false;
}
