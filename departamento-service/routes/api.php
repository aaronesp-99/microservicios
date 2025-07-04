<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DepartamentoController;

Route::middleware('auth:sanctum')->group(function () {
   Route::get('/', [DepartamentoController::class, 'getDepartamentos']);
   Route::post('/', [DepartamentoController::class, 'save']);
   Route::put('/{id}', [DepartamentoController::class, 'update']);
   Route::delete('/{id}', [DepartamentoController::class, 'delete']);
});
