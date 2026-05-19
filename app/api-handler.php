<?php

/*
    Handles routing for all API endpoints.
*/

$routes = [
    '/api/accomodation' => 'api/accomodation.php',
    '/api/attraction' => 'api/attraction.php',
    '/api/destination' => 'api/destination.php',
    '/api/itinerary-day' => 'api/itinerary-day.php',
    '/api/login' => 'api/login.php',
    '/api/package' => 'api/package.php',
    '/api/restaurant' => 'api/restaurant.php',
    '/api/review' => 'api/review.php',
    '/api/register/agency-user' => 'api/register-agency-user.php',
    '/api/register/traveller' => 'api/register-traveller.php',
    '/api/test' => 'api/test.php'
];

if (array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . "/" . $routes[$currentRoute];
    require_once $targetFile;
}