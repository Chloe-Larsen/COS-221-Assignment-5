<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flights - Travel Agency</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/flights.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="flights-header">
            <h1>Available Flights</h1>
            <p>Find the best flights to your dream destinations.</p>
        </div>

        <div class="search-form">
            <div class="search-row">
                <div class="form-group">
                    <label>From</label>
                    <input type="text" placeholder="Departure city" id="fromCity">
                </div>
                <div class="form-group">
                    <label>To</label>
                    <input type="text" placeholder="Arrival city" id="toCity">
                </div>
            </div>
            <div class="search-row">
                <div class="form-group">
                    <label>Departure</label>
                    <input type="date" id="departDate">
                </div>
                <div class="form-group">
                    <label>Return</label>
                    <input type="date" id="returnDate">
                </div>
            </div>
            <button class="btn" onclick="alert('Search flights feature coming soon!')">Search Flights →</button>
        </div>

        <div class="flight-list">
            <?php
            $flights = [
                ['flight' => 'FA101', 'from' => 'Johannesburg', 'to' => 'Cape Town', 'departure' => '08:00', 'arrival' => '10:00', 'duration' => '2h', 'price' => '$89'],
                ['flight' => 'FA102', 'from' => 'Cape Town', 'to' => 'Johannesburg', 'departure' => '11:00', 'arrival' => '13:00', 'duration' => '2h', 'price' => '$89'],
                ['flight' => 'FA203', 'from' => 'Durban', 'to' => 'London', 'departure' => '14:00', 'arrival' => '22:00', 'duration' => '8h', 'price' => '$599'],
                ['flight' => 'FA204', 'from' => 'Johannesburg', 'to' => 'Dubai', 'departure' => '09:00', 'arrival' => '17:00', 'duration' => '8h', 'price' => '$499'],
                ['flight' => 'FA205', 'from' => 'Cape Town', 'to' => 'Paris', 'departure' => '12:00', 'arrival' => '21:00', 'duration' => '9h', 'price' => '$649'],
                ['flight' => 'FA206', 'from' => 'Johannesburg', 'to' => 'New York', 'departure' => '15:00', 'arrival' => '23:00', 'duration' => '8h', 'price' => '$699'],
            ];
            foreach ($flights as $flight): ?>
                <div class="flight-card" onclick="alert('Book flight <?php echo $flight['flight']; ?>')">
                    <div class="flight-route">
                        <div class="departure">
                            <div class="city"><?php echo $flight['from']; ?></div>
                            <div class="time"><?php echo $flight['departure']; ?></div>
                        </div>
                        <div class="flight-line">✈️ — <?php echo $flight['duration']; ?> — ✈️</div>
                        <div class="arrival">
                            <div class="city"><?php echo $flight['to']; ?></div>
                            <div class="time"><?php echo $flight['arrival']; ?></div>
                        </div>
                    </div>
                    <div class="flight-details">
                        <div class="flight-number">Flight <?php echo $flight['flight']; ?></div>
                        <div class="flight-price"><?php echo $flight['price']; ?></div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
</body>

</html>