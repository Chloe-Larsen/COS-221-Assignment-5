<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Destination WHERE destinationId = :id";
        $destination = $db->fetch($query, [':id' => $_GET['id']]);

        if ($destination) {
            sendRes(200, ["message" => "Success", "data" => $destination]);
        } else {
            sendRes(404, ["message" => "Destination not found."]);
        }
    } else {
        $query = "SELECT * FROM Destination";
        $destination = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $destination]);
    }
} else if ($method === "POST") {
    if (empty($user['agencyId'])) {
        sendRes(400, ["message" => "Incomplete data. 'agencyId' is required."]);
    }
    $query = "INSERT INTO Destination (cityName, province, agencyId) 
                VALUES (:cityName, :province, :agencyId)";

    $params = [
        ':cityName' => $data['cityName'],
        ':province' => isset($data['province']) ? $data['province'] : null,
        ':agencyId' => isset($data['agencyId']) ? $data['agencyId'] : null
    ];
    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Destination created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create destination."]);
    }
} else if ($method === "PUT") {
    if (empty($data['destinationId'])) {
        sendRes(400, ["message" => "Incomplete data. 'destinationId' is required."]);
    }

    $query = "SELECT agencyId FROM Destination WHERE destinationId = :id";
    $destination = $db->fetch($query, [':id' => $data['destinationId']]);
    if ($destination == null) {
        sendRes(404, ["message" => "Destination not found"]);
    }
    if ($destination['agencyId'] != $user['agencyId']) {
        sendRes(403, ["message" => "Do not have premission to edit"]);
    }

    $updateQuery = "UPDATE Destination 
                SET cityName = :cityName, province = :province
                WHERE destinationId = :dId";

    $params = [
        ':cityName' => $data['cityName'],
        ':province' => isset($data['province']) ? $data['province'] : null,        
        ':dId' => $data['destinationId']
    ];
    if ($db->execute($updateQuery, $params)) {
        sendRes(200, ["message" => "Destination updated successfully"]);
    } else {
        sendRes(503, ["message" => "Unable to update destination"]);
    }
}