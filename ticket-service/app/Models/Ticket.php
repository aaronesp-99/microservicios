<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

    protected $table = 'tickets';
    protected $primaryKey = 'id_ticket';
    protected $casts = [
        'created_at' => 'date:d/m/Y',
        'updated_at' => 'date:d/m/Y'
    ];
    protected $fillable = [
        'estado', 'asunto', 'id_usuario_atiende', 'updated_at', 'created_at'
    ];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'id_categoria', 'id_categoria');
    }

    // public function comentarios()
    // {
    //     return $this->hasMany(TicketComentario::class, 'id_ticket', 'id_ticket');
    // }

    public function usuarioSolicita()
    {
        return $this->belongsTo(User::class, 'id_usuario_solicita', 'id');
    }

    public function usuarioAtiende()
    {
        return $this->belongsTo(User::class, 'id_usuario_atiende', 'id');
    }
}
