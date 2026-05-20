const signupForm = document.getElementById("signup-form");
const alertBox = document.getElementById("alert-box");
const submitBtn = document.getElementById("submit-btn");
const userTypeSelect = document.getElementById("user-type");

function showAlert(message, isError = true) {
    alertBox.textContent = message;
    alertBox.style.color = isError ? "red" : "green";
    if (!isError && alertBox.style.color === "green") {
        // If it's a warning (agency warning), we could use orange
    }
    alertBox.style.display = "block";
}

function hideAlert() {
    alertBox.style.display = "none";
}

// Warn when user changes type to agency
userTypeSelect.addEventListener("change", () => {
    hideAlert();
    if (userTypeSelect.value === "agency") {
        showAlert("Agency User registration is not implemented yet. Please choose Traveller.", true);
        alertBox.style.color = "orange";
    }
});

const passwordRegex = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{9,}$/;

signupForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    hideAlert();

    const userType = userTypeSelect.value;
    if (userType !== "traveller") {
        showAlert("Agency User registration is not implemented yet. Please register as a Traveller.");
        return;
    }

    const firstName = document.getElementById("firstName").value.trim();
    const lastName = document.getElementById("lastName").value.trim();
    const email = document.getElementById("email").value.trim();
    const phoneNumber = document.getElementById("phoneNumber").value.trim();
    const country = document.getElementById("country").value.trim();
    const password = document.getElementById("password").value.trim();

    if (!firstName || !lastName || !email || !phoneNumber || !country || !password) {
        showAlert("Please fill in all fields.");
        return;
    }

    // Client-side password validation to match regex in register-traveller.php
    if (!passwordRegex.test(password)) {
        showAlert("Password must be at least 9 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.");
        return;
    }

    submitBtn.disabled = true;
    submitBtn.textContent = "Creating Account...";

    try {
        const response = await fetch("/api/register/traveller", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                firstName,
                lastName,
                email,
                phoneNumber,
                country,
                password
            })
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

        if (response.ok) {
            showAlert("Account created successfully! Redirecting...", false);
            setTimeout(() => {
                window.location.href = "/dashboard";
            }, 1000);
        } else {
            const errorMessage = data ? (data.message || data.error || "Failed to register.") : "Failed to register.";
            showAlert(errorMessage);
            submitBtn.disabled = false;
            submitBtn.textContent = "Sign Up";
        }
    } catch (error) {
        console.error("Signup error:", error);
        showAlert("A network error occurred. Please try again.");
        submitBtn.disabled = false;
        submitBtn.textContent = "Sign Up";
    }
});
