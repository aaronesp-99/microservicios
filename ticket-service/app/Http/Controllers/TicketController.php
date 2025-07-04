<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Ticket;
use App\Models\TicketSeguimiento;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class TicketController extends Controller
{

    public function getPendientes(Request $request)
    {
        $token = $request->bearerToken();
        $response = Http::withToken($token)
                        ->get('http://localhost/api/auth/me');

        $persona = $response->json()['persona'];

        $tickets = Ticket::with('categoria')
                        ->where('estado', 'P')
                        ->where('id_departamento', $persona['id_departamento'])
                        ->whereNull('id_usuario_atiende')
                        ->get();

        return response()->json(['data' => $tickets]);
    }

    public function getAsignados(Request $request)
    {
        $token = $request->bearerToken();
        $response = Http::withToken($token)
                        ->get('http://localhost/api/auth/me');

        $persona = $response->json()['persona'];

        $tickets = Ticket::with('categoria')
                        ->whereIn('estado', ['E', 'R'])
                        ->where('id_departamento', $persona['id_departamento'])
                        ->where('id_usuario_atiende', $request->user()->id)
                        ->get();

        return response()->json(['data' => $tickets]);
    }

    public function getSolicitados(Request $request)
    {
        $tickets = Ticket::with('categoria')
                        ->whereIn('estado', ['P', 'E', 'R', 'C'])
                        ->where('id_usuario_solicita', $request->user()->id)
                        ->get();

        return response()->json(['data' => $tickets]);
    }

    public function getSeguimiento(Request $request)
    {
        $seguimiento = TicketSeguimiento::where('id_ticket', $request->id)
                                       ->orderBy('created_at')
                                       ->get();

        return response()->json(['data' => $seguimiento]);
    }

    public function save(Request $request)
    {
        DB::transaction(function () use ($request) {
            $user  = $request->user();
    
            $categoria = Categoria::find($request->idcategoria);
            
            $estado = 'P';
            $ticket = new Ticket();
            $ticket->asunto          = $request->asunto;
            $ticket->descripcion     = $request->descripcion;
            $ticket->id_categoria    = $categoria->id_categoria;
            $ticket->id_departamento = $categoria->id_departamento;
            $ticket->estado          = $estado;
            $ticket->prioridad       = $request->prioridad;
            $ticket->id_usuario_solicita = $user->id;
            $ticket->created_at = now();
            $ticket->save();
    
            $seguimiento = new TicketSeguimiento();
            $seguimiento->id_ticket  = $ticket->id_ticket;
            $seguimiento->id_usuario = $user->id;
            $seguimiento->comentario = 'Ticket Registrado';
            $seguimiento->created_at = now();
            $seguimiento->estado     = $estado;
            $seguimiento->save();
    
            $token = $request->bearerToken();
            $response = Http::withToken($token)
                            ->post('http://localhost/api/notificaciones/ticket-creado', [
                                'email'    => $user->email,
                                'nombres'  => $user->name
                            ]);
        });

        return response()->json();
    }

}
