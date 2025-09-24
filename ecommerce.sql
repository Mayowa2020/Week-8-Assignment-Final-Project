-- SQL DDL script to create tables for an e-commerce database

-- CREATE DATABASE joyeuxshoppers_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


-- USERS
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INT,
    gender ENUM('M', 'F') NOT NULL,
    state VARCHAR(100) NOT NULL,
    street_address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    traffic_source VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL,
);

-- DISTRIBUTION CENTERS
CREATE TABLE distribution_centers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL
);

-- PRODUCTS
CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cost DECIMAL(10,2) NOT NULL,
    category VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    retail_price DECIMAL(10,2) NOT NULL,
    department VARCHAR(100) NOT NULL,
    sku VARCHAR(100) UNIQUE NOT NULL,
    distribution_center_id BIGINT NOT NULL,
    FOREIGN KEY (distribution_center_id) REFERENCES distribution_centers(id)
);

-- INVENTORY ITEMS
CREATE TABLE inventory_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    sold_at DATETIME NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    product_category VARCHAR(100) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_brand VARCHAR(100) NOT NULL,
    product_retail_price DECIMAL(10,2) NOT NULL,
    product_department VARCHAR(100) NOT NULL,
    product_sku VARCHAR(100) NOT NULL,
    product_distribution_center_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (product_distribution_center_id) REFERENCES distribution_centers(id)
);

-- ORDERS
CREATE TABLE orders (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    status VARCHAR(50) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    created_at DATETIME NOT NULL,
    returned_at DATETIME NOT NULL,
    shipped_at DATETIME NOT NULL,
    delivered_at DATETIME NOT NULL,
    num_of_item INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ORDER ITEMS
CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    inventory_item_id BIGINT NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL,
    shipped_at DATETIME NOT NULL,
    delivered_at DATETIME NOT NULL,
    returned_at DATETIME NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    distribution_center_id BIGINT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (inventory_item_id) REFERENCES inventory_items(id),
    FOREIGN KEY (distribution_center_id) REFERENCES distribution_centers(id)
);

-- EVENTS
CREATE TABLE events (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    sequence_number BIGINT NOT NULL,
    session_id VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    browser VARCHAR(100) NOT NULL ,
    traffic_source VARCHAR(100) NOT NULL,
    uri TEXT NOT NULL,
    event_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);




-- ✅ Key points in this rewrite:

-- All foreign key constraints are defined inside the CREATE TABLE statements.

-- The order of creation is important:

-- users, distribution_centers →

-- products (depends on distribution_centers) →

-- orders (depends on users) →

-- order_items (depends on orders, users, products) →

-- inventory_items (depends on products) →

-- events (depends on users).

-- This ensures you won’t hit dependency errors when running the script.
