-- Script name: inserts.sql
-- Author:      Bryan Fetner
-- Purpose:     using update and delete command to test integrity of the payroll management system database
   
-- the database used to update and delete the data.
USE PayrollManagementSystemDB;

SET SQL_SAFE_UPDATES=0;

-- 1. Testing Account table
DELETE FROM Account WHERE created = '1999-12-23';
UPDATE Account SET password = 'abcd' WHERE account_id = 2;

-- 2. Testing Device table
DELETE FROM Device WHERE device_name = 'Android Mobile';
UPDATE Device SET device_type = 'Personal Computer' WHERE device_type = 'PC';

-- 3. Testing User table
DELETE FROM User WHERE first_name = 'Billy' AND last_name = 'Goodman';
UPDATE User SET email = 'dtames@gmail.com' WHERE user_id = 4;

-- 4. Testing Session table
DELETE FROM Session WHERE user_id = NULL;
UPDATE Session SET start_time = NOW() WHERE session_id = 1;

-- 5. Testing Company table
DELETE FROM Company WHERE name = 'Brocks Wood';
UPDATE Company SET type = 'Music Publishing' WHERE name = 'Volumn';

-- 6. Testing Payment Method table
DELETE FROM `Payment Method` WHERE description = 'Wells Fargo Check';
UPDATE `Payment Method` SET description = 'Credit Union Checking' WHERE pay_method_id = 2;

-- 7. Testing Company Supported Payment Methods table
DELETE FROM `Company Supported Payment Methods` WHERE company_id = NULL OR pay_method_id = NULL;
UPDATE `Company Supported Payment Methods` SET company_id = 4 WHERE comp_pay_methods_id = 3;

-- 8. Testing Person table
DELETE FROM Person WHERE ssn = 872378246;
UPDATE Person SET first_name = 'Peter' WHERE ssn = 232874237;

-- 9. Testing Employee table
DELETE FROM Employee WHERE start_work_date < '1999-1-1';
UPDATE Employee SET vacation_days = 15 WHERE employee_id = 6;

-- 10. Testing Company Employees table
DELETE FROM `Company Employees` WHERE company_id = NULL or employee_id = NULL;
UPDATE `Company Employees` SET company_id = 3 WHERE employee_id = 3;

-- 11. Testing Benefit table
DELETE FROM Benefit WHERE type = 'Eye Care';
UPDATE Benefit SET type = 'Health' WHERE type = 'Medical';

-- 12. Testing Company Offered Benefits table
DELETE FROM `Company Offered Benefits` WHERE company_id = NULL OR benefit_id = NULL;
UPDATE `Company Offered Benefits` SET benefit_id = 4 WHERE comp_offered_bene_id = 2;

-- 13. Testing Region table
DELETE FROM Region WHERE name = 'Texas';
UPDATE Region SET type = 'County' WHERE name = 'San Francisco';

-- 14. Testing Company Region table
DELETE FROM `Company Region` WHERE company_id = NULL OR region_id = NULL;
UPDATE `Company Region` SET region_id = 1 WHERE company_id = 3;

-- 15. Testing Payroll Compliance table
DELETE FROM `Payroll Compliance` WHERE type = 'medicade';
UPDATE `Payroll Compliance` SET type = 'Workers Comp' WHERE region_id = 5;

-- 16. Testing Company Compliances table
DELETE FROM `Company Compliances` WHERE company_id = NULL OR payroll_compliance_id = NULL;
UPDATE `Company Compliances` SET payroll_compliance_id = 3 WHERE company_id = 2;

-- 17. Testing Job Title table
DELETE FROM `Job Title` WHERE name = 'Administrative Assistant';
UPDATE `Job Title` SET name = 'Heavy Machine Operator' WHERE job_title_id = 5;

-- 18. Testing Employee Job Titles table
DELETE FROM `Employee Job Titles` WHERE job_title_id = 1;
UPDATE `Employee Job Titles` SET employee_id = 5 WHERE job_title_id = 3;

-- 19. Testing Employee Benefits table
DELETE FROM `Employee Benefits` WHERE emp_bene_id = 1;
UPDATE `Employee Benefits` SET benefit_id = 2 WHERE emp_bene_id = 3;

-- 20. Testing Standard Deduction table
DELETE FROM `Standard Deduction` WHERE type = 'Medicare';
UPDATE `Standard Deduction` SET cost = 302.21 WHERE type = 'State Income Tax';

-- 21. Testing Employee Standard Deductions table
DELETE FROM `Employee Standard Deductions` WHERE emp_stand_deduct_id = 3;
UPDATE `Employee Standard Deductions` SET employee_id = 2 WHERE emp_stand_deduct_id = 2;

-- 22. Testing Previous Employee table
DELETE FROM `Previous Employee` WHERE ssn = '979676465';
UPDATE `Previous Employee` SET leave_date = '2020-2-21' WHERE pre_emp_id = 3;

-- 23. Testing Manager table
DELETE FROM Manager WHERE man_start_date = '2019-4-10';
UPDATE Manager SET man_role = 'Maintains the bathrooms' WHERE manager_id = 3;

-- 24. Testing Department table
DELETE FROM Department WHERE name = 'Maintenance department';
UPDATE Department SET company_id = 4 WHERE depart_id = 2;

-- 25. Testing Managing in Departments table
DELETE FROM `Managing in Departments` WHERE man_in_depart_id = 1;
UPDATE `Managing in Departments` SET manager_id = 3 WHERE man_in_depart_id = 2;

-- 26. Testing Employees in Departments table
DELETE FROM `Employees in Departments` WHERE emp_in_depart_id = 4;
UPDATE `Employees in Departments` SET employee_id = 5 WHERE emp_in_depart_id = 5;

-- 27. Testing Address table
DELETE FROM Address WHERE city = 'San Francisco';
UPDATE Address SET street_address = '420 Circus Ave' WHERE ssn = 658698890;

-- 28. Testing Phone Number table
DELETE FROM `Phone Number` WHERE phone_number_id = 1;
UPDATE `Phone Number` SET area_code = 324 WHERE ssn = 326847959;

-- 29. Testing Regional Standard Deductions table
DELETE FROM `Regional Standard Deductions` WHERE standard_deduction_id = 1;
UPDATE `Regional Standard Deductions` SET region_id = 2 WHERE standard_deduction_id = 5;

-- 30. Testing Time Worked table
DELETE FROM `Time Worked` WHERE company_id = 2;
UPDATE `Time Worked` SET end_time = 210000 WHERE ssn = 326847959;

-- 31. Testing Hourly Employee table
DELETE FROM `Hourly Employee` WHERE employee_id = 2;
UPDATE `Hourly Employee` SET hourly_wage = 40.25 WHERE hourly_emp_id = 3;

-- 32. Testing Salary Employee table
DELETE FROM `Salary Employee` WHERE salary_pay = 60000;
UPDATE `Salary Employee` SET salary_pay = 120000 WHERE employee_id = 5;

-- 33. Testing Employee Pay table
DELETE FROM `Employee Pay` WHERE emp_pay_id = 3;
UPDATE `Employee Pay` SET amount = 1609.99 WHERE company_id = 3;

-- 34. Testing Payroll Payment Methods table
DELETE FROM `Payroll Payment Methods` WHERE payroll_pay_methods_id = 4;
UPDATE `Payroll Payment Methods` SET employee_pay_id = 5 WHERE pay_method_id = 5;

-- 35. Testing Check table
DELETE FROM `Check` WHERE bank_name = 'Bank of America';
UPDATE `Check` SET account_number = 283746234923 WHERE check_id = 4;

-- 36. Testing `Direct Deposit` table
DELETE FROM `Direct Deposit` WHERE direct_deposit_id = 3;
UPDATE `Direct Deposit` SET pay_method_id = 3 WHERE bank_name = 'US Bank';

-- 37. Testing History table
DELETE FROM History WHERE company_id = 3;
UPDATE History SET ending_date = '2021-8-21' WHERE ssn = 346398787;

-- 38. Testing Wage History table
DELETE FROM `Wage History` WHERE wage_hist_id = 1;
UPDATE `Wage History` SET wage_amount = 60.01 WHERE hist_id = 6;

-- 39. Testing Benefit History table
DELETE FROM `Benefit History` WHERE hist_id = 5;
UPDATE `Benefit History` SET type_of_benefit = 'Medical' WHERE benefit_hist_id = 2;

-- 40. Testing Used Paid Time Off table
DELETE FROM `Used Paid Time Off` WHERE date > '2021-1-1';
UPDATE `Used Paid Time Off` SET description = 'Covid' WHERE ssn = 326847959;

-- 41. Testing Company Tax table
DELETE FROM `Company Tax` WHERE paid = 1;
UPDATE `Company Tax` SET dollar_amount = 35098.44 WHERE company_id = 3;

-- 42. Testing Employee Tax Document table
DELETE FROM `Employee Tax Document` WHERE date_distributed < '2014-1-1';
UPDATE `Employee Tax Document` SET description = '2018 W2' WHERE emp_tax_doc_id = 5;

-- 43. Testing Email Support table
DELETE FROM `Email Support` WHERE email_supp_id = 5;
UPDATE `Email Support` SET department = 'Technical Assistance' WHERE topic = 'Password';

-- 44. Testing Email Support Request table
DELETE FROM `Email Support Request` WHERE user_id = 4;
UPDATE `Email Support Request` SET date = '2020-05-25' WHERE contact = 'Ivy Meyers';

-- 45. Testing Live Chat Support table
DELETE FROM `Live Chat Support` WHERE topic = 'Data Lose';
UPDATE `Live Chat Support` SET topic = 'Account Problems' WHERE live_chat_supp_id = 1;

-- 46. Testing Live Chat Support Request table
DELETE FROM `Live Chat Support Request` WHERE user_id = NULL;
UPDATE `Live Chat Support Request` SET agent = 'Ora Gray' WHERE live_chat_supp_id = 4;

-- 47. Testing `Report Option` table
DELETE FROM `Report Option` WHERE design = 'contemporary';
UPDATE `Report Option` SET color_scheme = 'white on dark blue' WHERE type = 'Compliance Updates Report';

-- 48. Testing Report table
DELETE FROM `Report` WHERE date < '2019-12-31';
UPDATE `Report` SET title = '2020 Employee Payout Report' WHERE report_id = 1;


