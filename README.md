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

## 🗂️ Data Structure & Data Source

### Data Source

The dataset used in this project was obtained from a **Maven Analytics guided project**.

- Source: [Maven Analytics Guided Project](https://app.mavenanalytics.io/guided-projects/d7167b45-6317-49c9-b2bb-42e2a9e9c0bc)) 
- The dataset was provided as part of the project and imported into a PostgreSQL database for analysis.

---

### Database Structure

The database consists of two relational tables:

#### 1. `order_details`
This table captures transactional data for each order placed.

- `order_details_id` (PK): Unique identifier for each record  
- `order_id`: Identifier for each order (can appear multiple times per order)  
- `order_date`: Date the order was placed  
- `order_time`: Time the order was placed  
- `item_id` (FK): References `menu_items.menu_item_id`  

👉 **Granularity:** One row per item within an order  

---

#### 2. `menu_items`
This table contains information about the restaurant’s menu.

- `menu_item_id` (PK): Unique identifier for each menu item  
- `item_name`: Name of the menu item  
- `category`: Item category (American, Asian, Italian, Mexican)  
- `price`: Price of the item  

👉 **Granularity:** One row per menu item  

---

### 🔗 Table Relationship
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Relationship%20diagram.png)

- **One-to-Many (1:M)** relationship  
  - One menu item → can appear in many order records  
  - Each order record → references one menu item  

---

### ⚠️ Data Quality & Initial Checks

- `menu_items`: 32 rows  
- `order_details`: 12,234 rows  
- Joined dataset: 12,097 rows  

➡️ **Insight:** 137 records in `order_details` do not have matching entries in `menu_items`, indicating missing or inconsistent references.

---

### Data Quality Note

Records with missing or unmatched `item_id` values were excluded during the join between `order_details` and `menu_items`.

This ensures that all analysis is based on valid transactions with complete menu information, maintaining accuracy in revenue and item-level insights while slightly reducing the total number of analyzed records

---
## 🧮 SQL Analysis

All SQL queries used in this project are available in the [`/sql` directory](https://github.com/agathaoguma/Taste-of-the-World-Cafe/tree/9d4a6d0662a20abd6960293cd56c2b1fe7845b5e/sql).  
Each file represents a specific area of analysis and is well documented with comments.

---

## 📊 Executive Summary
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Summary%20Dashboard.jpg)

* Italian and Asian cuisines are the primary revenue drivers
* The **Korean Beef Bowl** is the top-performing item (> $10K revenue)
* Sales peak mid-month and at month-end (payday effect)
* ~40% of customers purchase only one item
* Medium-sized orders ($20–$40) generate the highest revenue

---

## 🚀 Key Insights & Recommendations

### 1. 💰 Revenue Leaders
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Revenue%20by%20Category%20Dashboard.jpg)

### Key Insights

- **Italian cuisine is the primary revenue driver**, generating the highest revenue despite lower order volume. This indicates that customers perceive Italian dishes as **premium, high-value, “special occasion” meals**, and are willing to pay the average price of **$16.80 per item**.
- **Asian cuisine leads in order volume**, suggesting it is viewed as a **convenient, go-to option**. Its strong demand is driven by accessibility and frequent customer preference, even at lower price points.
- **Revenue peaks consistently occur mid-month and at month-end**, indicating a strong correlation with **payday cycles**. Customers tend to increase spending when disposable income is higher, leading to noticeable spikes in transactions and revenue.

---

### Strategic Recommendations

- **Enhance Italian offerings with premium add-ons**  
  Since customers are already willing to pay higher prices, introducing add-ons (e.g., sides, premium ingredients, or upgrades) can further increase **average order value (AOV)**.

- **Develop combo meals and family packs for Asian cuisine**  
  Leverage high demand by encouraging larger basket sizes through bundled offers, which can help convert high-volume traffic into **higher revenue per order**.

- **Align promotions with payday cycles**  
  Schedule marketing campaigns, discounts, and featured items during **mid-month (10th–15th)** and **end-of-month periods**, when customer spending is highest.

- **Revitalize American and Mexican categories**  
  These categories show the lowest performance in both volume and revenue. Consider:
  - Menu repositioning  
  - “Happy Hour” or targeted discounts  
  - Product innovation or menu refresh  
  to improve competitiveness and customer interest.

---

### 2. ⭐ Top & Bottom Performers
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Top%20and%20Bottom%20Items%20Dashboard.jpg)

- **The Korean Beef Bowl is the standout revenue leader**, generating over **$10.6K in revenue**, outperforming the next closest item (Spaghetti & Meatballs at $8.4K) by over 25%. Although it ranks third in sales volume (588 units), its strong revenue contribution highlights an optimal balance between popularity and price, making it the most valuable item on the menu.

- **Hamburgers and Edamame drive maximum foot traffic**, with 622 and 620 units sold respectively. However, their revenue impact differs significantly: the Hamburger is a strong contributor ($8.1K), while Edamame is an underperformer ($3.1K). This suggests Edamame drives volume but contributes less to overall profitability compared to main dishes.

- **Chicken Tacos are the lowest performers across all metrics**, with only 123 units sold and total revenue of $1.5K. Consistently appearing at the bottom across charts, this item represents a strong candidate for removal or reformulation to better optimize kitchen resources.

- **Revenue threshold highlights critical underperformers**, including Meat Lasagna, Salmon Rolls, and Veggie Burgers, all of which fall below the portfolio average of **$4.9K in revenue**. Despite some items (like Potstickers and Steak Tacos) showing decent sales volume, they fail to meet the revenue benchmark, making them strong candidates for pricing adjustments or replacement.

### Strategic Recommendations

- **Capitalize on the Korean Beef Bowl**  
  Feature this item prominently in marketing and menu placement as the primary “hero” product.

- **Address high-volume, low-revenue items**  
  For items like Edamame and French Fries, consider slight price increases or bundling with higher-margin items (e.g., beverages) to improve profitability.

- **Menu optimization (pruning)**  
  Consider phasing out low-performing items such as Chicken Tacos and Potstickers to make room for higher-performing or test items.

---

### 3. ⏰ Peak Demand
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Peak%20Day%20and%20Hour%20Dashboard.jpg)

- **Lunch and early dinner are the primary daily rushes**, with peak activity occurring at **12:00 PM (lunch)** and **5:00 PM (early dinner)**. These periods represent the highest concentration of both orders and revenue.

- **Mondays are the highest revenue-generating days**, averaging nearly **$27K in daily revenue**, significantly higher than the mid-week low observed on Wednesday (~$20K). This suggests a strong start-of-week demand pattern.

- **Transactions peak during the final week of the month**, with the highest activity occurring around **day 27**, where transactions exceed 200. This aligns with previous observations of a payday-driven revenue spike.

- **Late-night activity declines sharply after 8:00 PM**, with minimal transactions observed by 10:00 PM. This indicates that the business primarily operates within daytime and early evening demand windows.

### Strategic Recommendations

- **Optimize staffing for peak hours**  
  Ensure adequate staffing between **11:30 AM – 1:30 PM** and **4:30 PM – 6:30 PM** to maintain service efficiency.

- **Leverage “Magic Mondays”**  
  Introduce targeted promotions or discounts on Mondays to further maximize already strong demand.

- **Prepare for month-end demand surges**  
  Increase inventory and staffing during the final week of the month (Days 25–31).

- **Evaluate operating hours**  
  Consider reducing late-night operations due to consistently low demand after 8:00 PM.


---

### 4. 🛒 Order Size & Spending
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Ordersize%20Dashboard.jpg)

- **Medium orders are the primary revenue drivers**, contributing over **$111K**, significantly higher than Small ($27K) and Large ($21K) orders. This indicates that mid-sized purchases (spending $20–$40) are the most valuable to the business.

- **Approximately 40% of customers purchase only one item**, suggesting a large opportunity to increase revenue through upselling strategies.

- **The average customer spends about $29.60**, placing most transactions within the high-value “Medium” category.

- **Large group orders are rare**, with a steep decline after 4-item purchases and very few transactions involving 5 or more items. This indicates the restaurant primarily serves individuals and small groups.

### Strategic Recommendations

- **Encourage upselling to convert single-item buyers**  
  Offer incentives such as discounts on add-ons (drinks, sides) to move customers into the Medium spending range.

- **Introduce a $30 combo offer**  
  Create bundled meals aligned with the average spend to simplify decision-making and increase conversion.

- **Attract larger groups**  
  Introduce family packs or group meal options to encourage higher-value transactions.


---

## 🍽️ Menu Pairings & Combo Performance
![](https://github.com/agathaoguma/Taste-of-the-World-Cafe/blob/9880d54661d880eb2af8f1e63b1a2c4b29f89273/image/Combo%20Meals.jpg)

### Key Insights

- **Edamame and Burgers are the most frequently co-purchased items**, with combinations such as *Edamame & Hamburger* (90 orders) and *Cheeseburger & Edamame* (88 orders). This indicates a strong customer preference for pairing a light side with a main dish, making it a reliable high-volume combination.

- **High-value pairings are driven by premium items**, particularly the Korean Beef Bowl. For example, the combination *Korean Beef Bowl & Spaghetti & Meatballs* is associated with over **$2.3K in cumulative order value** across 65 orders. This suggests that premium items tend to appear together in higher-spending transactions.

- **Chicken Taco pairings consistently underperform**, with extremely low frequency and minimal contribution to overall sales activity (1 order). This reinforces earlier findings that the item lacks both popularity and strong pairing compatibility.

- **The menu supports a wide range of combinations (496 unique pairings)**, contributing to over **15K pairing occurrences** and **$388K in cumulative pairing value**. However, the large disparity between top-performing and low-performing combinations suggests that customer demand is concentrated in a small subset of pairings, indicating potential menu inefficiency.

---

### ⚠️ Note on Pairing Revenue

The revenue attributed to menu pairings exceeds total restaurant revenue because each order can contribute to multiple item combinations.

As a result, the same order value may be counted multiple times across different pairings. Therefore, this metric represents **cumulative pairing value** rather than actual revenue, and is best interpreted as a measure of **pairing impact within high-value orders**, not direct financial contribution.

---

### Strategic Recommendations

- **Promote high-value pairings**  
  Focus marketing efforts on combinations involving premium items (e.g., Korean Beef Bowl), as these are strongly associated with higher-spending customers and can increase average order value.

- **Formalize popular combinations into combo deals**  
  Introduce an official *Burger & Edamame* combo to streamline ordering, improve customer experience, and capitalize on proven high-frequency behavior.

- **Deprioritize or remove underperforming pairings**  
  Reduce visibility of low-performing combinations, particularly those involving Chicken Tacos, to simplify menu choices and guide customers toward higher-value options.

- **Bundle low-performing items with best-sellers**  
  Pair weaker items (e.g., Chips & Guacamole) with strong-performing mains to improve their sales performance and reduce menu waste.

- **Simplify menu structure**  
  With demand concentrated in a small number of combinations, curating and highlighting top-performing pairings can improve decision-making and overall sales efficiency.
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

## 🔗 Author

**Agatha Oguma**
Aspiring Data Analyst | SQL | Power BI | Business Intelligence
