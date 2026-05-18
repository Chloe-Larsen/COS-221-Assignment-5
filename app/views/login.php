<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In - Travel Agency</title>

    <link rel="stylesheet" href="/css/global.css" />
    <link rel="stylesheet" href="/css/login.css" />
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <h1>Log In</h1>
        <form action="#" method="POST" onsubmit="event.preventDefault(); alert('Logged In!');">
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" required>
            </div>
            <button type="submit">Log In</button>
        </form>
    </main>

    <script src="/javascript/global.js"></script>
    <script src="/javascript/login.js"></script>
</body>

</html>
