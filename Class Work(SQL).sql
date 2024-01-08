--Create a new database named "CompanyDB."
create database Company;

use Company;
--Design and create two tables Employees and Departments.

--Employees table should have fields: EmployeeID (int, primary key), FirstName (varchar), LastName (varchar), DepartmentID (int, foreign key to Departments table), and Salary (decimal).
CREATE TABLE Employees (
    EmployeeID INT not null unique identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
	gender varchar,
    Salary DECIMAL(10, 2),
		foreign key (DepartmentID) references Departments(DepartmentID)
	
	);

INSERT INTO Employees (FirstName, LastName, DepartmentID,gender, Salary)
VALUES
    ('Tayyaba', 'Muslim', 1,'F', 78000.00),
    ('Sawera', 'Ansari', 2,'F', 98000.00),
    ('Ayra', 'khan', 4,'F', 45000.00),
    ('Shahzain', 'Ali', 3,'M', 60000.00),
    ('Muhammad', 'Ahmed', 2,'M', 40000.00),
    ('Ahmed', 'Raza', 5, 'M',65000.00),
    ('Mishal', 'Khan', 3,'F', 85000.00),
    ('Sunny', 'Ansari', 5,'M', 43000.00),
    ('Ruhi', 'Imran', 1,'F', 57000.00),
    ('Shibra', 'Ikram', 4,'F', 77000.00);

	
--Departments table should have fields: DepartmentID (int, primary key), DepartmentName (varchar).
CREATE TABLE Departments (
    DepartmentID INT not null unique identity,
    DepartmentName VARCHAR(50)
);


INSERT INTO Departments (DepartmentName)
VALUES
    ('HR'),
    ( 'Marketing Department'),
	( 'Administration'),    
	( 'Finance'),
    ( 'Sales');
	select * from Departments;
	

   select Dept.DepartmentName,sum(salary) as total_salary from Employees Emp INNER JOIN Departments Dept on Emp.DepartmentID = Dept.DepartmentID group
   by (Dept.DepartmentName) with rollup;

    select Dept.DepartmentName,sum(salary) as total_salary from Employees Emp INNER JOIN Departments Dept on Emp.DepartmentID = Dept.DepartmentID group
   by cube(Emp.firstname,Dept.DepartmentName);

  --Aggregate function with group by clause
  select gender, sum(salary) as total_salary from Employees group by (gender) with rollup;

  select gender, sum(salary) as total_salary from Employees group by cube(gender, salary);





