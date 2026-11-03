# 🎬 StreamVault: Relational Database Architecture & SQL Analytics

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat-square&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-CC292B?style=flat-square&logo=database&logoColor=white)
![Database Design](https://img.shields.io/badge/Architecture-Relational-005C8A?style=flat-square)

> 🚧 **Project Status: In Progress**

StreamVault is a MySQL relational database project modeling the backend of a subscription-based streaming platform. It focuses on database design, relational modeling, SQL querying, database automation, performance optimization, and business analysis across a **17 table schema (16 core tables and 1 activity audit table)**.

---

## 🏗️ Architecture

The database is organized into three core operational domains, with a separate audit logging component:

- **Users & Subscriptions:** `user`, `profiles`, `subscription_plans`, `subscription`, `payment`
- **Content Catalog:** `content`, `episodes`, `genres`, `actors`, `director`, `content_genres`, `content_actor`, `content_directors`
- **Activity & Engagement:** `watch_history`, `ratings`, `watchlist`
- **Activity Auditing:** `activity_audit` Records selected database activities through triggers.

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
| **Activity & Engagement** | `watch_history`, `ratings`, `watchlist` | Tracks viewing history, ratings, and saved content. |
| **Audit Logging** | `activity_audit` | Stores records of selected database activities through triggers. |

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
CREATE DATABASE IF NOT EXISTS streamvault;
USE streamvault;
```

Execute the SQL scripts in the following order:

1. `database/schema/` — Create tables and relationships.
2. `database/data/` — Insert sample records.
3. `database/views/` — Create database views.
4. `database/procedures/` — Create stored procedures.
5. `database/triggers/` — Create audit tables and triggers.
6. `database/indexes/` — Create performance indexes.
7. `database/queries/` — Run SQL queries for testing and analysis.

> **Note:** The project uses MySQL directly and does not require XAMPP.

---

## 🚧 Current Status

- ✅ 17-table relational schema (16 core tables + 1 audit table)
- ✅ Sample data
- ✅ Basic SQL queries
- ✅ Aggregate queries
- ✅ Multi-table JOIN queries
- ✅ Advanced SQL queries
- ✅ Business analysis queries
- ✅ 10 database views
- ✅ 5 stored procedures
- ✅ 2 database triggers
- ✅ 6 explicit performance indexes
- ✅ Initial database integrity and functionality testing

**Remaining:** Clean database installation and recreation testing.

---


