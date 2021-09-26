<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = ['owner_id', 'trade_no', 'pay_type', 'pay_at', 'status'];

    public function items()
    {
        return $this->belongsToMany(Item::class, 'order_items');
    }

    public function getItemsNameAttribute()
    {
        $items = $this->items;
        $result = '';
        foreach($items as $item){
            if(strlen($result) == 0){
                $result = $item->title;
            }else{
                $result = $result . ',' . $item->title;
            }
        }
        return $result;
    }
}
