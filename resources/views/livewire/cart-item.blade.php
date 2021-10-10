<tr>
    @if($quantity > 0)
    <td>
      <div class="media">
        <div class="d-flex">
          <img src="{{ Voyager::image($pic) }}" alt="" />
        </div>
        <div class="media-body">
          <p>{!! $title !!}</p>
        </div>
      </div>
    </td>
    <td>
      <h5>${{ $price }}</h5>
    </td>
    <td>
      <div class="product_count">
        <span class="" wire:click="minus"> <i class="ti-minus"></i></span>
        <input class="" type="text" value="{{ $quantity }}" min="0" max="10">
        <span class="" wire:click="plus"> <i class="ti-plus"></i></span>
      </div>
    </td>
    <td>
      <h5>${{ $total}}</h5>
    </td>
    @endif
</tr>
