# 🎵 Music Store Data Analysis Using SQL

> **A PostgreSQL-based SQL analytics project exploring customer behavior, sales patterns, and music trends through real-world business questions.**

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=flat\&logo=postgresql\&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-4479A1?style=flat\&logo=sql\&logoColor=white)
![pgAdmin](https://img.shields.io/badge/Tool-pgAdmin%204-336791?style=flat)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat)

---

## 📌 Overview

The **Music Store Data Analysis** project uses **PostgreSQL and SQL** to analyze a digital music store database and answer business-oriented questions related to **customers, invoices, artists, tracks, albums, and genres**.

The project focuses on transforming relational data into meaningful insights using SQL concepts such as **JOINs, aggregations, subqueries, CTEs, GROUP BY, and ORDER BY**.

> 🎯 **Goal:** Use SQL to solve practical business questions and support data-driven decision-making.

---

## 🎯 Key Highlights

* 🗄️ Analyzed a relational music store database using PostgreSQL
* 🔍 Solved business questions using SQL
* 📊 Performed customer and sales analysis
* 🔗 Worked with multiple related tables using JOINs
* 🧮 Used aggregation functions for revenue and invoice analysis
* 🚀 Applied a CTE for advanced customer-spending analysis
* 💡 Converted SQL results into business-oriented insights

---

## 🗂️ Database Schema

The database contains tables representing customers, purchases, music, and employees.

| Table          | Description                              |
| -------------- | ---------------------------------------- |
| `customer`     | Customer details and contact information |
| `invoice`      | Purchase transactions                    |
| `invoice_line` | Individual items purchased               |
| `track`        | Song/track information                   |
| `album`        | Album information                        |
| `artist`       | Artist details                           |
| `genre`        | Music genre classification               |
| `employee`     | Employee information                     |

### 🔗 Entity Relationship Diagram

![Database Schema](ERD.png)

---

# ❓ Business Questions & SQL Analysis

The project contains **4 selected business questions**, organized by difficulty.

---

## 🟢 Easy

### 1️⃣ Senior-most Employee

**Business Question:**
Who is the senior-most employee based on job title?

```sql
SELECT title, last_name, first_name
FROM employee
ORDER BY levels DESC
LIMIT 1;
```

**SQL Concepts:**
`ORDER BY` · `DESC` · `LIMIT`

**Business Use:**
Helps identify the most senior employee in the organization based on employee hierarchy.

---

### 2️⃣ Invoice Distribution by Country

**Business Question:**
Which countries have the most invoices?

```sql
SELECT
    billing_country,
    COUNT(*) AS invoice_count
FROM invoice
GROUP BY billing_country
ORDER BY invoice_count DESC;
```

**SQL Concepts:**
`COUNT()` · `GROUP BY` · `ORDER BY`

**Business Use:**
Helps understand where the store receives the highest number of transactions.

---

## 🟡 Moderate

### 3️⃣ Rock Music Customers

**Business Question:**
Who are the customers that listen to Rock music?

```sql
SELECT DISTINCT
    customer.email,
    customer.first_name,
    customer.last_name
FROM customer
JOIN invoice
    ON customer.customer_id = invoice.customer_id
JOIN invoice_line
    ON invoice.invoice_id = invoice_line.invoice_id
JOIN track
    ON invoice_line.track_id = track.track_id
JOIN genre
    ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
ORDER BY customer.email;
```

**SQL Concepts:**
`JOIN` · `DISTINCT` · Filtering · Relational Data Analysis

**Business Use:**
Helps identify customers interested in a specific music genre, which can support targeted marketing and recommendation strategies.

---

## 🔴 Advanced

### 4️⃣ Customer Spending on the Best-Selling Artist

**Business Question:**
How much did each customer spend on the best-selling artist?

```sql
WITH best_selling_artist AS (
    SELECT
        artist.artist_id AS artist_id,
        artist.name AS artist_name,
        SUM(invoice_line.unit_price * invoice_line.quantity) AS total_sales
    FROM invoice_line
    JOIN track
        ON track.track_id = invoice_line.track_id
    JOIN album
        ON album.album_id = track.album_id
    JOIN artist
        ON artist.artist_id = album.artist_id
    GROUP BY artist.artist_id, artist.name
    ORDER BY total_sales DESC
    LIMIT 1
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    bsa.artist_name,
    SUM(il.unit_price * il.quantity) AS amount_spent
FROM invoice i
JOIN customer c
    ON c.customer_id = i.customer_id
JOIN invoice_line il
    ON il.invoice_id = i.invoice_id
JOIN track t
    ON t.track_id = il.track_id
JOIN album alb
    ON alb.album_id = t.album_id
JOIN best_selling_artist bsa
    ON bsa.artist_id = alb.artist_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    bsa.artist_name
ORDER BY amount_spent DESC;
```

**SQL Concepts:**
`CTE` · Multiple `JOINs` · `SUM()` · `GROUP BY` · `ORDER BY`

**Business Use:**
Helps identify high-value customers for the store's best-selling artist and supports customer segmentation and targeted promotions.

---

# 💡 Key Insights

The analysis can be used to understand:

* 🌍 Which countries generate the highest number of invoices
* 🎵 Which customers show interest in Rock music
* 💰 Which customers contribute more revenue for the top-selling artist
* 👥 How customer purchasing behavior can be analyzed using relational data

> **Note:** Specific numerical findings should be added after running the queries and verifying the actual results.

---

# 📈 Project Impact

This project demonstrates how SQL can transform raw transactional data into **actionable business information**.

### Business Impact

* Supports **customer segmentation**
* Helps identify **high-value customers**
* Provides insights into **geographical sales patterns**
* Enables analysis of **music preferences**
* Demonstrates how SQL can support **data-driven business decisions**

### Technical Impact

The project strengthened practical skills in:

`SQL` · `PostgreSQL` · `JOINs` · `Aggregation` · `CTEs` · `Subqueries` · `GROUP BY`

---

# 🛠️ Skills & Technologies

### Database

**PostgreSQL**

### Tool

**pgAdmin 4**

### SQL Skills

* SELECT & filtering
* INNER JOIN
* DISTINCT
* Aggregate Functions
* GROUP BY
* ORDER BY
* LIMIT
* Subqueries
* Common Table Expressions (CTEs)

---

# 📂 Repository Structure

```text
Music-Store-SQL-Analysis/
│
├── Schema.sql          # Database schema
├── queries.sql         # SQL business analysis queries
├── ERD.png             # Entity Relationship Diagram
└── README.md           # Project documentation
```

---

# 🚀 How to Run This Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/priyankaP7pandey/Music-Store-SQL-Analysis.git
```

### 2️⃣ Create the Database

Create a new PostgreSQL database using **pgAdmin 4**.

### 3️⃣ Run the Schema

Open `Schema.sql` in the pgAdmin Query Tool and execute it to create the required tables.

### 4️⃣ Run the Queries

Open `queries.sql` and execute the queries to reproduce the analysis.

---

# 📚 What I Learned

Through this project, I gained practical experience in:

* Writing SQL queries for business problems
* Understanding relationships between database tables
* Joining multiple tables
* Performing aggregations and calculations
* Using CTEs for advanced analysis
* Analyzing customer and sales behavior
* Translating business questions into SQL queries

---

# 🎯 Conclusion

The **Music Store Data Analysis** project demonstrates how SQL can be used to explore relational data and answer practical business questions.

By working with **PostgreSQL and pgAdmin**, I strengthened my ability to combine multiple tables, perform calculations, analyze customer behavior, and extract meaningful information from transactional data.

This project also provided a strong foundation for further work in **Data Analytics, Business Intelligence, and Data Science**.

---

