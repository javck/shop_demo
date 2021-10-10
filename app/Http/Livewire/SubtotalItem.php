<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Darryldecode\Cart\Cart;

class SubtotalItem extends Component
{
    protected $listeners = ['recalcul'];
    public $subtotal = 0;

    public function render()
    {
        $this->recalcul();
        return view('livewire.subtotal-item');
    }

    public function recalcul()
    {
        //重新計算小計的數字
        $this->subtotal = \Cart::session(1)->getSubTotal();
    }
}
