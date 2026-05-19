<?php
/*
    Handles all routing for the website.
*/

$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$currentRoute = '/' . trim($requestUri, '/');
$method = $_SERVER["REQUEST_METHOD"];
$data = json_decode(file_get_contents("php://input"), true);

require_once "../app/services/env-loader.php"; // load environment variables into $_ENV
require_once "../app/services/database-connection.php"; // get connection to database as $db variable

function sendRes($httpCode, $json = null)
{
    header("Content-Type: application/json"); // tell the client that json is being sent back
    http_response_code($httpCode);
    echo json_encode($json);
    exit;
}

if (str_starts_with($currentRoute, "/api")) {
    // forward to API handler
    require_once "../app/api-handler.php";
} else {
    // forward to view handler
    require_once "../app/view-handler.php";
}

sendRes(404, ["message" => "Invalid endpoint or method"]);