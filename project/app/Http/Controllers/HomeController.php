<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index() {
        $categories = DB::table('category')->get();
        $products = DB::table('product')
        ->join('image as i','i.id_product','=','product.id')
        ->select('i.*', 'product.*')
        ->get();
        return view('index', compact('categories', 'products'));
    }
    public function productsPage() {
        $categories = DB::table('category')->get();

        $products = DB::table('product')->get();
        return view('productsPage', compact('categories', 'products'));
    }
    public function home() {
        return view('home');
    }
}
