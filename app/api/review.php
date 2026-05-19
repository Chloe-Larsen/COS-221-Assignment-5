<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Review WHERE reviewId = :id";
        $review = $db->fetch($query, [':id' => $_GET['id']]);

        if ($review) {
            sendRes(200, ["message" => "Success", "data" => $review]);
        } else {
            sendRes(404, ["message" => "Review not found."]);
        }
    } else {
        $query = "SELECT * FROM Review";
        $review = $db->fetchAll($query);
        sendRes(200, ["message" => "Success", "data" => $review]);
    }
} else if ($method === "POST") {
    if (empty($user['userId'])) {
        sendRes(401, ["message" => "Unauthorized. Please log in to leave a review."]);
    }
    $query = "INSERT INTO Review (rating, comment, timestamp, userId, packageId) 
                VALUES (:rating, :comment, :timestamp, :userId, :packageId)";

    $params = [
        ':rating' => $data['rating'],        
        ':comment' => isset($data['comment']) ? $data['comment'] : null,
        ':timestamp' => isset($data['timestamp']) ? $data['timestamp'] : null,
        ':userId' => isset($data['userId']) ? $data['userId'] : null,
        ':packageId' => isset($data['packageId']) ? $data['packageId'] : null        
    ];
    if ($db->execute($query, $params)) {
        sendRes(201, ["message" => "Review created successfully."]);
    } else {
        sendRes(503, ["message" => "Unable to create review."]);
    }
}