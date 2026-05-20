<?php
if ($method === "GET") {
    if (isset($_GET['id'])) {
        $query = "SELECT * FROM Review WHERE reviewId = :id";
        $review = $db->fetch($query, [':id' => $_GET['id']]);

        if ($review) {
            send_res(200, ["message" => "Success", "data" => $review]);
        } else {
            send_res(404, ["message" => "Review not found."]);
        }
    } else {
        $query = "SELECT * FROM Review";
        $review = $db->fetchAll($query);
        send_res(200, ["message" => "Success", "data" => $review]);
    }
} else if ($method === "POST") {
    authenticate_user();
    if (empty($authenticated_user['userId'])) {
        send_res(401, ["message" => "Unauthorized. Please log in to leave a review."]);
    }
    $query = "INSERT INTO Review (rating, comment, timestamp, userId, packageId) 
                VALUES (:rating, :comment, :timestamp, :userId, :packageId)";

    $params = [
        ':rating' => $data['rating'],        
        ':comment' => isset($data['comment']) ? $data['comment'] : null,
        ':timestamp' => isset($data['timestamp']) ? $data['timestamp'] : null,
        ':userId' => $authenticated_user['userId'],
        ':packageId' => isset($data['packageId']) ? $data['packageId'] : null        
    ];
    if ($db->execute($query, $params)) {
        send_res(201, ["message" => "Review created successfully."]);
    } else {
        send_res(503, ["message" => "Unable to create review."]);
    }
}