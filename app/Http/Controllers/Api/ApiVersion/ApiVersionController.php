<?php

namespace App\Http\Controllers\Api\ApiVersion;

use App\Http\Controllers\Api\BaseController;
use Illuminate\Http\JsonResponse;

class ApiVersionController extends BaseController
{
    public function getApiVersion()
    {
        $apiVerison = \config('app.api_version');

        return $this->responseSuccess(config('resultcode.SUCCESS'), JsonResponse::HTTP_OK, $apiVerison);
    }
}
