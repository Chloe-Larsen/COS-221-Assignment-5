<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Travel Agency</title>

    <link rel="stylesheet" href="/css/global.css" />
    <link rel="stylesheet" href="/css/signup.css" />
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <h1>Sign Up</h1>
        <form action="#" method="POST" onsubmit="event.preventDefault(); alert('Signed Up successfully!');">
            <div>
                <label for="new-username">Username:</label>
                <input type="text" id="new-username" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" required>
            </div>
            <div>
                <label for="new-password">Password:</label>
                <input type="password" id="new-password" required>
            </div>
            <button type="submit">Sign Up</button>
        </form>
    </main>

    <script src="/javascript/global.js"></script>
    <script src="/javascript/signup.js"></script>
</body>

</html>
