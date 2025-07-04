<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DepartamentoController;

Route::middleware('auth:sanctum')->group(function () {
   Route::get('/departamentos', [DepartamentoController::class, 'getDepartamentos']);
   Route::post('/departamentos', [DepartamentoController::class, 'save']);
   Route::put('/departamentos/{id}', [DepartamentoController::class, 'update']);
   Route::delete('/departamentos/{id}', [DepartamentoController::class, 'delete']);
});
