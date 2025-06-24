# 🛒 E-Commerce Sales Analysis (SQL Project)

## 📌 Overview
This project is a simulated e-commerce database built with MySQL. It covers customers from Indian cities, real products, and order relationships using SQL. It showcases SQL joins, foreign keys, and normalized schema design.

## 🗃️ Tables Included
- **cities**: List of Indian cities
- **customers**: Buyers with city reference
- **products**: Items available for purchase
- **orders**: Order header info with customer link
- **order_items**: Products under each order

## 🔗 Relationships
- Customers → Cities (`city_id`)
- Orders → Customers (`customer_id`)
- Order_Items → Orders + Products

## 🧠 Example JOIN Query

```sql
SELECT 
    c.name AS customer_name,
    ci.city_name,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.price
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
JOIN cities ci ON c.city_id = ci.city_id;
