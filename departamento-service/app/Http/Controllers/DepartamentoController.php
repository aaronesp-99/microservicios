<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use App\Models\Departamento;
use Illuminate\Http\Request;

class DepartamentoController extends Controller
{

    public function getDepartamentos(Request $request)
    {
        $departamentos = Departamento::get();
        return response()->json(['data' => $departamentos]);
    }

    public function save(Request $request)
    {
        Departamento::insert([
            'descripcion' => $request->descripcion,
        ]);

        return response()->json();
    }

    public function update(Request $request)
    {
        Departamento::where('id_departamento', $request->id)
                    ->update(['descripcion' => $request->descripcion]);

        return response()->json();
    }

    public function delete(Request $request)
    {
        Departamento::where('id_departamento', $request->id)
                    ->delete();

        return response()->json();
    }

}
