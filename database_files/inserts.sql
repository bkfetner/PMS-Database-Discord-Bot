-- Script name: inserts.sql
-- Author:      Bryan Fetner
-- Purpose:     insert sample data to test the integrity of the payroll management system database
   
-- the database used to insert the data into.
USE PayrollManagementSystemDB;

-- Account table inserts
INSERT INTO Account (password, created) VALUES ('poi098', CURDATE());
INSERT INTO Account (password, created) VALUES ('1234', '2009-4-12');
INSERT INTO Account (password, created) VALUES ('password', '1999-12-23');
INSERT INTO Account (password, created) VALUES ('helloworld', '2010-6-15');
INSERT INTO Account (password, created) VALUES ('kinbe$4SDR##', '2021-1-14');

-- Device table inserts
INSERT INTO Device (account_id, device_name, device_type) VALUES (2, 'MacOS Monterey', 'PC');
INSERT INTO Device (account_id, device_name, device_type) VALUES (4, 'Android Mobile', 'Samsung Mobile Phone');
INSERT INTO Device (account_id, device_name, device_type) VALUES (2, 'Windows 95', 'PC');
INSERT INTO Device (account_id, device_name, device_type) VALUES (5, 'Ubuntu', 'PC');
INSERT INTO Device (account_id, device_name, device_type) VALUES (1, 'Texas Instruments', 'Portable calculator');

-- User table inserts
INSERT INTO User (account_id, first_name, last_name, email) VALUES (5, 'Billy', 'Goodman', 'bill@billhouse.com');
INSERT INTO User (account_id, first_name, last_name, email) VALUES (1, 'Sal', 'Vack', 'bestdan999@yahoo.com');
INSERT INTO User (account_id, first_name, last_name, email) VALUES (4, 'Val', 'Conners', 'vconners@dmv.gov');
INSERT INTO User (account_id, first_name, last_name, email) VALUES (2, 'Danny', 'Tames', 'jollytime@gmail.com');
INSERT INTO User (account_id, first_name, last_name, email) VALUES (3, 'Sandra', 'Gustamano', 'Sandy1997@gmail.com');

-- Session table inserts
INSERT INTO Session (device_id, user_id, start_time) VALUES ('2', '1', NOW());
INSERT INTO Session (device_id, user_id, start_time) VALUES ('3', '4', NOW());
INSERT INTO Session (device_id, user_id, start_time) VALUES ('5', '1', NOW());
INSERT INTO Session (device_id, user_id, start_time) VALUES ('3', '2', NOW());
INSERT INTO Session (device_id, user_id, start_time) VALUES ('1', '3', NOW());

-- Company table inserts
INSERT INTO Company (account_id, name, type) VALUES (3, 'Brocks Wood', 'Lumber');
INSERT INTO Company (account_id, name, type) VALUES (2, 'Volumn', 'Music Distribution');
INSERT INTO Company (account_id, name, type) VALUES (1, 'High Tech Technologies', 'College');
INSERT INTO Company (account_id, name, type) VALUES (5, 'Bread and Stuffing', 'Bakery');
INSERT INTO Company (account_id, name, type) VALUES (4, 'Stop and Go', 'Gas Station');

-- Payment Method table inserts
INSERT INTO `Payment Method` (isa_type, description) VALUES ('Check', 'Bank of America Check');
INSERT INTO `Payment Method` (isa_type, description) VALUES ('Direct Deposit', 'Credit Union Account');
INSERT INTO `Payment Method` (isa_type, description) VALUES ('Check', 'Capital One Checking');
INSERT INTO `Payment Method` (isa_type, description) VALUES ('Check', 'Wells Fargo Check');
INSERT INTO `Payment Method` (isa_type, description) VALUES ('Direct Deposit', 'Bank of America Savings');

-- Company Supported Payment Methods table inserts
INSERT INTO `Company Supported Payment Methods` (company_id, pay_method_id) VALUES (2, 4);
INSERT INTO `Company Supported Payment Methods` (company_id, pay_method_id) VALUES (1, 3);
INSERT INTO `Company Supported Payment Methods` (company_id, pay_method_id) VALUES (5, 2);
INSERT INTO `Company Supported Payment Methods` (company_id, pay_method_id) VALUES (3, 4);
INSERT INTO `Company Supported Payment Methods` (company_id, pay_method_id) VALUES (2, 5);

-- Person table inserts
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (346398787, 'Employee', 'Billy', 'Bower', 'billmail@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (326847959, 'Employee', 'Sandra', 'Conners', 'justsandy@yahoo.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (979676465, 'Previous Employee', 'Austin', 'Maxim', 'cocoapuff66@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (872378246, 'Previous Employee', 'Freddy', 'Gusferd', 'fred@guss.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (658698890, 'Employee', 'Tammy', 'Saint', 'tsaint@sfsu.edu');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (123986349, 'Employee', 'Oscar', 'Grouch', 'trachcan@sesamestreet.edu');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (232874237, 'Previous Employee', 'Pascal', 'Jordan', 'pas@jordanmail.org');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (746837246, 'Employee', 'Aman', 'Watts', 'watts@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (934534587, 'Employee', 'Lyra', 'Murphy', 'bestperson1002@godaddy.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (923869284, 'Previous Employee', 'Alex', 'Smith', 'alex@mail.org');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939269, 'Previous Employee', 'Roger', 'Dans', 'roger@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939270, 'Employee', 'Bob', 'Blank', 'bob@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939271, 'Employee', 'Will', 'Fast', 'will@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939272, 'Employee', 'Hugh', 'Mans', 'hugh@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939273, 'Employee', 'Riley', 'Cook', 'riley@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939274, 'Employee', 'Pam', 'Tree', 'pam@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939275, 'Employee', 'Sue', 'Storm', 'sue@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939276, 'Employee', 'Tracy', 'Moore', 'tracy@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939277, 'Employee', 'Klyde', 'Booms', 'klyde@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939278, 'Employee', 'Garth', 'Asher', 'klyde@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939279, 'Employee', 'Toms', 'Timothy', 'klyde@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939280, 'Employee', 'Becky', 'Veers', 'klyde@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939281, 'Employee', 'Julian', 'Dukes', 'klyde@gmail.com');
INSERT INTO Person (ssn, isa_type, first_name, last_name, email) VALUES (120939282, 'Employee', 'Veronica', 'Kleens', 'klyde@gmail.com');

-- Employee table inserts
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (346398787, 'Hourly Employee', '2020-5-30', 10, 3);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (326847959, 'Salary Employee', '2013-12-3', 20, 9);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (658698890, 'Salary Employee', '2019-1-12', 15, 5);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (123986349, 'Hourly Employee', '1990-5-2', 30, 5);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (746837246, 'Salary Employee', '2018-3-14', 12, 7);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (934534587, 'Hourly Employee', '1999-9-9', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939270, 'Hourly Employee', '2003-4-23', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939271, 'Hourly Employee', '2016-2-12', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939272, 'Hourly Employee', '2014-6-9', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939273, 'Hourly Employee', '2018-11-8', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939274, 'Hourly Employee', '2020-8-11', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939275, 'Hourly Employee', '2016-7-12', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939276, 'Hourly Employee', '2018-4-21', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939277, 'Hourly Employee', '2021-1-7', 21, 12);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939278, 'Salary Employee', '2016-4-3', 12, 7); -- 15
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939279, 'Salary Employee', '2013-7-16', 12, 7);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939280, 'Salary Employee', '2020-9-22', 12, 7);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939281, 'Salary Employee', '2014-2-25', 12, 7);
INSERT INTO Employee (ssn, isa_type, start_work_date, vacation_days, sick_days) VALUES (120939282, 'Salary Employee', '2015-5-6', 12, 7);

-- Company Employees table inserts
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (4, 3);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (1, 1);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (2, 5);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (4, 2);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (5, 4);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (1, 7);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (1, 8);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (2, 9);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (2, 10);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (4, 11);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (5, 12);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (5, 13);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (4, 14);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (1, 15);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (2, 16);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (3, 17);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (4, 18);
INSERT INTO `Company Employees` (company_id, employee_id) VALUES (5, 19);

-- Benefit table inserts
INSERT INTO Benefit (type, description, cost) VALUES ('Dental', 'Minimal Plan', 5.12);
INSERT INTO Benefit (type, description, cost) VALUES ('Medical', 'HMO', 249.50);
INSERT INTO Benefit (type, description, cost) VALUES ('Eye Care', 'Exams Only', 12.32);
INSERT INTO Benefit (type, description, cost) VALUES ('Medical', 'Gold Plan', 1002.43);
INSERT INTO Benefit (type, description, cost) VALUES ('Dental', 'Max Plan', 67.22);
INSERT INTO Benefit (type, description, cost) VALUES ('Dental', 'Max Plan', 670.76); -- 6
INSERT INTO Benefit (type, description, cost) VALUES ('Eye Care', 'Exams Only', 43.90);
INSERT INTO Benefit (type, description, cost) VALUES ('Medical', 'Gold Plan', 1243.90);
INSERT INTO Benefit (type, description, cost) VALUES ('Eye Care', 'Exams and Frames', 104.45);
INSERT INTO Benefit (type, description, cost) VALUES ('Dental', 'Minimal Plan', 12.32);

-- Company Offered Benefits table inserts
INSERT INTO `Company Offered Benefits` (company_id, benefit_id) VALUES (3, 2);
INSERT INTO `Company Offered Benefits` (company_id, benefit_id) VALUES (4, 2);
INSERT INTO `Company Offered Benefits` (company_id, benefit_id) VALUES (3, 3);
INSERT INTO `Company Offered Benefits` (company_id, benefit_id) VALUES (1, 5);
INSERT INTO `Company Offered Benefits` (company_id, benefit_id) VALUES (2, 1);

-- Region table inserts
INSERT INTO Region (name, type) VALUES ('TX', 'State');
INSERT INTO Region (name, type) VALUES ('KY', 'State');
INSERT INTO Region (name, type) VALUES ('CA', 'State');
INSERT INTO Region (name, type) VALUES ('WA', 'State');
INSERT INTO Region (name, type) VALUES ('United States of America', 'Country');
INSERT INTO Region (name, type) VALUES ('San Meteo', 'County');
INSERT INTO Region (name, type) VALUES ('San Francisco', 'City');
INSERT INTO Region (name, type) VALUES ('Dallas', 'City');
INSERT INTO Region (name, type) VALUES ('Bowling Green', 'City');
INSERT INTO Region (name, type) VALUES ('San Jose', 'City');
INSERT INTO Region (name, type) VALUES ('Tacoma', 'City');

-- Company Region table inserts
INSERT INTO `Company Region` (company_id, region_id) VALUES (1, 4);
INSERT INTO `Company Region` (company_id, region_id) VALUES (1, 11);
INSERT INTO `Company Region` (company_id, region_id) VALUES (2, 3);
INSERT INTO `Company Region` (company_id, region_id) VALUES (2, 10);
INSERT INTO `Company Region` (company_id, region_id) VALUES (4, 2);
INSERT INTO `Company Region` (company_id, region_id) VALUES (4, 9);
INSERT INTO `Company Region` (company_id, region_id) VALUES (5, 1);
INSERT INTO `Company Region` (company_id, region_id) VALUES (5, 8);
INSERT INTO `Company Region` (company_id, region_id) VALUES (5, 5);

-- Payroll Compliance table inserts
INSERT INTO `Payroll Compliance` (region_id, type, description, implementation_date) VALUES (5, 'Workers Compensation', 'For injured workers', '2000-5-2');
INSERT INTO `Payroll Compliance` (region_id, type, description, implementation_date) VALUES (2, 'Unemployment Insurance', 'Suplement unemployeed workers pay', '1995-3-12');
INSERT INTO `Payroll Compliance` (region_id, type, description, implementation_date) VALUES (3, 'Social Security', 'Payouts for the elderly', '1980-10-5');
INSERT INTO `Payroll Compliance` (region_id, type, description, implementation_date) VALUES (1, 'Medicare', 'Medical compensation', '2002-8-16');
INSERT INTO `Payroll Compliance` (region_id, type, description, implementation_date) VALUES (3, 'Medicade', 'Compensation for drugs', '1998-11-15');

-- Company Compliances table inserts
INSERT INTO `Company Compliances` (company_id, payroll_compliance_id) VALUES (5, 2);
INSERT INTO `Company Compliances` (company_id, payroll_compliance_id) VALUES (3, 3);
INSERT INTO `Company Compliances` (company_id, payroll_compliance_id) VALUES (1, 5);
INSERT INTO `Company Compliances` (company_id, payroll_compliance_id) VALUES (2, 4);
INSERT INTO `Company Compliances` (company_id, payroll_compliance_id) VALUES (4, 1);

-- Job Title table inserts
INSERT INTO `Job Title` (name, description) VALUES ('Administrative Assistant', 'Answers phones and does bookkeeping');
INSERT INTO `Job Title` (name, description) VALUES ('Executive Assistant', 'Arranges meeting and sets travel plans');
INSERT INTO `Job Title` (name, description) VALUES ('File Clerk', 'Develops organized filing systems');
INSERT INTO `Job Title` (name, description) VALUES ('Carpenter', 'Constructs small buildings');
INSERT INTO `Job Title` (name, description) VALUES ('Heavy Equipment Operator', 'Specializes in operating heavy machinery');
INSERT INTO `Job Title` (name, description) VALUES ('Sales Manager', 'Manages sales');
INSERT INTO `Job Title` (name, description) VALUES ('Account Manager', 'Manages accounts');
INSERT INTO `Job Title` (name, description) VALUES ('Data Entry', 'Enter data');
INSERT INTO `Job Title` (name, description) VALUES ('SQL Developer', 'Develops with SQL');
INSERT INTO `Job Title` (name, description) VALUES ('IT Professional', 'Sets up people laptops');

-- Employee Job Titles table inserts
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (1, 1);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (2, 3);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (3, 5);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (4, 2);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (4, 4);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (15, 6);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (16, 7);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (17, 8);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (18, 9);
INSERT INTO `Employee Job Titles` (employee_id, job_title_id) VALUES (19, 10);

-- Employee Benefits table inserts
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (3, 5);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (1, 3);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (2, 4);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (5, 1);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (4, 2);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (15, 6);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (16, 7);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (17, 8);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (18, 9);
INSERT INTO `Employee Benefits` (employee_id, benefit_id) VALUES (19, 10);

-- Standard Deduction table inserts
INSERT INTO `Standard Deduction` (type, description, cost) VALUES ('Social Security', 'Mandated payin to late age financial security', 100.23);
INSERT INTO `Standard Deduction` (type, description, cost) VALUES ('Court-Ordered Garnishment', 'Monetary rebursment as decided by a court', 566.72);
INSERT INTO `Standard Deduction` (type, description, cost) VALUES ('Federal Income Tax', 'Tax payout to the federal governement', 987.24);
INSERT INTO `Standard Deduction` (type, description, cost) VALUES ('Medicare', 'Payout to maintain medicare', 67.34);
INSERT INTO `Standard Deduction` (type, description, cost) VALUES ('State Income Tax', 'Tax payout to the state', 112.49);

-- Employee Standard Deductions table inserts
INSERT INTO `Employee Standard Deductions` (employee_id, standard_deduction_id) VALUES (4, 2);
INSERT INTO `Employee Standard Deductions` (employee_id, standard_deduction_id) VALUES (1, 1);
INSERT INTO `Employee Standard Deductions` (employee_id, standard_deduction_id) VALUES (3, 1);
INSERT INTO `Employee Standard Deductions` (employee_id, standard_deduction_id) VALUES (2, 5);
INSERT INTO `Employee Standard Deductions` (employee_id, standard_deduction_id) VALUES (4, 5);

-- Previous Employee table inserts
INSERT INTO `Previous Employee` (ssn, leave_date, exit_description) VALUES (979676465, NOW(), "Resigned");
INSERT INTO `Previous Employee` (ssn, leave_date, exit_description) VALUES (872378246, '2021-9-4', "Fired for insubordination");
INSERT INTO `Previous Employee` (ssn, leave_date, exit_description) VALUES (232874237, '2020-2-12', "Let go due to department shutting down");
INSERT INTO `Previous Employee` (ssn, leave_date, exit_description) VALUES (923869284, '2015-3-23', "Insubordination");
INSERT INTO `Previous Employee` (ssn, leave_date, exit_description) VALUES (120939269, '2019-10-8', "Unknown");

-- Manager table inserts
INSERT INTO Manager (employee_id, man_start_date, man_role) VALUES (2, '2020-7-23', 'Head manager for department A');
INSERT INTO Manager (employee_id, man_start_date, man_role) VALUES (1, '2019-4-10', 'Assistant manager for department B');
INSERT INTO Manager (employee_id, man_start_date, man_role) VALUES (5, '2021-3-22', 'Hiring manager for department C');

-- Department table inserts
INSERT INTO Department (company_id, name, description) VALUES (5, 'Payroll department', 'Handles employees payroll');
INSERT INTO Department (company_id, name, description) VALUES (2, 'Production department', 'Produces the products');
INSERT INTO Department (company_id, name, description) VALUES (1, 'Billing department', 'Handles customer billing');
INSERT INTO Department (company_id, name, description) VALUES (3, 'Maintenance department', 'Maintains and cleans building');
INSERT INTO Department (company_id, name, description) VALUES (2, 'Shipping department', 'Prepares product to be shipped');
INSERT INTO Department (company_id, name, description) VALUES (1, 'Maintenance department', 'Maintains and cleans building');
INSERT INTO Department (company_id, name, description) VALUES (4, 'Production department', 'Produces the products');
INSERT INTO Department (company_id, name, description) VALUES (4, 'Billing department', 'Handles customer billing');
INSERT INTO Department (company_id, name, description) VALUES (5, 'Shipping department', 'Prepares product to be shipped');

-- Managing in Departments table inserts
INSERT INTO `Managing in Departments` (manager_id, depart_id) VALUES (1, 3);
INSERT INTO `Managing in Departments` (manager_id, depart_id) VALUES (1, 5);
INSERT INTO `Managing in Departments` (manager_id, depart_id) VALUES (2, 2);

-- Employees in Departments table inserts
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (1, 5);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (2, 3);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (4, 2);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (3, 1);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (3, 4);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (7, 3);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (8, 6);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (9, 2);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (10, 5);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (11, 7);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (12, 9);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (13, 1);
INSERT INTO `Employees in Departments` (employee_id, depart_id) VALUES (14, 8);

-- Address table inserts
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (346398787, '534 Lawton St', 'San Francisco', 'WA', 94122);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (326847959, '8621 Laird St', 'Bowling Green', 'KY', 95363);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (979676465, '183 N Commercial St', 'Glenns Ferry', 'ID', 83623);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (658698890, '410 Circus Ave', 'Columbia', 'KY', 65201);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (123986349, '325 E Water St', 'Dallas', 'TX', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (746837246, '323 E Water St', 'Syracuse', 'CA', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939270, '325 E Water St', 'Tacoma', 'WA', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939271, '325 E Water St', 'Tacoma', 'WA', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939272, '325 E Water St', 'San Jose', 'CA', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939273, '325 E Water St', 'San Jose', 'CA', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939274, '325 E Water St', 'Bowling Green', 'KY', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939275, '325 E Water St', 'Dallas', 'TX', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939276, '325 E Water St', 'Dallas', 'TX', 13202);
INSERT INTO Address (ssn, street_address, city, state, zip_code) VALUE (120939277, '325 E Water St', 'Bowling Green', 'KY', 13202);

-- Phone Number table inserts
INSERT INTO `Phone Number` (ssn, country_code, area_code, telephone_number) VALUES (346398787, 1, 523, 6723920);
INSERT INTO `Phone Number` (ssn, country_code, area_code, telephone_number) VALUES (326847959, 1, 234, 3472659);
INSERT INTO `Phone Number` (ssn, country_code, area_code, telephone_number) VALUES (979676465, 1, 456, 3299884);
INSERT INTO `Phone Number` (ssn, country_code, area_code, telephone_number) VALUES (658698890, 1, 375, 5657668);
INSERT INTO `Phone Number` (ssn, country_code, area_code, telephone_number) VALUES (123986349, 1, 239, 8755632);

-- Regional Standard Deductions table inserts
INSERT INTO `Regional Standard Deductions` (standard_deduction_id, region_id) VALUES (3, 2);
INSERT INTO `Regional Standard Deductions` (standard_deduction_id, region_id) VALUES (4, 4);
INSERT INTO `Regional Standard Deductions` (standard_deduction_id, region_id) VALUES (1, 2);
INSERT INTO `Regional Standard Deductions` (standard_deduction_id, region_id) VALUES (5, 1);
INSERT INTO `Regional Standard Deductions` (standard_deduction_id, region_id) VALUES (3, 3);

-- Time Worked table inserts
INSERT INTO `Time Worked` (ssn, company_id, start_date, end_date, start_time, end_time) VALUES (346398787, 2, '2020-3-2', '2020-3-2', '083000', '170000');
INSERT INTO `Time Worked` (ssn, company_id, start_date, end_date, start_time, end_time) VALUES (326847959, 3, '2020-4-12', '2020-4-14', '090000', '200000');
INSERT INTO `Time Worked` (ssn, company_id, start_date, end_date, start_time, end_time) VALUES (979676465, 5, '2020-6-18', '2020-6-18', '100000', '140000');
INSERT INTO `Time Worked` (ssn, company_id, start_date, end_date, start_time, end_time) VALUES (658698890, 1, '2021-9-16', '2021-9-20', '050000', '060000');
INSERT INTO `Time Worked` (ssn, company_id, start_date, end_date, start_time, end_time) VALUES (123986349, 4, '2015-12-12', '2015-12-12', '130000', '143000');

-- Hourly Employee table inserts
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (1, 16.00, '2020-3-9');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (4, 32.50, '2021-9-12');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (6, 67.21, '2020-2-22');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (7, 19.00, '2003-4-23');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (8, 17.50, '2016-2-12');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (9, 22.22, '2014-6-9');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (10, 10.02, '2018-11-8');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (11, 7.25, '2020-8-11');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (12, 7.50, '2016-7-12');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (13, 45.12, '2018-4-21');
INSERT INTO `Hourly Employee` (employee_id, hourly_wage, wage_last_changed) VALUES (14, 38.33, '2021-1-7');

-- Salary Employee table inserts
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (2, 60000, '2019-3-15');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (3, 134000, '2021-5-4');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (5, 111000, '2020-12-14');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (15, 43000, '2016-4-3');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (16, 78500, '2013-7-16');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (17, 90900, '2020-9-22');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (18, 23000, '2014-2-25');
INSERT INTO `Salary Employee` (employee_id, salary_pay, salary_last_changed) VALUES (19, 57525, '2015-5-6');

-- Employee Pay table inserts
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (346398787, 3, 5672.32, '2020-5-2');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (346398787, 3, 998.34, '2021-4-21');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (346398787, 3, 7588.24, '2019-6-3');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (346398787, 3, 2596.95, '2018-12-22');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (346398787, 3, 3843.80, '2019-3-14');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (326847959, 2, 436.18, '2019-3-12');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (326847959, 2, 6547.10, '2018-6-22');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (326847959, 2, 1442.19, '2020-8-1');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (326847959, 2, 321.31, '2021-2-3');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (326847959, 2, 3516.63, '2019-12-11');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (326847959, 2, 349.91, '2019-3-18');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (658698890, 1, 5768.44, '2020-6-1');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (658698890, 1, 2563.71, '2018-8-9');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (658698890, 1, 4737.31, '2019-11-23');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (658698890, 1, 113.81, '2020-2-27');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (658698890, 1, 2309.60, '2021-7-11');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (123986349, 5, 1243.47, '2019-6-16');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (123986349, 5, 532.64, '2018-8-3');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (123986349, 5, 7853.49, '2018-12-29');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (123986349, 5, 87.58, '2021-1-22');
INSERT INTO `Employee Pay` (ssn, company_id, amount, date) VALUES (123986349, 5, 230.00, '2020-3-18');

-- Payroll Payment Methods rable inserts
INSERT INTO `Payroll Payment Methods` (employee_pay_id, pay_method_id) VALUES (3, 4);
INSERT INTO `Payroll Payment Methods` (employee_pay_id, pay_method_id) VALUES (1, 5);
INSERT INTO `Payroll Payment Methods` (employee_pay_id, pay_method_id) VALUES (2, 3);
INSERT INTO `Payroll Payment Methods` (employee_pay_id, pay_method_id) VALUES (1, 2);
INSERT INTO `Payroll Payment Methods` (employee_pay_id, pay_method_id) VALUES (4, 1);

-- Check table inserts
INSERT INTO `Check` (pay_method_id, check_number, bank_name, signed_by, account_number) VALUES (1, 1423, 'Bank of America', 'Ted Gomez', 473498231897);
INSERT INTO `Check` (pay_method_id, check_number, bank_name, signed_by, account_number) VALUES (3, 7537, 'Chase', 'Romeo Horton', 249249857342);
INSERT INTO `Check` (pay_method_id, check_number, bank_name, signed_by, account_number) VALUES (1, 437, 'Capitol One', 'Ashanti Carr', 349857732984);
INSERT INTO `Check` (pay_method_id, check_number, bank_name, signed_by, account_number) VALUES (3, 8654, 'Wells Fargo', 'Calista Tait', 309450395809);
INSERT INTO `Check` (pay_method_id, check_number, bank_name, signed_by, account_number) VALUES (4, 245, 'Union', 'Alaina Lin', 879862472304);

-- Direct Deposit table inserts
INSERT INTO `Direct Deposit` (pay_method_id, bank_name, account_number, routing_number) VALUES (2, 'Bank of America', 394257983470, 234763487);
INSERT INTO `Direct Deposit` (pay_method_id, bank_name, account_number, routing_number) VALUES (5, 'Chase Bank', 874587382347, 230487398);
INSERT INTO `Direct Deposit` (pay_method_id, bank_name, account_number, routing_number) VALUES (5, 'HSBC Bank', 394853984798, 464564456);
INSERT INTO `Direct Deposit` (pay_method_id, bank_name, account_number, routing_number) VALUES (2, 'US Bank', 192385734574, 125546687);
INSERT INTO `Direct Deposit` (pay_method_id, bank_name, account_number, routing_number) VALUES (5, 'First Republic Bank', 870779866987, 863434675);

-- History table inserts
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (346398787, 2, 'Wage History', '2020-5-3', '2021-6-3');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (346398787, 1, 'Benefit History', '2019-3-20', '2021-9-10');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (326847959, 5, 'Benefit History', '2015-4-6', '2018-9-22');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (872378246, 3, 'Wage History', '2021-2-16', '2021-9-4');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (123986349, 4, 'Benefit History', '2018-3-14', '2019-3-20');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (934534587, 2, 'Wage History', '2019-12-24', '2021-4-12');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (746837246, 4, 'Benefit History', '2018-3-14', '2019-3-20');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (346398787, 4, 'Benefit History', '2018-3-14', '2019-3-20');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (326847959, 4, 'Benefit History', '2018-3-14', '2019-3-20');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (123986349, 4, 'Benefit History', '2018-3-14', '2019-3-20');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (746837246, 4, 'Benefit History', '2018-3-14', '2019-3-20');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (979676465, 2, 'Wage History', '2015-4-12', NOW());
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (232874237, 3, 'Wage History', '2018-2-22', '2020-2-12');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (923869284, 5, 'Wage History', '2014-2-15', '2015-3-23');
INSERT INTO `History` (ssn, company_id, isa_type, starting_date, ending_date) VALUES (120939269, 1, 'Wage History', '2017-1-29', '2019-10-8');

-- Wage History table inserts
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (1, 'Hourly', 13.42);
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (4, 'Salary', 45673.21);
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (6, 'Hourly', 54.33);
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (12, 'Salary', 83832.02);
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (13, 'Hourly', 12.25);
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (14, 'Salary', 110974.00);
INSERT INTO `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (15, 'Hourly', 34.11);

-- Benefit History table inserts
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (2, "Medical", "Covering minimal medical", 320.24);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (3, "Medical", "Gold Coverage", 999.98);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (5, "Medical", "High Deductable", 609.44);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (7, "Medical", "Doctor Office Visits Only", 120.12);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (8, "Dental", "Full dental coverage", 87.32);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (9, "Dental", "Teeth cleaning coverage", 21.11);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (10, "Dental", "Full dental coverage", 90.12);
INSERT INTO `Benefit History` (hist_id, type_of_benefit, benefit_description, deduction_amount) VALUES (11, "Dental", "Teeth cleaning coverage", 44.01);

-- Used Paid Time Off table inserts
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (346398787, 3, 'Vacation', 'Two weeks taken', '2021-5-2');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (326847959, 5, 'Sick Leave', 'Flu', '2019-4-12');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (123986349, 2, 'Vacation', NULL, '2016-3-21');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (658698890, 1, 'Vacation', NULL, '2021-1-2');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (872378246, 4, 'Sick Leave', 'Surgery', '2019-12-4');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (346398787, 1, 'Sick Leave', 'Unknown', '2019-5-2');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (326847959, 4, 'Sick Leave', 'Family Emergeny', '2020-1-12');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (658698890, 4, 'Sick Leave', 'Doctors Note', '2021-12-5');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (123986349, 5, 'Sick Leave', 'Unknown', '2018-3-2');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (746837246, 2, 'Sick Leave', 'Covid', '2019-8-23');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (346398787, 1, 'Sick Leave', 'Unknown', '2018-1-2');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (658698890, 4, 'Sick Leave', 'Doctors Note', '2020-11-21');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (746837246, 2, 'Sick Leave', 'Covid', '2020-6-11');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (746837246, 2, 'Sick Leave', 'Covid', '2019-9-12');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (746837246, 2, 'Sick Leave', 'Covid', '2018-3-11');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (123986349, 5, 'Sick Leave', 'Unknown', '2020-1-12');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (123986349, 5, 'Sick Leave', 'Unknown', '2021-6-12');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (123986349, 5, 'Sick Leave', 'Unknown', '2019-8-22');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (658698890, 4, 'Sick Leave', 'Doctors Note', '2019-9-19');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (326847959, 4, 'Sick Leave', 'Family Emergeny', '2020-12-17');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (326847959, 4, 'Sick Leave', 'Family Emergeny', '2021-8-1');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (326847959, 4, 'Sick Leave', 'Family Emergeny', '2020-10-25');
INSERT INTO `Used Paid Time Off` (ssn, company_id, type, description, date) VALUES (326847959, 4, 'Sick Leave', 'Family Emergeny', '2018-8-24');

-- Company Tax table inserts
INSERT INTO `Company Tax` (company_id, region_id, type, description, due_date, dollar_amount, paid) VALUES (3, 2, 'Payroll Taxes', 'Payroll taxes for 2020', '2021-1-12', 23456.98, 0);
INSERT INTO `Company Tax` (company_id, region_id, type, description, due_date, dollar_amount, paid) VALUES (4, 1, 'Unemployment Insurance', 'Unemployment insurance coverage', '2020-5-3', 65464.23, 1);
INSERT INTO `Company Tax` (company_id, region_id, type, description, due_date, dollar_amount, paid) VALUES (1, 5, 'Income Tax', NULL, '2020-9-12', 187497.32, 0);

-- Employee Tax Document table inserts
INSERT INTO `Employee Tax Document` (ssn, company_id, form_type, description, date_distributed) VALUES (346398787, 2, 'W2', '2020 W2', '2021-1-12');
INSERT INTO `Employee Tax Document` (ssn, company_id, form_type, description, date_distributed) VALUES (979676465, 1, 'W2', '2019 W2', '2020-1-6');
INSERT INTO `Employee Tax Document` (ssn, company_id, form_type, description, date_distributed) VALUES (658698890, 4, 'W2', '2012 W2', '2013-1-23');
INSERT INTO `Employee Tax Document` (ssn, company_id, form_type, description, date_distributed) VALUES (123986349, 3, 'W2', '2013 W2', '2014-1-14');
INSERT INTO `Employee Tax Document` (ssn, company_id, form_type, description, date_distributed) VALUES (746837246, 4, 'W2', '2019 W2', '2020-1-11');

-- Email Support table inserts
INSERT INTO `Email Support` (topic, department) VALUES ('Password', 'Data Management');
INSERT INTO `Email Support` (topic, department) VALUES ('Information', 'Data Management');
INSERT INTO `Email Support` (topic, department) VALUES ('Technical', 'Technical Assistance');
INSERT INTO `Email Support` (topic, department) VALUES ('Network', 'Technical Assistance');
INSERT INTO `Email Support` (topic, department) VALUES ('Payment', 'Billing');

-- Email Support Request table inserts
INSERT INTO `Email Support Request` (email_supp_id, user_id, subject, content, contact, date, time, email) VALUES (1, 3, 'I forgot my password', 'I keep trying my password but it isnt working', 'Ivy Meyers', '2020-5-23', 053200, 'pas@jordanmail.org');
INSERT INTO `Email Support Request` (email_supp_id, user_id, subject, content, contact, date, time, email) VALUES (3, 4, 'App wont open', 'Everytime I try to open the app I get a network error', 'Jax Lowry', '2021-2-1', 120130, 'watts@gmail.com');
INSERT INTO `Email Support Request` (email_supp_id, user_id, subject, content, contact, date, time, email) VALUES (5, 2, 'I was overcharged', 'I checked my account and I was charged double the normal amount', 'Rebeca Griffith', '2019-12-2', 093000, 'billmail@gmail.com'); 

-- Live Chat Support table inserts
INSERT INTO `Live Chat Support` (topic, department) VALUES ('Account Issues', 'Data Management');
INSERT INTO `Live Chat Support` (topic, department) VALUES ('Payment', 'Billing');
INSERT INTO `Live Chat Support` (topic, department) VALUES ('Data Lose', 'Data Management');
INSERT INTO `Live Chat Support` (topic, department) VALUES ('App Usage', 'Technical Assistance');
INSERT INTO `Live Chat Support` (topic, department) VALUES ('Connection', 'Technical Assistance');

-- Live Chat Support Request table insert
INSERT INTO `Live Chat Support Request` (live_chat_supp_id, user_id, subject, date, start_time, end_time, agent) VALUES (1, 5, 'Account doesnt exist', '2021-9-8', 093200, 100200, 'Lilli Mcintosh');
INSERT INTO `Live Chat Support Request` (live_chat_supp_id, user_id, subject, date, start_time, end_time, agent) VALUES (3, 1, 'My company doesnt show up', '2021-2-14', 121300, 142200, 'Abigail Mullen');
INSERT INTO `Live Chat Support Request` (live_chat_supp_id, user_id, subject, date, start_time, end_time, agent) VALUES (4, 2, 'How do I delete offered benefits', '2020-11-13', 131500, 160900, 'Marek Valenzuela');
INSERT INTO `Live Chat Support Request` (live_chat_supp_id, user_id, subject, date, start_time, end_time, agent) VALUES (2, 5, 'Application just opens a black window', '2016-2-14', 093200, 100200, 'Harry Boss');
INSERT INTO `Live Chat Support Request` (live_chat_supp_id, user_id, subject, date, start_time, end_time, agent) VALUES (3, 1, 'Where is the icon?', '2019-3-14', 121300, 142200, 'Ryan Grace');
INSERT INTO `Live Chat Support Request` (live_chat_supp_id, user_id, subject, date, start_time, end_time, agent) VALUES (5, 2, 'My computer wont turn on', '2015-4-12', 131500, 160900, 'Stacy Parks');

-- Report Option table inserts
INSERT INTO `Report Option` (type, design, color_scheme) VALUES ('Employee Pay Report', 'contemporary', 'red on yellow');
INSERT INTO `Report Option` (type, design, color_scheme) VALUES ('Payroll Tax Payments Report', 'basic', 'black on white');
INSERT INTO `Report Option` (type, design, color_scheme) VALUES ('Compliance Updates Report', 'classic', 'white on grey');

-- Report table inserts
INSERT INTO `Report` (company_id, report_option_id, title, author, description, date) VALUE (3, 1, '2020 Employee Pay Report', 'Pia Tait', 'A report of the pay for all employees in the year of 2020', '2021-2-23');
INSERT INTO `Report` (company_id, report_option_id, title, author, description, date) VALUE (1, 2, '2019 Payroll Tax Report', 'Edna Jordan', '2019 payroll tax expenses', '2020-1-30');
INSERT INTO `Report` (company_id, report_option_id, title, author, description, date) VALUE (4, 3, 'Compliance updates for Feb 2018', 'Wilson Mckinney', 'Updated state compliances made in early 2018', '2018-3-15');








