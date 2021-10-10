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
        $this->rowId = $item['id'];
        $this->pic = json_decode($item['associatedModel']['pic'],true)[0];
        $this->title = $item['associatedModel']['title'];
        $this->price = $item['price'];
        $this->quantity = $item['quantity'];
        $this->init();
    }

    public function plus()
    {
        $this->quantity++;
        $this->init();
        //$this->emit('refreshCartItems');
    }

    public function minus()
    {
        $this->quantity--;
        if ($this->quantity <= 0) {
            \Cart::session(1)->remove($this->rowId);
        }else{
            $this->init();
        }
        //$this->emit('refreshCartItems');
    }

    public function init()
    {

        \Cart::session(1)->update($this->rowId, [
                'quantity' => array(
                    'relative' => false,
                    'value' => $this->quantity
                )]);
        $this->total = $this->quantity * $this->price;
        //dd(\Cart::session(1)->getContent());

        $this->emit('recalcul');
    }

    public function render()
    {
        return view('livewire.cart-item');
    }
}
