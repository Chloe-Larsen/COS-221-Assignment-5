<?php
/*
    Handles all routing for the website.
*/

function sendRes($httpCode, $json = null)
{
    header("Content-Type: application/json"); // tell the client that json is being sent back
    http_response_code($httpCode);
    echo json_encode($json);
    exit;
}

// handle server PHP errors
register_shutdown_function(function () {
    $error = error_get_last();
    // check if the script stopped due to a fatal/parse error
    if ($error && in_array($error['type'], [E_ERROR, E_PARSE, E_CORE_ERROR, E_COMPILE_ERROR])) {
        if (ob_get_length()) {
            // clear any buffered output if using output buffering (ob_start)
            ob_clean();
        }
        sendRes(500, [
            "error" => "Internal Server Error",
            "message" => $error['message']
        ]);
    }
});

$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$currentRoute = '/' . trim($requestUri, '/');
$method = $_SERVER["REQUEST_METHOD"];
$data = json_decode(file_get_contents("php://input"), true);

require_once "../app/services/env-loader.php"; // load environment variables into $_ENV
require_once "../app/services/database-connection.php"; // get connection to database as $db variable

if (str_starts_with($currentRoute, "/api")) {
    // forward to API handler
    require_once __DIR__ . "/../app/api-handler.php";
} else {
    // forward to view handler
    require_once __DIR__ . "/../app/view-handler.php";
}

sendRes(404, ["message" => "Invalid endpoint or method"]);