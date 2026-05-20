<?php

if ($method === "POST") {
    // check username and password
    if (!isset($data["email"]) || !is_string($data["email"])) {
        send_res(400, ["message" => "Invalid email"]);
    }
    if (!isset($data["password"]) || !is_string($data["password"])) {
        send_res(400, ["message" => "Invalid password"]);
    }

    $email = $data["email"];
    $password = $data["password"];

    $authenticated_user = $db->fetch("SELECT * FROM User WHERE email = :email", ["email" => $email]);

    if (!$authenticated_user || !password_verify($password, $authenticated_user["password"])) {
        send_res(400, ["error" => "Invalid username or password"]);
    }

    set_cookie_helper('apiKey', $authenticated_user["apiKey"]);
    send_res(200);
}