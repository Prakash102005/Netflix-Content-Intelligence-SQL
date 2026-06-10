# 🎬 Netflix Content Analysis — SQL Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Database-blue?style=for-the-badge)
![Dataset](https://img.shields.io/badge/Dataset-Kaggle-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)

## 📌 Project Overview

This project analyzes **8,800+ Netflix titles** using PostgreSQL to answer real-world business questions around content strategy, regional performance, genre trends, and audience insights.

---

## 🗄️ Dataset

- **Source:** [Netflix Movies and TV Shows — Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Size:** ~8,800 rows
- **Fields:** `show_id`, `type`, `title`, `director`, `cast`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| PostgreSQL | Database & querying |
| pgAdmin | GUI for query execution |

---

## 📊 Business Problems Solved

| # | Problem |
|---|---|
| 1 | Count the number of Movies vs TV Shows |
| 2 | List all movies released in a specific year (2020) |
| 3 | Find the top 5 countries with the most content |
| 4 | Identify the longest movie |
| 5 | Find content added in the last 5 years |
| 6 | Find all Movies/TV Shows by director *Rajiv Chilaka* |
| 7 | List all TV Shows with more than 5 seasons |
| 8 | Count content items in each genre |
| 9 | List all documentary movies |
| 10 | Find all content without a director |
| 11 | Find movies actor *Salman Khan* appeared in over the last 10 years |
| 12 | Find top 10 actors in highest number of Indian productions |

---

## 🔍 Key SQL Concepts Used

- `unnest()` + `string_to_array()` — parsing multi-valued fields (cast, genre, country)
- `split_part()` + `::numeric` cast — extracting and comparing duration values
- `TO_DATE()`, `EXTRACT()`, `INTERVAL` — date-based filtering and trend analysis
- `ILIKE` with wildcards — case-insensitive pattern matching
- `FILTER (WHERE ...)` — conditional aggregation for NULL audits
- Subqueries — percentage share calculation for KPI reporting
- `LIMIT`, `ORDER BY`, `GROUP BY` — ranking and aggregation

---
