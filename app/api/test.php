<?php
/*
    A test endpoint that simply returns the "value" value that was passed in the body.
*/

if ($method === "POST") {
    if (isset($data["value"])) {
        sendRes(200, [
            "message" => "Value received successfully",
            "data" => $data["value"],
            "env" => $_ENV
        ]);
    } else {
        sendRes(400, ["message" => "No value provided"]);
    }
}