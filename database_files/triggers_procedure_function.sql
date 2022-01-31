-- Script name: triggers_procedure_function.sql
-- Author:      Bryan Fetner
-- Purpose:     creating triggers, a procedure, and a function
   
-- the database intended for the triggers procedure and fucntion.
USE PayrollManagementSystemDB;

-- Triggers

-- 1. Trigger when employee is deleted from database. Create a new Previous Employee along with storing their wage into the Wage History table.
DELIMITER $$
CREATE TRIGGER ExitingEmployee BEFORE DELETE ON Employee
FOR EACH ROW BEGIN
	DECLARE employee_type VARCHAR(45);
    DECLARE company_id INT;
	DECLARE start_date DATE;
	DECLARE wage DECIMAL(65,2);
    DECLARE hist_id INT;
    SET employee_type = OLD.isa_type;
    SET company_id = (SELECT `Company Employees`.company_id 
						FROM `Company Employees`
                        WHERE `Company Employees`.employee_id = OLD.employee_id);
    INSERT INTO `Previous Employee` (ssn, leave_date) VALUES (OLD.ssn, NOW());
	UPDATE Person SET isa_type = 'Previous Employee' WHERE ssn = OLD.ssn;
    IF employee_type = "Hourly Employee" THEN
		SET start_date = (SELECT `Hourly Employee`.wage_last_changed
							FROM `Hourly Employee`
                            JOIN Employee ON `Hourly Employee`.employee_id = Employee.employee_id
                            WHERE Employee.ssn = OLD.ssn);
		SET wage = (SELECT `Hourly Employee`.hourly_wage 
					FROM `Hourly Employee` 
					JOIN Employee ON `Hourly Employee`.employee_id = Employee.employee_id
					WHERE Employee.ssn = OLD.ssn);
		INSERT History (ssn, company_id, isa_type, starting_date, ending_date) VALUES (OLD.ssn, company_id, 'Wage History', start_date, NOW());
		SET hist_id = LAST_INSERT_ID();
		INSERT `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (hist_id, 'Hourly', wage);
    ELSEIF employee_type = "Salary Employee" THEN
		SET start_date = (SELECT `Salary Employee`.salary_last_changed
							FROM `Salary Employee`
							JOIN Employee ON `Salary Employee`.employee_id = Employee.employee_id
							WHERE Employee.ssn = OLD.ssn);
		SET wage = (SELECT `Salary Employee`.salary_pay
					FROM `Salary Employee` 
					JOIN Employee ON `Salary Employee`.employee_id = Employee.employee_id
					WHERE Employee.ssn = OLD.ssn);
		INSERT History (ssn, company_id, isa_type, starting_date, ending_date) VALUES (OLD.ssn, company_id, 'Wage History', start_date, NOW());
		SET hist_id = LAST_INSERT_ID();
        INSERT `Wage History` (hist_id, type_of_wage, wage_amount) VALUES (hist_id, 'Salary', wage);
    END IF;
END$$
DELIMITER ;

-- 2. Trigger an Employee Pay is inserted. Compiles the time worked during a week period to determine pay.
DELIMITER $$
CREATE TRIGGER ProcessEmployeePay BEFORE INSERT ON `Employee Pay`
FOR EACH ROW BEGIN
	DECLARE c_start_date DATE;
    DECLARE c_end_date DATE;
    DECLARE c_start_time TIME;
    DECLARE c_end_time TIME;
    
	DECLARE employee_type VARCHAR(45);
    DECLARE employee_pay DECIMAL(65,2);
    
    DECLARE done INT DEFAULT FALSE;
    DECLARE cursor_times CURSOR FOR (SELECT `Time Worked`.start_date, `Time Worked`.end_date, 
		`Time Worked`.start_time, `Time Worked`.end_time FROM `Time Worked` 
        WHERE `Time Worked`.ssn = NEW.ssn 
        AND `Time Worked`.start_date > DATE_SUB(NEW.date, INTERVAL 7 DAY)
        AND `Time Worked`.end_date < NEW.date);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cursor_times;

	SET employee_pay = 0;
    SET employee_type =	(SELECT Employee.isa_type 
							FROM Employee
                            WHERE Employee.ssn = NEW.ssn);
	IF employee_type = "Hourly Employee" THEN
		loop_through_times: LOOP
			FETCH cursor_times INTO c_start_date, c_end_date, c_start_time, c_end_time;
			IF done THEN
				LEAVE loop_through_times;
			END IF;
			SET employee_pay = employee_pay + ((c_end_time - c_start_time) * 
				(SELECT `Hourly Employee`.hourly_wage 
					FROM `Hourly Employee` 
					JOIN Employee 
					ON Employee.employee_id = `Hourly Employee`.employee_id 
					WHERE Employee.ssn = NEW.ssn) / 10000);
		END LOOP;
		CLOSE cursor_times;
	ELSEIF employee_type = "Salary Employee" THEN
		loop_through_times: LOOP
			FETCH cursor_times INTO c_start_time, c_end_time, c_start_date, c_end_date;
			IF done THEN
				LEAVE loop_through_times;
			END IF;
			SET employee_pay = employee_pay + ((c_end_date - c_start_date + 1) * 
				(SELECT `Salary Employee`.salary_pay 
					FROM `Salary Employee` 
					JOIN Employee ON Employee.employee_id = `Salary Employee`.employee_id 
					WHERE Employee.ssn = NEW.ssn) / 260);
        END LOOP;
        CLOSE cursor_times;
    END IF;
    SET NEW.amount = employee_pay;
END$$
DELIMITER ;


-- Procedure

-- Find the total cost of medical benefits for a specified company.
DELIMITER $$
CREATE PROCEDURE CompanyMedicalBenefitCosts (IN company_name VARCHAR(100), OUT result DECIMAL(65,2))
BEGIN
    SELECT SUM(Benefit.cost) 
	INTO result
	FROM Benefit
	JOIN `Company Offered Benefits` ON `Company Offered Benefits`.benefit_id = Benefit.benefit_id
    JOIN Company ON Company.company_id = `Company Offered Benefits`.company_id
	WHERE Company.name = company_name
	AND Benefit.type = 'Medical';
END$$
DELIMITER ;


-- Function

-- For a specified year, find the company with the highest number of hires for that year, and return the companies name and the number hired.
DELIMITER $$
CREATE FUNCTION HighestYearsHired (year INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
	DECLARE mostHired INT;
    DECLARE companyName VARCHAR(100);
    SELECT COUNT(`Company Employees`.employee_id), Company.name INTO mostHired, companyName
	FROM Company
	JOIN `Company Employees` ON Company.company_id = `Company Employees`.company_id
	JOIN Employee ON Employee.employee_id = `Company Employees`.employee_id
	-- WHERE Employee.start_work_date BETWEEN (year-1)+'-12-31' AND (year+1)+'-1-1'
    WHERE Employee.start_work_date BETWEEN CONCAT((year-1), '-12-31') AND CONCAT((year+1), '-1-1')
	GROUP BY `Company Employees`.company_id
	ORDER BY COUNT(`Company Employees`.employee_id) DESC
	LIMIT 1;

	RETURN CONCAT('The company ', companyName, ' hired ', mostHired, ' employee(s) in the year ' , year);
END$$
DELIMITER ;












