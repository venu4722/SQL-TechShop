---------------------------------------- /* TASK-1 *** DATABASE DESIGN *** */--------------------------------------------------------

-- 1. Create the database named "TechShop" ------------
create database TechShop;

-------------------------------------------------------------------------------------

-- 2. -- Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables
-- based on the provided schema.

-- 4.Create appropriate Primary Key and Foreign Key constraints for referential integrity.
 
			/* Customer Table   */
create table Customers(
CustomerID int primary key,
FirstName varchar(255),
LastName varchar(255),
Email varchar(255),
Phone bigint,
Address varchar(255));


			/* Products Table */
create table Products(
ProductID int primary key,
ProductName varchar(200),
Description varchar(1000),
Price decimal(20,2));

		  /* Orders Table */
create table Orders(
OrderID int primary key,
CustomerID int,
OrderDate date,
TotalAmount decimal(20,2),
foreign key(CustomerID) references Customers(CustomerID));

          /*OrderDetails Table*/
create table OrderDetails(
OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int,
foreign key(OrderID) references Orders(OrderID),
foreign key(ProductID) references Products(ProductID));

        /*Inventory Table */
create table Inventory(
InventoryID int primary key,
ProductID int,
QuantityInStock int,
LastStockUpdate date,
foreign key(ProductID) references Products(ProductID));

---------------------------------------------------------------------------------------

-- 5. Insert at least 10 sample records into each of the following tables.
       -- a. Customers
	   -- b. Products
       -- c. Orders
       -- d. OrderDetails
-- a)
insert into Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
values
(1, 'Venu', 'Gopal', 'venu7272@Gmail.com', 9876543210, '123 SR Street,HYD'),
(2, 'Priya', 'Patel', 'priya.patel@email.com', 8765432109, '456 Ameerpet,HYD'),
(3, 'Uday', 'Kiran', 'udaykiran1@email.com', 7654321098, '789 Jeedimetla,HYD'),
(4, 'Anjali', 'Gupta', 'anjali.gupta@email.com', 9543210987, '101 Madhapur, HYD'),
(5, 'Rajesh', 'Kumar', 'rajesh.kumar@email.com', 7432109876, '202 Miyapur,HYD'),
(6, 'Sai', 'Teja', 'saiteja@email.com', 9321098765, '303 Uppal,HYD'),
(7, 'Vikram', 'Rathod', 'vikram.rathod@email.com', 9210987654, '404 LB Nagar,HYD'),
(8, 'Neha', 'Verma', 'neha.verma@email.com', 2109876543, '505 Yousufguda,HYD'),
(9, 'Anil', 'Kumar', 'anil.kumar@email.com', 9898765432, '606 Rahamath Nagar,HYD'),
(10, 'Pooja', 'David', 'pooja.david@email.com', 987654321, '707 Kukatpally,HYD');

-- b)
insert into Products (ProductID, ProductName, Description, Price)
values
(1, 'TV', 'Smart television with so many OTT platforms available.', 200.99),
(2, 'Smart Watch', 'A wearable device with smart features for health and notifications.', 499.99),
(3, 'Mobile', 'An Apple mobile with new features and modifications', 120000.99),
(4, 'Laptop', 'Portable computer for work and entertainment.', 60799.99),
(5, 'Camera', 'Capture your memories with this easy-to-use camera.', 70500.99),
(6, 'Clock', 'Classic clock for keeping track of time.', 599.99),
(7, 'Earphones', 'Quality earphones for your music and calls.', 2300.99),
(8, 'Guitar', 'Basic guitar for music enthusiasts.', 2300.99),
(9, 'Mouse', 'Effective mouse for smooth navigation on your computer.', 230.99),
(10, 'Pendrive', 'Compact and portable USB storage for your data needs.', 599.99);

-- c)
insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values
(1, 1, '2024-01-15', 1200.99),
(2, 2, '2024-01-16', 1299.99),
(3, 3, '2024-01-17', 240035.99),
(4, 4, '2024-01-18', 260089.99),
(5, 5, '2024-01-19', 145678.99),
(6, 6, '2024-01-20', 2483.99),
(7, 7, '2024-01-21', 6967.99),
(8, 8, '2024-01-22', 4675.99),
(9, 9, '2024-01-23', 678.99),
(10, 10, '2024-01-24', 2657.99);

-- d)
insert into OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
values
(1, 1, 1, 5),
(2, 2, 2, 2),
(3, 3, 3, 2),
(4, 4, 4, 3),
(5, 5, 5, 2),
(6, 6, 6, 4),
(7, 7, 7, 3),
(8, 8, 8, 2),
(9, 9, 9, 3),
(10, 10, 10, 5);

-- e)
insert into Inventory
values
(1, 1, 50, '2024-01-01'),
(2, 2, 100, '2024-01-02'),
(3, 3, 30, '2024-01-03'),
(4, 4, 75, '2024-01-04'),
(5, 5, 20, '2024-01-05'),
(6, 6, 10, '2024-01-06'),
(7, 7, 50, '2024-01-07'),
(8, 8, 15, '2024-01-08'),
(9, 9, 40, '2024-01-09'),
(10, 10, 25, '2024-01-10');


