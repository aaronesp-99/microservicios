<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function fn(Request $request)
    {
        return response()->json([
            'message' => 'Sesión cerrada correctamente'
        ]);
    }

}
