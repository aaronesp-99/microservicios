<?php

namespace App\Http\Controllers;

use App\Models\Persona;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class PersonaController extends Controller
{
    public function getUsuarios(Request $request)
    {
        $usuarios = User::select(['id', 'email'])
                    ->with('persona')
                    ->get();

        return response()->json(['data' => $usuarios]);
    }

    public function save(Request $request)
    {
        if(User::where('email', $request->email)->exists()) {
            return response()->json(['error', 'Este correo ya está en uso'], 400);
        }

        DB::transaction(function () use ($request) {
            $password = mt_rand(100000, 999999);
    
            $usuario = new User();
            $usuario->name       = $request->nombres.' '.$request->apepaterno;
            $usuario->email      = $request->email;
            $usuario->password   = Hash::make($password);
            $usuario->created_at = now();
            $usuario->save();
    
            $persona = new Persona();
            $persona->id_usuario  = $usuario->id;
            $persona->nombres      = $request->nombres;
            $persona->apellido_paterno = $request->apepaterno;
            $persona->apellido_materno = $request->apematerno;
            $persona->dni         = $request->dni;
            $persona->celular     = $request->celular;
            $persona->domicilio   = $request->domicilio;
            $persona->sexo        = $request->sexo;
            $persona->id_departamento = $request->iddepartamento;
            $persona->fecha_nacimiento = $request->fecnacimiento;
            $persona->created_at = now();
            $persona->save();

        });

        return response()->json();
    }

    public function update(Request $request, $id)
    {
        DB::transaction(function () use ($request, $id) {
            $usuario = User::findOrFail($id);
            $persona = $usuario->persona;

            if ($request->email && $request->email !== $usuario->email) {
                if (User::where('email', $request->email)->exists()) {
                    abort(400, 'Este correo ya está en uso');
                }
                $usuario->email = $request->email;
            }

            $usuario->name = $request->nombres . ' ' . $request->apepaterno;
            $usuario->updated_at = now();
            $usuario->save();

            $persona->nombres           = $request->nombres;
            $persona->apellido_paterno  = $request->apepaterno;
            $persona->apellido_materno  = $request->apematerno;
            $persona->dni               = $request->dni;
            $persona->celular           = $request->celular;
            $persona->domicilio         = $request->domicilio;
            $persona->sexo              = $request->sexo;
            $persona->id_departamento   = $request->iddepartamento;
            $persona->fecha_nacimiento  = $request->fecnacimiento;
            $persona->updated_at        = now();
            $persona->save();
        });

        return response()->json();
    }

    public function delete(Request $request)
    {
        return response()->json();
    }

}
