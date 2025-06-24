
-- Creating the database
CREATE DATABASE IF NOT EXISTS e_commerce_analysis;
USE e_commerce_analysis;

-- Table: cities
CREATE TABLE cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50)
);

INSERT INTO cities (city_id, city_name) VALUES
(1, 'Delhi'), (2, 'Mumbai'), (3, 'Bengaluru'), (4, 'Hyderabad'), (5, 'Ahmedabad'),
(6, 'Chennai'), (7, 'Kolkata'), (8, 'Pune'), (9, 'Jaipur'), (10, 'Lucknow'),
(11, 'Indore'), (12, 'Bhopal'), (13, 'Patna'), (14, 'Nagpur'), (15, 'Surat');

-- Table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

INSERT INTO customers (customer_id, name, email, city_id) VALUES
(1, 'Ravi Sharma', 'ravi.sharma@example.com', 1),
(2, 'Neha Singh', 'neha.singh@example.com', 2),
(3, 'Amit Verma', 'amit.verma@example.com', 3),
(4, 'Pooja Mehta', 'pooja.mehta@example.com', 4),
(5, 'Rajiv Nair', 'rajiv.nair@example.com', 5),
(6, 'Sonal Chauhan', 'sonal.chauhan@example.com', 6),
(7, 'Arjun Kapoor', 'arjun.kapoor@example.com', 7),
(8, 'Meena Joshi', 'meena.joshi@example.com', 8),
(9, 'Karan Patel', 'karan.patel@example.com', 9),
(10, 'Swati Dubey', 'swati.dubey@example.com', 10),
(11, 'Anuj Yadav', 'anuj.yadav@example.com', 11),
(12, 'Priya Saxena', 'priya.saxena@example.com', 12),
(13, 'Rohit Sinha', 'rohit.sinha@example.com', 13),
(14, 'Divya Agarwal', 'divya.agarwal@example.com', 14),
(15, 'Suresh Rathi', 'suresh.rathi@example.com', 15);

-- Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'iPhone 14', 'Electronics', 79999.00),
(2, 'Samsung Galaxy M14', 'Electronics', 13999.00),
(3, 'HP Pavilion Laptop', 'Electronics', 62999.00),
(4, 'Nike Running Shoes', 'Footwear', 4999.00),
(5, 'Puma Sneakers', 'Footwear', 3299.00),
(6, 'Levi's Jeans', 'Apparel', 1999.00),
(7, 'UCB T-Shirt', 'Apparel', 899.00),
(8, 'LG Washing Machine', 'Home Appliances', 25999.00),
(9, 'Philips Mixer Grinder', 'Home Appliances', 4499.00),
(10, 'Noise Smartwatch', 'Accessories', 2999.00);

-- Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-06-01', 13999.00),
(2, 2, '2024-06-02', 4999.00),
(3, 3, '2024-06-03', 25999.00),
(4, 4, '2024-06-04', 3299.00),
(5, 5, '2024-06-05', 1999.00);

-- Table: order_items
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 2, 1, 13999.00),
(2, 2, 4, 1, 4999.00),
(3, 3, 8, 1, 25999.00),
(4, 4, 5, 1, 3299.00),
(5, 5, 6, 1, 1999.00);
