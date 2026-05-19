<?php

if ($method === "POST") {
    // check username and password
    if (!isset($data["email"]) || !is_string($data["email"])) {
        sendRes(400, ["message" => "Invalid username"]);
    }
    if (!isset($data["password"]) || !is_string($data["password"])) {
        sendRes(400, ["message" => "Invalid password"]);
    }

    $email = $data["email"];
    $password = $data["password"];

    $user = $db->fetch("SELECT * FROM User WHERE email = :email", ["email" => $email]);

    if (!$user || !password_verify($password, $user["password"])) {
        sendRes(400, ["error" => "Invalid username or password"]);
    }

    setcookie('apiKey', $user["apiKey"]);
    sendRes(200);
}