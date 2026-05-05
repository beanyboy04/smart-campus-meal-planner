
const API = "http://localhost:5000/api";

// ===== MEALS =====
async function getMeals() {
  try {
    const res = await fetch(`${API}/meals`);
    return await res.json();
  } catch (err) {
    console.error("Error fetching meals:", err);
    return [];
  }
}

// ===== PLANS =====

// Get all plans
async function getPlans() {
  try {
    const res = await fetch(`${API}/plans`);
    return await res.json();
  } catch (err) {
    console.error("Error fetching plans:", err);
    return [];
  }
}

// Add meal to plan
async function addPlan(day, meal) {
  try {
    const res = await fetch(`${API}/plans`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        day: day,
        item_name: meal.item_name,
        calories: meal.calories,
        price: Number(meal.price) || 0
      })
    });

    const data = await res.json(); // always read response

    console.log("SERVER RESPONSE:", data);

    // 🔥 IMPORTANT: only fail if real error
    if (res.status === 500) return false;

    return true;

  } catch (err) {
    console.error("Error adding plan:", err);
    return false;
  }
}

// Delete plan
async function deletePlanAPI(id) {
  try {
    await fetch(`${API}/plans/${id}`, {
      method: "DELETE"
    });
  } catch (err) {
    console.error("Error deleting plan:", err);
  }
}
