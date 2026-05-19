<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Travel Agency</title>
</head>

<body>
    <?php require_once __DIR__ . '/../includes/header.php'; ?>

    <main>
        <h1>Sign Up</h1>

        <div id="alert-box" style="display: none; color: red; margin-bottom: 10px;"></div>

        <form id="signup-form">
            <div>
                <label for="user-type">User Type:</label>
                <select id="user-type">
                    <option value="traveller">Traveller</option>
                    <option value="agency">Agency User</option>
                </select>
            </div>

            <div>
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" required>
            </div>

            <div>
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" required>
            </div>

            <div>
                <label for="email">Email:</label>
                <input type="email" id="email" required>
            </div>

            <div>
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" required>
            </div>

            <div>
                <label for="country">Country:</label>
                <input type="text" id="country" required>
            </div>

            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" required>
                <span>(Must be at least 9 characters long, contain uppercase, lowercase, a digit, and a special character)</span>
            </div>

            <button type="submit" id="submit-btn">Sign Up</button>
        </form>

        <p>Already have an account? <a href="/login">Log In</a></p>
    </main>

    <script src="/javascript/global.js"></script>
    <script src="/javascript/signup.js"></script>
</body>

</html>
