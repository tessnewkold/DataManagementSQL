RETURN;

--Homework #3a Querying Multiple Tables
--Your Name: Tess Newkold

/*--------------------------------------------------------------------------------------
Instructions:

If you haven't done so in class, please download and run the entire syntax in the MovieDatabase.sql file to establish a Movies database.
Answer the following questions as best as possible.
Show your work if you need to take multiple steps to answer a problem. 
Partial answers will count.
--------------------------------------------------------------------------------------*/

CREATE DATABASE Homework3;
USE Movies;


/*Q1. (0.5 point)
List Film Name, Director Name, Studio Name, and Country Name of all films.*/
/*Q1. Syntax*/

Select FilmName, DirectorName, StudioName, CountryName  from tblFilm as FilmT
left join 
tblDirector as D on FilmT.filmDirectorID=d.DirectorId 
left join 
tblStudio as S on FilmT.FilmStudioId= s.StudioId
left join 
tblCountry as C on FilmT.FilmCountryID=c.CountryID


/*Q2. (0.5 point)
List people who have been actors but not directors.*/
/*Q2. Syntax*/

SELECT A.ActorName
FROM tblActor AS A
Where A.ActorName NOT IN
	(
	SELECT DirectorName
	FROM tblDirector AS D
	);


/*Q3. (1 point)
List actors that have never been directors and directors that have never been actors.*/
/*Q3. Syntax*/

	--couldnt figure out as subquery, so did a FULL OUTER JOIN as #10 in Week4 Demo
SELECT ActorName, DirectorName
FROM tblActor AS A
FULL OUTER JOIN tblDirector AS D
ON A.ActorID = D.DirectorID
WHERE A.ActorID is null 
or D.DirectorID is null;


/*Q4. (1 point)
List all films that are released in the same year when the film Casino is released.*/
/*Q4. Syntax*/

SELECT FilmName
FROM dbo.tblFilm
Where FilmReleaseDate = 
	(
	SELECT FilmReleaseDate
	FROM dbo.tblFilm
	WHERE FilmName = 'Casino'
	);


/*Q5. (0.5 point)
Using JOIN to list films whose directors were born between '1946-01-01' AND '1946-12-31'. */
/*Q5. Syntax*/

--from Week4 Demo #7
SELECT DirectorName, DirectorDOB
FROM tblFilm as F
	LEFT JOIN tblDirector as D
	ON F.FilmDirectorID = D.DirectorID
WHERE D.DirectorDOB BETWEEN '1946-01-01' AND '1946-12-31';

/*Q6. (0.5 point)
Using subquery to list films whose directors were born between '1946-01-01' AND '1946-12-31'. */
/*Q6. Syntax*/

SELECT filmName
FROM tblFilm
WHERE FilmDirectorID IN
	(
	SELECT DirectorID
	FROM tblDirector
	WHERE DirectorDOB BETWEEN '1946-01-01' AND '1946-12-31'
	);

