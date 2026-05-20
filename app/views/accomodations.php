<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accommodations - Travel Agency</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/accomodations.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="page-header">
            <h1>Find your perfect stay</h1>
            <p>From luxury resorts to cozy cabins, we have something for every traveler.</p>
        </div>

        <div class="accommodation-grid">
            <?php
            $accommodations = [
                ['name' => 'Grand Hyatt', 'type' => '5 Star Hotel', 'price' => '$299', 'rating' => '★★★★★', 'location' => 'Downtown', 'image' => 'grand-hyatt.jpg'],
                ['name' => 'Cozy Cabin', 'type' => 'Self-catering', 'price' => '$159', 'rating' => '★★★★☆', 'location' => 'Mountains', 'image' => 'cabin.jpg'],
                ['name' => 'Backpackers Lodge', 'type' => 'Budget Hostel', 'price' => '$35', 'rating' => '★★★☆☆', 'location' => 'City Center', 'image' => 'hostel.jpg'],
                ['name' => 'Seaside Resort', 'type' => 'Beach Resort', 'price' => '$399', 'rating' => '★★★★★', 'location' => 'Coastline', 'image' => 'seaside.jpg'],
                ['name' => 'Urban Boutique', 'type' => 'Boutique Hotel', 'price' => '$189', 'rating' => '★★★★☆', 'location' => 'Arts District', 'image' => 'boutique.jpg'],
                ['name' => 'Mountain Lodge', 'type' => 'Nature Lodge', 'price' => '$129', 'rating' => '★★★★☆', 'location' => 'National Park', 'image' => 'lodge.jpg'],
            ];
            foreach ($accommodations as $acc): ?>
                <div class="accommodation-card" onclick="alert('Check availability for <?php echo $acc['name']; ?>')">
                    <div class="card-image" style="background-image: url('/images/<?php echo $acc['image']; ?>');">
                        <div class="rating-badge"><?php echo $acc['rating']; ?></div>
                    </div>
                    <div class="card-content">
                        <div class="card-title"><?php echo $acc['name']; ?></div>
                        <div class="card-location">📍 <?php echo $acc['location']; ?></div>
                        <span class="accommodation-type"><?php echo $acc['type']; ?></span>
                        <div class="card-price"><?php echo $acc['price']; ?><small>/night</small></div>
                        <button class="btn">View Details →</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
</body>

</html>