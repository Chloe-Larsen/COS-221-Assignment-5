<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In - Travel Agency</title>
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <h1>Log In</h1>
        
        <div id="alert-box" style="display: none; color: red; margin-bottom: 10px;"></div>
        
        <form id="login-form">
            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" required>
            </div>
            
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" required>
            </div>
            
            <button type="submit" id="submit-btn">Log In</button>
        </form>

        <p>Don't have an account? <a href="/signup">Sign Up</a></p>
    </main>

    <script src="/javascript/global.js"></script>
    <script src="/javascript/login.js"></script>
</body>

</html>
