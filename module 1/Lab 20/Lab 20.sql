-- Challenge 2 Create the Database and Tables
create database if not exists LAB_20;
use LAB_20; 
create table if not exists cars(
vin VARCHAR(17) NOT NULL,
manufacturer VARCHAR(30),
model VARCHAR(30),
year_ INT,
color VARCHAR(30),
PRIMARY KEY (vin)
);
CREATE TABLE IF NOT EXISTS customers (
customer_id INT NOT NULL,
name_ VARCHAR(50),
phone VARCHAR(30),
email VARCHAR(40),
address VARCHAR(50),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
zip VARCHAR(10),
PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS stores (
store_id INT NOT NULL,
address VARCHAR(50),
city VARCHAR(50),
PRIMARY KEY (store_id)
);

create table if not exists salesperson (
staff_id INT NOT NULL,
name_ VARCHAR(50),
store_id INT,
PRIMARY KEY (staff_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id));

CREATE TABLE IF NOT EXISTS invoices (
invoice_id INT NOT NULL,
date_ DATE,
vin VARCHAR(17),
customer_id int,
staff_id INT,
PRIMARY KEY (invoice_id));

-- Challenge 3 - Seeding the Database
use lab_20;
insert into cars(vin, Manufacturer, model, year_, color)
values 
('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan',	2019, 'Blue'),
('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red'),
('RKXVNNIHLVVZOUB4M','Ford', 'Fusion',	2018, 'White'),
('HKNDGS7CU31E9Z7JW','Toyota', 'RAV4',	2018,'Silver'),
('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');

insert into customers(Customer_ID,Name_	,Phone,Email,Address,City,State,Country,zip)
values
(10001,'Pablo Picasso', '+34 636 17 63 82','-','Paseo de la Chopera 14','madrid', 'madrid', 'spain',28045),
(20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States',33130),
(30001,	'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',75008);

insert into stores(store_id, address, city)
values
(001,'-', 'Madrid'),
(002,'-', 'barcelona'),
(003, '-','berlin'),
(004,'-', 'paris'),
(005,'-','Mimia'),
(006,'-','Mexico City'),
(007,'-','Amsterdam'),
(008,'-','São Paulo');

INSERT into salesperson(Staff_ID,Name_, store_id)
values
(00001,'Petey Cruiser',	'001'),
(00002,'Anna Sthesia','002'),
(00003,'Paul Molive','003'),
(00004,'Gail Forcewind','004'),
(00005,'Paige Turner','005'),
(00006,	'Bob Frapples','006'),
(00007,	'Walter Melon','007'),	
(00008,	'Shonda Leer','008');

insert into invoices(Invoice_id,Date_,VIN, customer_id, staff_id)
values
(852399038, "2018-08-22", "3K096I98581DHSNUP", 20001, 00004),
(731166526, "2018-12-31", "HKNDGS7CU31E9Z7JW", 10001, 00006),
(271135104, "2019-01-22", "RKXVNNIHLVVZOUB4M", 30001, 00008);


