/*	
	IS6030 Homework 4b 
	Name: Tess Newkold
*/
RETURN;
CREATE DATABASE Homework4
USE Homework4;
/*--------------------------------------------------------------------------------------
Instructions:

You will be using the Baltimore Parking Citations data set (14,705 rows)
(this is only a snapshot of all citations for Baltimore).

The name of your table should be called dbo.ParkingCitations.

Answer each question as best as possible.  
Show your work if you need to take multiple steps to answer a problem. 
Partial answers will count.
--------------------------------------------------------------------------------------*/

/* 
	You can run this query to check your table, if it does not run or you do not get 14,705 rows,
    you should revisit your import/table.  Before you do anything, make sure your data/table is correct!
	
	Reminder: Please check which database you imported data into and which database you are working with.
*/

	SELECT *
	FROM dbo.ParkingCitations; 

/* Q1. (1 point)
		Show the number of Citations, Total Fine amount, by Make and Violation Date. 
        Sort your results in a descending order of Violation Date and in an ascending order of Make.
		Hint: Check the data type for ViolDate and see whether any transformation is needed.*/
/* Q1. Query */
		
SELECT  CAST(ViolDate as DATE) AS Violation_Date,
		Make, 
		Count(Citation) AS Number_of_Citations,
		SUM(ViolFine) AS Total_Fine_Amount
FROM dbo.ParkingCitations
GROUP BY ViolDate, Make
ORDER BY ViolDate DESC, Make ASC


/* Q2. (0.5 point)
	Display just the State (2 character abbreviation) that has the most number of violations.*/
/* Q2. Query */

SELECT TOP 1 State
FROM dbo.ParkingCitations 
ORDER BY ParkingCitationID DESC



/* Q3. (1 point)
	   Display the number of violations and the tag, for any tag that is registered at Maryland (MD) and has 6 or more violations. 
	   Order your results in a descending order of number of violations.*/
/* Q3. Query */
		
SELECT Tag AS Tag_Number,
		COUNT(Citation) AS Number_of_Citations
FROM dbo.ParkingCitations
WHERE State LIKE '%MD%'
GROUP BY Tag
HAVING COUNT(ParkingCitationID) >= 6
ORDER BY Number_of_Citations DESC


/* Q4. (0.5 point)
	Generate a one column output by formatting the data into this format 
	(I'll use the first record as an example of the format, you'll need to apply this to all records with State of MD):	
			15TLR401 - Citation: 98348840 - OTH - Violation Fine: $502.00 */
/* Q4. Query */

SELECT  TAG + ' - ' + 
	   'Citation: ' + Citation + ' - ' +
		Make + ' - ' +
	   'Violation Fine: $' + CAST(ViolFine AS VARCHAR(10))
	   AS MD_Parking_Violation_Data
FROM dbo.ParkingCitations
WHERE State LIKE '%MD%'



/* Q5. (0.5 point)
	   Write a query to calculate which states MAX ViolFine differ more than 200 from MIN VioFine 
	   Display the State Name and the Difference.  Sort your output by State A->Z.*/
/* Q5. Query */

SELECT sub.State,
		sub.Max_Fine - sub.Min_Fine AS Difference_Fine
FROM (
	  SELECT Distinct State,
			MAX(ViolFine) OVER (PARTITION BY State) AS Max_Fine,
			MIN(ViolFine) OVER (PARTITION BY State) AS Min_Fine
	  FROM dbo.ParkingCitations
	  ) AS sub
WHERE sub.Max_Fine - sub.Min_Fine > 200
ORDER BY State ASC


/* Q6. (1 point)
	   You will need to bucket the entire ParkingCitations database into three segments by ViolFine. 
	   Your first segment will include records with ViolFine between $0.00 and $50.00 and will be labled as "01. $0.00 - $50.00".
	   The second segment will include records with ViolFine between $50.01 and $100.00 and will be labled as "02. $50.01 - $100.00".
	   The final segment will include records with ViolFine larger than $100.00 and will be labled as"03. larger than $100.00". 

	   Display Citation, Make, VioCode, VioDate, VioFine, and the Segment information in an descending order of ViolDate.*/ 
/* Q6. Query */


SELECT Citation, 
		Make, 
		ViolCode,
		CAST(ViolDate as DATE) AS Violation_Date,
		ViolFine,
CASE
	WHEN ViolFine BETWEEN  0.00 and 50.00 THEN '01. $0.00 - $50.00'
	WHEN ViolFine BETWEEN  50.01 and 100.00 THEN '02. $50.01 - $100.00'
	WHEN ViolFine > 100.00 THEN '03. larger than $100.00'
END AS Violation_Fine_Segment
FROM dbo.ParkingCitations
ORDER BY ViolDate Desc;


/* Q7. (0.5 point)
	   Based on the three segments you created in Q6, display the AVG ViolFine and number of records for each segment. 
	   Order your output by the lowest -> highest segments.*/ 
/* Q7. Query */


SELECT sub.Violation_Fine_Segment,
		AVG(ViolFine) AS Average_Violation_Fine,
		COUNT(Citation) AS Number_Of_Records
FROM (
	SELECT Citation, 
		Make, 
		ViolCode,
		CAST(ViolDate as DATE) AS Violation_Date,
		ViolFine,
	CASE
		WHEN ViolFine BETWEEN  0.00 and 50.00 THEN '01. $0.00 - $50.00'
		WHEN ViolFine BETWEEN  50.01 and 100.00 THEN '02. $50.01 - $100.00'
		WHEN ViolFine > 100.00 THEN '03. larger than $100.00'
	END AS Violation_Fine_Segment
	FROM dbo.ParkingCitations
	) AS sub
GROUP BY sub.Violation_Fine_Segment
ORDER BY sub.Violation_Fine_Segment


/* Q8. Bonus Question (0.1 point):
	   You may share any challenge(s) you face while finishing the assignment and how you overcome the challenge.
*/

/* Q8. Answer */

/*This week i really struggled with subqueries, im not sure why!
So i used this website to change the way I do them. 
https://community.modeanalytics.com/sql/tutorial/sql-subqueries/
I used this techniqe in Question 5, 7
*/
