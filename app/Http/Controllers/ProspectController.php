<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class ProspectController extends Controller
{
    public function index()
    {
        return Inertia::render('Prospects');
    }
}
