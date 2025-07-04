<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\GoogleDriveController;

Route::middleware('auth:sanctum')->group(function () {
   Route::post('/upload', [GoogleDriveController::class, 'uploadFile']);
   Route::get('/get', [GoogleDriveController::class, 'getFile']);
   Route::get('/download/{id}', [GoogleDriveController::class, 'downloadFile']);
});