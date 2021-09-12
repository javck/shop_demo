<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Order;
use App\Models\OrderItem;
use Darryldecode\Cart\Cart;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    public function renderHomePage()
    {
        $items_popular = Item::where('sort', 1)->get();
        return view('index', compact('items_popular'));
    }

    public function renderCartPage()
    {
        $items_cart = \Cart::session(1)->getContent();
        $subtotal = \Cart::session(1)->getSubTotal();
        return view('cart', compact('items_cart', 'subtotal'));
    }

    public function addCart($id)
    {
        $item = Item::find($id);
        if ($item) {
            \Cart::session(1)->add([
                'id' => $item->id,
                'name' => $item->title,
                'price' => $item->price,
                'quantity' => 1,
                'attributes' => array(),
                'associatedModel' => $item
            ]);
        }
        return redirect(url()->previous());
    }

    public function checkout()
    {
        //建立訂單&明細
        $items_cart = \Cart::session(1)->getContent();
        $order = Order::create([
            'owner_id' => 1
        ]);
        foreach ($items_cart as $item_cart) {
            OrderItem::create(['order_id' => $order->id, 'item_id' => $item_cart->id, 'qty' => $item_cart->quantity]);
        }


        //串接金流做付款
        //智偉 ??
        return redirect('/');
    }
}
