<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Accommodation WHERE accommodationId = :id";
        $accommodation = $db->fetch($query, [':id' => $_GET['id']]);

        if ($accommodation) {
            send_res(200, ["message" => "Success", "data" => $accommodation]);
        } else {
            send_res(404, ["message" => "Accommodation not found."]);
        }
    } else {
        $query = "SELECT * FROM Accommodation";
        $accommodations = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $accommodations]);
    }
} else if ($method === "POST") {
    authenticate_user();

    if ($authenticated_user["agencyId"] !== $data["agencyId"]) {
        send_res(403, ["message" => "No permission to modify the agency"]);
    }

    $query = "INSERT INTO Accommodation (name, type, buildingNumber, street, suburb, postalCode, agencyId) 
                VALUES (:name, :type, :buildingNumber, :street, :suburb, :postalCode, :agencyId)";

    $params = [
        ':name' => $data['name'],
        ':type' => isset($data['type']) ? $data['type'] : null,
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ?: null,
        ':agencyId' => $data['agencyId']
    ];
    if ($db->execute($query, $params)) {
        send_res(201, ["message" => "Accommodation created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create accommodation."]);
    }
} else if ($method === "PUT") {
    authenticate_user();

    $query = "SELECT agencyId FROM Accommodation WHERE accommodationId = :id";
    $accommodation = $db->fetch($query, [':id' => $data['accommodationId']]);
    if ($accommodation == null) {
        send_res(404, ["message" => "Accommodation not found"]);
    }
    if ($accommodation['agencyId'] != $authenticated_user['agencyId']) {
        send_res(403, ["message" => "Do not have premission to edit"]);
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
        send_res(200, ["message" => "Accommodation updated successfully"]);
    } else {
        send_res(503, ["message" => "Unable to update accommodation"]);
    }
}