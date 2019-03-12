RETURN;

CREATE DATABASE Homework5;
USE Homework5;

SELECT *
FROM dbo.ChicagoSchools

SELECT COUNT(*) AS Number_of_Records
FROM dbo.ChicagoSchools;


--Summary Statistics broken into CASES of Adequate Yearly Progress 

SELECT  AVG(Average_Student_Attendance) AS Average_Student_Attendance,
		AVG(Rate_of_Misconducts_per_100_students) AS Average_Rate_of_Misconducts,
		AVG(Family_Involvement_Score) AS Average_Family_Involvement_Score,
		AVG(Gr3_5_Grade_Level_Math_Percent) AS Average_Students_at_Grade_3_thru_5_Math,
		AVG(Gr6_8_Grade_Level_Math_Percent) AS Average_Students_at_Grade_6_thru_8_Math,
CASE
	WHEN Adequate_Yearly_Progress_Made = 'Yes' THEN 'Yes'
	WHEN Adequate_Yearly_Progress_Made = 'No' THEN 'No'
	WHEN Adequate_Yearly_Progress_Made = 'NDA' THEN 'NDA'
END AS Progress
FROM dbo.ChicagoSchools
GROUP BY Adequate_Yearly_Progress_Made
Order BY Adequate_Yearly_Progress_Made DESC

