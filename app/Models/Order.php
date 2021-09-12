<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = ['owner_id'];

    public function items()
    {
        return $this->belongsToMany(Item::class, 'order_items');
    }
}
