<?php
$tableName = "";
$parentTable = "";
$fkCol = "";
function setupImageVariables($type)
{
    global $tableName, $parentTable, $fkCol;
    $allowedTypes = ['accommodation', 'attraction', 'destination', 'restaurant'];

    if (!$type || !in_array(strtolower($type), $allowedTypes)) {
        send_Res(400, ["message" => "A valid 'type' is required. Allowed types: " . implode(", ", $allowedTypes)]);
    }

    $type = strtolower($type);
    $tableName = $type . 'image';
    $parentTable = $type;
    $fkCol = $type . 'Id';
}

if ($method === "GET") {
    authenticate_user();
    $type = $_GET['type'] ?? null;
    setupImageVariables($type);
    if (isset($_GET['imageId'])) {
        $query = "SELECT * FROM $tableName WHERE imageId = :id";
        $image = $db->fetch($query, [':id' => $_GET['imageId']]);

        if ($image) {
            send_Res(200, ["message" => "Success", "data" => $image]);
        } else {
            send_Res(404, ["message" => "Image not found."]);
        }
    } else if (isset($_GET['entityId'])) {
        $query = "SELECT * FROM $tableName WHERE $fkCol = :id";
        $images = $db->fetchAll($query, [':id' => $_GET['entityId']]);
        send_Res(200, ["message" => "Success", "data" => $images]);
    }
} else if ($method === "POST") {
    authenticate_user();
    $type = $data['type'] ?? null;
    setupImageVariables($type);
    if (empty($authenticated_user['agencyId'])) {
        send_Res(403, ["message" => "Only Travel Agencies can upload images."]);
    }

    if (empty($data['url']) || empty($data['entityId'])) {
        send_Res(400, ["message" => "Incomplete data. Both 'url' and 'entityId' are required."]);
    }

    $ownershipQuery = "SELECT agencyId FROM $parentTable WHERE $fkCol = :id";
    $entity = $db->fetch($ownershipQuery, [':id' => $data['entityId']]);

    if ($entity == null) {
        send_Res(404, ["message" => ucfirst($parentTable) . " not found."]);
    }

    if ($entity['agencyId'] != $authenticated_user['agencyId']) {
        send_Res(403, ["message" => "You can only add images to your own " . $parentTable . "s."]);
    }

    $insertQuery = "INSERT INTO $tableName (url, $fkCol) VALUES (:url, :entityId)";
    $params = [
        ':url' => $data['url'],
        ':entityId' => $data['entityId']
    ];

    if ($db->execute($insertQuery, $params)) {
        send_Res(201, ["message" => "Image added successfully to $parentTable."]);
    } else {
        send_Res(503, ["message" => "Unable to add image."]);
    }
}