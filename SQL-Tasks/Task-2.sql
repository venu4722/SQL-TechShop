--------------------------------------- /* TASK-2 *** Select, Where, Between, AND, LIKE*** */---------------------------------------
-- 1) Write an SQL query to retrieve the names and emails of all customers.

   select concat(FirstName,' ',LastName) Full_Name,Email from Customers;

-- 2) Write an SQL query to list all orders with their order dates and corresponding customer
--    names.
		
        select orderID,orderDate,concat(FirstName,' ',LastName) from Orders o
        join Customers c
        on o.customerID=c.customerID;

-- 3) Write an SQL query to insert a new customer record into the "Customers" table. Include
       -- customer information such as name, email, and address.
       
		insert into Customers
          values(11,'Prakash','Sandaka','prakash.sandaka@gmail.com',7702838207,'257 kakinada,AP');

-- 4) Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
       --  increasing them by 10%
       
       update Products 
       set price =price+(price*0.1);
       select price from Products;
       
-- 5) Write an SQL query to delete a specific order and its associated order details from the
       -- "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
       
			SET @OrderID := 2; 
			DELETE FROM OrderDetails
			WHERE OrderID = @OrderID;
			-- Delete from Orders
			DELETE FROM Orders
			WHERE OrderID = @OrderID;
     
-- 6) Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,  
       -- order date, and any other necessary information. 
       
			insert into orders 
				values(11,11,'2024-01-25',30039.99);
    
-- 7) Write an SQL query to update the contact information (e.g., email and address) of a specific
    --  customer in the "Customers" table. Allow users to input the customer ID and new contact
    --  information.
				 select * from customers;
				 set @customerId:=2;
				 set @newEmail:='priya1@gmail.com';
				 set @newAddress:='491 yousufguda,HYD';
				 update customers 
					set email=@newEmail,address=@newAddress
					where customerID=@customerId;
                    
-- 8)Write an SQL query to recalculate and update the total cost of each order in the "Orders"
    -- table based on the prices and quantities in the "OrderDetails" table.
					select * from products;
					select * from orders;
					select * from orderdetails;
				UPDATE Orders
				SET TotalAmount = (
					SELECT SUM(od.Quantity * p.Price) AS TotalCost
					FROM OrderDetails od
					JOIN Products p ON od.ProductID = p.ProductID
					where od.OrderID = Orders.OrderID
				)
				WHERE EXISTS (
					SELECT 1
					FROM OrderDetails od
					WHERE od.OrderID = Orders.OrderID
				);

-- 9) Write an SQL query to delete all orders and their associated order details for a specific
     -- customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
	-- as a parameter.
    
			select * from orders;
			select * from customers;
			select * from orderdetails;
			set @customerId:=3;
			
			DELETE FROM OrderDetails
			WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);
			
			DELETE FROM Orders
			WHERE CustomerID = @CustomerID;
            
-- 10)  Write an SQL query to insert a new electronic gadget product into the "Products" table,  
      -- including product name, category, price, and any other relevant details. 
			
            select * from products;
			insert into products values
            			(11,'keyBoard','Easy and efficient to type',528.99);

-- 11) Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from  
  -- "Pending" to "Shipped"). Allow users to input the order ID and the new status. 
		
        SET @OrderIDToUpdate = 1;
		UPDATE Orders
		SET Status = 'Shipped'
		WHERE OrderID = @OrderIDToUpdate;
       
-- 12) Write an SQL query to calculate and update the number of orders placed by each customer  
       -- in the "Customers" table based on the data in the "Orders" table. 
		
			UPDATE Customers
		SET Orders = (
			SELECT COUNT(OrderID)
			FROM Orders
			WHERE Customers.CustomerID = Orders.CustomerID
		);
