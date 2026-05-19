<?php

/*
    Handles routing for all API endpoints.
*/

$routes = [
    '/api/test' => 'api/test.php',
];

if (array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . "/../app/" . $routes[$currentRoute];
    require_once $targetFile;
}