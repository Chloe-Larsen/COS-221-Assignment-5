const loginForm = document.getElementById("login-form");
const alertBox = document.getElementById("alert-box");
const submitBtn = document.getElementById("submit-btn");

function showAlert(message, isError = true) {
    alertBox.textContent = message;
    alertBox.style.color = isError ? "red" : "green";
    alertBox.style.display = "block";
}

function hideAlert() {
    alertBox.style.display = "none";
}

loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    hideAlert();

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    if (!email || !password) {
        showAlert("Please fill in all fields.");
        return;
    }

    submitBtn.disabled = true;
    submitBtn.textContent = "Logging in...";

    try {
        const response = await fetch("/api/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ email, password }),
        });

        let data = null;
        const text = await response.text();
        if (text) {
            try {
                data = JSON.parse(text);
            } catch (e) {
                // Not JSON
            }
        }

        console.log(response)
        if (response.ok) {
            showAlert("Login successful! Redirecting...", false);
            setTimeout(() => {
                window.location.href = "/dashboard";
            }, 1000);
        } else {
            const errorMessage = data ? (data.error || data.message || "Failed to log in.") : "Invalid email or password.";
            showAlert(errorMessage);
            submitBtn.disabled = false;
            submitBtn.textContent = "Log In";
        }
    } catch (error) {
        console.error("Login error:", error);
        showAlert("A network error occurred. Please try again.");
        submitBtn.disabled = false;
        submitBtn.textContent = "Log In";
    }
});
