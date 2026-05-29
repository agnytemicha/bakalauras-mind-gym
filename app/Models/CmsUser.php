<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class CmsUser extends Authenticatable
{
    public const ROLES = ['admin'];

    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts()
    {
        return [
            'password' => 'hashed',
        ];
    }

    public function isAdmin()
    {
        return $this->role === 'admin';
    }

    public function roleLabel()
    {
        if ($this->role === 'admin') {
            return 'Administratorius';
        }

        return $this->role;
    }
}
