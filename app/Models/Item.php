<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    public function getPicUrlAttribute()
    {
        return json_decode($this->pic, true)[0];
    }
}
