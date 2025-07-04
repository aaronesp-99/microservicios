<?php

use App\Http\Controllers\TicketComentarioController;
use App\Http\Controllers\TicketController;
use App\Http\Controllers\TicketEstadoController;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:sanctum')->group(function () {
   Route::get('/pendientes', [TicketController::class, 'getPendientes']);
   Route::get('/asignados', [TicketController::class, 'getAsignados']);
   Route::get('/solicitados', [TicketController::class, 'getSolicitados']);
   Route::get('/{id}/seguimiento', [TicketController::class, 'getSeguimiento']);
   Route::post('/', [TicketController::class, 'save']);

   Route::post('/{id}/asignar', [TicketEstadoController::class, 'asignarTecnico']);
   Route::post('/{id}/resolver', [TicketEstadoController::class, 'resolverTicket']);
   Route::post('/{id}/reabrir', [TicketEstadoController::class, 'reabrirTicket']);
   Route::post('/{id}/cerrar', [TicketEstadoController::class, 'cerrarTicket']);

   Route::get('/{id}/comentarios', [TicketComentarioController::class, 'getComentarios']);
   Route::post('/{id}/comentarios', [TicketComentarioController::class, 'save']);
});
