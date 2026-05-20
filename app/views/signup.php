<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Tripistry</title>
    <meta name="description" content="Create your Tripistry account and start planning your perfect trip today.">
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/signup.css">
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <div class="auth-container">
            <div class="auth-card">
                <div class="auth-header">
                    <div class="auth-icon">🌍</div>
                    <h1>Create Account</h1>
                    <p>Join Tripistry and start exploring the world</p>
                </div>

                <div id="alert-box" class="alert alert-error"></div>

                <form id="signup-form">
                    <div class="form-group">
                        <label for="user-type">Account Type</label>
                        <select id="user-type">
                            <option value="traveller">Traveller</option>
                            <option value="agency">Agency User</option>
                        </select>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" placeholder="Jane" required>
                        </div>

                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" placeholder="Smith" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" placeholder="you@example.com" required>
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="text" id="phoneNumber" placeholder="+27 12 345 6789" required>
                    </div>

                    <div class="form-group">
                        <label for="country">Country</label>
                        <input type="text" id="country" placeholder="South Africa" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" placeholder="Password" required>
                        <span class="field-hint">At least 9 characters with uppercase, lowercase, a digit, and a special character.</span>
                    </div>

                    <button type="submit" id="submit-btn" class="btn-full">Create Account</button>
                </form>

                <p class="auth-footer">Already have an account? <a href="/login">Log In</a></p>
            </div>
        </div>
    </main>

    <?php require_once __DIR__ . '/../includes/footer.php'; ?>
    <script src="/javascript/global.js"></script>
    <script src="/javascript/signup.js"></script>
</body>

</html>
