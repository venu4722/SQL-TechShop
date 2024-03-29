----------------------------------------------- ** Task 3. Aggregate functions, Having, Order By, GroupBy and Joins **  ------------------------------
-- 1) Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
     -- customer name) for each order.
			 select concat(c.firstname,' ',c.lastname) custName,orderId,orderDate,totalAmount from orders o
			 join customers c
			 on o.customerID=c.customerID;

-- 2) Write an SQL query to find the total revenue generated by each electronic gadget product.
     -- Include the product name and the total revenue.
     
				 select productName,sum(Quantity*price) total_revenue
				 from products p
				 join orderDetails od
				 on p.productID=od.productID group by productName;
		
-- 3) Write an SQL query to list all customers who have made at least one purchase. Include their
      -- names and contact information.
      
				  select concat(firstName,' ',lastName) full_name,c.Address
				  from customers c
				  join orders o
				  on c.customerID=o.customerID
				  join orderDetails od
				  on o.orderID=od.orderID 
				  where od.quantity>=1;
                  
-- 4) Write an SQL query to find the most popular electronic gadget, which is the one with the highest
     -- total quantity ordered. Include the product name and the total quantity ordered.
     
				 select p.productName,od.quantity
				 from products p
				 join orderDetails od
				 on p.productID=od.productID order by quantity desc,productName limit 1;
	
-- 5) Write an SQL query to retrieve a list of electronic gadgets along with their corresponding
 --  categories.
			 select productname,quantity,orderDate,totalamount
			 from products p
			 join orderdetails od
			 on p.productID=od.productID
			 join orders o
			 on o.orderID=od.orderID;
             
-- 6) Write an SQL query to calculate the average order value for each customer. Include the
    -- customer's name and their average order value.
    
			select concat(firstname,' ',lastname) customerName,avg(od.Quantity * p.Price) avg_order
			from customers c
			join orders o
			on c.customerID=o.customerID
			join orderdetails od
			on o.orderID=od.orderID
			join products p
			on p.productID=od.productID
			group by c.customerID,concat(firstname,' ',lastname);
    
    
-- 7) Write an SQL query to find the order with the highest total revenue. Include the order ID,
     -- customer information, and the total revenue.
     
			select o.orderID,concat(firstname,' ',lastname) customerName,email,Address,sum(p.price*od.quantity) totalrevenue
			from customers c
			join orders o
			on c.customerID=o.customerID
			join orderdetails od
			on o.orderid=od.orderid
			join products p
			on p.productid=od.productid
			group by o.orderid,concat(firstname,' ',lastname),c.address,c.email
			order by totalrevenue desc
			limit 1;
     
     
-- 8) Write an SQL query to list electronic gadgets and the number of times each product has been
     -- ordered.
     
			SELECT P.ProductID, P.ProductName,
			COUNT(OD.ProductID) AS OrderCount
			FROM Products P
			JOIN OrderDetails OD ON P.ProductID = OD.ProductID
			group by p.productID,p.productName;

-- 9) Write an SQL query to find customers who have purchased a specific electronic gadget product.
     -- Allow users to input the product name as a parameter.
		
		set @productName='TV';
        select c.customerID,concat(firstName,' ',lastname) fullname,c.email,c.address
        from customers c
        join orders o
        on c.customerId=o.customerid
        join orderdetails od
        on o.orderid=od.orderid
        join products p
        on p.productid=od.productid
        where p.productName=@productName;
        
     
-- 10) Write an SQL query to calculate the total revenue generated by all orders placed within a
      -- specific time period. Allow users to input the start and end dates as parameters.
      
			  select * from orders;
			  set @start='2024-01-15';
			  set @end='2024-01-19';
			  select sum(totalamount) totalrevenue
			  from orders
			  where orderdate between @start and @end;
      
      
	