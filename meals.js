// ===== STATE =====
let allMeals = [];
let currentCategory = "";

// ===== LOAD DATA =====
let initialized = false;

async function loadMeals() {
  if (initialized) return;
  initialized = true;

  try {
    const meals = await getMeals();
    allMeals = meals;

    document.getElementById("search").addEventListener("input", filterMeals);
    document.getElementById("sort").addEventListener("change", filterMeals);

    filterMeals();

  } catch (err) {
    console.error("Error loading meals:", err);
  }
}

window.addEventListener("DOMContentLoaded", loadMeals);

// ===== CATEGORY =====
function setCategory(cat) {
  currentCategory = cat;
  filterMeals();
}

// ===== FILTER =====
let timeout;

function filterMeals() {
  clearTimeout(timeout);

  timeout = setTimeout(() => {
    const search = document.getElementById("search").value.toLowerCase();
    const sort = document.getElementById("sort").value;

    let filtered = allMeals.filter(meal =>
      meal.item_name.toLowerCase().includes(search) &&
      (currentCategory === "" || meal.category === currentCategory)
    );

    if (sort === "low") {
      filtered.sort((a, b) => a.calories - b.calories);
    } else if (sort === "high") {
      filtered.sort((a, b) => b.calories - a.calories);
    }

    renderMeals(filtered);
  }, 150);
}

// ===== ADD TO PLANNER =====
async function addToPlan(day, meal) {
  const success = await addPlan(day, meal);

  if (success) {
    window.location.href = "planner.html";
  } else {
    alert("Meal NOT added. Check backend.");
  }
}

// ===== RENDER =====
function renderMeals(meals) {
  const container = document.getElementById("meals-grid");

  container.innerHTML = "";

  if (meals.length === 0) {
    container.innerHTML = "<p>No meals found.</p>";
    return;
  }

  const fragment = document.createDocumentFragment();

  meals.forEach(meal => {
    const card = document.createElement("div");
    card.className = "meal-card";

    // pick icon based on category
    const icon = getCategoryIcon(meal.category);

    card.innerHTML = `
      <div class="meal-header">
        <span class="meal-icon">${icon}</span>
        <span class="meal-category ${meal.category.toLowerCase()}">${meal.category}</span>
      </div>

      <h4>${meal.item_name}</h4>

      <div class="meal-info">
        <span class="calories">${meal.calories} cal</span>
      </div>
    `;

    const btn = document.createElement("button");
    btn.textContent = "Add to Planner";
    btn.onclick = () => {
  const day = prompt("Enter day (Mon, Tue, Wed, Thu, Fri):");
  if (day) addToPlan(day, meal);
};

    card.appendChild(btn);
    fragment.appendChild(card);
  });

  container.appendChild(fragment);
}

function getCategoryIcon(category) {
  switch (category) {
    case "Main": return "🍔";
    case "Breakfast": return "🍳";
    case "Salad": return "🥗";
    case "Side": return "🍟";
    case "Soup": return "🍲";
    default: return "🍽️";
  }
}