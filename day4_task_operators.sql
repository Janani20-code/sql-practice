create database hospital_management1;
use hospital_management1;
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT,
    gender VARCHAR(10),
    contact VARCHAR(15),
    address VARCHAR(30)
);

INSERT INTO Patients VALUES
(1, 'Arun Kumar', 32, 'Male', '9876543210', 'Chennai'),
(2, 'Priya Sharma', 27, 'Female', '9845012345', 'Bangalore'),
(3, 'Rahul Das', 45, 'Male', '9789098765', 'Kolkata'),
(4, 'Lakshmi Devi', 52, 'Female', '9823456712', 'Hyderabad'),
(5, 'Sita Ram', 39, 'Male', '9898989898', 'Delhi');

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    phone VARCHAR(15),
    room_no INT
);

INSERT INTO Doctors VALUES
(1, 'Dr. Suresh', 'Cardiologist', '9000011111', 101),
(2, 'Dr. Anita', 'Dermatologist', '9000022222', 102),
(3, 'Dr. Ramesh', 'Orthopedic', '9000033333', 103),
(4, 'Dr. Kavitha', 'Neurologist', '9000044444', 104),
(5, 'Dr. John', 'General Physician', '9000055555', 105);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_code INT,
    doctor_code INT,
    date DATE,
    time VARCHAR(20),
    status VARCHAR(20)
);

INSERT INTO Appointments VALUES
(1, 10, 101, '2025-01-10', '10:00 AM', 'Scheduled'),
(2, 20, 103, '2025-01-11', '11:30 AM', 'Completed'),
(3, 30, 102, '2025-01-12', '03:00 PM', 'Cancelled'),
(4, 40, 105, '2025-01-13', '12:00 PM', 'Scheduled'),
(5, 50, 104, '2025-01-14', '04:00 PM', 'Completed');

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_code INT,
    amount INT,
    discount INT,
    total_amount INT,
    payment_status VARCHAR(20)
);

INSERT INTO Billing VALUES
(1, 10, 5000, 500, 4500, 'Paid'),
(2, 20, 2000, 0, 2000, 'Paid'),
(3, 30, 3500, 300, 3200, 'Pending'),
(4, 40, 8000, 800, 7200, 'Paid'),
(5, 50, 4500, 0, 4500, 'Pending');

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30),
    availability VARCHAR(20),
    price_per_day INT
);

INSERT INTO Rooms VALUES
(1, 'General', 'Available', 1500),
(2, 'ICU', 'Occupied', 6000),
(3, 'Semi-Private', 'Available', 3000),
(4, 'Private', 'Occupied', 4500),
(5, 'General', 'Available', 1500);

select * from patients where gender="Male";
select name from patients where name like "A%";
select * from patients where age between 30 and 50;
select * from patients order by age desc limit 3;
update patients set contact='8766574834' where patient_id=3;
delete from patients where age <20;
select * from patients where address in ('chennai','delhi')
select * from patients where address not in ('Hyderabad','Bangalore');
select * from patients where address is null;
update patients set address="Unknown" where address is null;
update patients set age=age+1;
alter table patients rename column contact to phone_number;
truncate table patients;
drop table patients;
select * from doctors where specialization="Neurologist";
select * from doctors where name like "%a%";
select * from doctors where room_no>102
select * from doctors order by name limit 2;
update doctors set phone="7896789045" where doctor_id=5;
delete from doctors where specialization="orthopedic";
select * from doctors where specialization in ("deromotologist","cardiologist")
select * from doctors where specialization not in ('General Physician','Orthopedic');
select * from doctors where room_no is not null;
update doctors set room_no=room_no+10;
alter table doctors rename column room_no to chamber_no;
select * from doctors;
select * from doctors order by specialization,name;
select * from doctors where phone like "90000%";
Truncate table doctors; 
drop table doctors;
select * from appointments where status="scheduled"; 
select * from appointments where date= '2025-01-12'
select * from appointments where time like "%AM";
select * from appointments order by date desc limit 2;
update appointments set status="completed" where appointment_id=3
delete from appointments where status="cancelled";
select * from appointments where patient_code in(10,20,30) 
select * from appointments where doctor_code not in (101,202,303) 
select * from appointments where status is null
update appointments set status="pending" where status is null 
select * from appointments order by date,time;
update appointments set doctor_code=doctor_code+100  
alter table appointments add column remarks varchar(20);
truncate table appointments;
drop table appointments;
select * from billing where payment_status="Pending"
select * from billing where total_amount>4000
select * from billing where discount>200
select * from billing order by total_amount desc limit 2;
update billing set discount=1000 where bill_id=1
delete from billing where amount<3000
select * from billing where patient_code in (20,30)
select * from billing where payment_status<>"paid";
select * from billing where total_amount is not null;
update billing set total_amount=total_amount*1.10
alter table billing rename column payment_status to status;
select * from billing order by total_amount desc
select * from billing where discount like "5%"
truncate from billing
drop from billing 
select * from rooms where availability="available"
select * from rooms where room_type="ICU"
select * from rooms where price_per_day>2000
select * from rooms order by price_per_day;
update rooms set availability="available" where room_id=4
delete from rooms where room_type="general"
select * from rooms where room_type in ("ICU","private")
select * from rooms where room_type<>"general";
select * from rooms where availability is null;
update rooms set availability="unknown" where availability is null;
update rooms set price_per_day=price_per_day*0.20;
alter table rooms add column floor_no int;
select * from rooms where room_type like "p%"
truncate table rooms
drop table rooms
select * from patients;
select * from doctors;
select * from appointments
select * from rooms
select * from billing;
