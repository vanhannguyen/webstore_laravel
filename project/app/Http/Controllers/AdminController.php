<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index() {
        return view('admin.index');
    }
    public function login() {
        return view('login');
    }
    public function check_login()
    {
        request()->validate([
            'email'=>'required|email|exists:customer,email',
            'password'=>'required',
        ]);
        $data = request()->only('email','password');
        if(auth()->attempt($data)){
            return redirect()->route('admin.index');
        }
        return redirect()->back();

    }
    public function register() {
        return view('register');
    }
    public function check_register()
    {
        request()->validate([
            'name'=>'required',
            'email'=>'required|email|unique:customer,email',
            'password'=>'required',
            'confirm_password'=>'required|same:password',
        ]);
        $data = request()->only('email','name');
        $data ['password'] = bcrypt(request('password'));
        Customer::create($data);
        return redirect()->route('login');
    }

    public function createCategory() {
        $categories = DB::table('category')->get();
        return view('admin.createCategory', compact('categories'));
    }
    public function storeCategory(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:100',
            'status' => 'required|integer',
        ]);

        DB::table('category')->insert($validatedData);

        return redirect()->route('admin.index')->with('success', 'Category created successfully');
    }

    public function createProduct() {
        $brands = DB::table('brand')->get();
        $categories = DB::table('category')->get();
        $products = DB::table('product as p')
    ->join('product_detail', 'p.id', '=', 'product_detail.product_id')
    ->join('brand', 'p.id_brand', '=', 'brand.id')
    ->join('image as i','i.id_product','=','p.id')
    ->select('p.*', 'product_detail.quantity as quantity', 'brand.name as brand_name', 'i.image_file as image')
    ->get();
    // dd($products);
        return view('admin.createProduct', compact('products', 'brands', 'categories'));
    }

    public function storeProduct(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:200',
            'mo_ta' => 'required|string|max:250',
            'thong_tin' => 'required|string',
            'price' => 'required|numeric',
            'quantity' => 'required',
            'status' => 'required',
            'id_brand' => 'required|exists:brand,id',
            'id_category' => 'required|exists:category,id',
        ]);

        if($request->has('file_upload')) {
            $file = $request->file_upload;
            $filename = $file->getClientOriginalName();
            $file->move(public_path('uploads'), $filename);
        }
        $request->merge(['image' => $filename]);
        $product_id = DB::table('product')->insertGetId([
            'name' => $validatedData['name'],
            'mo_ta' => $validatedData['mo_ta'],
            'thong_tin' => $validatedData['thong_tin'],
            'price' => $validatedData['price'],
            'status' => $validatedData['status'],
            'id_brand' => $validatedData['id_brand'],
            'id_category' => $validatedData['id_category'],
        ]);
        // Insert quantity into the 'product_detail' table
        DB::table('product_detail')->insert([
            'product_id' => $product_id,
            'quantity' => $validatedData['quantity'],
        ]);
        DB::table('image')->insert([
            'id_product' => $product_id,
            'image_file' => $filename,
        ]);
        return redirect()->route('admin.index')->with('success', 'Product created successfully');
    }

    public function editProduct($id)
{
    $categories = DB::table('category')->get();
    $brands = DB::table('brand')->get();
    $product = DB::table('product as p')
    ->join('product_detail', 'p.id', '=', 'product_detail.product_id')
    ->join('brand', 'p.id_brand', '=', 'brand.id')
    ->select('p.*', 'product_detail.quantity as quantity', 'brand.name as brand_name')
    ->where('p.id', $id)
    ->first();
    return view('admin/editProduct', compact('product', 'brands', 'categories'));
}


public function updateProduct(Request $request, $id)
{
    $request->validate([
        'name' => 'required|string|max:200',
        'mo_ta' => 'required|string|max:250',
        'thong_tin' => 'required|string',
        'price' => 'required|numeric',
        'quantity' => 'required',
        'status' => 'required',
        'id_brand' => 'required|exists:brand,id',
        'id_category' => 'required|exists:category,id',
    ]);

    // Update the 'product' table
    DB::table('product')->where('id', $id)->update($request->only('name','mo_ta', 'thong_tin', 'price', 'id_brand', 'id_category', 'status'));

    // Update the 'product_detail' table
    DB::table('product_detail')->where('product_id', $id)->update(['quantity' => $request->quantity]);


    DB::table('brand')->where('id', $request->id_brand)->update(['id' => $request->id_brand]);

    return redirect()->route('admin.createProduct');
}


    public function destroyProduct($id)
    {
        DB::table('product')->where('id', $id)->delete();

        return redirect()->route('products.index')->with('success', 'Product deleted successfully');
    }


    public function editCategory($id)
    {
        $category = DB::table('category')->find($id);
        return view('admin/editCategory', compact('category'));
    }

    public function updateCategory(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'status' => 'required|numeric',
        ]);

        DB::table('category')->where('id', $id)->update([
            'name' => $request->name,
            'status' => $request->status,
            'updated_at' => now(),
        ]);

        return redirect()->route('admin.index');
    }

    public function destroyCategory($id)
    {
        DB::table('category')->where('id', $id)->delete();

        return redirect()->route('admin.index');
    }

}
