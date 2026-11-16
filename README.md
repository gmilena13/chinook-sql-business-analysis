# Chinook Music Store - Advanced SQL Business Analysis

## Project Overview
This project presents an advanced data analysis of the **Chinook** digital music store database using **SQL**. The objective is to answer 10 key business questions ranging from customer purchasing behavior and revenue by country to top-performing music genres, artists, and sales trends over time.

## Business Questions Addressed
* **Top 5 Highest-Spending Customers:** Identified top customers based on total lifetime spending.
* **Revenue by Billing Country:** Calculated total revenue generated across all billing markets.
* **Average Order Value & Total Orders:** Analyzed purchasing power by showing average invoice value and order counts per country.
* **Top 5 Best-Selling Music Genres:** Determined genres with the highest total track sales quantity.
* **Top 3 Best-Selling Tracks by Revenue:** Identified top individual tracks generating the highest revenue.
* **Unsold Tracks Identification:** Found tracks in the catalog that have never been purchased using a `LEFT JOIN`.
* **Premium Invoices Analysis:** Listed invoices with totals higher than the overall database average using subqueries.
* **Peak Sales Month:** Pinpointed the exact calendar month and year with maximum revenue.
* **Inactive Customer Segmentation:** Filtered customers who made no purchases during 2019 using `NOT IN`.
* **Geographic Revenue Breakdown (Excluding USA):** Ranked top revenue-generating countries outside the US market.

## Tools & Technical Concepts Used
* **Database:** Chinook Database (Relational SQLite/SQL Server structure)
* **SQL Queries & Techniques:** 
  * Joins (`INNER JOIN`, `LEFT JOIN`)
  * Aggregations (`SUM`, `AVG`, `COUNT`)
  * Grouping & Sorting (`GROUP BY`, `ORDER BY`)
  * Subqueries & Nested Statements
  * Date Functions (`YEAR`, `MONTH`)
  * Conditional Filtering (`WHERE`, `NOT IN`)
