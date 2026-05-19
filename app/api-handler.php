<?php

/*
    Handles routing for all API endpoints.
*/

$routes = [    
    '/api/accomodation' => 'api/accomodation',
    '/api/attraction' => 'api/attraction',
    '/api/destination' => 'api/destination',
    '/api/itinerary-day' => 'api/itinerary-day',
    '/api/login' => 'api/login',
    '/api/package' => 'api/package',
    '/api/restaurant' => 'api/restaurant',
    '/api/review' => 'api/review',
    '/api/register/agency-user' => 'api/register-agency-user',
    '/api/register/traveller' => 'api/register-traveller'
];

if (array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . "/" . $routes[$currentRoute];
    require_once $targetFile;
}