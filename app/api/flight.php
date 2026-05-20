<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Flight WHERE flightId = :id";
        $flight = $db->fetch($query, [':id' => $_GET['id']]);

        if ($flight) {
            sendRes(200, ["message" => "Success", "data" => $flight]);
        } else {
            sendRes(404, ["message" => "Destination not found."]);
        }
    } else {
        $query = "SELECT * FROM Flight";
        $flights = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $flights]);
    }
}