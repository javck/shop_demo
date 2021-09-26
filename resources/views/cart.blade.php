@extends('layouts.master')

@section('content')
<!-- Hero Area Start-->
<div class="slider-area ">
    <div class="single-slider slider-height2 d-flex align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center">
                        <h2>我的購物車</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================Cart Area =================-->
<section class="cart_area section_padding">
  <div class="container">
    <div class="cart_inner">
      <div class="table-responsive">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">商品名稱</th>
              <th scope="col">價格</th>
              <th scope="col">數量</th>
              <th scope="col">總計</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($items_cart as $item)
                @livewire('cart-item', ['item' => $item])
            @endforeach
            <tr class="bottom_button">
              <td>

              </td>
              <td></td>
              <td></td>
              <td>
                <div class="cupon_text float-right">
                  <a class="btn_1" href="#">優惠券</a>
                </div>
              </td>
            </tr>
            <tr>
              <td></td>
              <td></td>
              <td>
                <h5>小計</h5>
              </td>
              <td>
                <h5>${{ $subtotal }}</h5>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="checkout_btn_inner float-right">
          <a class="btn_1" href="{{ url('/') }}">繼續購物</a>
          <a class="btn_1 checkout_btn_1" href="{{ url('/checkout') }}">結帳</a>
        </div>
      </div>
    </div>
</section>
<!--================End Cart Area =================-->
@stop
