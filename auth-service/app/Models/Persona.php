<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
   use HasFactory;
   
   protected $table = 'personas';
   protected $primaryKey = 'id_persona';
   public $timestamps = false;
   
}
