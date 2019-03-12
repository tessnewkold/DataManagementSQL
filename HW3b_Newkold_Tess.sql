RETURN;
--Homework #3b Querying Multiple Tables
--Your Name: Tess Newkold 

/*--------------------------------------------------------------------------------------
Instructions:

You will be using the Chicago Salary table but you will following the questions 
to normalize the data in order to provide a table structure to test your JOIN abilities. 

You can use the original summary table to double check any answers.

Answer each question as best as possible.  
Show your work if you need to take multiple steps to answer a problem. 
Partial answers will count.
--------------------------------------------------------------------------------------*/
CREATE DATABASE Homework3;
USE Homework3;

/* 
Q1. (0.5 point)
	Write the syntax to drop and build a table called dbo.Employee. 
	Create an EmployeeID field (IDENTITY PK), a Name field and a Salary field for the Employee table.
	Populate the Employee table with unique Name and Salary information from the dbo.ChicagoSalary table.
*/
/* Q1. Syntax*/

IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL DROP TABLE dbo.Employee; 

Create Table Employee
	(EmployeeID INT IDENTITY (5,2) PRIMARY KEY,
	NAME VARCHAR (200),
	Salary DECIMAL(8,2)
	);

INSERT INTO dbo.Employee (Name, Salary)
SELECT DISTINCT (Name), Salary
FROM dbo.ChicagoSalary


--to check if the number of rows is correct
SELECT *
FROM dbo.Employee


/* Q2. (0.5 point)
	Write the syntax to drop and build a table called dbo.Department.
	Create an DepartmentID field (IDENTITY PK), and a Name field for the Department Table.
	Populate the Department table with unique Department Names.
*/
/* Q2. Syntax */


IF OBJECT_ID('dbo.Department', 'U') IS NOT NULL DROP TABLE dbo.Department;

Create Table Department
	(DepartmentID INT IDENTITY (5,2) PRIMARY KEY,
	NAME VARCHAR (200)
	);

INSERT INTO dbo.Department(Name)
SELECT DISTINCT (Department)
FROM dbo.ChicagoSalary

--to check if the number of rows is correct
SELECT *
FROM dbo.Department



/* Q3. (0.5 point)
	Write the syntax to drop and build a table called dbo.Position.
	Create an PositionID field (IDENTITY PK), and a Name field for the Position table.
	Populate the Position table with unique PositionTitles (call the field Title).
*/
/* Q3. Syntax */

IF OBJECT_ID('dbo.Position', 'U') IS NOT NULL DROP TABLE dbo.Position;

Create Table Position
	(PositionID INT IDENTITY (5,2) PRIMARY KEY,
	Title VARCHAR (200)
	);

INSERT INTO dbo.Position(Title)
SELECT DISTINCT (PositionTitle)
FROM dbo.ChicagoSalary

--to check if the number of rows is correct
SELECT *
FROM dbo.Position




/* Run the following query to populate a Employment table to help build the relationship between the above three tables. */

IF OBJECT_ID('dbo.Employment','U') IS NOT NULL DROP TABLE dbo.Employment;

SELECT DISTINCT IDENTITY(INT,1,1)  EmploymentID
		, EmployeeID
		, PositionID
		, DepartmentID
INTO dbo.Employment
FROM dbo.ChicagoSalary CS
INNER JOIN dbo.Employee E on CS.Name = E.Name and CS.Salary = E.Salary 
INNER JOIN dbo.Position P on P.Title = CS.PositionTitle  
INNER JOIN dbo.Department D on D.Name = CS.Department;


/* Q4. (0.5 point)
	Display the same output as the dbo.ChicagoSalary table but use the new 4 tables you created.
*/
/* Q4. Syntax*/

--just to check what it looks like
Select * FROM dbo.ChicagoSalary

Select E.NAME, P.Title, D.NAME, E.Salary from Employment as Emp
left join
Employee as E on Emp.EmployeeID = E.EmployeeID
left join
Department as D on Emp.DepartmentID = D.DepartmentID
left join
Position as P on Emp.PositionID = P.PositionID


/* Q5. (1 point)
	Using the new tables and JOINs to display Number of Employees and Average Salary in the Police department.
*/
/*Q5. Syntax*/

SELECT COUNT(*),
	AVG(Salary) 
FROM dbo.Employment AS EMP
	LEFT JOIN Employee AS E
	ON EMP.DepartmentID = E.EmployeeID
WHERE DepartmentID =
	(
	SELECT DepartmentID
	FROM dbo.Department
	WHERE Name = 'Police'
	);

/* Q6. (1 point)
	Using the new tables and JOINs to provide the Number of Employees and Total Salary of Each Department.
	Sort the output by Department A->Z.
*/
/*Q6. Syntax*/

SELECT D.NAME,
	   COUNT(*) AS Number_of_Employees,
	   SUM(E.Salary) AS Total_Salary_of_Each_Department
FROM dbo.Employee AS E
	LEFT JOIN Employment AS EMP
	ON E.EmployeeID = EMP.EmployeeID
	LEFT JOIN Department AS D
	ON EMP.DepartmentID = D.DepartmentID
GROUP BY EMP.DepartmentID,
		 D.Name
ORDER BY D.Name

/* Q7. (1 point)
	Using the new table(s) and subqueries to list the name(s) and salary of employee(s) whose last name is Aaron and work for the POLICE department. 
*/ 
/*Q7. Syntax*/

SELECT Name, 
	   Salary
FROM dbo.Employee
WHERE EmployeeID IN
	(
	SELECT EmployeeID
	FROM dbo.Employment
	WHERE DepartmentID IN
		(
		SELECT DepartmentID
		FROM dbo.Department
		WHERE Name = 'Police'
		) 
		AND	Name LIKE 'Aaron%'
	);

/*Q7. Answer:
Name= AARON, JEFFERY M
Salary= 75372.00
*/

 


/* Q8. (1 point)
	Display the name(s) of the people who have the longest name(s) 
*/
/* Q8. Syntax */

SELECT Name
FROM dbo.Employee
WHERE LEN(NAME) = 
	(
	SELECT MAX(LEN(NAME))
	FROM dbo.Employee
	) 


/* Q8.Answer: Clemons Sams, Michael Anthony C
				AND
			  Wrzesniewska Kozak, Anniabella M

*/
					 
/*Q9. (Bonus: 0.1 point)
	You may share any challenge(s) you face while finishing the assignment and how you overcome the challenge.
*/

 /* Q9.Answer: I really struggled with #4 for a long time (i think I was tired :)) but then I realized that #1 from part A 
				would help a lot because they are very similar. 
				This helped me really understand how to do JOINS and how to think through them. 

*/
