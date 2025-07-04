<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use App\Models\TicketSeguimiento;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class TicketEstadoController extends Controller
{

    public function asignarTecnico(Request $request)
    {
        DB::transaction(function () use ($request) {
            $user = $request->user();
            $estado = 'E';
    
            $ticket = Ticket::find($request->id);
            $ticket->estado = $estado;
            $ticket->id_usuario_atiende = $user->id;
            $ticket->updated_at = now();
            $ticket->save();
    
            $seguimiento = new TicketSeguimiento();
            $seguimiento->id_ticket  = $ticket->id_ticket;
            $seguimiento->id_usuario = $user->id;
            $seguimiento->comentario = 'Ticket asignado a Técnico';
            $seguimiento->created_at = now();
            $seguimiento->estado     = $estado;
            $seguimiento->save();
    
            $token = $request->bearerToken();
            $response = Http::withToken($token)
                            ->post('http://localhost/api/notificaciones/ticket-asignado', [
                                'emailSolicitante' => $ticket->usuarioSolicita->email,
                                'emailTecnico'  => $ticket->usuarioAtiende->email,
                                'nombresSolicitante' => $ticket->usuarioSolicita->name,
                                'nombresTecnico' => $ticket->usuarioSolicita->name,
                            ]);
        });

        return response()->json();
    }

    public function resolverTicket(Request $request)
    {
        DB::transaction(function () use ($request) {
            $user = $request->user();
            $estado = 'R';

            $ticket = Ticket::find($request->id);
            $ticket->estado  = $estado;
            $ticket->updated_at  = now();
            $ticket->save();

            $seguimiento = new TicketSeguimiento();
            $seguimiento->id_ticket  = $ticket->id_ticket;
            $seguimiento->id_usuario = $user->id;
            $seguimiento->comentario = 'Ticket Resuelto';
            $seguimiento->created_at = now();
            $seguimiento->estado     = $estado;
            $seguimiento->save();
        
            $token = $request->bearerToken();
            $response = Http::withToken($token)
                            ->post('http://localhost/api/notificaciones/ticket-resuelto', [
                                'emailSolicitante' => $ticket->usuarioSolicita->email,
                                'emailTecnico'  => $ticket->usuarioAtiende->email,
                                'nombresSolicitante' => $ticket->usuarioSolicita->name,
                                'nombresTecnico' => $ticket->usuarioSolicita->name,
                            ]);        
        });

        return response()->json();
    }

    public function reabrirTicket(Request $request)
    {
        DB::transaction(function () use ($request) {
            $user = $request->user();
            $estado = 'E';

            $ticket = Ticket::find($request->id);
            $ticket->estado  = $estado;
            $ticket->updated_at  = now();
            $ticket->save();

            $seguimiento = new TicketSeguimiento();
            $seguimiento->id_ticket  = $ticket->id_ticket;
            $seguimiento->id_usuario = $user->id;
            $seguimiento->comentario = 'Ticket Reabierto';
            $seguimiento->created_at = now();
            $seguimiento->estado     = $estado;
            $seguimiento->save();

            $token = $request->bearerToken();
            $response = Http::withToken($token)
                            ->post('http://localhost/api/notificaciones/ticket-reabierto', [
                                'emailSolicitante' => $ticket->usuarioSolicita->email,
                                'emailTecnico'  => $ticket->usuarioAtiende->email,
                                'nombresSolicitante' => $ticket->usuarioSolicita->name,
                                'nombresTecnico' => $ticket->usuarioSolicita->name,
                            ]);
        });

        return response()->json();
    }

    public function cerrarTicket(Request $request)
    {
        DB::transaction(function () use ($request) {
            $user = $request->user();
            $estado = 'C';

            $ticket = Ticket::where('id_ticket', $request->id)
                            ->where('estado', 'R')
                            ->first();

            $ticket->estado  = $estado;
            $ticket->updated_at  = now();
            $ticket->save();

            $seguimiento = new TicketSeguimiento();
            $seguimiento->id_ticket  = $ticket->id_ticket;
            $seguimiento->id_usuario = $user->id;
            $seguimiento->comentario = 'Ticket Cerrado';
            $seguimiento->created_at = now();
            $seguimiento->estado     = $estado;
            $seguimiento->save();
           
            $token = $request->bearerToken();
            $response = Http::withToken($token)
                            ->post('http://localhost/api/notificaciones/ticket-cerrado', [
                                'emailSolicitante' => $ticket->usuarioSolicita->email,
                                'emailTecnico'  => $ticket->usuarioAtiende->email,
                                'nombresSolicitante' => $ticket->usuarioSolicita->name,
                                'nombresTecnico' => $ticket->usuarioSolicita->name,
                            ]);        
        });

        return response()->json();
    }


}
