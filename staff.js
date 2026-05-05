const API = "http://localhost:5000/api";

// ===== LOAD ALL MEALS =====
async function loadMeals() {
  try {
    const res = await fetch(`${API}/meals`);
    const meals = await res.json();

    const container = document.getElementById("meal-list");
    container.innerHTML = "";

    meals.forEach(meal => {
      const card = document.createElement("div");
      card.classList.add("meal-card");

      card.innerHTML = `
        <h4>${meal.item_name}</h4>
        <p>${meal.calories} cal</p>
        <p>${meal.category}</p>
        <p>$${meal.price}</p>
      `;

      const btn = document.createElement("button");
      btn.textContent = "Delete";
      btn.onclick = () => deleteMeal(meal.item_id);

      card.appendChild(btn);
      container.appendChild(card);
    });

  } catch (err) {
    console.error(err);
  }
}

// ===== ADD MEAL =====
async function addMeal() {
  const item_name = document.getElementById("name").value.trim();
  const calories = document.getElementById("calories").value;
  const category = document.getElementById("category").value.trim();
  const price = document.getElementById("price").value;

  if (!item_name) {
    alert("Enter meal name");
    return;
  }

  await fetch(`${API}/meals`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      item_name,
      calories,
      category,
      price
    })
  });

  loadMeals();
}

// ===== DELETE =====
async function deleteMeal(id) {
  if (!confirm("Delete this meal?")) return;

  await fetch(`${API}/meals/${id}`, {
    method: "DELETE"
  });

  loadMeals();
}

window.onload = loadMeals;

router.post("/", (req, res) => {
  const { item_name, calories, category, price } = req.body;

  db.query(
    "INSERT INTO items (item_name, calories, category, price) VALUES (?, ?, ?, ?)",
    [item_name, calories, category, price],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: "Meal Added" });
    }
  );
});
router.delete("/:id", (req, res) => {
  db.query(
    "DELETE FROM items WHERE item_id = ?",
    [req.params.id],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: "Meal Deleted" });
    }
  );
});