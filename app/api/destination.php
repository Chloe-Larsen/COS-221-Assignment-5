<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Destination WHERE destinationId = :id";
        $destination = $db->fetch($query, [':id' => $_GET['id']]);

        if ($destination) {
            send_res(200, ["message" => "Success", "data" => $destination]);
        } else {
            send_res(404, ["message" => "Destination not found."]);
        }
    } else {
        $query = "SELECT * FROM Destination";
        $destination = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $destination]);
    }
} else if ($method === "POST") {
    authenticate_user();

    if ($authenticated_user["agencyId"] === null) {
        send_res(403, ["message" => "Not part of an agency"]);
    }
    if ($authenticated_user["agencyId"] !== $data["agencyId"]) {
        send_res(403, ["message" => "No permission to modify the agency"]);
    }
    $query = "INSERT INTO Destination (cityName, province, agencyId) 
                VALUES (:cityName, :province, :agencyId)";

    $params = [
        ':cityName' => $data['cityName'],
        ':province' => isset($data['province']) ? $data['province'] : null,
        ':agencyId' => $data['agencyId']
    ];
    if ($db->execute($query, $params)) {
        send_res(201, ["message" => "Destination created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create destination."]);
    }
} else if ($method === "PUT") {
    authenticate_user();

    if ($authenticated_user["agencyId"] === null) {
        send_res(403, ["message" => "Not part of an agency"]);
    }
    if (empty($data['destinationId'])) {
        send_res(400, ["message" => "Incomplete data. 'destinationId' is required."]);
    }

    $query = "SELECT agencyId FROM Destination WHERE destinationId = :id";
    $destination = $db->fetch($query, [':id' => $data['destinationId']]);
    if ($destination == null) {
        send_res(404, ["message" => "Destination not found"]);
    }
    if ($destination['agencyId'] != $authenticated_user['agencyId']) {
        send_res(403, ["message" => "Do not have premission to edit"]);
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
        send_res(200, ["message" => "Destination updated successfully"]);
    } else {
        send_res(503, ["message" => "Unable to update destination"]);
    }
}