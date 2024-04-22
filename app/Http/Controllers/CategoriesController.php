<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    //
    public function __construct()
    {
    }
    public function index()
    {
        return view('clients/categorties/list');
    }
    //lấy ra 1 chuyên mụ theo id (get)
    public function getCategories($id)
    {
        return view('clients/categorties/update');
    }
    //show form thêm dữ liệu (get)
    public function showCategories()
    {
        return view('clients/categorties/create');
    }
    //thêm dữ liệu (post)
    public function createCategories()
    {
        return redirect(route('categorties.create'));
        // return 'submit thêm';
    }
    //Update 1 chuyên mụ theo id (post)
    public function updateCategories($id)
    {
        return 'submit sửa' . $id;
    }
    //xóa1 chuyên mụ theo id (delete )
    public function deleteCategories($id)
    {
        return 'submit xóa' . $id;
    }
}
