<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Item;
use App\Models\Order;
use App\Models\User;
use App\Models\OrderItem;
use Darryldecode\Cart\Cart;
use Illuminate\Http\Request;
use TsaiYiHua\ECPay\Checkout;
use Illuminate\Support\Facades\Log;

class SiteController extends Controller
{

    protected $checkout;

    public function __construct(Checkout $checkout)
    {
        $this->checkout = $checkout;
        $this->checkout->setReturnUrl(url('checkout/callback'));
    }


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
        //串接綠界金流做付款
        $formData = [
            'UserId' => 1, // 用戶ID , 非必須
            'ItemDescription' => $order->itemsName, //商品描述，可自己修改
            'ItemName' => 'Goblin Shop Items', //商品名稱，可自己修改
            'TotalAmount' => \Cart::session(1)->getTotal(), //訂單總金額
            'PaymentMethod' => 'Credit', // ALL, Credit, ATM, WebATM
            'CustomField1' => $order->id //自定義欄位1
        ];

        return $this->checkout->setPostData($formData)->send();
    }

    //綠界付完款轉址路由方法
    public function checkoutCallback(Request $request)
    {
        $response = $request->all();
        $order = Order::find($response['CustomField1']);
        if ($response['RtnCode'] == 1) {
            if ($response['PaymentType'] == 'Credit_CreditCard') {
                $order->pay_type = 'credit';
            }else{
                $order->pay_type = $response['PaymentType'];
            }
            $order->trade_no = $response['TradeNo']; //綠界訂單編號
            $order->pay_at = Carbon::now();
            $order->status = 'paid';
            $order->save();
            Log::info('訂單編號' . $order->id . '付款成功');
        } else {
            Log::error('訂單編號' . $order->id . '付款失敗');
        }
        return redirect('/'); //返回首頁
    }
}
