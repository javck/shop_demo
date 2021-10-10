<div>
    @if (count($items_cart) > 0)
        @foreach ($items_cart as $item)
            @livewire('cart-item', ['item' => $item], key($item['id']))
        @endforeach
    @endif
</div>
