<?php

/*
    Handles routing for all API endpoints.
*/

$routes = [
    '/api/test' => 'api/test.php',
    'api/login' => 'api/login'
];

if (array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . "/" . $routes[$currentRoute];
    require_once $targetFile;
}