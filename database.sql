CREATE DATABASE business_operations;

USE business_operations;

SELECT DATABASE();

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_amount DECIMAL(10,2) NOT NULL,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
USE business_operations;

INSERT INTO customers (name, email, phone, city)
VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Jaipur'),
('Priya Verma', 'priya@gmail.com', '9876543211', 'Delhi'),
('Aman Gupta', 'aman@gmail.com', '9876543212', 'Mumbai'),
('Neha Singh', 'neha@gmail.com', '9876543213', 'Jaipur'),
('Rohit Mehta', 'rohit@gmail.com', '9876543214', 'Ahmedabad'),
('Ananya Jain', 'ananya@gmail.com', '9876543215', 'Pune'),
('Vikas Agarwal', 'vikas@gmail.com', '9876543216', 'Delhi'),
('Sneha Kapoor', 'sneha@gmail.com', '9876543217', 'Mumbai'),
('Karan Joshi', 'karan@gmail.com', '9876543218', 'Jaipur'),
('Simran Kaur', 'simran@gmail.com', '9876543219', 'Chandigarh');
SELECT * FROM customers;
USE business_operations;

INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 55000.00),
('Wireless Mouse', 'Accessories', 1200.00),
('Keyboard', 'Accessories', 1800.00),
('Monitor', 'Electronics', 15000.00),
('Headphones', 'Accessories', 2500.00),
('Office Chair', 'Furniture', 8500.00),
('Desk Lamp', 'Furniture', 1800.00),
('USB-C Cable', 'Accessories', 700.00);
SELECT * FROM products;
USE business_operations;

INSERT INTO orders
(customer_id, product_id, quantity, unit_price, order_date, status)
VALUES
(1, 1, 1, 55000.00, '2026-09-01 10:15:00', 'Completed'),
(2, 2, 2, 1200.00, '2026-09-01 11:30:00', 'Completed'),
(3, 4, 1, 15000.00, '2026-09-02 09:45:00', 'Pending'),
(4, 5, 3, 2500.00, '2026-09-02 14:20:00', 'Completed'),
(5, 6, 1, 8500.00, '2026-09-03 16:10:00', 'Shipped'),
(6, 1, 1, 55000.00, '2026-09-03 17:30:00', 'Pending'),
(7, 3, 2, 1800.00, '2026-09-04 10:00:00', 'Completed'),
(8, 4, 2, 15000.00, '2026-09-04 12:40:00', 'Shipped'),
(9, 5, 1, 2500.00, '2026-09-05 15:00:00', 'Completed'),
(10, 6, 2, 8500.00, '2026-09-05 16:30:00', 'Pending'),
(1, 2, 3, 1200.00, '2026-09-06 09:20:00', 'Completed'),
(2, 7, 2, 1800.00, '2026-09-06 11:15:00', 'Completed'),
(3, 8, 5, 700.00, '2026-09-07 13:10:00', 'Shipped'),
(4, 1, 1, 55000.00, '2026-09-07 14:45:00', 'Pending'),
(5, 4, 1, 15000.00, '2026-09-08 10:30:00', 'Completed');
SELECT * FROM orders;
USE business_operations;

INSERT INTO sales
(order_id, customer_id, product_id, quantity, sale_amount, sale_date)
VALUES
(1, 1, 1, 1, 55000.00, '2026-09-01 10:15:00'),
(2, 2, 2, 2, 2400.00, '2026-09-01 11:30:00'),
(4, 4, 5, 3, 7500.00, '2026-09-02 14:20:00'),
(7, 7, 3, 2, 3600.00, '2026-09-04 10:00:00'),
(9, 9, 5, 1, 2500.00, '2026-09-05 15:00:00'),
(11, 1, 2, 3, 3600.00, '2026-09-06 09:20:00'),
(12, 2, 7, 2, 3600.00, '2026-09-06 11:15:00'),
(15, 5, 4, 1, 15000.00, '2026-09-08 10:30:00');
SELECT * FROM sales;
SELECT
    SUM(sale_amount) AS total_revenue
FROM sales;
SELECT
    p.product_name,
    SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;

SELECT
    o.order_id,
    c.name AS customer_name,
    p.product_name,
    o.quantity,
    o.status,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Pending'
ORDER BY o.order_date;

USE business_operations;

CREATE TABLE actions (
    action_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    related_order_id INT,
    status VARCHAR(30) DEFAULT 'Pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (related_order_id) REFERENCES orders(order_id)
);
