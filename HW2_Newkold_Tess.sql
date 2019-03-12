--Homework #2 Query from A Single Table

/*--------------------------------------------------------------------------------------
Instructions:

You will need to import the data for Chicago Salary in order to complete this assignment. 

The Chicago Salary tabe should be called dbo.ChicagoSalary and have 4 fields 
Name varchar(255) 
PositionTitle varchar(255) 
Department varchar(255) 
Salary decimal(19,2)

You should have a total of 32,432 rows.

Don't forget to name your columns, an output of (No column name) will reduce your overall grade.

Answer each question as best as possible.  
Show your work if you need to take multiple step to answer a problem. 
Partial answers will count.
--------------------------------------------------------------------------------------*/
RETURN;

CREATE DATABASE Homework2;
USE Homework2;


/* 
Q1. (0.5 point)
Write the query to COUNT the number of Records in the Salary table. 
*/
/* Q1. Query*/
Select Count (*) AS Number_of_Records
FROM dbo.ChicagoSalary

/* 
Q2. (0.5 point)
Write a query to display the number of unique names.
*/
/* Q2. Query */
SELECT COUNT(DISTINCT (Name)) AS Number_of_Unique_Names
FROM dbo.ChicagoSalary

/* 
Q3. (0.5 point)
Write a query to display the only the name and position title of those with a full name 
that contains the text 'Spangler' in it.
*/
/* Q3. Query*/
SELECT Name, PositionTitle
FROM dbo.ChicagoSalary
WHERE Name LIKE '%Spangler%';


/* 
Q4. (0.5 point)
Write a query to display the name and position of the person who has the lowest Salary in the the AVIATION department.
*/
/* Q4. Query */
SELECT MIN(SALARY) AS MIN_Salary
FROM dbo.ChicagoSalary
WHERE Department = 'AVIATION'

SELECT DISTINCT Name, PositionTitle
FROM dbo.ChicagoSalary
Where Salary = 8580.00
	AND Department = 'AVIATION'


/* 
Q5. (0.5 point)
Write a query to display all the names and salaries of everyone in the WATER MGMNT department
that makes more than 150K in salary, order the output by Salary descending.
*/
/* Q5. Query */ 
SELECT Name, Salary
FROM dbo.ChicagoSalary
WHERE Department = 'Water Mgmnt'
	AND Salary > 150000
ORDER BY Salary DESC;


/* 
Q6. (0.5 point)
Display the total salary of the entire Chicago salary table.
*/
/* Q6. Query */
SELECT Sum(Salary) AS Total_Salary_of_Chicago
FROM dbo.ChicagoSalary


/* 
Q7. (0.5 point)
Display the department name and average salary where average salary for the department is more than 90000.
*/
/* Q7. Query */
SELECT Department AS Department_Name, 
		AVG(Salary) AS Average_Salary
FROM dbo.ChicagoSalary 
Group by Department
HAVING AVG(Salary) > 90000
ORDER BY Department;





/* Q8. (0.5 point)
Which Employee has the highest salary? 
How Much higher is that person's salary compared to the AVG salary of the department they belong to? 
You can use multiple queries to answer this question.
*/
/*Q8. Query */

SELECT MAX(SALARY) AS MAX_Salary
FROM dbo.ChicagoSalary

SELECT Name AS Name_of_Employee_With_Highest_Salary
		,Department
		, Salary
FROM dbo.ChicagoSalary
Where Salary = 260004.00

Select Department,
		(Max(Salary) - AVG(Salary)) AS Difference_Between_Average_and_MAX_Salary
FROM dbo.ChicagoSalary
Where Department = 'Police'
Group by Department


/* Q9. (0.5 point)
Display the Name, Department, Salary (to the nearest whole number) of any employee who has a salary of 60000 or more 
and their name begins with 'Aaron'.
*/ 
/* Q9. Query */
 
SELECT Name
		, Department
		, ROUND(Salary, 0) AS Salary_to_Nearest_Whole_Number
FROM dbo.ChicagoSalary
WHERE Name LIKE 'Aaron%'
	AND Salary > 60000;




/* Q10. (0.5 point)
Display LastName and FirstName (with Middle Initial) as seperate columns/fields derived from the Name field. Write down your query in the answersheet.
*/
/* Q10. Query*/

SELECT Name 
		,LEFT (Name, CHARINDEX (' ', Name)-1) as LastName
		,RIGHT (Name, LEN (Name)-CHARINDEX (' ', Name)) as FirstName_MiddleInitial
From dbo.ChicagoSalary
 

/*Bonus Q11. (0.1 point) 
You may share any challenge(s) you face while finishing the assignment and how you overcome the challenge.

*/

/*
Question #2 supprisingly difficult for me, I originally had it like
SELECT DISTINCT COUNT(NAME) .....
and I realized that this was counting all the names and then getting the distinct values of the count, which is the same.
I realized this is stupid, and I changed it to 
SELECT COUNT(DISTINCT (Name))...
this is correct bc it takes all the distinct names first, and then it counts them. getting the correct number 32164


Question #8 was hard for me, the instructions said I could break it down into multiple queries,
which I was able to accomplish but I tried to get them all into one query.
This I could not do, i spent quiet a bit of time. I think I was very close with this query, but I still 
could not get it to work

This is my code below that I think is close to working, but does not, I get errors. 

SELECT Name AS Name_of_Employee_With_Highest_Salary
		,Department
		, Salary
		, (Max(Salary) - AVG(Salary)) AS Difference_Between_Average_and_MAX_Salary
FROM dbo.ChicagoSalary
Where Department = 'Police'
GROUP BY Department
*/