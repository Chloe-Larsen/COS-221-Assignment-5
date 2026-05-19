<?php

/*
    Handles routing for all views.
*/

$routes = [
    '/' => 'views/home.php',
    '/flights' => 'views/flights.php',
    '/destinations' => 'views/destinations.php',
    '/attractions' => 'views/attractions.php',
    '/accomodations' => 'views/accomodations.php',
    '/accommodations' => 'views/accomodations.php',
    '/packages' => 'views/packages.php',
    '/dashboard' => 'views/dashboard.php',
    '/login' => 'views/login.php',
    '/signup' => 'views/signup.php'
];

if ($method === "GET" && array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . "/" . $routes[$currentRoute];
    require_once $targetFile;
    exit; // terminate after rendering page
}