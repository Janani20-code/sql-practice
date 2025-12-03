create database ecommerce;
use ecommerce;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

INSERT INTO Users VALUES
(1, 'arunk', 'arun@gmail.com', '9876543210', 'Chennai'),
(2, 'priya27', 'priya@yahoo.com', '9845078945', 'Bangalore'),
(3, 'rahul45', 'rahul@outlook.com', '9778899001', 'Kolkata'),
(4, 'lakshmi', 'lakshmi@gmail.com', '9823498765', 'Hyderabad'),
(5, 'ram99', 'ram@hotmail.com', '9898981818', 'Delhi');


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 55000, 20),
(2, 'Headphones', 'Electronics', 1500, 50),
(3, 'Shoes', 'Footwear', 2500, 30),
(4, 'Mobile Phone', 'Electronics', 20000, 40),
(5, 'Backpack', 'Bags', 1200, 25);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    buyer_code INT,
    product_code INT,
    order_date DATE,
    quantity INT,
    status VARCHAR(20)
);

INSERT INTO Orders VALUES
(101, 10, 501, '2025-01-05', 1, 'Delivered'),
(102, 20, 502, '2025-01-06', 2, 'Shipped'),
(103, 30, 503, '2025-01-07', 1, 'Cancelled'),
(104, 40, 504, '2025-01-08', 3, 'Pending'),
(105, 50, 505, '2025-01-09', 1, 'Delivered');

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_code INT,
    amount INT,
    method VARCHAR(20),
    status VARCHAR(20)
);

INSERT INTO Payments VALUES
(1, 101, 55000, 'UPI', 'Success'),
(2, 102, 3000, 'Card', 'Success'),
(3, 103, 2500, 'NetBanking', 'Failed'),
(4, 104, 60000, 'Cash', 'Pending'),
(5, 105, 1200, 'UPI', 'Success');

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_code INT,
    available_stock INT,
    warehouse VARCHAR(50)
);

INSERT INTO Inventory VALUES
(1, 501, 100, 'Chennai Warehouse'),
(2, 502, 200, 'Bangalore Warehouse'),
(3, 503, 150, 'Mumbai Warehouse'),
(4, 504, 180, 'Delhi Warehouse'),
(5, 505, 120, 'Hyderabad Warehouse');

select * from users;
select * from users where username like "a%";
select * from users where email like "%gmail%";
select * from users where user_id in (1,3,5);
select * from users where user_id not in (2,4);
select * from users where phone is null;
select * from users where username is not null;
select * from users order by user_id limit 3;
select * from users where username like "%an%";
update users set username="Guest user" where email is null;
select * from products;
select * from products where price>500;
select * from products where product_name like "s%";
select * from products where category is null;
select * from products where category is not null;
select * from products order by price;
select * from products where product_name like "%Pro%"
select * from products where product_name not in ('laptop','mobile')
update products set price=price+200;
update products set product_name="crocs" where product_id=3;
delete from products where stock=0
select * from products limit 2
select * from products where price between 500 and 2000;
select * from products where category in ('electronics','appliances');
drop table product;
select * from orders;
select * from orders where status="pending";
select * from orders where order_id in (1,2,3);
select * from orders where order_id not in (4,5)
select * from orders limit 4;
select * from orders order by quantity desc;
select * from orders where order_date like "2025%";
update orders set status="cancelled"
delete from orders where status="Delivered"
truncate table orders;
select * from payments;
select * from payments where amount >1000
select * from payments order by amount
select * from payments where method like "%card%"
select * from payments where method is null
select * from payments where method is not null
select * from payments where payment_id in (2,4,6)
select * from payments limit 3;
update payments set method="UPI" where payment_id=5
delete from payments where amount=0
select * from payments where amount between 200 and 1500
select * from payments where status like "%success%"
select * from payments where payment_id not in (1,3,5)
drop table payments;
select * from payments where amount-50 > 500;
select * from inventory;
select * from inventory where available_stock>50
select * from inventory where available_stock <10
select * from inventory order by available_stock desc;
update inventory set available_stock=available_stock+10
delete from inventory where available_stock=0
select * from inventory where inventory_id in (1,2,3)
select * from inventory where inventory_id not in (4,5)
select * from inventory limit 5;
select * from inventory where product_code like "%2"
select * from inventory where available_stock between 20 and 60
drop table inventory