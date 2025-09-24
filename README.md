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


⚡ Notes

1. All IDs are BIGINT (scales better than INT for large datasets).

2. Foreign keys enforce relationships in the same order as your dependency chain.

3. created_at, shipped_at, etc. are stored as DATETIME.

4. cost, retail_price, and sale_price use DECIMAL(10,2) for money precision.

5. email in users is UNIQUE.
