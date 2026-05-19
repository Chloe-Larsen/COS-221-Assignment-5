<header>
    <nav>
        <a href="/">Home</a> |
        <a href="/flights">Flights</a> |
        <a href="/destinations">Destinations</a> |
        <a href="/attractions">Attractions</a> |
        <a href="/accomodations">Accommodations</a> |
        <a href="/packages">Packages</a> |
        <a href="/dashboard">Dashboard</a> |
        
        <?php if (isset($_COOKIE['apiKey'])): ?>
            <!-- show if logged in -->
            <a id="header-logout-button">Log Out</a>
        <?php else: ?>
            <!-- show if logged out -->
            <a href="/login">Log In</a> |
            <a href="/signup">Sign Up</a>
        <?php endif; ?>
    </nav>
</header>
<hr>