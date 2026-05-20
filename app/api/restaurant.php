<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Restaurant WHERE restaurantId = :id";
        $restaurant = $db->fetch($query, [':id' => $_GET['id']]);

        if ($restaurant) {
            send_res(200, ["message" => "Success", "data" => $restaurant]);
        } else {
            send_res(404, ["message" => "Restaurant not found."]);
        }
    } else {
        $query = "SELECT * FROM Restaurant";
        $restaurant = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $restaurant]);
    }
} else if ($method === "POST") {
    if (empty($authenticated_user['agencyId'])) {
        send_res(400, ["message" => "Incomplete data. 'agencyId' is required."]);
    }
    $query = "INSERT INTO Restaurant (name, buildingNumber, street, suburb, postalCode, agencyId) 
                VALUES (:name, :buildingNumber, :street, :suburb, :postalCode, :agencyId)";

    $params = [
        ':name' => $data['name'],        
        ':buildingNumber' => isset($data['buildingNumber']) ? $data['buildingNumber'] : null,
        ':street' => isset($data['street']) ? $data['street'] : null,
        ':suburb' => isset($data['suburb']) ? $data['suburb'] : null,
        ':postalCode' => isset($data['postalCode']) ? $data['postalCode'] : null,
        ':agencyId' => (int) $authenticated_user['agencyId']
    ];
    if ($db->execute($query, $params)) {
        send_res(201, ["message" => "Restaurant created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create restaurant."]);
    }
} else if ($method === "PUT") {
    if (empty($data['restaurantId'])) {
        send_res(400, ["message" => "Incomplete data. 'restaurantId' is required."]);
    }

    $query = "SELECT agencyId FROM Restaurant WHERE restaurantId = :id";
    $restaurant = $db->fetch($query, [':id' => $data['restaurantId']]);
    if ($restaurant == null) {
        send_res(404, ["message" => "Restaurant not found"]);
    }
    if ($restaurant['agencyId'] != $authenticated_user['agencyId']) {
        send_res(403, ["message" => "Do not have premission to edit"]);
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
        send_res(200, ["message" => "Restaurant updated successfully"]);
    } else {
        send_res(503, ["message" => "Unable to update restaurant"]);
    }
}