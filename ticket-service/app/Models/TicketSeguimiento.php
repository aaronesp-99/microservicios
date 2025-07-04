<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketSeguimiento extends Model
{
    use HasFactory;

    protected $table = 'tickets.ticket_seguimiento';
    public $timestamps = false;
    
    protected $casts = [
        'created_at' => 'date:d/m/Y'
    ];
}
