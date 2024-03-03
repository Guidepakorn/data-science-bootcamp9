-- Create Table
Create Table Customers(
  CustomerID int,
  CustomerName text,
  Age int,
  Gender text,
  Occupation Text
  );

Insert into Customers values 
  (1,'Guide',25,'Male',"Investor"),
  (2,'John',26,'Male',"Audit"),
  (3,'Tom',28,'Male',"Manager"),
  (4,'Jerry',26,"Male","Sales"),
  (5,'Emma',28,"Female","Cook"),
  (6,'Lisa',32,"Female","Celebrity");
.mode box
select * From customers;

Create Table Orders (
  customerid int,
  OrderID int,
  Menu_Name Text,
  Qty int,
  Price int,
  OrderDate date
);
Insert into Orders values
  (1,101,"Hawaiian",1,300,"2022-09-11"),
  (2,102,"Seafood Deluxe",1,400,"2022-09-12"),
  (3,103,"Meat Deluxe",2,700,"2022-09-13"),
  (4,104,"Veggie Mushroom",2,500,"2022-09-14"),
  (5,105,"Chicken Trio",4,1200,"2022-09-15"),
  (6,106,"Hawaiian",3,900,"2022-09-16");
.mode box
Select * From Orders;

Create Table Menus(
  Menu_Num int,
  Menu_name Text,
  Menu_Price int
);
Insert into Menus values
  (1,"Hawaiian",300),
  (2,"Seafood Deluxe",400),
  (3,"Meat Deluxe",350),
  (4,"Veggie Mushroom",250),
  (5,"Chicken Trio",300);
.mode box
Select * From Menus;

-- Aggregate Function
Select 
  sum(Qty) As Total_Qty,
  sum(Price) As Total_Price,
  Avg(Price) AS Avg_Price,
  Count(Customerid) As Total_Customer
From 
  Orders;

.mode box

-- Join Syntax
Select *
From Menus 
Join Orders 
On Menus.Menu_Name = Orders.Menu_Name
Join Customers
on Orders.customerid = Customers.CustomerID
Group by 1
Order by 1 Desc
limit 3;
.mode box

-- subquery
select 
  customername,
  age,
  gender,
  Occupation
From (select * From Customers) As sub
Where Occupation = "Investor";
.mode box

-- With
with sub as (select * From Customers)
select 
  customername,
  age,
  gender,
  Occupation
From sub
Where Occupation = "Audit";
.mode box

