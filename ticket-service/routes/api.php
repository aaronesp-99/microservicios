<?php

use App\Http\Controllers\TicketController;
use App\Http\Controllers\TicketEstadoController;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:sanctum')->group(function () {
   Route::get('/tickets/pendientes', [TicketController::class, 'getPendientes']);
   Route::get('/tickets/asignados', [TicketController::class, 'getAsignados']);
   Route::get('/tickets/solicitados', [TicketController::class, 'getSolicitados']);
   Route::get('/tickets/{id}/seguimiento', [TicketController::class, 'getSeguimiento']);
   Route::post('/tickets', [TicketController::class, 'save']);

   Route::post('/tickets/{id}/asignar', [TicketEstadoController::class, 'asignarTecnico']);
   Route::post('/tickets/{id}/resolver', [TicketEstadoController::class, 'resolverTicket']);
   Route::post('/tickets/{id}/reabrir', [TicketEstadoController::class, 'reabrirTicket']);
   Route::post('/tickets/{id}/cerrar', [TicketEstadoController::class, 'cerrarTicket']);
});
