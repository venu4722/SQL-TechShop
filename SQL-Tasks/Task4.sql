------------------------------ Task 4. Subquery and its types: --------------------------

-- 1) Write an SQL query to find out which customers have not placed any orders.

			SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,c.Email,c.Address,o.orderid
			FROM Customers c
			left join orders o
            on c.customerid=o.customerid
            where o.orderid is null;
            
-- 2) Write an SQL query to find the total number of products available for sale.

			select count(*) totalproducts
            from products;
            
-- 3) Write an SQL query to calculate the total revenue generated by TechShop.

		select sum(totalamount) totalrevenue from orders;

-- 4) Write an SQL query to calculate the average quantity ordered for products.

		select avg(quantity) AverageQuantityOrdered from orderdetails;
        
-- 5) Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
      -- to input the customer ID as a parameter.
      
      set @custId=5;
      select sum(totalamount) totalrevenue
      from customers c
      join orders o
      on c.customerid=o.customerid
      where c.customerid=@custId;
      
-- 6) Write an SQL query to find the customers who have placed the most orders. List their names
      -- and the number of orders they've placed.
      
			select * from customers;
            select * from orders;
            select c.customerid,concat(firstname,' ',lastname) fullname,count(orderid) numberOfOrders
            from customers c
            join orders o
            on c.customerid=o.customerid
            group by c.customerid,concat(firstname,' ',lastname)
            order by numberOfOrders desc
            limit 1;
            
-- 7) Write an SQL query to find the most popular product category, which is the one with the highest
     -- total quantity ordered across all orders.
                select p.productname,sum(o.quantity) total_quantity_ordered
				from products p
				join orderdetails o 
                on p.productid = o.productid
				group by p.productname
				order by total_quantity_ordered desc
				limit 1;
		
-- 8) Write an SQL query to find the customer who has spent the most money (highest total revenue)
     -- on electronic gadgets. List their name and total spending.
     
     
			select customerid,fullname,totalrevenue
			from(select c.customerid,concat(c.firstname, ' ', c.lastname) fullname,sum(o.totalamount) totalrevenue
            from customers c
			join orders o 
            on c.customerid = o.customerid
			group by c.customerid, concat(c.firstname, ' ', c.lastname)) as customer_revenue
			order by totalrevenue desc
            limit 1;

-- 9) Write an SQL query to calculate the average order value (total revenue divided by the number of
      -- orders) for all customers.
      
			select avg(totalrevenue / order_count) average_order_value
			from (select c.customerid,sum(o.totalamount)  totalrevenue,count(o.orderid) order_count
			from customers c
            left join orders o 
            on c.customerid = o.customerid
			group by c.customerid) as customer_order_stats;
            

-- 10) Write an SQL query to find the total number of orders placed by each customer and list their
 -- names along with the order count.
 
 
		select c.customerid,concat(c.firstname, ' ', c.lastname) fullname,count(o.orderid) AS order_count
		from customers c
		left join orders o 
        on c.customerid = o.customerid
		group by
		c.customerid, concat(c.firstname, ' ', c.lastname)
		order by order_count desc;
		
 