CREATE DATABASE ecommerce_analytics;

use ecommerce_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name CHAR(50),
    city CHAR(50),
    signup_date DATE
);

INSERT INTO customers
(customer_id, customer_name, city, signup_date)
VALUES
(1, 'Amit Sharma', 'Kolkata', '2025-11-05'),
(2, 'Priya Das', 'Delhi', '2025-11-12'),
(3, 'Rahul Verma', 'Mumbai', '2025-11-20'),
(4, 'Sneha Roy', 'Kolkata', '2025-12-01'),
(5, 'Arjun Mehta', 'Bengaluru', '2025-12-08'),
(6, 'Neha Singh', 'Delhi', '2025-12-15'),
(7, 'Rohit Sen', 'Mumbai', '2025-12-22'),
(8, 'Ananya Bose', 'Kolkata', '2026-01-03'),
(9, 'Vikram Patel', 'Pune', '2026-01-10'),
(10, 'Pooja Gupta', 'Delhi', '2026-01-15'),
(11, 'Sourav Ghosh', 'Kolkata', '2026-01-20'),
(12, 'Kavya Nair', 'Bengaluru', '2026-02-01'),
(13, 'Karan Malhotra', 'Mumbai', '2026-02-05'),
(14, 'Ishita Paul', 'Pune', '2026-02-12'),
(15, 'Dev Kapoor', 'Delhi', '2026-02-18');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name CHAR(50),
    category CHAR(30),
    unit_price DECIMAL,
    unit_cost DECIMAL
);

INSERT INTO products
(product_id, product_name, category, unit_price, unit_cost)
VALUES
(101, 'Laptop', 'Electronics', 50000, 42000),
(102, 'Smartphone', 'Electronics', 25000, 20000),
(103, 'Headphones', 'Electronics', 2500, 1500),
(104, 'Wireless Mouse', 'Accessories', 800, 400),
(105, 'Mechanical Keyboard', 'Accessories', 2500, 1600),
(106, 'Office Chair', 'Furniture', 7000, 5000),
(107, 'Study Desk', 'Furniture', 10000, 7500),
(108, 'USB Hub', 'Accessories', 1200, 650),
(109, 'Smartwatch', 'Wearables', 6000, 4200),
(110, 'Tablet', 'Electronics', 18000, 14500);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers (customer_id),
    order_date DATE,
    order_status CHAR(20)
);

INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2026-01-05', 'Completed'),
(1002, 2, '2026-01-07', 'Completed'),
(1003, 3, '2026-01-10', 'Completed'),
(1004, 4, '2026-01-12', 'Cancelled'),
(1005, 1, '2026-01-15', 'Completed'),
(1006, 5, '2026-01-18', 'Completed'),
(1007, 6, '2026-01-21', 'Pending'),
(1008, 7, '2026-01-24', 'Completed'),
(1009, 8, '2026-01-28', 'Completed'),
(1010, 2, '2026-02-02', 'Completed'),
(1011, 9, '2026-02-05', 'Completed'),
(1012, 10, '2026-02-08', 'Cancelled'),
(1013, 3, '2026-02-11', 'Completed'),
(1014, 11, '2026-02-14', 'Completed'),
(1015, 5, '2026-02-17', 'Pending'),
(1016, 12, '2026-02-20', 'Completed'),
(1017, 1, '2026-03-02', 'Completed'),
(1018, 6, '2026-03-05', 'Completed'),
(1019, 7, '2026-03-09', 'Completed'),
(1020, 8, '2026-03-12', 'Cancelled'),
(1021, 13, '2026-03-15', 'Completed'),
(1022, 2, '2026-03-18', 'Completed'),
(1023, 10, '2026-03-22', 'Pending'),
(1024, 11, '2026-03-25', 'Completed'),
(1025, 4, '2026-03-28', 'Completed');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders (order_id),
    product_id INT REFERENCES products (product_id),
    quantity INT,
    selling_price DECIMAL
);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, selling_price)
VALUES
(1, 1001, 101, 1, 48000),
(2, 1001, 104, 2, 750),
(3, 1002, 102, 1, 24000),
(4, 1002, 103, 2, 2300),
(5, 1003, 105, 1, 2400),
(6, 1003, 108, 2, 1100),
(7, 1004, 106, 1, 6800),
(8, 1005, 101, 1, 50000),
(9, 1005, 105, 1, 2500),
(10, 1006, 107, 1, 9500),
(11, 1006, 104, 1, 800),
(12, 1007, 109, 1, 5800),
(13, 1008, 103, 3, 2400),
(14, 1008, 108, 1, 1200),
(15, 1009, 102, 1, 25000),
(16, 1009, 104, 2, 780),
(17, 1010, 101, 1, 49000),
(18, 1010, 110, 1, 17500),
(19, 1011, 106, 2, 7000),
(20, 1011, 108, 2, 1150),
(21, 1012, 105, 2, 2400),
(22, 1013, 102, 1, 24500),
(23, 1013, 103, 1, 2500),
(24, 1014, 104, 3, 750),
(25, 1014, 107, 1, 10000),
(26, 1015, 110, 1, 18000),
(27, 1016, 109, 2, 5900),
(28, 1016, 108, 1, 1200),
(29, 1017, 101, 1, 49500),
(30, 1017, 104, 3, 780),
(31, 1018, 102, 2, 24000),
(32, 1018, 105, 1, 2500),
(33, 1019, 106, 1, 6900),
(34, 1019, 103, 2, 2450),
(35, 1020, 107, 1, 9800),
(36, 1021, 110, 2, 17500),
(37, 1021, 108, 2, 1150),
(38, 1022, 102, 1, 25000),
(39, 1022, 104, 4, 750),
(40, 1023, 109, 1, 6000),
(41, 1024, 105, 2, 2450),
(42, 1024, 108, 2, 1200),
(43, 1025, 101, 1, 50000),
(44, 1025, 106, 1, 7000);

SELECT 'customers' AS table_name, COUNT(*) AS total_records FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;


SELECT * FROM customers;
