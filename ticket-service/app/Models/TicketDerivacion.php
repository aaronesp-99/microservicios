<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketDerivacion extends Model
{
    use HasFactory;

    protected $table = 'ticket_derivacion';
    protected $primaryKey = 'id_derivacion';
    public $timestamps = false;

    protected $casts = [
        'created_at' => 'date:d/m/Y H:i'
    ];


}
