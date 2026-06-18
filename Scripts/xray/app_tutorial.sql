Create Schema tutorial

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
