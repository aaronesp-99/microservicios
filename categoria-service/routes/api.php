<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriaController;

Route::middleware('auth:sanctum')->group(function () {
   Route::get('/categorias', [CategoriaController::class, 'getCategorias']);
   Route::post('/categorias', [CategoriaController::class, 'save']);
   Route::put('/categorias/{idcategoria}', [CategoriaController::class, 'update']);
   Route::delete('/categorias/{idcategoria}', [CategoriaController::class, 'delete']);
});
