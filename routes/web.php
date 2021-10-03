<?php

use App\Models\User;
use App\Models\Order;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::namespace('App\Http\Controllers')->group(function(){
    Route::get('/', 'SiteController@renderHomePage');
    Route::get('/cart', 'SiteController@renderCartPage')->name('my.cart');
    Route::get('/addcart/{id}','SiteController@addCart');
    Route::get('/queryorder/{id}','SiteController@queryOrder');
    Route::get('/queryinvoice/{order_id}','SiteController@queryInvInfo');
    Route::get('/checkout','SiteController@checkout');
    Route::get('/checkoutinvoice','SiteController@checkoutInvoice');
    Route::post('/checkout/callback','SiteController@checkoutCallback');
    Route::get('orders/{order}',function( Order $order){
        //購買者
        //dd(User::find($order->owner_id)->name);
        //訂單明細
        //dd($order->items);
        $result = '';
        foreach($order->items as $item)
        {
            $result = $result . $item->title . ',';
        }
        dd($result);
    });
});





