<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketComentario extends Model
{
    use HasFactory;

    protected $table = 'ticket_comentario';
    protected $primaryKey = 'id_comentario';
    public $timestamps = false;
    // protected $fillable = ['texto', 'id_ticket', 'id_usuario', 'created_at'];

    protected $casts = [
        'created_at' => 'date:d/m/Y H:i'
    ];

    public function usuario()
    {
        return $this->belongsTo(User::class, 'id_usuario', 'id');
    }

    public function archivos()
    {
        return $this->hasMany(TicketComentarioArchivo::class, 'id_comentario', 'id_comentario');
    }

}
