<?php

use Illuminate\Http\Request;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PersonaController;
use Illuminate\Support\Facades\Route;


Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
   Route::post('/logout', [AuthController::class, 'logout']);
   Route::get('/me', function(Request $request) {
      $user = $request->user()->load('persona');
      return response()->json([ 'persona' => $user->persona ]);
   });

   Route::post('/usuarios/{id}/reset-password', [AuthController::class, 'resetPassword']);
   Route::get('/usuarios', [PersonaController::class, 'getusuarios']);
   Route::post('/usuarios', [PersonaController::class, 'save']);
   Route::put('/usuarios/{id}', [PersonaController::class, 'update']);
   
});