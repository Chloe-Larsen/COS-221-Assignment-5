<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Accommodation WHERE accommodationId = :id";
        $accommodation = $db->fetch($query, [':id' => $_GET['id']]);

        if ($accommodation) {
            sendRes(200, ["message" => "Success", "data" => $accommodation]);
        } else {
            sendRes(404, ["message" => "Accommodation not found."]);
        }
    } else {
        $query = "SELECT * FROM Accommodation";
        $accommodations = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $accommodations]);
    }
} else if ($method === "POST") {
    if (empty($user['agencyId'])) {
        sendRes(400, ["message" => "Incomplete data. 'agencyId' is required."]);
    }
    $query = "INSERT INTO Accommodation (name, type, buildingNumber, street, suburb, postalCode, agencyId) 
                VALUES (:name, :type, :buildingNumber, :street, :suburb, :postalCode, :agencyId)";

    $params = [
        ':name' => $data['name'],
        ':type' => isset($data['type']) ? $data['type'] : null,
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':agencyId' => (int) $user['agencyId']
    ];
    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Accommodation created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create accommodation."]);
    }
} else if ($method === "PUT") {
    if (empty($data['accommodationId'])) {
        sendRes(400, ["message" => "Incomplete data. 'accommodationId' is required."]);
    }

    $query = "SELECT agencyId FROM Accommodation WHERE accommodationId = :id";
    $accommodation = $db->fetch($query, [':id' => $data['accommodationId']]);
    if ($accommodation == null) {
        sendRes(404, ["message" => "Accommodation not found"]);
    }
    if ($accommodation['agencyId'] != $user['agencyId']) {
        sendRes(403, ["message" => "Do not have premission to edit"]);
    }

    $updateQuery = "UPDATE Accommodation 
                SET name = :name, type = :type, buildingNumber = :buildingNumber, street = :street, suburb = :suburb, postalCode = :postalCode 
                WHERE accommodationId = :accId";

    $params = [
        ':name' => $data['name'],
        ':type' => isset($data['type']) ? $data['type'] : null,
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':accId' => $data['accommodationId']
    ];
    if ($db->execute($updateQuery, $params)) {
        sendRes(200, ["message" => "Accommodation updated successfully"]);
    } else {
        sendRes(503, ["message" => "Unable to update accommodation"]);
    }
}