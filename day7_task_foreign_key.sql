create database hospital_management_foreign;
use hospital_management_foreign;
-- Rooms Table (created first because Patients references it)
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_no VARCHAR(10),
    room_type VARCHAR(50),
    status VARCHAR(20)
);

-- Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(255),
    disease VARCHAR(100),
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    available_time VARCHAR(50)
);

-- Appointments Table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Billing Table
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    room_charges DECIMAL(10,2),
    doctor_fee DECIMAL(10,2),
    medicine_cost DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    bill_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
-- First, insert into Rooms table (since Patients table references it)
INSERT INTO Rooms (room_id, room_no, room_type, status) VALUES
(101, 'A101', 'ICU', 'Occupied'),
(102, 'A102', 'General', 'Available'),
(202, 'B202', 'Private', 'Occupied'),
(204, 'B204', 'General', NULL),
(301, 'C301', 'ICU', 'Available');

-- Insert into Patients table
INSERT INTO Patients (patient_id, name, age, gender, phone, address, disease, room_id) VALUES
(1, 'Arjun', 45, 'Male', '9876543210', 'MG Street', 'Fever', 101),
(2, 'Priya', 34, 'Female', NULL, 'Gandhi Road', 'Diabetes', 102),
(3, 'Karan', 17, 'Male', '9123456677', 'Anna Nagar', NULL, NULL),
(4, 'David', 55, 'Male', '9988776644', 'Main Street', 'Heart Issue', 202),
(5, 'Anu', 60, 'Female', '9090909090', 'Lake Street', 'Asthma', 204);

-- Insert into Doctors table
INSERT INTO Doctors (doctor_id, name, specialization, phone, available_time) VALUES
(201, 'Dr. Deepak', 'Cardiology', '9000000001', '10AM–2PM'),
(202, 'Dr. Riya', 'Neuro', '9888888888', '2PM–6PM'),
(203, 'Dr. Sunil', 'General', NULL, NULL),
(204, 'Dr. Divya', 'Dental', '9000080000', '9AM–1PM');

-- Insert into Appointments table
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status) VALUES
(1001, 1, 201, '2025-01-15', 'Completed'),
(1002, 2, 202, '2025-01-16', NULL),
(1003, 4, 204, '2025-02-01', 'Cancelled'),
(1004, 3, 201, NULL, 'Pending');

-- Insert into Billing table
INSERT INTO Billing (bill_id, patient_id, room_charges, doctor_fee, medicine_cost, total_amount, bill_date) VALUES
(5001, 1, 5000.00, 1000.00, 800.00, 6800.00, '2025-01-15'),
(5002, 4, 8000.00, 1500.00, 1200.00, 10700.00, '2025-02-01'),
(5003, 2, 3000.00, 500.00, NULL, NULL, '2025-01-16');

select * from patients;
select * from patients where name like "A%";
select * from patients where age > 50;
insert into patients values (6,"paru",29,"Female","6798456324","Lakshmi street","stomach ache",301);
update patients set phone="6758942389" where patient_id=2;
delete from patients where phone is null;
select * from patients where room_id in(101,102);
select * from patients where room_id not in (101,102);
select * from patients order by age limit 5;
select * from patients where address like "%street%";
select * from patients where gender in ("male","female");
delete from rooms where room_id is null;
select * from patients where age < 18;
update patients set room_id=204 where room_id=202;
select * from patients where disease is null;
insert into patients(patient_id,name,age,gender,phone,address,disease) values (7,"parvathi",39,"Female","6798456334","jeeva street","headache");
select * from patients order by name;
select * from doctors;
select * from doctors where specialization="cardiology";
insert into doctors values(205,"Dr.Radha","dermotologist","8790654321","9AM-12PM");
update doctors set available_time="4pm-9pm" where doctor_id=203;
select * from doctors where specialization is null;
select * from doctors where name like "D%";
select * from doctors where specialization in ("ortho","Neuro","Dental");
select * from doctors where phone like "%00";
insert into doctors(doctor_id,name,specialization,phone)values(206,"Dr.krishna","peadiatrician","8790766554");
select * from doctors limit 3;
update doctors set specialization="General Physician" where specialization="general";
select * from doctors where length(name)>5;
delete from doctors where phone is null;
select * from doctors order by doctor_id desc;
select * from doctors where specialization not in ("cardio","Neuro");
update doctors set phone=9000000000;
select * from rooms;
select * from rooms where status="available";
update rooms set status="occupied" where room_id=204;
insert into rooms values(302,"C302","private","Available");
delete from rooms where status is null;
select * from rooms where room_type in("icu","general");
select * from rooms where room_no like "1%";
select * from rooms limit 5;
update rooms set room_type="general ward" where room_type="general";
delete from rooms where room_id>300;
select * from rooms order by room_id ;
insert into rooms(room_id,room_no,room_type)values(303,"C303","general");
Select * from rooms where room_id NOT IN (101,102,103); 
Update rooms set room_type="private" where room_id=101;
select * from rooms where status is null;
truncate table rooms;
select * from rooms where room_id>300;
select * from patients where room_id>300;
delete from patients where patient_id=6;
select * from appointments;
select * from appointments where appointment_date=curdate();
insert into appointments values(1005,5,202,"2025-11-04","completed");
delete from appointments where status is null;
select * from appointments where patient_id=1;
select * from appointments where doctor_id in(202,201);
update appointments set status="completed" where appointment_id=1004;
select * from appointments order by appointment_date desc limit 3;
select * from appointments where appointment_date is null;
select * from appointments where appointment_date like "2025-01";
delete from appointments where status="cancelled";
update appointments set appointment_date="2025-03-10" where appointment_id =1003;
select * from appointments where patient_id not in (2,4);
insert into appointments(appointment_id,patient_id,doctor_id,appointment_date) values(1006,4,204,"2025-11-14");
select * from appointments order by appointment_date desc;
delete from appointments where doctor_id=7;
select * from billing;
select * from billing where total_amount > 5000;
insert into billing values(5004,3,2000.00,200.00,500.00,2700.00,"2025-03-15");
update billing set medicine_cost=500 where bill_id=5003;
delete from billing where medicine_cost is null;
Select * from billing where patient_id IN (1,2);
select * from billing order by total_amount desc limit 3;
insert into billing(bill_id,patient_id,room_charges,doctor_fee,total_amount,bill_date) values(5005,3,3500.00,400.00,3900.00,"2025-03-15");
update billing set total_amount=doctor_fee+medicine_cost;
select * from billing where total_amount between 1000 and 3000;
delete from billing where patient_id=2;
Select * from billing where total_amount not in (1000,2000,3000);
Update billing set doctor_fee=doctor_fee*0.1;
Select * from billing order by bill_date;
truncate table billing;
Select * from billing where doctor_fee is null;




