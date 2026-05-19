<?php

/*
    Handles routing for all API endpoints.
*/

// helper function for setting cookies

function setCookieHelper($name, $value)
{
    setcookie(
        $name,
        $value,
        time() + (30 * 24 * 60 * 60), // expiration time: 30 days from now
        '/',        // Available across your entire site folder structure
        '',         // Current domain
        true,       // Secure: Only transmit over HTTPS (set to false ONLY on local localhost without SSL)
        true        // HttpOnly: Hidden from JavaScript. Blocks XSS theft completely!
    );
}

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