#Check the version
version

#Update if needed
update.packages()


#Install package
install.packages("RODBC")

#Use library
library(RODBC)

#List all your ODBC connections
odbcDataSources(type = c("all", "user", "system"))

#Create connection - Note if you leave uid and pwd blank it works with your existing Windows credentials
Local <- odbcConnect("HW5", uid = "", pwd = "")

#Query a database (select statement)
ChicagoSchools <- sqlQuery(Local, "SELECT * FROM Homework5.dbo.ChicagoSchools")


#View data
View (ChicagoSchools)
head(ChicagoSchools,5)

#Check the structure of the data
class(ChicagoSchools)
str(ChicagoSchools)


#Quick summary to describe the data
dim(ChicagoSchools)
summary (ChicagoSchools)  
colnames(ChicagoSchools)

Family_Involvement_Score <- ChicagoSchools$Family_Involvement_Score
Avg_Student_Attendance <- ChicagoSchools$Average_Student_Attendance
Rate_of_Student_Misconduct <- ChicagoSchools$Rate_of_Misconducts_per_100_students
Grade3_5_Level_Math <- ChicagoSchools$Gr3_5_Grade_Level_Math_Percent
Gradr6_8_Level_Math <- ChicagoSchools$Gr6_8_Grade_Level_Math_Percent
College_Elligibility <- ChicagoSchools$College_Eligibility_Percent
College_Enrolment <- ChicagoSchools$College_Enrollment_Rate_Percent

summary(Family_Involvement_Score)
summary(Avg_Student_Attendance)
summary(Rate_of_Student_Misconduct)
summary(Grade3_5_Level_Math)
summary(Gradr6_8_Level_Math)
summary(College_Elligibility)


hist(Family_Involvement_Score)
hist(Avg_Student_Attendance)
hist(Rate_of_Student_Misconduct)
hist(Grade3_5_Level_Math)
hist(Gradr6_8_Level_Math)

boxplot(Family_Involvement_Score)
boxplot(Avg_Student_Attendance)
boxplot(Rate_of_Student_Misconduct)
boxplot(Grade3_5_Level_Math)
boxplot(Gradr6_8_Level_Math)

#Basic queries
sqlView <- sqlQuery(Local, "SELECT *
FROM dbo.ChicagoSchools;
                     ")
sqlBasic <- sqlQuery(Local, "SELECT COUNT(*) AS Number_of_Records
FROM dbo.ChicagoSchools;
                     ")


sqlAverages <- sqlQuery(Local, "SELECT  AVG(Average_Student_Attendance) AS Average_Student_Attendance,
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
                              ")      
sqlAverages


#Best practice - don't leave the connection open and ensures you get the latest data
odbcCloseAll()
