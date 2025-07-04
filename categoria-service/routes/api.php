<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriaController;

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/', [CategoriaController::class, 'getCategorias']);
    Route::post('/', [CategoriaController::class, 'save']);
    Route::put('/{idcategoria}', [CategoriaController::class, 'update']);
    Route::delete('/{idcategoria}', [CategoriaController::class, 'delete']);
});