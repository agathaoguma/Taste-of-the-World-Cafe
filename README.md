# ☕ Taste of the World Café – Sales Analysis

## 📌 Project Overview

This project analyzes the performance of Taste of the World Café following the launch of a new menu at the start of 2023. The goal is to evaluate sales trends, customer behavior, and product performance using transactional data.

This project was completed as part of a Maven Analytics guided project. The project structure was provided, but all data analysis, SQL queries, and dashboard development were independently carried out by me.

---

## 🎯 Business Objective

The restaurant needed a clear, data-driven way to understand:

* Which menu items drive revenue
* Customer purchasing behavior
* Peak business hours and demand trends
* Opportunities to increase average order value
  
---

## 🔍 Scope of Analysis

The analysis focuses on five key areas:

* **Revenue Leaders**: Identifying top-performing menu categories
* **Top & Bottom Performers**: Highlighting best and worst-selling items
* **Peak Demand**: Determining busiest days and hours
* **Order Size**: Analyzing customer spending patterns
* **Menu Pairings**: Discovering frequently purchased item combinations

---

## 🗂️ Data Structure

The dataset consists of two tables with a total of **12,266 records**.

### 1. `order_details`

* **order_details_id (PK)**: Unique record identifier
* **order_id**: Order identifier (repeats per item)
* **order_date**: Date of order
* **order_time**: Time of order
* **item_id (FK)**: Links to menu_items

👉 *Granularity: One row per item within an order*

### 2. `menu_items`

* **menu_item_id (PK)**: Unique item identifier
* **item_name**: Name of item
* **category**: Item category (American, Asian, Italian, Mexican)
* **price**: Item price

👉 *Granularity: One row per menu item*

### 🔗 Relationship
 ![]([https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/87351320c3a21d082985a09e43d5b3c17460cd03/Entity%20Relationship%20Diagram.jpg](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/f72bb3f64f7035d299a23b6bb55743fd6e0e1140/Relationship%20diagram.png))

* One-to-Many (1:M)
* One menu item → many order records

### ⚠️ Data Quality Check

* `menu_items`: 32 rows
* `order_details`: 12,234 rows
* Joined dataset: 12,097 rows

➡️ **Insight**: 137 records in `order_details` have no matching menu item, indicating potential data inconsistencies.

---

## 📊 Executive Summary

* Italian and Asian cuisines are the primary revenue drivers
* The **Korean Beef Bowl** is the top-performing item (> $10K revenue)
* Sales peak mid-month and at month-end (payday effect)
* ~40% of customers purchase only one item
* Medium-sized orders ($20–$40) generate the highest revenue

---

## 🚀 Key Insights & Recommendations

### 1. 💰 Revenue Leaders

* Italian cuisine generates the highest revenue due to premium pricing
* Asian cuisine leads in order volume
* Revenue spikes occur mid-month and end-of-month

**Recommendations:**

* Introduce premium add-ons for Italian dishes
* Create bundle deals for Asian cuisine
* Align marketing with payday cycles

---

### 2. ⭐ Top & Bottom Performers

* **Top Item**: Korean Beef Bowl ($10.6K revenue)
* **High Volume Items**: Hamburger, Edamame
* **Worst Performer**: Chicken Tacos

**Recommendations:**

* Promote high-margin “hero” products
* Bundle high-volume, low-revenue items
* Remove or improve underperforming items

---

### 3. ⏰ Peak Demand

* Peak hours: **12 PM (Lunch)** and **5 PM (Dinner)**
* Highest revenue day: **Monday**
* Peak period: End of the month

**Recommendations:**

* Optimize staffing during peak hours
* Run promotions on Mondays
* Increase inventory before month-end

---

### 4. 🛒 Order Size & Spending

* Average Order Value: **$29.60**
* Medium orders (2–4 items) generate most revenue
* 40% of customers buy only one item

**Recommendations:**

* Encourage add-ons (drinks/sides)
* Create combo deals around $30
* Introduce family/group meal options

---

### 5. 🍽️ Menu Pairings

* Most common pairing: **Edamame + Burger**
* Highest revenue combos involve Korean Beef Bowl
* Weakest combos involve Chicken Tacos

**Recommendations:**

* Create official combo meals
* Promote high-value pairings
* Remove low-performing combinations

---

## ⚙️ Assumptions & Data Cleaning

### 1. Order Size Categorization

* Small: 1 item
* Medium: 2–4 items
* Large: 5+ items

### 2. Data Cleaning

* Removed ~2.5% of records with zero/negative revenue
* Ensured accurate Average Order Value calculation

---

## 📈 Tools & Skills Used

* **SQL (PostgreSQL)** – Data cleaning & analysis
* **Power BI** – Dashboard creation & visualization
* **Data Analysis** – Business insights & storytelling

---

## 📌 Conclusion

This analysis provides actionable insights into customer behavior, product performance, and revenue trends. By focusing on high-performing items, optimizing pricing strategies, and leveraging customer purchase patterns, the restaurant can significantly improve profitability.

---

## 📷 Dashboard Preview

*(Insert dashboard screenshots here)*

---

## 🔗 Author

**Agatha Oguma**
Aspiring Data Analyst | SQL | Power BI | Business Intelligence
