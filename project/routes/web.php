<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AdminController;

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


Route::group(['prefix'=> ''], function() {
    Route::get('/', [HomeController::class, 'index'])->name('home.index');
    Route::get('/productsPage', [HomeController::class, 'productsPage'])->name('home.products');
});

Route::get('/login', [AdminController::class, 'login'])->name('login');
Route::post('/login', [AdminController::class, 'check_login']);
Route::get('/register', [AdminController::class, 'register'])->name('register');
Route::post('/register', [AdminController::class, 'check_register'])->name('checkRegister');

Route::group(['prefix'=> 'admin','middleware' => 'auth'], function() {
    Route::get('/', [AdminController::class, 'index'])->name('admin.index');
    Route::get('/createCategory', [AdminController::class, 'createCategory'])->name('admin.createCategory');
    Route::post('/createCategory', [AdminController::class, 'storeCategory']);
    Route::get('/createProduct', [AdminController::class, 'createProduct'])->name('admin.createProduct');
    Route::post('/createProduct', [AdminController::class, 'storeProduct']);

    // Edit Product
    Route::get('/editProduct/{id}', [AdminController::class, 'editProduct'])->name('product.edit');

    // Update Product
    Route::put('/editProduct/{id}', [AdminController::class, 'updateProduct'])->name('product.update');

    // Delete Product
    Route::delete('/editProduct/{id}', [AdminController::class, 'destroyProduct'])->name('product.destroy');

    // Edit Category
    Route::get('/editCategory/{id}', [AdminController::class, 'editCategory'])->name('categories.edit');

    // Update Category
    Route::put('/editCategory/{id}', [AdminController::class, 'updateCategory'])->name('categories.update');

    // Delete Category
    Route::delete('/editCategory/{id}', [AdminController::class, 'destroyCategory'])->name('categories.destroy');
});


Route::get('/index', function () {
    return view('index');
});
Route::get('/home', function () {
    return view('home');
});
