<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{

    public function getCategorias(Request $request)
    {
        $categorias = Categoria::get();
        return response()->json(['data' => $categorias]);
    }

    public function save(Request $request)
    {

        Categoria::insert([
            'descripcion' => $request->descripcion,
            'id_departamento' => $request->iddepartamento
        ]);

        return response()->json();
    }

   public function update(Request $request)
   {
      Categoria::where('id_categoria', $request->idcategoria)
                ->update([
                    'id_departamento' => $request->iddepartamento,
                    'descripcion' => $request->descripcion
                ]);

      return response()->json();
   }

    public function delete(Request $request)
    {
        Categoria::where('id_categoria', $request->idcategoria)
                ->delete();

        return response()->json();
    }

}
