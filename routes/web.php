<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProductsController;
use App\Http\Controllers\CategoriesController;
use Faker\Guesser\Name;
use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckPermission;
use App\Http\Controllers\HomeController;
use App\Http\Middleware\CheckLoginAdmin;
use Illuminate\Http\Request;

// //Client routes
// Route::prefix('categories')->group(function () {
//     //hiện danh sách
//     Route::get('/', [CategoriesController::class, 'index'])->name('categorties.list');

//     //hiện 1 chuyên mục (áp dụng show form sửa)
//     Route::get('/update/{id}', [CategoriesController::class, 'getCategorties'])->name('categorties.update');

//     //update
//     Route::post('/update/{id}', [CategoriesController::class, 'updateCategorties']);

//     //show forn create
//     Route::get('/create', [CategoriesController::class, 'showCategories'])->name('categorties.create');

//     //xử lý create
//     Route::post('/create', [CategoriesController::class, 'createCategories']);

//     //delete
//     Route::delete('/delete/{id}', [CategoriesController::class, 'deleteCategories'])->name('categorties.delete');
// });

// //Admin
// Route::prefix('admin')->name('admin')->group(function () {
//     Route::get('/', [DashboardController::class, 'index']);
//     Route::resource('/products', ProductsController::class);
// });
// Route::get()