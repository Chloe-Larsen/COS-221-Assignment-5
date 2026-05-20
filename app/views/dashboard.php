<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Travel Agency</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/dashboard.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>
    
    <?php
    session_start();
    $message = '';
    $messageType = '';
    $packages = [
        ['id' => 1, 'name' => 'Summer Getaway', 'destination' => 'Cape Town', 'price' => 1200],
        ['id' => 2, 'name' => 'Romantic Paris', 'destination' => 'Paris', 'price' => 2500],
        ['id' => 3, 'name' => 'Explore Tokyo', 'destination' => 'Tokyo', 'price' => 3200],
    ];
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_package'])) {
        $packageName = trim($_POST['package_name'] ?? '');
        $packagePrice = floatval($_POST['package_price'] ?? 0);
        $packageDestination = trim($_POST['package_destination'] ?? '');
        
        if ($packageName && $packagePrice > 0) {
            $message = "Package '$packageName' added successfully!";
            $messageType = "success";
            array_unshift($packages, ['id' => count($packages) + 1, 'name' => $packageName, 'destination' => $packageDestination, 'price' => $packagePrice]);
        } else {
            $message = "Please provide valid package name and price.";
            $messageType = "error";
        }
    }
    
    if (isset($_GET['delete'])) {
        $message = "Package deleted successfully!";
        $messageType = "success";
    }
    ?>

    <main>
        <h1>Dashboard</h1>
        <p style="color: var(--gray-600); margin-bottom: 2rem;">Manage your travel packages.</p>
        
        <?php if ($message): ?>
            <div class="alert alert-<?php echo $messageType; ?> show"><?php echo htmlspecialchars($message); ?></div>
        <?php endif; ?>
        
        <div class="dashboard-grid">
            <div class="form-card">
                <h2>Create New Package</h2>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="package_name">Package Name</label>
                        <input type="text" id="package_name" name="package_name" placeholder="e.g., Summer in Paris" required>
                    </div>
                    <div class="form-group">
                        <label for="package_destination">Destination</label>
                        <input type="text" id="package_destination" name="package_destination" placeholder="e.g., Paris, France">
                    </div>
                    <div class="form-group">
                        <label for="package_price">Price ($)</label>
                        <input type="number" id="package_price" name="package_price" step="0.01" placeholder="0.00" required>
                    </div>
                    <button type="submit" name="add_package">Add Package →</button>
                </form>
            </div>

            <div class="packages-card">
                <h2>Current Packages</h2>
                <?php if (empty($packages)): ?>
                    <div class="empty-state">
                        <p>No packages yet</p>
                        <p style="font-size: 0.875rem;">Create your first package using the form</p>
                    </div>
                <?php else: ?>
                    <div class="packages-list">
                        <?php foreach ($packages as $pkg): ?>
                            <div class="package-row">
                                <div class="package-info">
                                    <strong><?php echo htmlspecialchars($pkg['name']); ?></strong>
                                    <?php if ($pkg['destination']): ?>
                                        <span class="destination">📍 <?php echo htmlspecialchars($pkg['destination']); ?></span>
                                    <?php endif; ?>
                                    <span class="price">$<?php echo number_format($pkg['price'], 2); ?></span>
                                </div>
                                <button class="btn delete-btn" onclick="alert('Delete <?php echo $pkg['name']; ?>?')">Delete</button>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
</body>

</html>