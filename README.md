# 🎬 StreamVault: Relational Database Architecture & SQL Analytics

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
![SQL](https://img.shields.io/badge/Language-SQL-CC292B?style=flat-square&logo=database&logoColor=white)
![Database Design](https://img.shields.io/badge/Architecture-Relational-005C8A?style=flat-square)

✅ **Project Status: Database Implementation & Testing Completed**

StreamVault is a MySQL relational database project that models the backend of a subscription-based streaming platform. It focuses on relational database design, SQL querying, database automation, integrity constraints, performance optimization, and business analysis across a **17-table schema** (16 core tables and 1 activity audit table).

**Key Highlights:** 17 Tables · 10 Views · 5 Stored Procedures · 2 Triggers · 5 Performance Indexes

---

## 🏗️ Architecture

The database is organized into three operational domains, supported by an audit logging component:

- **Users & Subscriptions:** `user`, `profiles`, `subscription_plans`, `subscription`, `payment`
- **Content Catalog:** `content`, `episodes`, `genres`, `actors`, `director`, `content_genres`, `content_actor`, `content_directors`
- **Activity & Engagement:** `watch_history`, `ratings`, `watchlist`
- **Audit Logging:** `activity_audit` records selected database activities through triggers.

```text
user ──1:N──> profiles
user ──1:N──> subscription ──N:1──> subscription_plans
subscription ──1:N──> payment

content ──1:N──> episodes

content ──1:N──> content_genres ──N:1──> genres
content ──1:N──> content_actor ──N:1──> actors
content ──1:N──> content_directors ──N:1──> director

profiles ──1:N──> watch_history ──N:1──> content
profiles ──1:N──> ratings ──N:1──> content
profiles ──1:N──> watchlist ──N:1──> content

activity_audit ← database triggers
```

---

## 🗂️ Database Schema Overview

| **Category** | **Tables Included** | **Key Features** |
|---|---|---|
| **User & Billing** | `user`, `profiles`, `subscription_plans`, `subscription`, `payment` | Primary and foreign keys, `ENUM`, `UNIQUE` constraints |
| **Catalog** | `content`, `episodes`, `genres`, `actors`, `director` | Relational modeling and integrity constraints |
| **Junctions** | `content_genres`, `content_actor`, `content_directors` | Many-to-many (M:N) relationship mapping |
| **Activity & Engagement** | `watch_history`, `ratings`, `watchlist` | Viewing history, ratings, and saved content |
| **Audit Logging** | `activity_audit` | Records selected database activities through triggers |

---

## 🔎 SQL Query Layers

```text
01_basic_queries.sql      → Filtering, sorting, range selection
02_aggregate_queries.sql  → COUNT, AVG, SUM, GROUP BY, HAVING
03_join_queries.sql       → Multi-table relational joins
04_advanced_queries.sql   → Subqueries, CASE, CTEs, Window Functions
05_business_analysis.sql  → User, subscription, and revenue analysis
```

---

## 🚀 Setup

**Clone the repository:**

```bash
git clone https://github.com/sehreen-jeelani/streamvault-database.git
cd streamvault-database
```

**Create the database in MySQL 8.0:**

```sql
CREATE DATABASE IF NOT EXISTS streamvault;
USE streamvault;
```

Execute the SQL scripts in the following order:

1. `database/schema/`
2. `database/data/`
3. `database/views/`
4. `database/procedures/`
5. `database/triggers/`
6. `database/indexes/`
7. `database/queries/`

> **Note:** StreamVault uses MySQL directly and does not require XAMPP.

---

## 🧪 Testing & Validation

- Fresh database installation and recreation verified
- All views and stored procedures tested
- Triggers tested using transactions and rollbacks
- Composite foreign key constraints validated
- Data integrity and invalid relationship cases checked
- Query execution plans inspected using `EXPLAIN`
- Integrity checks returned zero violations
- Index usage verified; the intended subscription index was also tested using `FORCE INDEX`

---

## 📌 Project Scope

StreamVault is a **database layer project** demonstrating relational database design, integrity enforcement, database automation, and analytical querying. It does not include a frontend, streaming engine, or complete application backend.

---

## 📚 Documentation

- [Full Technical Documentation](docs/database_documentation.md)
- [Entity-Relationship Diagram](er-diagram/streamvault_erd.png)

