<?php
$tableName = "";
$parentTable = "";
$fkCol = "";
function setupImageVariables($type)
{
    global $tableName, $parentTable, $fkCol;
    $allowedTypes = ['accommodation', 'attraction', 'destination', 'restaurant'];

    if (!$type || !in_array(strtolower($type), $allowedTypes)) {
        sendRes(400, ["message" => "A valid 'type' is required. Allowed types: " . implode(", ", $allowedTypes)]);
    }

    $type = strtolower($type);
    $tableName = $type . 'image';
    $parentTable = $type;
    $fkCol = $type . 'Id';
}

if ($method === "GET") {
    $type = $_GET['type'] ?? null;
    setupImageVariables($type);
    if (isset($_GET['imageId'])) {
        $query = "SELECT * FROM $tableName WHERE imageId = :id";
        $image = $db->fetch($query, [':id' => $_GET['imageId']]);

        if ($image) {
            sendRes(200, ["message" => "Success", "data" => $image]);
        } else {
            sendRes(404, ["message" => "Image not found."]);
        }
    } else if (isset($_GET['entityId'])) {
        $query = "SELECT * FROM $tableName WHERE $fkCol = :id";
        $images = $db->fetchAll($query, [':id' => $_GET['entityId']]);
        sendRes(200, ["message" => "Success", "data" => $images]);
    } else {
        $query = "SELECT * FROM $tableName";
        $images = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $images]);
    }
} else if ($method === "POST") {
    $type = $data['type'] ?? null;
    setupImageVariables($type);
    
}