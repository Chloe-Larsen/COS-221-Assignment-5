<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In - Tripistry</title>
    <meta name="description" content="Log in to your Tripistry account to access your travel packages and bookings.">
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/login.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="auth-container">
            <div class="auth-card">
                <div class="auth-header">
                    <div class="auth-icon">✈️</div>
                    <h1>Welcome Back</h1>
                    <p>Sign in to continue your journey</p>
                </div>

                <div id="alert-box" class="alert alert-error"></div>

                <form id="login-form">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" placeholder="you@example.com" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" placeholder="Password" required>
                    </div>

                    <button type="submit" id="submit-btn" class="btn-full">Log In</button>
                </form>

                <p class="auth-footer">Don't have an account? <a href="/signup">Sign Up</a></p>
            </div>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
    <script src="/javascript/login.js"></script>
</body>

</html>
