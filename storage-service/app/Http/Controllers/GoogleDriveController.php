<?php

namespace App\Http\Controllers;

use Illuminate\Http\Response;
use Illuminate\Http\Request;
use Yaza\LaravelGoogleDriveStorage\Gdrive;

class GoogleDriveController extends Controller
{

    public function uploadFile(Request $request): Response
    {
        $path = $request->input('path');
        Gdrive::put($path, $request->file('file'));

        return response('File Uploaded!', 200);
    }

    public function getFile(Request $request): Response
    {
        $image = Gdrive::get('your-folder/filename.jpg');

        return response($image->file, 200)
            ->header('Content-Type', $image->ext);
    }

    public function downloadFile(Request $request): Response
    {
        $image = Gdrive::get('your-folder/filename.jpg');

        return response($image->file, 200)
            ->header('Content-Type', $image->ext)
			->header('Content-disposition', 'attachment; filename="'.$image->filename.'"');
    }

    public function deleteFile(Request $request): Response
    {
        Gdrive::delete('your-folder/filename.png');

   		return response('File Deleted!', 200);
    }

}