<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $feedback = \App\Models\Feedback::all();
        $arr = [
            'status' => true,
            'message' => "Danh sách phản hồi",
            'data' => \App\Http\Resources\Feedback::collection($feedback)
        ];
        return response()->json($arr, 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
        $feedback = \App\Models\Feedback::find($id);
        if (is_null($feedback)) {
            $arr = [
                'success' => false,
                'message' => 'Không có phản hồi này',
                'dara' => []
            ];
            return response()->json($arr, 200);
        }
        $arr = [
            'status' => true,
            'message' => "Chi tiết feedback ",
            'data' => new \App\Http\Resources\Feedback($feedback)
        ];
        return response()->json($arr, 201);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
