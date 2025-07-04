<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TicketComentarioController;

Route::middleware('auth:sanctum')->group(function () {
   Route::get('/ticket-comentarios/{id}', [TicketComentarioController::class, 'getComentarios']);
   Route::post('/ticket-comentarios', [TicketComentarioController::class, 'save']);

});
