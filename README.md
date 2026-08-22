<div align="center">

# 🎵 Music Store Data Analysis Using SQL

**Uncovering sales, customer, and music trends from a digital music store database — one query at a time.**

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791?style=flat&logo=postgresql&logoColor=white)
![Tool](https://img.shields.io/badge/Tool-pgAdmin-2C5AA0?style=flat)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=flat)

</div>

---

## 📌 Overview

This project dives into a **digital music store database** using SQL to answer real-world business questions — the kind an analyst might be asked to solve for a growing e-commerce or media company. Using **PostgreSQL** and **pgAdmin**, I wrote queries ranging from simple lookups to multi-step analytical logic involving window functions, CTEs, and aggregations.

> 🎯 The goal: turn raw transactional data into insights a business could actually act on.

---

## 🗂️ Database Schema


![Schema Diagram](ERD.png)



## ❓ Business Questions & Insights

Queries are organized by difficulty in [`queries.sql`](./queries.sql):

### 🟢 Easy

 Q1  Who is the senior-most employee based on job title? 
 
   ```sql
   SELECT title, last_name, first_name 
   FROM employee
   ORDER BY levels DESC
   LIMIT 1
   ```

 Q2 Which countries have the most invoices? 

   ```sql
   SELECT COUNT(*) AS c, billing_country 
   FROM invoice
   GROUP BY billing_country
   ORDER BY c DESC
   ```

### 🟡 Moderate

 Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. 

      SELECT DISTINCT email,first_name, last_name
      FROM customer
      JOIN invoice ON customer.customer_id = invoice.customer_id
      JOIN invoiceline ON invoice.invoice_id = invoiceline.invoice_id
      WHERE track_id IN(
      	SELECT track_id FROM track
      	JOIN genre ON track.genre_id = genre.genre_id
      	WHERE genre.name LIKE 'Rock'
      )
      ORDER BY email;



### 🔴 Advanced

 Q1 Find how much amount spent by each customer on artist?
   write a query to return customer name,artist name and total spent.
   
        WITH best_selling_artist AS (
        	SELECT artist.artist_id AS artist_id, artist.name AS artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
        	FROM invoice_line
        	JOIN track ON track.track_id = invoice_line.track_id
        	JOIN album ON album.album_id = track.album_id
        	JOIN artist ON artist.artist_id = album.artist_id
        	GROUP BY 1
        	ORDER BY 3 DESC
        	LIMIT 1
        )
        SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, SUM(il.unit_price*il.quantity) AS amount_spent
        FROM invoice i
        JOIN customer c ON c.customer_id = i.customer_id
        JOIN invoice_line il ON il.invoice_id = i.invoice_id
        JOIN track t ON t.track_id = il.track_id
        JOIN album alb ON alb.album_id = t.album_id
        JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
        GROUP BY 1,2,3,4
        ORDER BY 5 DESC;
  

## 🛠️ Tools & Tech

- **Database:** PostgreSQL
- **Client:** pgAdmin 4
- **Concepts used:** Joins, Aggregations, Subqueries, CTEs, Window Functions, GROUP BY / HAVING

---

## 📂 Repository Structure

```
Music-Store-SQL-Analysis/
├── Schema.sql        # Database schema (table structure)
├── queries.sql        # All business-question SQL queries
├── results/            # Query output screenshots / CSVs (optional)
└── README.md          # You're here!
```

---

## 🚀 How to Run This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/priyankaP7pandey/Music-Store-SQL-Analysis.git
   ```
2. **Set up the database** — create a new PostgreSQL database and run:
   ```bash
   psql -U your_username -d your_database -f Schema.sql
   ```
3. **Run the queries** — open `queries.sql` in pgAdmin's Query Tool and execute the queries you're interested in.

---

## 🙌 Acknowledgements

This project was inspired by the excellent tutorial by **[Rishabh Mishra](https://www.youtube.com/@RishabhMishraOfficial)** — [watch it here](https://youtu.be/VFIuIjswMKM) 🎥

---

## 📬 Connect

If you found this project useful or have suggestions, feel free to open an issue or connect with me!

<div align="center">

⭐ **If you like this project, consider giving it a star!** ⭐

</div>
