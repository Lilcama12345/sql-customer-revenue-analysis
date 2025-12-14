# Customer Behavior & Revenue Performance Analysis (SQL)

##  Project Overview
This project focuses on analyzing **customer behavior, transaction quality, and revenue performance** using transactional sales data stored in a **SQLite database**. The analysis aims to provide business insights that can support **customer retention strategies, payment optimization, and revenue growth**.

This project is designed as an **intermediate-level SQL portfolio project**, building upon basic aggregation by incorporating customer-centric analysis and business-oriented metrics.

---

##  Business Objectives
The main objectives of this project are:
- Identify high-value customers based on revenue contribution
- Analyze repeat purchasing behavior
- Evaluate revenue distribution across cities
- Assess transaction quality based on status
- Compare payment methods based on revenue performance

---

##  Database Structure
The analysis is based on four main tables:

- **customer**: customer demographic information
- **transactions**: detailed transaction records
- **payment**: payment method per transaction
- **status**: transaction completion status

---

##  Analysis & SQL Queries

### 1️⃣ Customer Lifetime Value (CLV – Simplified)
Identifies customers who contribute the highest revenue.

```sql
SELECT 
    c.ID_Customer,
    c."Nama Customer",
    COUNT(t.ID_Transaction) AS total_transactions,
    SUM(t.Grand_Total) AS total_revenue,
    AVG(t.Grand_Total) AS avg_order_value
FROM customer c
JOIN transactions t 
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
ORDER BY total_revenue DESC;
```

---

### 2️⃣ Repeat vs One-Time Customers
Classifies customers based on purchasing frequency.

```sql
SELECT 
    CASE 
        WHEN COUNT(t.ID_Transaction) > 1 THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS customer_type,
    COUNT(DISTINCT c.ID_Customer) AS total_customers
FROM customer c
JOIN transactions t 
    ON c.ID_Customer = t.ID_Customer
GROUP BY customer_type;
```

---

### 3️⃣ Revenue Contribution by City
Evaluates which cities generate the highest revenue.

```sql
SELECT 
    c.Kota,
    COUNT(DISTINCT c.ID_Customer) AS total_customers,
    SUM(t.Grand_Total) AS total_revenue
FROM customer c
JOIN transactions t 
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.Kota
ORDER BY total_revenue DESC;
```

---

### 4️⃣ Transaction Quality Analysis
Measures revenue and volume based on transaction status.

```sql
SELECT 
    s.Status,
    COUNT(*) AS total_transactions,
    SUM(t.Grand_Total) AS total_revenue
FROM status s
JOIN transactions t 
    ON s.ID_Transaction = t.ID_Transaction
GROUP BY s.Status;
```

---

### 5️⃣ Payment Method Performance
Compares payment methods based on transaction volume and revenue.

```sql
SELECT 
    p.Payment,
    COUNT(*) AS total_transactions,
    SUM(t.Grand_Total) AS total_revenue
FROM payment p
JOIN transactions t 
    ON p.ID_Transaction = t.ID_Transaction
GROUP BY p.Payment
ORDER BY total_revenue DESC;
```

---

##  Key Insights
Based on the analysis results, several insights can be derived:
- Repeat customers contribute significantly higher total revenue compared to one-time buyers
- Completed transactions dominate overall revenue contribution
- Customers from major cities show higher purchasing power
- Cashless payment methods tend to generate higher transaction values

---

##  Tools & Technologies
- **Database**: SQLite
- **Query Tool**: DB Browser for SQLite
- **Language**: SQL
- **Version Control**: GitHub

---

##  How to Run the Project
1. Download the SQLite database file (`.db`)
2. Open the database using **DB Browser for SQLite**
3. Execute the SQL queries provided in this repository
4. Review the results to interpret business insights

---

## 📈 Portfolio Value
This project demonstrates the ability to:
- Perform customer-centric SQL analysis
- Translate raw transaction data into business insights
- Apply analytical thinking for decision-making

This repository is intended for **academic purposes, self-learning, and data analyst portfolio development**.
