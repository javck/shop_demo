<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;

class SiteController extends Controller
{
    public function renderHomePage() {
        $items_popular = Item::where('sort',1)->get();
        return view('index',compact('items_popular'));
    }
}
