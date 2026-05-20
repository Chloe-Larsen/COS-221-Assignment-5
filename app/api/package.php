<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Package WHERE packageId = :id";
        $package = $db->fetch($query, [':id' => $_GET['id']]);

        if ($package) {
            send_res(200, ["message" => "Success", "data" => $package]);
        } else {
            send_res(404, ["message" => "Package not found."]);
        }
    } else {
        $query = "SELECT * FROM Package";
        $package = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $package]);
    }
} else if ($method === "POST") {
    authenticate_user();

    if ($authenticated_user["agencyId"] !== $data["agencyId"]) {
        send_res(403, ["message" => "No permission to modify the agency"]);
    }
    $query = "INSERT INTO Package (name, description, duration, basePrice, agencyId, maxCapacity) 
                VALUES (:name, :description, :duration, :basePrice, :agencyId, :maxCapacity)";

    $params = [
        ':name' => $data['name'],
        ':description' => isset($data['description']) ? $data['description'] : null,
        ':duration' => isset($data['duration']) ? $data['duration'] : null,
        ':basePrice' => isset($data['basePrice']) ? $data['basePrice'] : null,
        ':agencyId' => $data['agencyId'],
        ':maxCapacity' => isset($data['maxCapacity']) ? $data['maxCapacity'] : null
    ];
    if ($db->execute($query, $params)) {
        send_res(201, ["message" => "Package created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create package."]);
    }
} else if ($method === "PUT") {
    authenticate_user();
    if (empty($data['packageId'])) {
        send_res(401, ["message" => "Unauthorized. A 'agencyId' is required."]);
    }

    $query = "SELECT agencyId FROM Package WHERE packageId = :id";
    $package = $db->fetch($query, [':id' => $data['packageId']]);

    if ($package == null) {
        send_res(404, ["message" => "Package not found"]);
    }
    if ($package['agencyId'] != $authenticated_user['agencyId']) {
        send_res(403, ["message" => "Do not have permission to edit"]);
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

    if ($db->execute($updateQuery, $params)) {
        send_res(200, ["message" => "Package created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create package."]);
    }
}