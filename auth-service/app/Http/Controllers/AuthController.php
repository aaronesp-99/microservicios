<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        $user = User::where('email', $request->email)->first();
        if(!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // $user->tokens()->delete();
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Sesión cerrada correctamente'
        ]);
    }

    public function resetPassword(Request $request)
    {
        $usuario = User::findOrFail($request->id);
        
        $password = mt_rand(100000, 999999);
        $usuario->password   = Hash::make($password);
        $usuario->save();

        $token = $request->bearerToken();
        $response = Http::withToken($token)
                        ->post('http://localhost/api/notificaciones/password-reset', [
                                'email'    => $usuario->email,
                                'nombres'  => $usuario->name,
                                'password' => $password
                        ]);
        
        return response()->json();
    }

    public function loginGoogle(){}
    public function redirectGoogle(){}

}
