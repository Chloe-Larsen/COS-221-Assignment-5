<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Attraction WHERE attractionId = :id";
        $attraction = $db->fetch($query, [':id' => $_GET['id']]);

        if ($attraction) {
            send_res(200, ["message" => "Success", "data" => $attraction]);
        } else {
            send_res(404, ["message" => "Attraction not found."]);
        }
    } else {
        $query = "SELECT * FROM Attraction";
        $accommodations = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $accommodations]);
    }
} else if ($method === "POST") {
    if (empty($authenticated_user['agencyId'])) {
        send_res(400, ["message" => "Incomplete data. 'agencyId' is required."]);
    }
    $query = "INSERT INTO Attraction (name, entranceFee, buildingNumber, street, suburb, postalCode, agencyId) 
                VALUES (:name, :entranceFee, :buildingNumber, :street, :suburb, :postalCode, :agencyId)";

    $params = [
        ':name' => $data['name'],
        ':entranceFee' => isset($data['entranceFee']) ? $data['entranceFee'] : null,
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':agencyId' => (int) $authenticated_user['agencyId']
    ];
    if ($db->execute($query, $params)) {
        send_res(201, ["message" => "Attraction created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create attraction."]);
    }
} else if ($method === "PUT") {
    if (empty($data['attractionId'])) {
        send_res(400, ["message" => "Incomplete data. 'attractionId' is required."]);
    }

    $query = "SELECT agencyId FROM Attraction WHERE attractionId = :id";
    $attraction = $db->fetch($query, [':id' => $data['attractionId']]);
    if ($attraction == null) {
        send_res(404, ["message" => "Attraction not found"]);
    }
    if ($attraction['agencyId'] != $authenticated_user['agencyId']) {
        send_res(403, ["message" => "Do not have premission to edit"]);
    }

    $updateQuery = "UPDATE Attraction 
                SET name = :name, entranceFee = :entranceFee, buildingNumber = :buildingNumber, street = :street, suburb = :suburb, postalCode = :postalCode 
                WHERE attractionId = :attId";

    $params = [
        ':name' => $data['name'],
        ':entranceFee' => isset($data['entranceFee']) ? $data['entranceFee'] : null,
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':attId' => $data['attractionId']
    ];
    if ($db->execute($updateQuery, $params)) {
        send_res(200, ["message" => "Attraction updated successfully"]);
    } else {
        send_res(503, ["message" => "Unable to update attraction"]);
    }
}