<?php
/*
    A test endpoint that simply returns the "value" value that was passed in the body.
*/

if ($method === "POST") {
    if (isset($data["value"])) {
        send_res(200, [
            "message" => "Value received successfully",
            "data" => $data["value"]
        ]);
    } else {
        send_res(400, ["message" => "No value provided"]);
    }
}