<?php

use Illuminate\Support\Str;

return [

    /*
    |--------------------------------------------------------------------------
    | Default Session Driver
    |--------------------------------------------------------------------------
    |
    | This option determines the default session driver that is utilized for
    | incoming requests. Sessions are stored in the MySQL sessions table
    | created by the user table migration.
    |
    */

    'driver' => 'database',

    /*
    |--------------------------------------------------------------------------
    | Session Lifetime
    |--------------------------------------------------------------------------
    |
    | Here you may specify the number of minutes that you wish the session
    | to be allowed to remain idle before it expires. If you want them to
    | expire immediately when the browser is closed, use expire_on_close.
    |
    */

    'lifetime' => 120,

    'expire_on_close' => false,

    /*
    |--------------------------------------------------------------------------
    | Session Encryption
    |--------------------------------------------------------------------------
    |
    | This option allows you to specify that all of your session data should
    | be encrypted before it's stored. Encryption is disabled for this local
    | database-backed setup.
    |
    */

    'encrypt' => false,

    /*
    |--------------------------------------------------------------------------
    | Session Database Connection
    |--------------------------------------------------------------------------
    |
    | When using the database session driver, you may specify a connection
    | that should be used to manage these sessions. Null means Laravel uses
    | the default MySQL connection.
    |
    */

    'connection' => null,

    /*
    |--------------------------------------------------------------------------
    | Session Database Table
    |--------------------------------------------------------------------------
    |
    | When using the database session driver, you may specify the table to be
    | used to store sessions.
    |
    */

    'table' => 'sessions',

    /*
    |--------------------------------------------------------------------------
    | Session Sweeping Lottery
    |--------------------------------------------------------------------------
    |
    | Some session drivers must manually sweep their storage location to get
    | rid of old sessions from storage. Here are the chances that it will
    | happen on a given request. By default, the odds are 2 out of 100.
    |
    */

    'lottery' => [2, 100],

    /*
    |--------------------------------------------------------------------------
    | Session Cookie Name
    |--------------------------------------------------------------------------
    |
    | Here you may change the name of the session cookie that is created by
    | the framework. Typically, you should not need to change this value.
    |
    */

    'cookie' => Str::slug((string) env('APP_NAME', 'Mind Gym')).'-session',

    /*
    |--------------------------------------------------------------------------
    | Session Cookie Path
    |--------------------------------------------------------------------------
    |
    | The session cookie path determines the path for which the cookie will
    | be regarded as available. Typically, this will be the root path of
    | your application.
    |
    */

    'path' => '/',

    /*
    |--------------------------------------------------------------------------
    | Session Cookie Domain
    |--------------------------------------------------------------------------
    |
    | This value determines the domain and subdomains the session cookie is
    | available to. Null keeps it scoped to the current local host.
    |
    */

    'domain' => null,

    /*
    |--------------------------------------------------------------------------
    | HTTPS Only Cookies
    |--------------------------------------------------------------------------
    |
    | By setting this option to true, session cookies will only be sent back
    | to the server if the browser has an HTTPS connection.
    |
    */

    'secure' => false,

    /*
    |--------------------------------------------------------------------------
    | HTTP Access Only
    |--------------------------------------------------------------------------
    |
    | Setting this value to true prevents JavaScript from accessing the cookie
    | value, so the cookie is only accessible through the HTTP protocol.
    |
    */

    'http_only' => true,

    /*
    |--------------------------------------------------------------------------
    | Same-Site Cookies
    |--------------------------------------------------------------------------
    |
    | This option determines how your cookies behave when cross-site requests
    | take place and can be used to mitigate CSRF attacks.
    |
    */

    'same_site' => 'lax',

    /*
    |--------------------------------------------------------------------------
    | Partitioned Cookies
    |--------------------------------------------------------------------------
    |
    | Setting this value to true ties the cookie to the top-level site for a
    | cross-site context. Partitioned cookies require secure cookies and
    | Same-Site set to "none".
    |
    */

    'partitioned' => false,

    /*
    |--------------------------------------------------------------------------
    | Session Serialization
    |--------------------------------------------------------------------------
    |
    | JSON serialization is the Laravel default and avoids storing PHP
    | objects in session payloads.
    |
    */

    'serialization' => 'json',

];
