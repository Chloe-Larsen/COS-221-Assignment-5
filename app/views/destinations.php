<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destinations - Travel Agency</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/destinations.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="destinations-header">
            <h1>Popular Destinations</h1>
            <p>Discover the most beautiful places around the world.</p>
        </div>

        <div class="search-bar">
            <input type="text" class="search-input" placeholder="Search destinations..." id="searchInput" onkeyup="filterDestinations()">
        </div>

        <div class="destination-grid" id="destinationGrid">
            <?php
            $destinations = [
                ['name' => 'Paris, France', 'attractions' => 'Eiffel Tower, Louvre', 'price' => '$899', 'popularity' => '★★★★★', 'image' => 'paris.jpg'],
                ['name' => 'Tokyo, Japan', 'attractions' => 'Mount Fuji, Shibuya', 'price' => '$1,299', 'popularity' => '★★★★★', 'image' => 'tokyo.jpg'],
                ['name' => 'Cape Town, SA', 'attractions' => 'Table Mountain', 'price' => '$799', 'popularity' => '★★★★☆', 'image' => 'capetown.jpg'],
                ['name' => 'New York, USA', 'attractions' => 'Statue of Liberty', 'price' => '$999', 'popularity' => '★★★★★', 'image' => 'nyc.jpg'],
                ['name' => 'Rome, Italy', 'attractions' => 'Colosseum', 'price' => '$849', 'popularity' => '★★★★☆', 'image' => 'rome.jpg'],
                ['name' => 'Bali, Indonesia', 'attractions' => 'Rice Terraces', 'price' => '$699', 'popularity' => '★★★★☆', 'image' => 'bali.jpg'],
                ['name' => 'London, UK', 'attractions' => 'Big Ben, London Eye', 'price' => '$949', 'popularity' => '★★★★☆', 'image' => 'london.jpg'],
                ['name' => 'Dubai, UAE', 'attractions' => 'Burj Khalifa', 'price' => '$1,099', 'popularity' => '★★★★☆', 'image' => 'dubai.jpg'],
            ];
            foreach ($destinations as $dest): ?>
                <div class="destination-card" data-name="<?php echo strtolower($dest['name']); ?>" onclick="alert('Explore <?php echo $dest['name']; ?>')">
                    <div class="destination-image" style="background-image: url('/images/<?php echo $dest['image']; ?>');"></div>
                    <div class="destination-content">
                        <div class="destination-name"><?php echo $dest['name']; ?></div>
                        <div class="destination-info">
                            <span class="attractions-count">🎯 <?php echo $dest['attractions']; ?></span>
                            <span class="popularity"><?php echo $dest['popularity']; ?></span>
                        </div>
                        <div class="card-price">From <?php echo $dest['price']; ?></div>
                        <button class="btn">Explore →</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
    <script>
        function filterDestinations() {
            let input = document.getElementById('searchInput');
            let filter = input.value.toLowerCase();
            let grid = document.getElementById('destinationGrid');
            let cards = grid.getElementsByClassName('destination-card');
            
            for (let i = 0; i < cards.length; i++) {
                let name = cards[i].getAttribute('data-name');
                if (name.includes(filter)) {
                    cards[i].style.display = "";
                } else {
                    cards[i].style.display = "none";
                }
            }
        }
    </script>
</body>

</html>