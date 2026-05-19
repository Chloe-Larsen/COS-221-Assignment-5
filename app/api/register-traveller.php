<?php

if ($method === "POST") {
    // email
    if (!isset($data["email"]) || !is_string($data["email"]) || !preg_match("/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/", $data["email"])) {
        sendRes(400, ["message" => "Invalid email"]);
    }
    // password
    if (!isset($data["password"]) || !is_string($data["password"]) || !preg_match("/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{9,}$/", $data["password"])) {
        sendRes(400, ["message" => "Invalid password"]);
    }
    // firstName
    if (!isset($data["firstName"]) || !is_string($data["firstName"]) || trim($data["firstName"]) === "") {
        sendRes(400, ["message" => "Invalid firstName"]);
    }
    // lastName
    if (!isset($data["lastName"]) || !is_string($data["lastName"]) || trim($data["lastName"]) === "") {
        sendRes(400, ["message" => "Invalid lastName"]);
    }
    // phoneNumber
    if (!isset($data["phoneNumber"]) || !is_string($data["phoneNumber"])) {
        sendRes(400, ["message" => "Invalid phoneNumber"]);
    }
    // country
    if (!isset($data["country"]) || !is_string($data["country"])) {
        sendRes(400, ["message" => "Invalid country"]);
    }

    $email = $data["email"];
    $existingUser = $db->fetch("SELECT * FROM User WHERE email = :email", ["email" => $email]);

    if ($existingUser) {
        sendRes(400, ["message" => "Email already exists"]);
    }

    $hashedPassword = password_hash($data["password"], PASSWORD_ARGON2ID); // hash password with salt included
    $apiKey = bin2hex(random_bytes(32)); // generate API key

    // add user to database
    $db->execute("INSERT INTO Users (email, password, firstName, lastName, phoneNumber, country, apiKey) VALUES (:email, :password, :firstName, :lastName, :phoneNumber, :country, :apiKey)", [
        "email" => $email,
        "password" => $hashedPassword,
        "firstName" => $data["firstName"],
        "lastName" => $data["lastName"],
        "phoneNumber" => $data["phoneNumber"],
        "country" => $data["country"],
        "apiKey" => $data["apiKey"]
    ]);

    setcookie('apiKey', $apiKey);
    sendRes(200);
}