const DB_DATABASE_NAME = process.env['DB_DATABASE_NAME']
const DB_PASSWORD = process.env['DB_PASSWORD']
const DB_USER = process.env['DB_USER']
const DB_HOST = process.env['DB_HOST']
const PrettyTable = require('./prettytable.js');
const mysql = require('mysql');
const { CommandInteractionOptionResolver } = require('discord.js');
require('dotenv').config()

const validateString = (string) => {
  for(var i = 0; i < string.length; i++) {
    if(!(string.charCodeAt(i) === 32 || (string.charCodeAt(i) > 47 && string.charCodeAt(i) < 58) 
      || (string.charCodeAt(i) > 64 && string.charCodeAt(i) < 91) 
      || (string.charCodeAt(i) > 96 && string.charCodeAt(i) < 123))) {
        return false;
      }
  }
  return true;
}

var PMSDatabase = function () {
  this.version = '0.0.1';
};

PMSDatabase.prototype.test = () => {
  console.log("Hello from PMS");
}

PMSDatabase.prototype.companies = () => new Promise((resolve, reject) => {
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);
    con.query("SELECT Company.name AS \"Company Name\" FROM Company", function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.regions = () => new Promise((resolve, reject) => {
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);
    con.query(`SELECT Region.name AS "Region Name", Region.type AS "Region Type" FROM Region`, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.employeeHighPayBetweenYears = (yearX, yearY) => new Promise((resolve, reject) => {
  if(yearX < 1000 || yearX > 9999 || yearY < 1000 || yearY > 9999) {
    resolve("Please use a 4 digit number for the years.");
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const query =
      `SELECT Person.first_name AS \"Employee First Name\", Person.last_name AS \"Employee Last Name\", ` +
      `Company.name AS \"Company Name\", \`Employee Pay\`.amount AS \"Employee Pay\" ` +
      `FROM Person ` +
      `JOIN Employee ON Person.ssn = Employee.ssn ` +
      `JOIN \`Company Employees\` ON Employee.employee_id = \`Company Employees\`.employee_id ` +
      `JOIN Company ON \`Company Employees\`.company_id = Company.company_id ` +
      `JOIN \`Employee Pay\` ON \`Employee Pay\`.ssn = Person.ssn ` +
      `WHERE \`Employee Pay\`.date BETWEEN \'${yearX}-12-31\' AND \'${yearY}-1-1\' ` +
      `HAVING (SELECT AVG(amount) FROM \`Employee Pay\` WHERE \`Employee Pay\`.date BETWEEN \'${yearX}-12-31\' AND \'${yearY}-1-1\') < \`Employee Pay\` `

    con.query(query, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.employeeUsedSickDayOffInYear = (year) => new Promise((resolve, reject) => {
  if(year < 1000 || year > 9999) {
    resolve("Please use a 4 digit number for the year.");
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT ANY_VALUE(Person.first_name) AS "Employee First Name", ANY_VALUE(Person.last_name) AS "Employee Last Name", \n` +
      `ANY_VALUE(Company.name) AS "Company Name", ANY_VALUE(Address.state) AS "State", \n` +
      `COUNT(\`Used Paid Time Off\`.type) AS "Sick Days Used" \n` +
      `FROM Person \n` +
      `JOIN Employee ON Person.ssn = Employee.ssn \n` +
      `JOIN \`Company Employees\` ON Employee.employee_id = \`Company Employees\`.employee_id \n` +
      `JOIN Company ON \`Company Employees\`.company_id = Company.company_id \n` +
      `JOIN \`Used Paid Time Off\` ON Person.ssn = \`Used Paid Time Off\`.ssn \n` +
      `JOIN \`Address\` ON Person.ssn = \`Address\`.ssn \n` +
      `JOIN \`Company Region\` ON Company.company_id = \`Company Region\`.company_id \n` +
      `JOIN \`Region\` ON \`Company Region\`.region_id = \`Region\`.region_id \n` +
      `WHERE \`Used Paid Time Off\`.date BETWEEN '${year-1}-12-31' AND '${year+1}-1-1' \n` +
      `AND \`Used Paid Time Off\`.type = "Sick Leave" \n` +
      `AND Region.type = "State" \n` +
      `AND Region.name = Address.state \n` +
      `GROUP BY Person.ssn`;

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.accountsLiveChatSupportReqs = (year, char) => new Promise((resolve, reject) => {
  var validChar = char;
  if(year < 1000 || year > 9999) {
    resolve("Please use a 4 digit number for the year.");
  } else if(validChar.length !== 1) {
    validChar = validChar.charAt(0);
  } else if(!validateString(validChar)) {
    resolve("Please only use letters and numbers.");
    validChar = ' ';
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT User.first_name AS "First Name", User.last_name AS "Last Name", User.email AS "E-Mail", \n` +
      `DATE_FORMAT(Account.created, '%m/%d/%Y') AS "Account Creation Date", \`Live Chat Support Request\`.subject AS "Live Chat Support Request Subject" \n` +
      `FROM User \n` +
      `JOIN Account ON Account.account_id = User.account_id \n` +
      `JOIN \`Live Chat Support Request\` ON \`Live Chat Support Request\`.user_id = User.user_id \n` +
      `WHERE \`Live Chat Support Request\`.date < '${year}-1-1' \n` +
      `AND \`Live Chat Support Request\`.subject LIKE "${validChar}%" \n`

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.benefitCostOnEmployees = (year, amount) => new Promise((resolve, reject) => {
  if(year < 1000 || year > 9999) {
    resolve("Please use a 4 digit number for the year.");
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT Company.name AS "Company Name", \`Benefit History\`.type_of_benefit AS "Benefit Type", \n` +
      `\`Benefit History\`.deduction_amount AS "Benefit Cost", Person.first_name AS "Employee First Name",  \n` +
      `Person.last_name AS "Employee Last Name" \n` +
      `FROM Company \n` +
      `JOIN \`Company Employees\` ON Company.company_id = \`Company Employees\`.company_id \n` +
      `JOIN Employee ON \`Company Employees\`.employee_id = Employee.employee_id \n` +
      `JOIN Person ON Person.ssn = Employee.ssn \n` +
      `JOIN History ON Person.ssn = History.ssn \n` +
      `JOIN \`Benefit History\` ON History.hist_id = \`Benefit History\`.hist_id \n` +
      `WHERE Employee.start_work_date < "${year}-1-1" \n` +
      `AND \`Benefit History\`.deduction_amount > ${amount} \n`

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.previousEmployeePay = (char) => new Promise((resolve, reject) => {
  var validChar = char;
  if(validChar.length !== 1) {
    validChar = validChar.charAt(0);
  } else if(!validateString(validChar)) {
    resolve("Please only use letters and numbers.");
    validChar = ' ';
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT Person.first_name AS "First Name", Person.last_name AS "Last Name",  \`Wage History\`.type_of_wage AS "Wage Type", \`Wage History\`.wage_amount AS "Wage Amount" \n ` +
      `FROM Person \n ` +
      `JOIN \`Previous Employee\` ON Person.ssn = \`Previous Employee\`.ssn \n ` +
      `JOIN History ON History.ssn = Person.ssn \n ` +
      `JOIN \`Wage History\` ON History.hist_id = \`Wage History\`.hist_id \n ` +
      `WHERE Person.last_name LIKE "${validChar}%" \n ` 

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.hourlyInDepByCompCityLoc = (company, amount) => new Promise((resolve, reject) => {
  var validCompany = company;
  if(!validateString(validCompany)) {
    resolve("Please only use letters and numbers.");
    validCompany = '';
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT Company.name AS "Company Name", Department.name AS "Department Name", Person.first_name AS "First Name", \n` +
      `Person.last_name AS "Last Name", \`Hourly Employee\`.hourly_wage AS "Hourly Wage", Region.name AS "City" \n` +
      `FROM Company \n` +
      `JOIN \`Company Employees\` ON Company.company_id = \`Company Employees\`.company_id \n` +
      `JOIN Employee ON \`Company Employees\`.employee_id = Employee.employee_id \n` +
      `JOIN \`Employees in Departments\` ON Employee.employee_id = \`Employees in Departments\`.employee_id \n` +
      `JOIN Department ON \`Employees in Departments\`.depart_id = Department.depart_id AND Company.company_id = Department.company_id \n` +
      `JOIN Person ON Employee.ssn = Person.ssn \n` +
      `JOIN \`Hourly Employee\` ON Employee.employee_id = \`Hourly Employee\`.employee_id \n` +
      `JOIN Address ON Person.ssn = Address.ssn \n` +
      `JOIN \`Company Region\` ON Company.company_id = \`Company Region\`.company_id \n` +
      `JOIN Region ON \`Company Region\`.region_id = Region.region_id \n` +
      `WHERE \`Hourly Employee\`.hourly_wage > ${amount} \n` +
      `AND Region.type = "City" \n` +
      `AND Company.name = "${validCompany}" \n` +
      `AND Address.city = Region.name  \n`

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.salaryEmployeeBenefits = (cost, char) => new Promise((resolve, reject) => {
  var validChar = char;
  if(validChar.length !== 1) {
    validChar = validChar.charAt(0);
  } else if(!validateString(validChar)) {
    resolve("Please only use letters and numbers.");
    validChar = ' ';
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT ANY_VALUE(Person.first_name) AS "First Name", ANY_VALUE(Person.last_name) AS "Last Name", \n` +
      `ANY_VALUE(\`Salary Employee\`.salary_pay) AS "Salary Pay", ANY_VALUE(Company.name) AS "Company Name",  \n` +
      `ANY_VALUE(Benefit.type) AS "Benefit Type", ANY_VALUE(Benefit.cost) AS "Benefit Cost" \n` +
      `FROM Person \n` +
      `JOIN Employee ON Person.ssn = Employee.ssn \n` +
      `JOIN \`Salary Employee\` ON Employee.employee_id = \`Salary Employee\`.employee_id \n` +
      `JOIN \`Company Employees\` ON Employee.employee_id = \`Company Employees\`.employee_id \n` +
      `JOIN Company ON \`Company Employees\`.company_id = Company.company_id \n` +
      `JOIN \`Employee Benefits\` ON Employee.employee_id = \`Employee Benefits\`.employee_id \n` +
      `JOIN Benefit ON \`Employee Benefits\`.benefit_id = Benefit.benefit_id \n` +
      `WHERE Benefit.cost < ${cost} \n` +
      `AND Person.last_name LIKE "${validChar}%" \n` +
      `GROUP BY Person.ssn \n`

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.salaryEmployeeJobTitles = (company) => new Promise((resolve, reject) => {
  var validCompany = company;
  if(!validateString(company)) {
    resolve("Please only use letters and numbers.");
    validCompany = '';
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);

    const myQuery =
      `SELECT \`Job Title\`.name AS "Job Title", Person.first_name AS "First Name", Person.last_name AS "Last Name", \n` +
      `\`Salary Employee\`.salary_pay AS "Salary Pay", Company.name AS "Company Name" \n` +
      `FROM Person \n` +
      `JOIN Employee ON Person.ssn = Employee.ssn \n` +
      `JOIN \`Salary Employee\` ON Employee.employee_id = \`Salary Employee\`.employee_id \n` +
      `JOIN \`Company Employees\` ON Employee.employee_id = \`Company Employees\`.employee_id \n` +
      `JOIN Company ON \`Company Employees\`.company_id = Company.company_id \n` +
      `JOIN \`Employee Job Titles\` ON Employee.employee_id = \`Employee Job Titles\`.employee_id \n` +
      `JOIN \`Job Title\` ON \`Employee Job Titles\`.job_title_id = \`Job Title\`.job_title_id \n` +
      `WHERE \`Salary Employee\`.salary_pay > (SELECT AVG(\`Salary Employee\`.salary_pay) FROM \`Salary Employee\`) \n` +
      `AND Company.name = "${validCompany}" \n`

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

PMSDatabase.prototype.benefitsByRegion = (name, type) => new Promise((resolve, reject) => {
  var validName = name;
  var validType = type;
  if(!validateString(validName) || !validateString(validType)) {
    resolve("Please only use letters and numbers.");
    validName = '';
    validType = '';
  }
  var con = mysql.createConnection({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: DB_DATABASE_NAME
  });
  con.connect(function(err) {
    if (err) throw err;
    const d = new Date(Date.now());
    const timestamp = d.toString();
    console.log("Connected: " + timestamp);
    
    const myQuery =
      `SELECT Benefit.type AS "Benefit Type", Benefit.description AS "Benefit Description", \n` +
      `Company.name AS "Company Name", Region.name AS "Region Name", Region.type AS "Region Type" \n` +
      `FROM Benefit \n` +
      `JOIN \`Company Offered Benefits\` ON Benefit.benefit_id = \`Company Offered Benefits\`.benefit_id \n` +
      `JOIN Company ON \`Company Offered Benefits\`.company_id = Company.company_id \n` +
      `JOIN \`Company Region\` ON Company.company_id = \`Company Region\`.company_id \n` +
      `JOIN Region ON \`Company Region\`.region_id = Region.region_id \n` +
      `WHERE Region.name = "${validName}" AND Region.type = "${validType}" \n`

    con.query(myQuery, function (err, result, fields) {
      if (err) throw err;
      pt = new PrettyTable();
      pt.convertArrayOfObjects(result);
      returnTable = pt.toString();
      if(returnTable.length === 0) {
        returnTable = "No entires where found."
      }
      const styledReturntable = "\`\`\` \n" + returnTable + " \`\`\`"
      con.end();
      resolve(styledReturntable);
    });
  });
});

module.exports = PMSDatabase;