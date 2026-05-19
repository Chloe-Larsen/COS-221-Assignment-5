<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Flight WHERE flightId = :id";
        $destination = $db->fetch($query, [':id' => $_GET['id']]);

        if ($destination) {
            sendRes(200, ["message" => "Success", "data" => $destination]);
        } else {
            sendRes(404, ["message" => "Destination not found."]);
        }
    } else {
        $query = "SELECT * FROM Flight";
        $accommodations = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $accommodations]);
    }
}