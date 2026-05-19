<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Restaurant WHERE restaurantId = :id";
        $restaurant = $db->fetch($query, [':id' => $_GET['id']]);

        if ($restaurant) {
            sendRes(200, ["message" => "Success", "data" => $restaurant]);
        } else {
            sendRes(404, ["message" => "Restaurant not found."]);
        }
    } else {
        $query = "SELECT * FROM Restaurant";
        $accommodations = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $accommodations]);
    }
} else if ($method === "POST") {
    if (empty($user['agencyId'])) {
        sendRes(400, ["message" => "Incomplete data. 'agencyId' is required."]);
    }
    $query = "INSERT INTO Restaurant (name, buildingNumber, street, suburb, postalCode, agencyId) 
                VALUES (:name, :buildingNumber, :street, :suburb, :postalCode, :agencyId)";

    $params = [
        ':name' => $data['name'],        
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':agencyId' => (int) $data['agencyId']
    ];
    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Restaurant created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create restaurant."]);
    }
} else if ($method === "PUT") {
    if (empty($data['restaurantId'])) {
        sendRes(400, ["message" => "Incomplete data. 'restaurantId' is required."]);
    }

    $query = "SELECT agencyId FROM Restaurant WHERE restaurantId = :id";
    $restaurant = $db->fetch($query, [':id' => $data['restaurantId']]);
    if ($restaurant == null) {
        sendRes(404, ["message" => "Restaurant not found"]);
    }
    if ($restaurant['agencyId'] != $user['agencyId']) {
        sendRes(403, ["message" => "Do not have premission to edit"]);
    }

    $updateQuery = "UPDATE Restaurant 
                SET name = :name, buildingNumber = :buildingNumber, street = :street, suburb = :suburb, postalCode = :postalCode 
                WHERE restaurantId = :attId";

    $params = [
        ':name' => $data['name'],        
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':attId' => $data['restaurantId']
    ];
    if ($db->execute($updateQuery, $params)) {
        sendRes(200, ["message" => "Restaurant updated successfully"]);
    } else {
        sendRes(503, ["message" => "Unable to update restaurant"]);
    }
}