<?php
/*
    Handles all routing for the website.
*/

$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$currentRoute = '/' . trim($requestUri, '/');

// values for API
$method = $_SERVER["REQUEST_METHOD"];
$data = json_decode(file_get_contents("php://input"), true);

function sendRes($httpCode, $json)
{
    header("Content-Type: application/json"); // tell the client that json is being sent back
    http_response_code($httpCode);
    echo json_encode($json);
    exit;
}

$routes = [
    // api
    '/api/test' => 'api/test.php',

    // views
    '/' => 'views/home.html'
];

if (array_key_exists($currentRoute, $routes)) {
    $targetFile = __DIR__ . '/../app/' . $routes[$currentRoute];
    require_once $targetFile;
}

sendRes(404, ["message" => "Invalid endpoint or method"]);