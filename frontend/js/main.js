// ===== STUDENT LOGIN =====
async function login() {
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value.trim();

  try {
    const res = await fetch("http://localhost:5000/api/auth/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ email, password })
    });

    const data = await res.json();

    if (!data.success) {
      alert("Login failed");
      return;
    }

    localStorage.setItem("user", email);
    localStorage.setItem("role", "student");

    window.location.href = "dashboard.html";

  } catch (err) {
    console.error(err);
    alert("Server error");
  }
}


// ===== STAFF LOGIN =====
function staffLogin() {
  const username = document.getElementById("staffUser").value.trim();

  // accept anything
  localStorage.setItem("staff", username || "staff");
  localStorage.setItem("role", "staff");

  window.location.href = "staff.html";
}


// ===== LOGOUT (CLEARS PLANNER) =====
async function logout() {
  try {
    //  clear all planner meals
    await fetch("http://localhost:5000/api/plans", {
      method: "DELETE"
    });
  } catch (err) {
    console.error("Error clearing planner:", err);
  }

  // clear session
  localStorage.clear();

  // redirect
  window.location.href = "index.html";
}
