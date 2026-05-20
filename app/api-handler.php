<?php

/*
    Handles routing for all API endpoints.
*/

// helper function for setting cookies

function set_cookie_helper($name, $value)
{
    setcookie(
        $name,
        $value,
        time() + (30 * 24 * 60 * 60), // expiration time: 30 days from now
        '/',        // Available across your entire site folder structure
        '',         // Current domain
        true,       // Secure: Only transmit over HTTPS (set to false ONLY on local localhost without SSL)
        false        // HttpOnly: Hidden from JavaScript. Blocks XSS theft completely! (false so that frontend js can remove the cookie)
    );
}

$authenticated_user = null;

function authenticate_user()
{
    global $db, $authenticated_user;

    if (!isset($_COOKIE['apiKey'])) {
        send_res(401, ["message" => "No API key set"]);
    }

    $apiKey = $_COOKIE['apiKey'];
    $authenticated_user = $db->fetch("SELECT * FROM User WHERE apiKey = :apiKey", [
        "apiKey" => $apiKey
    ]);

    if (!$authenticated_user) {
        send_res(401, ["message" => "Invalid API key"]);
    }
}

$routes = [
    '/api/accomodation' => 'api/accomodation.php',
    '/api/attraction' => 'api/attraction.php',
    '/api/destination' => 'api/destination.php',
    '/api/flight' => 'api/flight.php',
    '/api/image' => 'api/image.php',
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