// ===== LOAD ALL PLANS =====
async function loadPlans() {
  try {
    const plans = await getPlans();

    // ===== CALCULATE TOTALS =====
    const totals = {};
    plans.forEach(p => {
      if (!totals[p.day]) totals[p.day] = 0;
      totals[p.day] += p.calories || 0;
    });

    // ===== CLEAR + SET HEADERS =====
    document.querySelectorAll(".day-column").forEach(col => {
      const day = col.dataset.day;
      const total = totals[day] || 0;

      col.innerHTML = `<h4>${day} (${total} cal)</h4>`;

      // ===== DRAG OVER =====
      col.addEventListener("dragover", (e) => {
        e.preventDefault();
        col.classList.add("drag-over");
      });

      col.addEventListener("dragleave", () => {
        col.classList.remove("drag-over");
      });

      // ===== DROP =====
      col.addEventListener("drop", async (e) => {
        e.preventDefault();
        col.classList.remove("drag-over");

        const mealId = e.dataTransfer.getData("mealId");
        await moveMeal(mealId, day);
        loadPlans();
      });
    });

    // ===== RENDER MEALS =====
    plans.forEach(p => {
      const column = document.querySelector(`[data-day="${p.day}"]`);
      if (!column) return;

      const item = document.createElement("div");
      item.classList.add("planned-meal");

      item.innerHTML = `
        <strong>${p.item_name}</strong>
        <small>${p.calories || 0} cal</small>
      `;

      // ===== DRAG START =====
      item.setAttribute("draggable", true);
      item.addEventListener("dragstart", (e) => {
        e.dataTransfer.setData("mealId", p.id);
      });

      // ===== DELETE BUTTON =====
      const btn = document.createElement("button");
      btn.textContent = "✖";
      btn.classList.add("delete-btn");

      btn.onclick = () => {
        if (confirm("Delete this meal?")) {
          deletePlan(p.id);
        }
      };

      item.appendChild(btn);
      column.appendChild(item);
    });

  } catch (err) {
    console.error("Error loading plans:", err);
  }
}

// ===== MOVE MEAL =====
async function moveMeal(id, newDay) {
  try {
    await fetch(`http://localhost:5000/api/plans/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ day: newDay })
    });
  } catch (err) {
    console.error("Error moving meal:", err);
  }
}

// ===== DELETE =====
async function deletePlan(id) {
  try {
    await fetch(`http://localhost:5000/api/plans/${id}`, {
      method: "DELETE"
    });
    loadPlans();
  } catch (err) {
    console.error("Error deleting plan:", err);
  }
}

// ===== SAVE PLAN =====
async function savePlan() {
  try {
    const plans = await getPlans();

    if (plans.length === 0) {
      alert("No meals to save.");
      return;
    }

    alert("Plan saved successfully!");
  } catch (err) {
    console.error("Error saving plan:", err);
    alert("Error saving plan.");
  }
}

// ===== BACK BUTTON =====
function goToDashboard() {
  window.location.href = "dashboard.html";
}

// ===== INIT =====
window.addEventListener("DOMContentLoaded", loadPlans);