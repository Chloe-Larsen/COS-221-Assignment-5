<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Package WHERE packageId = :id";
        $package = $db->fetch($query, [':id' => $_GET['id']]);

        if ($package) {
            sendRes(200, ["message" => "Success", "data" => $package]);
        } else {
            sendRes(404, ["message" => "Package not found."]);
        }
    } else {
        $query = "SELECT * FROM Package";
        $package = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $package]);
    }
} else if ($method === "POST") {
    if (empty($user['agencyId'])) {
        sendRes(401, ["message" => "Unauthorized. A 'agencyId' is required."]);
    }
    $query = "INSERT INTO Package (name, description, duration, basePrice, agencyId, maxCapacity) 
                VALUES (:name, :description, :duration, :basePrice, :agencyId, :maxCapacity)";

    $params = [
        ':name' => $data['name'],
        ':description' => isset($data['description']) ? $data['description'] : null,
        ':duration' => isset($data['duration']) ? $data['duration'] : null,
        ':basePrice' => isset($user['basePrice']) ? $user['basePrice'] : null,
        ':agencyId' => isset($data['agencyId']) ? $data['agencyId'] : null,
        ':maxCapacity' => isset($data['maxCapacity']) ? $data['maxCapacity'] : null
    ];
    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Package created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create package."]);
    }
} else if ($method === "PUT") {
    if (empty($data['packageId'])) {
        sendRes(401, ["message" => "Unauthorized. A 'agencyId' is required."]);
    }

    $query = "SELECT agencyId FROM Package WHERE packageId = :id";
    $package = $db->fetch($query, [':id' => $data['packageId']]);

    if ($package == null) {
        sendRes(404, ["message" => "Package not found"]);
    }
    if ($package['agencyId'] != $user['agencyId']) {
        sendRes(403, ["message" => "Do not have permission to edit"]);
    }

    $updateQuery = "UPDATE Package 
                SET name = :name, description = :description, duration = :duration, basePrice = :basePrice, maxCapacity = :maxCapacity
                WHERE packageId = :pId";

    $params = [
        ':name' => $data['name'],
        ':description' => isset($data['description']) ? $data['description'] : null,
        ':duration' => isset($data['duration']) ? (int) $data['duration'] : null,
        ':basePrice' => isset($data['basePrice']) ? (float) $data['basePrice'] : null,
        ':maxCapacity' => isset($data['maxCapacity']) ? (int) $data['maxCapacity'] : null,
        ':pId' => $data['packageId']
    ];

    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Package created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create package."]);
    }
}