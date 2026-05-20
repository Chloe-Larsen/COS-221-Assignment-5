<!-- home.php - Complete redesign -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WanderLust Travel - Your Adventure Starts Here</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/home.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <section class="hero">
            <h1>Tripistry</h1>
            <p>Discover amazing destinations, find perfect accommodations, and create unforgettable memories.</p>
            <div class="hero-buttons">
                <a href="/packages" class="btn">View Packages</a>
                <a href="/destinations" class="btn btn-outline">Explore Destinations</a>
            </div>
        </section>

        <section>
            <h2>Why Choose Us?</h2>
            <div class="card-grid">
                <div class="card">
                    <div class="card-content">
                        <div class="card-title">✈️ Best Prices</div>
                        <p>We guarantee the lowest prices on flights and packages.</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <div class="card-title">🏨 Premium Stays</div>
                        <p>Curated selection of the finest accommodations worldwide.</p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <div class="card-title">🛡️ 24/7 Support</div>
                        <p>Round-the-clock customer service for all your needs.</p>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <h2>Featured Destinations</h2>
            <div class="card-grid">
                <?php
                $destinations = [
                    ['name' => 'Paris, France', 'price' => '$899', 'image' => 'paris.jpg'],
                    ['name' => 'Tokyo, Japan', 'price' => '$1299', 'image' => 'tokyo.jpg'],
                    ['name' => 'Cape Town, SA', 'price' => '$799', 'image' => 'capetown.jpg'],
                ];
                foreach ($destinations as $dest): ?>
                    <div class="card">
                        <div class="card-image" style="background-image: url('/images/<?php echo $dest['image']; ?>');"></div>
                        <div class="card-content">
                            <div class="card-title"><?php echo $dest['name']; ?></div>
                            <div class="card-price">From <?php echo $dest['price']; ?></div>
                            <button class="btn" onclick="alert('Booking coming soon!')">Book Now →</button>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </section>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
</body>

</html>