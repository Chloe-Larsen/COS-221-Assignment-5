<?php

/*
    Handles routing for all API endpoints.
*/

$routes = [    
    '/api/accomodation' => 'api/accomodation',
    '/api/agency-register' => 'api/agency-register',
    '/api/agency-user-register' => 'api/agency-user-register',
    '/api/attraction' => 'api/attraction',
    '/api/destination' => 'api/destination',
    '/api/itinerary-day' => 'api/itinerary-day',
    '/api/login' => 'api/login',
    '/api/package' => 'api/package',
    '/api/restaurant' => 'api/restaurant',
    '/api/review' => 'api/review',
    '/api/traveller-register' => 'api/traveller-registerd',

];

if (array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . "/" . $routes[$currentRoute];
    require_once $targetFile;
}