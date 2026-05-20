<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Flight WHERE flightId = :id";
        $flight = $db->fetch($query, [':id' => $_GET['id']]);

        if ($flight) {
            send_res(200, ["message" => "Success", "data" => $flight]);
        } else {
            send_res(404, ["message" => "Destination not found."]);
        }
    } else {
        $query = "SELECT * FROM Flight";
        $flights = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $flights]);
    }
}