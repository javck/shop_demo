<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Darryldecode\Cart\Cart;

class CartItem extends Component
{
    public $rowId;
    public $pic;
    public $title;
    public $price;
    public $quantity;
    public $total;

    public function mount($item)
    {
        $this->rowId = $item->id;
        $this->pic = $item->associatedModel->pic;
        $this->title = $item->associatedModel->title;
        $this->price = $item->price;
        $this->quantity = $item->quantity;
        $this->init();
    }

    public function plus()
    {
        $this->quantity++;
        $this->init();
    }

    public function minus()
    {
        if ($this->quantity > 0) {
            $this->quantity--;
            $this->init();
        } else {
            \Cart::session(1)->remove($this->rowId);
        }
    }

    public function init()
    {
        $this->total = $this->price * $this->quantity;
    }

    public function render()
    {
        return view('livewire.cart-item');
    }
}
