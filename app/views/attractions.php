<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attractions - Travel Agency</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/attractions.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="attractions-header">
            <h1>Must-see attractions</h1>
            <p>Discover the most iconic landmarks around the world.</p>
        </div>

        <div class="attraction-grid">
            <?php
            $attractions = [
                ['name' => 'Eiffel Tower', 'location' => 'Paris, France', 'price' => '$25', 'featured' => true, 'image' => 'eiffel.jpg'],
                ['name' => 'Mount Fuji', 'location' => 'Tokyo, Japan', 'price' => '$15', 'featured' => false, 'image' => 'fuji.jpg'],
                ['name' => 'Table Mountain', 'location' => 'Cape Town, SA', 'price' => '$20', 'featured' => true, 'image' => 'table-mountain.jpg'],
                ['name' => 'Statue of Liberty', 'location' => 'New York, USA', 'price' => '$30', 'featured' => false, 'image' => 'liberty.jpg'],
                ['name' => 'Colosseum', 'location' => 'Rome, Italy', 'price' => '$22', 'featured' => true, 'image' => 'colosseum.jpg'],
                ['name' => 'Great Wall', 'location' => 'Beijing, China', 'price' => '$18', 'featured' => false, 'image' => 'greatwall.jpg'],
            ];
            foreach ($attractions as $attr): ?>
                <div class="attraction-card" onclick="alert('Book tickets for <?php echo $attr['name']; ?>')">
                    <?php if ($attr['featured']): ?>
                        <div class="featured-badge">⭐ Featured</div>
                    <?php endif; ?>
                    <div class="attraction-image" style="background-image: url('/images/<?php echo $attr['image']; ?>');"></div>
                    <div class="attraction-content">
                        <div class="attraction-title"><?php echo $attr['name']; ?></div>
                        <div class="attraction-location">📍 <?php echo $attr['location']; ?></div>
                        <div class="ticket-price">From <?php echo $attr['price']; ?></div>
                        <button class="btn">Book Tickets →</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
</body>

</html>