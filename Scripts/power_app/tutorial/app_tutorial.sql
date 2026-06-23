Create Schema tutorial

--Create Tables
----------------------------------------------------------------------------
-- DROP TABLE repsys1.tutorial.stock;
CREATE TABLE repsys1.tutorial.stock (
	id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(255),
	description varchar(255),
	stockLevel int,
);

--generate csv file containing a name,description,and a number
INSERT INTO repsys1.tutorial.stock (name, description, stockLevel)
VALUES
('Wireless Mouse','Ergonomic 2.4GHz wireless office mouse',142),
('Mechanical Keyboard','RGB backlit keyboard with blue switches',85),
('Noise-Canceling Headphones','Over-ear Bluetooth headphones with ANC',210),
('USB-C Hub','6-in-1 adapter with HDMI and SD card reader',63),
('Smart Watch','Fitness tracker with heart rate monitor',115);
select * from repsys1.tutorial.stock 
-- DROP TABLE repsys1.tutorial.orders;
CREATE TABLE repsys1.tutorial.orders (
	id int IDENTITY(1,1) PRIMARY KEY,
	stockID int,
	orderDate datetime,
	amount int,
	description varchar(255),
);
--generate csv file containing a number between 1 and 5,order date,amount,description

INSERT INTO repsys1.tutorial.orders 
(stockID, orderDate, amount, description)
VALUES
(3,'2026-05-12',45.50,'Amazon'),
(1,'2026-05-14',12.99,'Target'),
(4,'2026-05-20',105.00,'Chewy'),
(2,'2026-05-28',25.00,'Walmart'),
(5,'2026-06-02',210.25,'Home Depot')

SELECT * from repsys1.tutorial.orders; 

----------------------------------------------------------------
-- Get Orders SPROC
----------------------------------------------------------------
DECLARE @return_value INT;

EXEC @return_value = tutorial.getOrders

select 'return_value' = @return_value

-- drop procedure tutorial.getOrders
create procedure tutorial.getOrders
as 
BEGIN   
--In SQL Server, SET NOCOUNT ON prevents the database from sending a message about the number of rows affected by a Transact-SQL statement (e.g., (1 row(s) affected)) back to the client.	
	SET NOCOUNT ON; 
	select t2.name as stockName,
	t2.description as stockDescript,
	t1.amount as orderedAmount,
	t1.description as orderDescript,
	t1.orderDate
	from tutorial.orders t1
	left join tutorial.stock t2
	on t1.stockID=t2.id
END; 


----------------------------------------------------------------
-- Get Stock SPROC
	name varchar(255),
	description varchar(255),
	stockLevel int,

----------------------------------------------------------------
DECLARE @return_value INT;

declare @id int;
set @id = 1;

EXEC @return_value = tutorial.getStock @id
--EXEC @return_value = tutorial.getStock

select 'return_value' = @return_value

-- drop procedure tutorial.getStock
create procedure tutorial.getStock
(	
	@id int = 0
)
as 
BEGIN   
--In SQL Server, SET NOCOUNT ON prevents the database from sending a message about the number of rows affected by a Transact-SQL statement (e.g., (1 row(s) affected)) back to the client.	
	SET NOCOUNT ON; 
    -- Case 1: All Stock
    IF @id = 0
    BEGIN
		select s.name as stockName,
			s.description as stockDescript,
			s.stockLevel as stockLevel
			from tutorial.stock s
    END
    -- All other Cases: 1 Item
    ELSE 
    BEGIN
		select s.name as stockName,
			s.description as stockDescript,
			s.stockLevel as stockLevel
			from tutorial.stock s
			where s.id=@id
    end
END; 


----------------------------------------------------------------
-- Get Stock SPROC
----------------------------------------------------------------
DECLARE @return_value INT;

declare @id int;
set @id = 1;

EXEC @return_value = tutorial.getStock @id
--EXEC @return_value = tutorial.getStock

select 'return_value' = @return_value

-- drop procedure tutorial.getStock
create procedure tutorial.getStock
(	
	@id int = 0
)
as 
BEGIN   
--In SQL Server, SET NOCOUNT ON prevents the database from sending a message about the number of rows affected by a Transact-SQL statement (e.g., (1 row(s) affected)) back to the client.	
	SET NOCOUNT ON; 
    -- Case 1: All Stock
    IF @id = 0
    BEGIN
		select s.name as stockName,
			s.description as stockDescript,
			s.stockLevel as stockLevel
			from tutorial.stock s
    END
    -- All other Cases: 1 Item
    ELSE 
    BEGIN
		select s.name as stockName,
			s.description as stockDescript,
			s.stockLevel as stockLevel
			from tutorial.stock s
			where s.id=@id
    end
END; 
