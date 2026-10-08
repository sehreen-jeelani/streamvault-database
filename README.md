# 🎬 StreamVault: Relational Database Architecture & SQL Analytics

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat-square&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-CC292B?style=flat-square&logo=database&logoColor=white)
![Database Design](https://img.shields.io/badge/Architecture-Relational-005C8A?style=flat-square)

> 🚧 **Project Status: In Progress**

StreamVault is an ongoing **MySQL relational database project** modeling the backend of a subscription based streaming platform. It focuses on **database design, relational modeling, SQL querying, and business analysis** across a 16 table schema.

---

## 🏗️ Architecture

The database spans three core operational domains:

- **Users & Subscriptions:** `user`, `profiles`, `subscription_plans`, `subscription`, `payment`
- **Content Catalog:** `content`, `episodes`, `genres`, `actors`, `director`, `content_genres`, `content_actor`, `content_directors`
- **Activity & Engagement:** `watch_history`, `ratings`, `watchlist`

```text
user ──1:N──> profiles
user ──1:N──> subscription ──1:N──> payment
subscription ──N:1──> subscription_plans

content ──1:N──> episodes
content ──M:N──> genres | actors | director
                 (via junction tables)

profiles ──1:N──> watch_history | ratings | watchlist
                       │
                       └──N:1──> content
```

---

## 🗂️ Database Schema Overview

| **Category** | **Tables Included** | **Key Features** |
|---|---|---|
| **User & Billing** | `user`, `profiles`, `subscription_plans`, `subscription`, `payment` | Primary & Foreign Keys, `ENUM`, `UNIQUE` constraints |
| **Catalog** | `content`, `episodes`, `genres`, `actors`, `director` | Relational modeling, constraints |
| **Junctions** | `content_genres`, `content_actor`, `content_directors` | M:N relationship mapping |
| **Activity** | `watch_history`, `ratings`, `watchlist` | Viewing, rating, and saved-content records |

---

## 🔎 SQL Query Layers

```text
01_basic_queries.sql      → Filtering, Sorting, Range Selection
02_aggregate_queries.sql  → COUNT, AVG, SUM, GROUP BY, HAVING
03_join_queries.sql       → Multi-Table Relational JOINs
04_advanced_queries.sql   → Subqueries, CASE, CTEs, Window Functions
05_business_analysis.sql  → User & Subscription Analysis
```

---

## 🚀 Setup & Usage

Clone the repository:

```bash
git clone https://github.com/sehreen-jeelani/streamvault-database.git
cd streamvault-database
```

Create the database in MySQL:

```sql
CREATE DATABASE streamvault;
USE streamvault;
```

Then execute the SQL files in:

```text
database/schema/
database/data/
database/queries/
```

> **Note:** The project uses MySQL directly and does not require XAMPP.

---

## 🚧 Current Status

- ✅ 16-table relational schema
- ✅ Sample data
- ✅ Basic SQL
- ✅ Aggregate queries
- ✅ JOIN queries
- ✅ Advanced SQL
- 🚧 Business analysis in progress
- 🔮 Views, procedures, triggers & indexing planned

---


