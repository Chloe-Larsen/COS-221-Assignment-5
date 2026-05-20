<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Packages - Travel Agency</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/packages.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="packages-header">
            <h1>Travel Packages</h1>
            <p>Curated experiences for unforgettable journeys.</p>
        </div>

        <div class="package-grid">
            <?php
            $packages = [
                ['name' => 'Summer Getaway', 'destination' => 'Cape Town', 'days' => 7, 'price' => 1200, 'features' => ['Hotel', 'Breakfast', 'Tour Guide'], 'featured' => false, 'image' => 'cape-town.jpg'],
                ['name' => 'Romantic Paris', 'destination' => 'Paris', 'days' => 5, 'price' => 2500, 'features' => ['5★ Hotel', 'Dinner Cruise', 'Museum Pass'], 'featured' => true, 'image' => 'paris-package.jpg'],
                ['name' => 'Explore Tokyo', 'destination' => 'Tokyo', 'days' => 10, 'price' => 3200, 'features' => ['Flight', 'Hotel', 'City Tour'], 'featured' => false, 'image' => 'tokyo-package.jpg'],
                ['name' => 'Safari Adventure', 'destination' => 'Kenya', 'days' => 8, 'price' => 2800, 'features' => ['Game Drives', 'Lodge Stay', 'Meals'], 'featured' => false, 'image' => 'safari.jpg'],
                ['name' => 'Greek Islands', 'destination' => 'Santorini', 'days' => 7, 'price' => 2100, 'features' => ['Ferry Transfers', 'Sunset Tour', 'Breakfast'], 'featured' => true, 'image' => 'greece.jpg'],
                ['name' => 'Bali Escape', 'destination' => 'Bali', 'days' => 9, 'price' => 1800, 'features' => ['Villa Stay', 'Spa Treatment', 'Yoga Class'], 'featured' => false, 'image' => 'bali-package.jpg'],
            ];
            foreach ($packages as $pkg): ?>
                <div class="package-card <?php echo $pkg['featured'] ? 'featured' : ''; ?>" onclick="alert('View <?php echo $pkg['name']; ?> package')">
                    <?php if ($pkg['featured']): ?>
                        <div class="featured-tag">⭐ Best Seller</div>
                    <?php endif; ?>
                    <div class="package-image" style="background-image: url('/images/<?php echo $pkg['image']; ?>');"></div>
                    <div class="package-content">
                        <div class="package-name"><?php echo $pkg['name']; ?></div>
                        <div class="package-destination">📍 <?php echo $pkg['destination']; ?> • <?php echo $pkg['days']; ?> days</div>
                        <div class="package-features">
                            <?php foreach ($pkg['features'] as $feature): ?>
                                <span class="feature">✓ <?php echo $feature; ?></span>
                            <?php endforeach; ?>
                        </div>
                        <div class="package-price">$<?php echo number_format($pkg['price'], 0); ?><small>/person</small></div>
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