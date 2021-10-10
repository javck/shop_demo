<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Darryldecode\Cart\Cart;

class CartItems extends Component
{
    public $items_cart;


    public function render()
    {
        $this->items_cart = \Cart::session(1)->getContent()->toArray();
        return view('livewire.cart-items');
    }
}
