<?php
if ($method === "GET") {
    if (isset($_GET['packageId']) && isset($_GET['dayNumber'])) {
        $query = "SELECT * FROM ItineraryDay WHERE packageId = :packageId AND dayNumber = :dayNumber";
        $itineraryDay = $db->fetch($query, [
            ':packageId' => $_GET['packageId'],
            ':dayNumber' => $_GET['dayNumber']
        ]);

        if ($itineraryDay) {
            sendRes(200, ["message" => "Success", "data" => $itineraryDay]);
        } else {
            sendRes(404, ["message" => "Itinerary day not found."]);
        }
    } else if (isset($_GET['packageId'])) {
        $query = "SELECT * FROM ItineraryDay WHERE packageId = :packageId ORDER BY dayNumber ASC";
        $itineraryDays = $db->fetchAll($query, [':packageId' => $_GET['packageId']]);
        sendRes(200, ["message" => "Success", "data" => $itineraryDays]);
    } else {
        $query = "SELECT * FROM ItineraryDay";
        $itineraryDays = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $itineraryDays]);
    }

} else if ($method === "POST") {
    if (empty($user['agencyId'])) {
        sendRes(403, ["message" => "Forbidden. Only Travel Agencies can create itinerary days."]);
    }

    if (empty($data['packageId']) || empty($data['dayNumber'])) {
        sendRes(400, ["message" => "Incomplete data. 'packageId' and 'dayNumber' are required."]);
    }

    $packageQuery = "SELECT agencyId FROM Package WHERE packageId = :pId";
    $package = $db->fetch($packageQuery, [':pId' => $data['packageId']]);

    if ($package == null) {
        sendRes(404, ["message" => "Package not found"]);
    }
    if ($package['agencyId'] && $user['agencyId']) {
        sendRes(403, ["message" => "You can only add itinerary days to your own packages."]);
    }

    $query = "INSERT INTO ItineraryDay (packageId, dayNumber, description, destinationId, accommodationId, flightId) 
                VALUES (:packageId, :dayNumber, :description, :destinationId, :accommodationId, :flightId)";

    $params = [
        ':packageId' => $data['packageId'],
        ':dayNumber' => $data['dayNumber'],
        ':description' => isset($data['description']) ? $data['description'] : null,
        ':destinationId' => isset($data['destinationId']) ? $data['destinationId'] : null,
        ':accommodationId' => isset($data['accommodationId']) ? $data['accommodationId'] : null,
        ':flightId' => isset($data['flightId']) ? $data['flightId'] : null
    ];

    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Itinerary day created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create itinerary day."]);
    }

} else if ($method === "PUT") {
    if (empty($data['packageId']) || empty($data['dayNumber'])) {
        sendRes(400, ["message" => "Incomplete data. Both 'packageId' and 'dayNumber' are required to update."]);
    }
    $packageQuery = "SELECT agencyId FROM Package WHERE packageId = :pId";
    $package = $db->fetch($packageQuery, [':pId' => $data['packageId']]);

    if ($package == null) {
        sendRes(404, ["message" => "Package not found."]);
    }
    if ($package['agencyId'] != $user['agencyId']) {
        sendRes(403, ["message" => "You can only edit itinerary days on your own packages."]);
    }

    $updateQuery = "UPDATE ItineraryDay 
                    SET description = :description, destinationId = :destinationId, accommodationId = :accommodationId, flightId = :flightId 
                    WHERE packageId = :packageId AND dayNumber = :dayNumber";

    $params = [
        ':description' => isset($data['description']) ? $data['description'] : null,
        ':destinationId' => isset($data['destinationId']) ? $data['destinationId'] : null, // Assuming destination can be updated
        ':accommodationId' => isset($data['accommodationId']) ? $data['accommodationId'] : null,
        ':flightId' => isset($data['flightId']) ? $data['flightId'] : null,
        ':packageId' => $data['packageId'],
        ':dayNumber' => $data['dayNumber']
    ];
    
    if ($db->execute($updateQuery, $params)) {
        sendRes(200, ["message" => "Itinerary day updated successfully"]);
    } else {
        sendRes(503, ["message" => "Unable to update itinerary day"]);
    }
}