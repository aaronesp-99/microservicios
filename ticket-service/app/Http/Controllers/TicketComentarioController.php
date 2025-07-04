<?php

namespace App\Http\Controllers;

use App\Models\TicketComentario;
use App\Models\TicketComentarioArchivo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

class TicketComentarioController extends Controller
{

    public function getComentarios(Request $request)
    {
        $user = $request->user();

        $comentarios = TicketComentario::where('id_ticket', $request->id)
                                        ->orderBy('created_at')
                                        ->get()
                                        ->each(function($item) use($user){
                                            $item->soyEmisor = $user->id == $item->id_usuario;
                                        });

        return response()->json(['data' => $comentarios]);
    }


    public function save(Request $request)
    {
        DB::transaction(function () use ($request) {
            $user = $request->user();

            $comentario = new TicketComentario();
            $comentario->texto      = $request->comentario;
            $comentario->id_ticket  = $request->idticket;
            $comentario->id_usuario = $user->id;
            $comentario->created_at = now();
            $comentario->save();
            
            $file = $request->file('file');
            if($file) {
                $uniqueId = Str::uuid();

                $originalName = $file->getClientOriginalName();
                $nombre = pathinfo($originalName, PATHINFO_FILENAME);
                $extension = pathinfo($originalName, PATHINFO_EXTENSION);

                $archivo = new TicketComentarioArchivo();
                $archivo->id_comentario = $comentario->id_comentario;
                $archivo->nombre = $nombre;
                $archivo->ruta = $uniqueId;
                $archivo->extension = $extension;
                $archivo->save();
                $path = 'laravel-drive/' . $uniqueId;
                
                $response = Http::attach(
                                    'file',
                                    fopen($file->getRealPath(), 'r'),
                                    $file->getClientOriginalName()
                                )->post('http://localhost/api/storage/upload', [
                                    'path' => $path
                                ]);

                if (!$response->successful()) {
                    throw new \Exception('Error al subir archivo');
                }
            }
        });

        return response()->json([]);
    }
}
