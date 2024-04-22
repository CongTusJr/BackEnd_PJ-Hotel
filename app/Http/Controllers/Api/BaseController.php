<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\MessageMs;
use App\Repositories\BaseRepositoryInterface;
use Exception;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\JsonResponse;

class BaseController extends Controller
{
    /**
     * @var BaseRepositoryInterface
     */
    protected $repository;

    /**
     * @var array
     */
    protected $columns = ['*'];

    /**
     * @var array
     */
    protected $filters = [];

    /**
     * @var array
     */
    protected $searchs = [];

    /**
     * @var int or null
     */
    protected $perPage = null;

    /**
     * @var string
     */
    protected $sort = '-created_at';

    /**
     * Function name like as T01/T02...
     * @var string
     */
    protected $fnName = '';

    /**
     * @var array
     */
    protected $relations = [];

    /**
     * @param BaseRepositoryInterface $repository
     *
     * @return [type]
     */
    public function setRepositoryInterface($repository)
    {
        $this->repository = $repository;
    }

    /**
     * @param Request $request
     *
     * @return [type]
     */
    public function index(Request $request)
    {
        Log::info('BaseController@index - ' . get_class($this->repository) . ' - Start ...');

        // Get parameters
        if ($request->has('columns'))
            $this->columns = explode(',', $request->input('columns'));

        $this->sort = $request->input('sort', '-created_at');
        $this->filters = $request->input('filter', []);
        $this->searchs = $request->input('search', []);
        $this->perPage = $request->input("per_page", null);

        if ($request->has('relations'))
            $this->relations = explode(',', $request->input('relations'));

        # TODO: add query other

        $list = $this->repository->all(
            $this->columns,
            $this->filters,
            $this->searchs,
            $this->sort,
            $this->perPage,
            $this->relations
        );

        // Get List SUCCESS
        Log::info('BaseController@index - ' . get_class($this->repository) . ' - End');

        return $this->responseSuccess(config('resultcode.SUCCESS'), JsonResponse::HTTP_OK, $list);
    }

    /**
     * @param int $id
     *
     * @return [type]
     */
    public function show(int $id)
    {
        Log::info('BaseController@show - ' . get_class($this->repository) . ' - Start ...');

        try {
            $data = $this->repository->findById($id);

            if (!$data) {
                Log::warning("BaseController@show - Object not found");
                return $this->responseError(array(
                    'message_key' => 'ALL_MSG_OBJECT_NOT_FOUND', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_OBJECT_NOT_FOUND')->first()->message_content ?? ''
                ), config('resultcode.ERRORS.OBJECT_NOT_FOUND'), JsonResponse::HTTP_NOT_FOUND);
            }
        } catch (Exception $e) {
            Log::info('BaseController@show - ' . get_class($this->repository) . ' - Exception: ' . $e);
            return $this->responseError(array(
                'message_key' => 'ALL_MSG_INTERNAL_ERROR', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_INTERNAL_ERROR')->first()->message_content ?? ''
            ), \config('resultcode.ERRORS.INTERNAL_ERROR'), JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        Log::info('BaseController@show - ' . get_class($this->repository) . ' - End');

        return $this->responseSuccess(config('resultcode.SUCCESS'), JsonResponse::HTTP_OK, $data);
    }

    /**
     * @param FormRequest $request
     *
     * @return [type]
     */
    public function _store(FormRequest $request)
    {
        Log::info('BaseController@_store - ' . get_class($this->repository) . ' - Start ...');

        try {
            // Create data
            $stored_data = $this->repository->create($request->all());
        } catch (Exception $e) {
            Log::info('BaseController@_store - ' . get_class($this->repository) . ' - Exception: ' . $e);
            return $this->responseError(array(
                'message_key' => 'ALL_MSG_INTERNAL_ERROR', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_INTERNAL_ERROR')->first()->message_content ?? ''
            ), \config('resultcode.ERRORS.INTERNAL_ERROR'), JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        // Create SUCCESS
        Log::info('BaseController@_store - ' . get_class($this->repository) . ' - End');

        return $this->responseSuccess(config('resultcode.SUCCESS'), JsonResponse::HTTP_CREATED, $stored_data);
    }

    /**
     * @param int $id
     * @param FormRequest $request
     *
     * @return [type]
     */
    public function _update(int $id, FormRequest $request)
    {
        Log::info('BaseController@_update - ' . get_class($this->repository) . ' - Start ...');

        try {
            $data = $this->repository->findById($id);

            if (!$data) {
                Log::warning("BaseController@_update - Object not found");
                return $this->responseError(array(
                    'message_key' => 'ALL_MSG_OBJECT_NOT_FOUND', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_OBJECT_NOT_FOUND')->first()->message_content ?? ''
                ), config('resultcode.ERRORS.OBJECT_NOT_FOUND'), JsonResponse::HTTP_NOT_FOUND);
            }

            // Update data
            $this->repository->update($id, $request->all());

            // Update SUCCESS
            $data = $this->repository->findById($id);
        } catch (Exception $e) {
            Log::info('BaseController@_update - ' . get_class($this->repository) . ' - Exception: ' . $e);
            return $this->responseError(array(
                'message_key' => 'ALL_MSG_INTERNAL_ERROR', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_INTERNAL_ERROR')->first()->message_content ?? ''
            ), \config('resultcode.ERRORS.INTERNAL_ERROR'), JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        Log::info('BaseController@_update - ' . get_class($this->repository) . ' - End');

        return $this->responseSuccess(config('resultcode.SUCCESS'), JsonResponse::HTTP_OK, $data);
    }

    /**
     * @param int $id
     *
     * @return [type]
     */
    public function destroy(int $id)
    {
        Log::info('BaseController@destroy - ' . get_class($this->repository) . ' - Start ...');

        try {
            $this->repository->deleteById($id);
        } catch (QueryException $qe) {
            Log::info('BaseController@destroy - ' . get_class($this->repository) . ' - Exception: ' . $qe);
            //23000 - integrity_constraint_violation
            //23503 - foreign_key_violation
            if ($qe->errorInfo[0] == '23000' || $qe->errorInfo[0] == '23503') {
                return $this->responseError(array(
                    'message_key' => 'ALL_MSG_DELETE_CONSTRAINT_ERROR', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_DELETE_CONSTRAINT_ERROR')->first()->message_content ?? ''
                ), \config('resultcode.ERRORS.INTERNAL_ERROR'), JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
            }
        } catch (Exception $e) {
            Log::info('BaseController@destroy - ' . get_class($this->repository) . ' - Exception: ' . $e);
            return $this->responseError(array(
                'message_key' => 'ALL_MSG_INTERNAL_ERROR', 'message_content' => MessageMs::where('message_key', 'ALL_MSG_INTERNAL_ERROR')->first()->message_content ?? ''
            ), \config('resultcode.ERRORS.INTERNAL_ERROR'), JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }

        Log::info('BaseController@destroy - ' . get_class($this->repository) . ' - End');

        return $this->responseSuccess(config('resultcode.SUCCESS'), JsonResponse::HTTP_NO_CONTENT);
    }


    /**
     * Return success response
     * @param array $results
     * @param string $result_code
     * @param $code
     * @return JsonResponse
     */
    public function responseSuccess($result_code, $code = JsonResponse::HTTP_OK, $results = [])
    {
        $response = [
            'result_code' => $result_code,
            'data' => $results,
        ];

        return response()->json($response, $code);
    }

    /**
     * Return error response
     * @param array $results
     * @param $result_code
     * @param int $code
     * @return JsonResponse
     */
    public function responseError($message, $result_code, $code = JsonResponse::HTTP_NOT_FOUND, $results = [])
    {
        $error_message = [];
        $error_message['message'] = $message;
        $error_message['detail'] = $results;
        $response = [
            'result_code' => $result_code,
            'error_message' => $error_message,
        ];

        return response()->json($response, $code);
    }
}
