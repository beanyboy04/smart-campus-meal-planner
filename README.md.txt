Smart Campus Meal Planner - Database

 Overview
This is the complete MySQL database for the **Smart Campus Meal Planner** project at Georgia Southern University. It manages students, meal plans, food items, orders, and employee access with secure login authentication.

Admins have full database access, can modify menu, manage users
Menu Managers can add/edit/delete menu items
Cashiers can process student orders
Kitchen Staff View-only access to orders
Students can view menu, place orders, check balance
Database Statistics


All passwords are hashed with SHA2 + unique salt
All accounts lock after 5 failed login attempts
The student table and employee login tables are separate
There is also a password reset functionality available 

| Metric | Count |
|--------|-------|
| Total Tables | 11 |
| Total Rows | 500+ |
| Food Items | 172 |
| Students | 23 |
| Meals | 21 |
| Employees | 17 |

Table Structure

| Table | Rows | Description 
|-------|------|-------------
| `students` | 23 | Student info with meal balances 
| `items` | 172 | Food items with nutrition & allergens 
| `meals` | 21 | Breakfast, lunch, and dinner combos 
| `meal_items` | 53 | Links meals to food items 
| `orders` | 10 | Student purchase records 
| `employee` | 17 | Staff and student employees 
| `nutrition_facts` | 197 | Ingredients and allergen info 
| `3_day_plans` | 10 | 3-day meal plan subscriptions 
| `7_day_plans` | 5 | 7-day meal plan subscriptions 
| `plan_modifications` | 10 | Student meal change requests 
| `menu_update_log` | 13 | Employee audit trail 
| `student_login` | 5 | Student login credentials (encrypted) 
| `employee_login` | 7 | Employee login credentials (encrypted) 
| `password_resets` | 0 | Password reset management 

 SAMPLE QUERIES

-------------------------------------------------------
Today's Menu

SELECT m.meal_name, i.item_name, i.is_vegetarian, i.is_gluten_free
FROM meals m
JOIN meal_items mi ON m.meal_id = mi.meal_id
JOIN items i ON mi.item_id = i.item_id
WHERE m.day_of_week = 'Monday';


-------------------------------------------------------

CHECK STUDENT BALANCE

SELECT student_name, meal_balance 
FROM students 
WHERE student_id = 1;

-------------------------------------------------------

Student Login

SELECT s.student_id, s.student_name, s.meal_balance
FROM student_login sl
JOIN students s ON sl.student_id = s.student_id
WHERE sl.username = 'jsmith' 
AND sl.password_hash = SHA2(CONCAT('Student123!', sl.salt), 256);


-------------------------------------------------------







