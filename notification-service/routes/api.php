<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\NotificationController;

Route::middleware('auth:sanctum')->prefix('notificaciones')->group(function () {
   Route::post('/password-reset', [NotificationController::class, 'resetPassword']);
   Route::post('/ticket-creado', [NotificationController::class, 'ticketCreado']);
   Route::post('/ticket-asignado', [NotificationController::class, 'ticketAsignado']);
   Route::post('/ticket-resuelto', [NotificationController::class, 'ticketResuelto']);
   Route::post('/ticket-reabierto', [NotificationController::class, 'ticketReabierto']);
   Route::post('/ticket-cerrado', [NotificationController::class, 'ticketCerrado']);
});
