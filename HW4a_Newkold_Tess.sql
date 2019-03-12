RETURN;
/*	
	IS6030 Homework 4a 
	Name: Tess Newkold 
*/


/*--------------------------------------------------------------------------------------
Instructions:

You will be using the StudentDinner database we created in class to answer the following questions.

Please download the StudentDinner.sql and execute the file to create the StudentDinner database
if you have not done so in class.

Answer each question as best as possible.  
Show your work if you need to take multiple steps to answer a problem. 
Partial answers will count.
--------------------------------------------------------------------------------------*/
USE Week5Exercise;

/*Q1. (0.5 point)
	List the restaurant according to their average ratings, from the highest to the lowest.*/
/* Q1. Query */

SELECT 
	N.RName AS Restaurant_Name,
	AVG(CAST(R.Rating as Decimal(3,2))) AS Average_Rating
FROM 
	dbo.Dinner AS R
	INNER JOIN dbo.Restaurant AS N
	ON R.RID = N.RID
GROUP BY N.RName
ORDER BY Average_Rating DESC


/*Q2. (0.5 point)
	List the names of student who eat out every single day of the week.*/
/* Q2. Query */

SELECT 
	N.SName AS Student_Name,
	COUNT(DISTINCT Day.DinnerDay) AS How_Many_Days_Eating_Out
FROM 
	dbo.Student AS N
	INNER JOIN	dbo.Dinner AS Day
	ON N.SID = Day.SID
GROUP BY N.SName, N.SID
HAVING Count(DISTINCT Day.DinnerDay) = 7
--having distinct allows us to be confident that it is once a day for each day. not eating 7 times in 3 days.



/*Q3. (1 point)
	List the restaurant whose total earning is greater than $100 and does not have a phone number, with the highest earning restaurant at the top.*/
/* Q3. Query */

SELECT 
	R.RName AS Restaurant_Name,
	SUM(C.Cost) AS Total_Earnings
FROM dbo.Restaurant AS R
	FULL OUTER JOIN dbo.dinner AS C
	ON R.RID = C.RID
WHERE R.Phone IS NULL
GROUP BY R.RName
HAVING SUM(C.Cost) >100
ORDER BY SUM(C.COST) DESC



/*Q4. (1 point)
	List the student according to the total distance they travel for dinner.*/
/* Q4. Query */

SELECT 
	S.SName AS Student_Name,
	SUM(D.LCBDistance) AS Total_Distance_Traveled
FROM dbo.Student AS S
	LEFT JOIN dbo.Dinner AS I
	ON S.SID = I.SID
	LEFT JOIN dbo.Restaurant AS D
	ON I.RID = D.RID
GROUP BY S.SName
ORDER BY Total_Distance_Traveled ASC


/*Q5. (1 point)
	List the names of student who do not like to eat out on Thursdays.*/
/* Q5. Query */
--got help from Mounika(look to emails if forget when studying)

SELECT 
	DISTINCT S.SName AS Student_Name
FROM dbo.Student AS S
	LEFT JOIN dbo.Dinner AS D
	ON S.SID = D.SID
WHERE D.DinnerDay NOT LIKE '%Thursday%'
ORDER BY S.SName


/*Q6. (1 point)
	For each major, list the total amount of money students spent on dinner, 
	and their number of visits to restaurants during the weekends (Saturdays and Sundays).*/	
/* Q6. Query */


SELECT 
    M.Major,
	SUM(CAST(D.Cost AS DECIMAL(6,2))) AS Total_Dollars_Spent_on_Dinner,
	Count(D.DinnerDay) AS Number_of_Visits_on_Weekends
FROM dbo.Major AS M
	INNER JOIN dbo.Student AS S
	ON M.MID = S.MID
	INNER JOIN dbo.Dinner AS D
	ON S.SID = D.SID  
WHERE D.DinnerDay LIKE '%Saturday%' 
	  OR D.DinnerDay LIKE '%Sunday%'
GROUP BY M.Major, M.MID

