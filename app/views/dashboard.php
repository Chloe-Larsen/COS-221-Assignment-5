<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Travel Agency</title>

    <link rel="stylesheet" href="/css/global.css" />
    <link rel="stylesheet" href="/css/dashboard.css" />
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <h1>Travel Agency Dashboard</h1>
        <p>This is a bare-bones page for managing travel packages.</p>
        
        <section>
            <h2>Create a Package</h2>
            <form action="#" method="POST" onsubmit="event.preventDefault(); alert('Package Created!');">
                <div>
                    <label for="pkg-name">Package Name:</label>
                    <input type="text" id="pkg-name" required>
                </div>
                <div>
                    <label for="pkg-price">Price ($):</label>
                    <input type="number" id="pkg-price" required>
                </div>
                <button type="submit">Add Package</button>
            </form>
        </section>

        <section>
            <h2>Current Packages</h2>
            <ul>
                <li>Summer Getaway</li>
                <li>Romantic Paris</li>
                <li>Explore Tokyo</li>
            </ul>
        </section>
    </main>

    <script src="/javascript/global.js"></script>
    <script src="/javascript/dashboard.js"></script>
</body>

</html>
