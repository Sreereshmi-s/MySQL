-- Create a database named "Sales"
CREATE DATABASE Sales;

-- Use the Sales database
USE Sales;

-- Create the "Orders" table with the specified columns and constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

-- Add a new column named "order_quantity" to the orders table
ALTER TABLE Orders
ADD order_quantity INT;

-- Rename the orders table to the sales_orders table
RENAME TABLE Orders TO sales_orders;

-- Insert 10 rows into the sales_orders table
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
(1, 'Annie Smith', 'Electronics', 'Smartphone', '1234567890', 1),
(2, 'Bob John', 'Furniture', 'Office Chair', '1234567891', 2),
(3, 'Catherene Brown', 'Clothing', 'T-Shirt', '1234567892', 3),
(4, 'David Johnson', 'Kitchenware', 'Blender', '1234567893', 1),
(5, 'Ema Davis', 'Books', 'Novel', '1234567894', 5),
(6, 'Francis Moore', 'Electronics', 'Laptop', '1234567895', 1),
(7, 'Grace Lee', 'Toys', 'Board Game', '1234567896', 4),
(8, 'Harry White', 'Appliances', 'Microwave', '1234567897', 1),
(9, 'Ivy Clark', 'Clothing', 'Jacket', '1234567898', 2),
(10, 'John Hall', 'Sports', 'Football', '1234567899', 3);

-- Retrieve customer_name and Ordered_Item from the sales_orders table
SELECT Customer_name, Ordered_item FROM sales_orders;

-- Update the name of a product for any row
UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 6;

-- Delete the sales_orders table from the database
DROP TABLE sales_orders;
