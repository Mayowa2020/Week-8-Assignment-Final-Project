# Week-8-Assignment-Final-Project

## Assignment Question

Question 1: Build a Complete Database Management System

## Objective:

Design and implement a full-featured relational database using MySQL.

## Instructions:

Choose a real-world use case (e.g., Library Management, Student Records, Clinic Booking System, Inventory Tracking, E-commerce Store, etc.).

Create a relational database schema that includes:

Well-structured tables.

Proper constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE).

Relationships (One-to-One, One-to-Many, Many-to-Many, where applicable).

Use SQL to implement your design.

Deliverables:

A single .sql file containing:

CREATE DATABASE statement

CREATE TABLE statements

Relationship constraints


## Notes

1. All IDs are BIGINT (scales better than INT for large datasets).

2. Foreign keys enforce relationships in the same order as your dependency chain.

3. created_at, shipped_at, etc. are stored as DATETIME.

4. cost, retail_price, and sale_price use DECIMAL(10,2) for money precision.

5. email in users is UNIQUE.


## ✅ Key points

-- All foreign key constraints are defined inside the CREATE TABLE statements.

-- The order of creation is important:

-- users, distribution_centers →

-- products (depends on distribution_centers) →

-- orders (depends on users) →

-- order_items (depends on orders, users, products) →

-- inventory_items (depends on products) →

-- events (depends on users).

-- This ensures you won’t hit dependency errors when running the script.
