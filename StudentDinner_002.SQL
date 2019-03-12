CREATE DATABASE Week5Exercise
USE Week5Exercise

/* first table*/
IF OBJECT_ID('dbo.Restaurant', 'U') IS NOT NULL DROP TABLE dbo.Restaurant;


CREATE TABLE dbo.Restaurant (
RID INT NOT NULL PRIMARY KEY,
RName VARCHAR(100),
Address VARCHAR(500),
Phone VARCHAR (14),
LCBDistance DECIMAL (3,1),
);

/* second table */
IF OBJECT_ID('dbo.Major', 'U') IS NOT NULL DROP TABLE dbo.Major;

CREATE TABLE dbo.Major (
MID INT NOT NULL PRIMARY KEY,
Major VARCHAR(50) NOT NULL,
);

/* third table */
IF OBJECT_ID('dbo.Student', 'U') IS NOT NULL DROP TABLE dbo.Student;

CREATE TABLE dbo.Student (
SID INT NOT NULL PRIMARY KEY,
SName VARCHAR(50) NOT NULL,
Section CHAR(3),
MID INT FOREIGN KEY REFERENCES dbo.Major (MID),
);



/* fourth table */
IF OBJECT_ID('dbo.Dinner', 'U') IS NOT NULL DROP TABLE dbo.Dinner;

CREATE TABLE dbo.Dinner (
DinnerID INT IDENTITY PRIMARY KEY,
SID INT NOT NULL FOREIGN KEY REFERENCES dbo.Student (SID),
RID INT NOT NULL FOREIGN KEY REFERENCES dbo.Restaurant (RID),
DinnerDay VARCHAR (10),
Cost DECIMAL,
Rating INT
);


/*  Insert Restaurant */
INSERT INTO Restaurant VALUES (101,'Fortune Noodle House','349 Calhoun St. Cincinnati, OH 45219','(513) 281-1800',1);
INSERT INTO Restaurant VALUES (102,'Conscious Kitchen','2516 Clifton Ave Cincinnati, OH 45219','(513) 979-4062',1);
INSERT INTO Restaurant VALUES (103,'Noodles & Company','7 Martin Luther King Dr E Cincinnati, OH 45219','(513) 221-5100',0.7);
INSERT INTO Restaurant VALUES (104,'Cilantro Vietnamese Bistro','235 W McMillan Ave Cincinnati, OH 45219',NULL,1);
INSERT INTO Restaurant VALUES (105,'Tucker¡¯s Restaurant','1637 Vine St Cincinnati, OH 45202','(513) 954-8920',1.8);
INSERT INTO Restaurant VALUES (106,'Fireside Pizza','773 E McMillan St Cincinnati, OH 45206',NULL,1.9);
INSERT INTO Restaurant VALUES (107,'Krueger¡¯s Tavern','1211 Vine St Cincinnati, OH 45202','(513) 834-8670',2.2);
INSERT INTO Restaurant VALUES (108,'Zula','1400 Race St Cincinnati, OH 45202','(513) 744-9852',2.2);
INSERT INTO Restaurant VALUES (109,'Sushi Lounge','200 West Mcmillan Cincinnati, OH 45219','(513) 421-2666',1.1);
INSERT INTO Restaurant VALUES (110,'CrepeGuys','121 Calhoun St Cincinnati, OH 45219','(513) 221-0899',1.3);
INSERT INTO Restaurant VALUES (111,'Bagel Brothers','347 Calhoun St Cincinnati, OH 45219','(513) 221-4000',1);
INSERT INTO Restaurant VALUES (112,'Fresh Table','1801 Race St Cincinnati, OH 45202',NULL,1.8);
INSERT INTO Restaurant VALUES (113,'J. Gumbo¡¯s','286 Ludlow Ave Cincinnati, OH 45220','(513) 407-6930',0.9);
INSERT INTO Restaurant VALUES (114,'Liwei Frozen Yogurt','1324 Race St Cincinnati, OH 45202',NULL,2.1);

/*  Insert Major */
INSERT INTO Major VALUES (1,'Accounting');
INSERT INTO Major VALUES (2,'Marketing');
INSERT INTO Major VALUES (3,'Business Analytics');
INSERT INTO Major VALUES (4,'Information Systems');
INSERT INTO Major VALUES (5,'Operations Management');
INSERT INTO Major VALUES (6,'Applied Economics');
INSERT INTO Major VALUES (7,'Adult Learning');



/*  Insert Student */
INSERT INTO Student VALUES (1,'Corwin','002',1);
INSERT INTO Student VALUES (2,'Brandon','002',2);
INSERT INTO Student VALUES (3,'Paul','002',3);
INSERT INTO Student VALUES (4,'Elijah','002',3);
INSERT INTO Student VALUES (5,'Saketh','002',4);
INSERT INTO Student VALUES (6,'Matt ','002',5);
INSERT INTO Student VALUES (7,'John','002',5);
INSERT INTO Student VALUES (8,'Rahul','002',3);
INSERT INTO Student VALUES (9,'Jesso','002',3);
INSERT INTO Student VALUES (10,'Trishul','002',3);
INSERT INTO Student VALUES (11,'Menali','002',3);
INSERT INTO Student VALUES (12,'Jeevan','002',3);
INSERT INTO Student VALUES (13,'Blake','002',6);
INSERT INTO Student VALUES (14,'Sanjana','002',3);
INSERT INTO Student VALUES (15,'Jacob','002',3);
INSERT INTO Student VALUES (16,'James','002',3);
INSERT INTO Student VALUES (17,'Anirudh','002',3);
INSERT INTO Student VALUES (18,'Anusha','002',3);
INSERT INTO Student VALUES (19,'Akash','002',3);
INSERT INTO Student VALUES (20,'Krishna ','002',3);
INSERT INTO Student VALUES (21,'Mrinal','002',3);
INSERT INTO Student VALUES (22,'Ashish','002',3);
INSERT INTO Student VALUES (23,'Beth','002',4);
INSERT INTO Student VALUES (24,'Shriya ','002',3);
INSERT INTO Student VALUES (25,'Gopal','002',3);
INSERT INTO Student VALUES (26,'Pravallika','002',3);
INSERT INTO Student VALUES (27,'Shashank','002',3);
INSERT INTO Student VALUES (28,'Nan','002',3);
INSERT INTO Student VALUES (29,'Aniket ','002',3);
INSERT INTO Student VALUES (30,'Buddha','002',3);
INSERT INTO Student VALUES (31,'Aniket','002',3);
INSERT INTO Student VALUES (32,'Mark','002',3);
INSERT INTO Student VALUES (33,'Rahul','002',3);
INSERT INTO Student VALUES (34,'Ramana ','002',3);
INSERT INTO Student VALUES (35,'Neha','002',3);
INSERT INTO Student VALUES (36,'Harsharaj ','002',3);
INSERT INTO Student VALUES (37,'Tess','002',3);
INSERT INTO Student VALUES (38,'Pati','002',3);
INSERT INTO Student VALUES (39,'Khiem ','002',3);
INSERT INTO Student VALUES (40,'Rashmi','002',3);
INSERT INTO Student VALUES (41,'Husain ','002',3);
INSERT INTO Student VALUES (42,'Xi','002',3);
INSERT INTO Student VALUES (43,'Arjun','002',3);
INSERT INTO Student VALUES (44,'Ashwita','002',3);
INSERT INTO Student VALUES (45,'Aabhaas','002',3);
INSERT INTO Student VALUES (46,'Kaijun','002',3);
INSERT INTO Student VALUES (47,'Jyo','002',3);
INSERT INTO Student VALUES (48,'Pallavi','002',3);
INSERT INTO Student VALUES (49,'Chunyan','002',3);
INSERT INTO Student VALUES (50,'Mahitha ','002',3);
INSERT INTO Student VALUES (51,'Bharath','002',3);
INSERT INTO Student VALUES (52,'Yannik','002',7);
INSERT INTO Student VALUES (53,'Ruby','002',3);
INSERT INTO Student VALUES (54,'Tingyu','002',3);
INSERT INTO Student VALUES (55,'Bolun','002',3);


/*  Insert Dinner */
INSERT INTO Dinner VALUES (1,113,'Monday',10,1);
INSERT INTO Dinner VALUES (1,102,'Tuesday',8,2);
INSERT INTO Dinner VALUES (1,103,'Wednesday',12,4);
INSERT INTO Dinner VALUES (1,103,'Friday',10,1);
INSERT INTO Dinner VALUES (1,110,'Friday',10,5);
INSERT INTO Dinner VALUES (1,112,'Saturday',9,2);
INSERT INTO Dinner VALUES (2,111,'Monday',12,3);
INSERT INTO Dinner VALUES (2,102,'Tuesday',10,2);
INSERT INTO Dinner VALUES (2,109,'Tuesday',11,5);
INSERT INTO Dinner VALUES (2,111,'Friday',11,3);
INSERT INTO Dinner VALUES (2,111,'Saturday',9,4);
INSERT INTO Dinner VALUES (3,101,'Sunday',11,4);
INSERT INTO Dinner VALUES (3,101,'Monday',11,4);
INSERT INTO Dinner VALUES (3,104,'Tuesday',10,4);
INSERT INTO Dinner VALUES (3,110,'Wednesday',11,1);
INSERT INTO Dinner VALUES (3,113,'Friday',11,1);
INSERT INTO Dinner VALUES (3,113,'Saturday',8,5);
INSERT INTO Dinner VALUES (4,109,'Sunday',12,4);
INSERT INTO Dinner VALUES (4,103,'Monday',8,5);
INSERT INTO Dinner VALUES (4,107,'Tuesday',9,3);
INSERT INTO Dinner VALUES (4,102,'Wednesday',10,3);
INSERT INTO Dinner VALUES (4,113,'Thursday',9,4);
INSERT INTO Dinner VALUES (4,104,'Friday',10,5);
INSERT INTO Dinner VALUES (4,112,'Saturday',10,3);
INSERT INTO Dinner VALUES (5,108,'Sunday',11,5);
INSERT INTO Dinner VALUES (5,105,'Monday',8,4);
INSERT INTO Dinner VALUES (5,101,'Tuesday',12,2);
INSERT INTO Dinner VALUES (5,107,'Wednesday',9,2);
INSERT INTO Dinner VALUES (6,102,'Friday',12,1);
INSERT INTO Dinner VALUES (6,110,'Monday',9,4);
INSERT INTO Dinner VALUES (6,113,'Tuesday',10,5);
INSERT INTO Dinner VALUES (6,103,'Wednesday',12,1);
INSERT INTO Dinner VALUES (6,109,'Friday',8,5);
INSERT INTO Dinner VALUES (6,104,'Saturday',12,5);
INSERT INTO Dinner VALUES (7,113,'Sunday',10,2);
INSERT INTO Dinner VALUES (7,101,'Monday',9,1);
INSERT INTO Dinner VALUES (7,110,'Tuesday',11,4);
INSERT INTO Dinner VALUES (7,110,'Wednesday',12,5);
INSERT INTO Dinner VALUES (7,107,'Saturday',9,2);
INSERT INTO Dinner VALUES (8,106,'Sunday',12,5);
INSERT INTO Dinner VALUES (8,109,'Thursday',11,1);
INSERT INTO Dinner VALUES (8,105,'Friday',11,1);
INSERT INTO Dinner VALUES (8,103,'Saturday',9,3);
INSERT INTO Dinner VALUES (9,105,'Sunday',11,4);
INSERT INTO Dinner VALUES (9,110,'Monday',11,1);
INSERT INTO Dinner VALUES (9,113,'Tuesday',8,4);
INSERT INTO Dinner VALUES (10,106,'Wednesday',10,3);
INSERT INTO Dinner VALUES (10,109,'Sunday',10,2);
INSERT INTO Dinner VALUES (10,101,'Monday',10,3);
INSERT INTO Dinner VALUES (10,109,'Tuesday',12,2);
INSERT INTO Dinner VALUES (11,106,'Friday',11,2);
INSERT INTO Dinner VALUES (11,101,'Sunday',12,1);
INSERT INTO Dinner VALUES (11,112,'Monday',9,2);
INSERT INTO Dinner VALUES (12,107,'Tuesday',10,3);
INSERT INTO Dinner VALUES (12,103,'Monday',12,2);
INSERT INTO Dinner VALUES (12,109,'Tuesday',9,1);
INSERT INTO Dinner VALUES (12,113,'Wednesday',11,5);
INSERT INTO Dinner VALUES (12,107,'Thursday',11,2);
INSERT INTO Dinner VALUES (12,110,'Friday',11,2);
INSERT INTO Dinner VALUES (12,107,'Saturday',12,1);
INSERT INTO Dinner VALUES (13,105,'Sunday',8,5);
INSERT INTO Dinner VALUES (13,102,'Tuesday',10,5);
INSERT INTO Dinner VALUES (13,107,'Wednesday',17,1);
INSERT INTO Dinner VALUES (13,111,'Thursday',11,1);
INSERT INTO Dinner VALUES (13,111,'Friday',14,4);
INSERT INTO Dinner VALUES (14,110,'Saturday',29,4);
INSERT INTO Dinner VALUES (14,113,'Monday',19,4);
INSERT INTO Dinner VALUES (14,107,'Tuesday',11,1);
INSERT INTO Dinner VALUES (14,113,'Wednesday',26,5);
INSERT INTO Dinner VALUES (14,109,'Friday',25,3);
INSERT INTO Dinner VALUES (14,113,'Saturday',21,2);
INSERT INTO Dinner VALUES (15,113,'Sunday',20,4);
INSERT INTO Dinner VALUES (15,109,'Monday',16,2);
INSERT INTO Dinner VALUES (15,106,'Tuesday',13,4);
INSERT INTO Dinner VALUES (15,106,'Wednesday',23,2);
INSERT INTO Dinner VALUES (15,109,'Friday',22,2);
INSERT INTO Dinner VALUES (15,109,'Saturday',16,4);
INSERT INTO Dinner VALUES (16,112,'Sunday',16,2);
INSERT INTO Dinner VALUES (16,107,'Monday',12,4);
INSERT INTO Dinner VALUES (16,112,'Tuesday',23,5);
INSERT INTO Dinner VALUES (16,107,'Wednesday',29,5);
INSERT INTO Dinner VALUES (16,108,'Thursday',28,1);
INSERT INTO Dinner VALUES (16,106,'Friday',23,3);
INSERT INTO Dinner VALUES (16,101,'Saturday',23,5);
INSERT INTO Dinner VALUES (17,102,'Sunday',26,1);
INSERT INTO Dinner VALUES (17,105,'Monday',24,3);
INSERT INTO Dinner VALUES (17,110,'Tuesday',13,2);
INSERT INTO Dinner VALUES (17,111,'Wednesday',13,1);
INSERT INTO Dinner VALUES (17,102,'Thursday',20,5);
INSERT INTO Dinner VALUES (18,113,'Friday',14,5);
INSERT INTO Dinner VALUES (18,102,'Monday',29,5);
INSERT INTO Dinner VALUES (18,108,'Tuesday',23,3);
INSERT INTO Dinner VALUES (18,104,'Wednesday',26,1);
INSERT INTO Dinner VALUES (18,109,'Thursday',25,1);
INSERT INTO Dinner VALUES (18,105,'Friday',26,1);
INSERT INTO Dinner VALUES (19,111,'Saturday',22,4);
INSERT INTO Dinner VALUES (19,108,'Monday',24,3);
INSERT INTO Dinner VALUES (19,104,'Tuesday',18,5);
INSERT INTO Dinner VALUES (19,111,'Wednesday',12,4);
INSERT INTO Dinner VALUES (19,102,'Friday',10,3);
INSERT INTO Dinner VALUES (19,107,'Saturday',25,3);
INSERT INTO Dinner VALUES (20,112,'Sunday',24,3);
INSERT INTO Dinner VALUES (20,113,'Monday',29,1);
INSERT INTO Dinner VALUES (20,112,'Tuesday',12,2);
INSERT INTO Dinner VALUES (20,103,'Wednesday',21,2);
INSERT INTO Dinner VALUES (20,105,'Friday',15,1);
INSERT INTO Dinner VALUES (21,106,'Saturday',25,1);
INSERT INTO Dinner VALUES (21,106,'Monday',30,4);
INSERT INTO Dinner VALUES (21,107,'Tuesday',11,2);
INSERT INTO Dinner VALUES (21,111,'Wednesday',23,1);
INSERT INTO Dinner VALUES (21,105,'Friday',27,3);
INSERT INTO Dinner VALUES (21,107,'Saturday',22,5);
INSERT INTO Dinner VALUES (22,110,'Sunday',27,3);
INSERT INTO Dinner VALUES (22,113,'Monday',16,2);
INSERT INTO Dinner VALUES (22,106,'Tuesday',12,2);
INSERT INTO Dinner VALUES (22,102,'Wednesday',25,5);
INSERT INTO Dinner VALUES (22,113,'Friday',9,3);
INSERT INTO Dinner VALUES (22,103,'Saturday',10,5);
INSERT INTO Dinner VALUES (23,103,'Sunday',12,5);
INSERT INTO Dinner VALUES (23,105,'Monday',9,2);
INSERT INTO Dinner VALUES (23,113,'Tuesday',11,3);
INSERT INTO Dinner VALUES (23,110,'Wednesday',8,4);
INSERT INTO Dinner VALUES (23,103,'Friday',11,2);
INSERT INTO Dinner VALUES (23,108,'Saturday',8,5);
INSERT INTO Dinner VALUES (24,110,'Sunday',11,1);
INSERT INTO Dinner VALUES (24,104,'Monday',12,5);
INSERT INTO Dinner VALUES (24,104,'Tuesday',11,1);
INSERT INTO Dinner VALUES (24,107,'Wednesday',11,5);
INSERT INTO Dinner VALUES (24,104,'Friday',10,4);
INSERT INTO Dinner VALUES (24,111,'Saturday',9,3);
INSERT INTO Dinner VALUES (25,106,'Sunday',10,1);
INSERT INTO Dinner VALUES (25,109,'Monday',12,3);
INSERT INTO Dinner VALUES (25,109,'Tuesday',10,1);
INSERT INTO Dinner VALUES (25,108,'Wednesday',12,3);
INSERT INTO Dinner VALUES (25,104,'Friday',15,1);
INSERT INTO Dinner VALUES (25,104,'Saturday',27,5);
INSERT INTO Dinner VALUES (26,107,'Sunday',19,4);
INSERT INTO Dinner VALUES (26,109,'Monday',22,1);
INSERT INTO Dinner VALUES (26,108,'Tuesday',23,1);
INSERT INTO Dinner VALUES (26,102,'Wednesday',30,5);
INSERT INTO Dinner VALUES (26,113,'Friday',24,2);
INSERT INTO Dinner VALUES (26,113,'Saturday',14,1);
INSERT INTO Dinner VALUES (27,113,'Sunday',25,5);
INSERT INTO Dinner VALUES (27,101,'Monday',21,1);
INSERT INTO Dinner VALUES (27,110,'Tuesday',26,4);
INSERT INTO Dinner VALUES (27,103,'Wednesday',16,2);
INSERT INTO Dinner VALUES (27,102,'Friday',12,2);
INSERT INTO Dinner VALUES (28,111,'Saturday',19,5);
INSERT INTO Dinner VALUES (28,109,'Sunday',22,3);
INSERT INTO Dinner VALUES (28,101,'Tuesday',17,2);
INSERT INTO Dinner VALUES (28,103,'Wednesday',19,1);
INSERT INTO Dinner VALUES (28,111,'Friday',19,2);
INSERT INTO Dinner VALUES (29,111,'Saturday',10,2);
INSERT INTO Dinner VALUES (29,106,'Sunday',25,1);
INSERT INTO Dinner VALUES (29,101,'Tuesday',24,3);
INSERT INTO Dinner VALUES (29,105,'Wednesday',27,3);
INSERT INTO Dinner VALUES (29,110,'Saturday',27,4);
INSERT INTO Dinner VALUES (29,113,'Sunday',26,2);
INSERT INTO Dinner VALUES (30,113,'Monday',12,2);
INSERT INTO Dinner VALUES (30,107,'Tuesday',8,4);
INSERT INTO Dinner VALUES (30,101,'Wednesday',10,1);
INSERT INTO Dinner VALUES (30,108,'Friday',12,2);
INSERT INTO Dinner VALUES (30,108,'Saturday',10,5);
INSERT INTO Dinner VALUES (30,110,'Sunday',12,1);
INSERT INTO Dinner VALUES (31,103,'Monday',9,3);
INSERT INTO Dinner VALUES (31,109,'Tuesday',10,4);
INSERT INTO Dinner VALUES (31,106,'Friday',8,1);
INSERT INTO Dinner VALUES (31,104,'Saturday',12,3);
INSERT INTO Dinner VALUES (31,110,'Sunday',9,1);
INSERT INTO Dinner VALUES (32,101,'Monday',9,1);
INSERT INTO Dinner VALUES (32,107,'Tuesday',9,4);
INSERT INTO Dinner VALUES (32,110,'Wednesday',12,3);
INSERT INTO Dinner VALUES (32,104,'Friday',8,2);
INSERT INTO Dinner VALUES (32,112,'Saturday',11,3);
INSERT INTO Dinner VALUES (32,110,'Sunday',8,3);
INSERT INTO Dinner VALUES (33,102,'Monday',12,3);
INSERT INTO Dinner VALUES (33,101,'Tuesday',12,4);
INSERT INTO Dinner VALUES (33,109,'Wednesday',9,1);
INSERT INTO Dinner VALUES (33,101,'Thursday',9,1);
INSERT INTO Dinner VALUES (33,107,'Friday',10,2);
INSERT INTO Dinner VALUES (33,112,'Saturday',10,3);
INSERT INTO Dinner VALUES (33,107,'Sunday',9,4);
INSERT INTO Dinner VALUES (34,103,'Monday',9,2);
INSERT INTO Dinner VALUES (34,113,'Tuesday',10,3);
INSERT INTO Dinner VALUES (34,110,'Wednesday',9,3);
INSERT INTO Dinner VALUES (34,102,'Friday',8,1);
INSERT INTO Dinner VALUES (35,113,'Monday',10,2);
INSERT INTO Dinner VALUES (35,104,'Tuesday',11,5);
INSERT INTO Dinner VALUES (35,104,'Wednesday',12,1);
INSERT INTO Dinner VALUES (35,112,'Friday',8,5);
INSERT INTO Dinner VALUES (35,113,'Saturday',8,4);
INSERT INTO Dinner VALUES (35,109,'Sunday',11,4);
INSERT INTO Dinner VALUES (36,104,'Monday',8,4);
INSERT INTO Dinner VALUES (36,105,'Tuesday',12,4);
INSERT INTO Dinner VALUES (36,103,'Wednesday',12,2);
INSERT INTO Dinner VALUES (36,113,'Saturday',11,1);
INSERT INTO Dinner VALUES (36,106,'Sunday',9,3);
INSERT INTO Dinner VALUES (37,104,'Thursday',12,3);
INSERT INTO Dinner VALUES (37,104,'Friday',12,4);
INSERT INTO Dinner VALUES (37,107,'Saturday',9,2);
INSERT INTO Dinner VALUES (37,104,'Sunday',11,5);
INSERT INTO Dinner VALUES (38,111,'Monday',8,3);
INSERT INTO Dinner VALUES (38,103,'Tuesday',10,5);
INSERT INTO Dinner VALUES (38,107,'Wednesday',8,4);
INSERT INTO Dinner VALUES (39,108,'Sunday',12,5);
INSERT INTO Dinner VALUES (39,107,'Monday',9,1);
INSERT INTO Dinner VALUES (39,105,'Tuesday',10,4);
INSERT INTO Dinner VALUES (39,102,'Friday',10,2);
INSERT INTO Dinner VALUES (40,108,'Sunday',10,1);
INSERT INTO Dinner VALUES (40,102,'Monday',11,2);
INSERT INTO Dinner VALUES (40,101,'Tuesday',12,4);
INSERT INTO Dinner VALUES (41,103,'Monday',11,3);
INSERT INTO Dinner VALUES (41,107,'Tuesday',10,1);
INSERT INTO Dinner VALUES (41,112,'Wednesday',11,5);
INSERT INTO Dinner VALUES (41,104,'Thursday',11,4);
INSERT INTO Dinner VALUES (41,112,'Friday',8,3);
INSERT INTO Dinner VALUES (41,108,'Saturday',8,4);
INSERT INTO Dinner VALUES (41,101,'Sunday',12,3);
INSERT INTO Dinner VALUES (42,104,'Tuesday',11,3);
INSERT INTO Dinner VALUES (42,111,'Wednesday',11,1);
INSERT INTO Dinner VALUES (42,101,'Thursday',8,2);
INSERT INTO Dinner VALUES (42,113,'Friday',10,2);
INSERT INTO Dinner VALUES (42,112,'Saturday',8,1);
INSERT INTO Dinner VALUES (43,104,'Monday',10,2);
INSERT INTO Dinner VALUES (43,113,'Tuesday',10,1);
INSERT INTO Dinner VALUES (43,107,'Wednesday',10,1);
INSERT INTO Dinner VALUES (43,110,'Friday',11,5);
INSERT INTO Dinner VALUES (43,107,'Saturday',8,4);
INSERT INTO Dinner VALUES (43,110,'Sunday',10,1);
INSERT INTO Dinner VALUES (44,105,'Monday',10,5);
INSERT INTO Dinner VALUES (44,107,'Tuesday',12,5);
INSERT INTO Dinner VALUES (44,111,'Wednesday',11,4);
INSERT INTO Dinner VALUES (44,111,'Friday',10,5);
INSERT INTO Dinner VALUES (44,105,'Saturday',12,2);
INSERT INTO Dinner VALUES (44,103,'Sunday',12,1);
INSERT INTO Dinner VALUES (45,105,'Monday',10,5);
INSERT INTO Dinner VALUES (45,108,'Tuesday',11,2);
INSERT INTO Dinner VALUES (45,101,'Wednesday',11,5);
INSERT INTO Dinner VALUES (45,107,'Thursday',8,5);
INSERT INTO Dinner VALUES (45,101,'Friday',9,3);
INSERT INTO Dinner VALUES (45,109,'Saturday',10,3);
INSERT INTO Dinner VALUES (45,104,'Sunday',11,2);
INSERT INTO Dinner VALUES (46,112,'Monday',9,5);
INSERT INTO Dinner VALUES (46,102,'Tuesday',9,4);
INSERT INTO Dinner VALUES (46,102,'Wednesday',10,1);
INSERT INTO Dinner VALUES (46,103,'Thursday',9,1);
INSERT INTO Dinner VALUES (46,113,'Friday',8,5);
INSERT INTO Dinner VALUES (47,104,'Monday',8,4);
INSERT INTO Dinner VALUES (47,109,'Tuesday',8,5);
INSERT INTO Dinner VALUES (47,102,'Wednesday',9,1);
INSERT INTO Dinner VALUES (47,110,'Thursday',9,1);
INSERT INTO Dinner VALUES (47,106,'Friday',11,2);
INSERT INTO Dinner VALUES (47,111,'Saturday',9,2);
INSERT INTO Dinner VALUES (48,108,'Monday',10,3);
INSERT INTO Dinner VALUES (48,111,'Tuesday',8,3);
INSERT INTO Dinner VALUES (48,103,'Wednesday',10,5);
INSERT INTO Dinner VALUES (48,105,'Friday',10,2);
INSERT INTO Dinner VALUES (48,101,'Saturday',9,2);
INSERT INTO Dinner VALUES (48,105,'Sunday',10,4);
INSERT INTO Dinner VALUES (49,106,'Monday',9,5);
INSERT INTO Dinner VALUES (49,112,'Tuesday',11,1);
INSERT INTO Dinner VALUES (49,111,'Wednesday',9,1);
INSERT INTO Dinner VALUES (49,107,'Friday',8,1);
INSERT INTO Dinner VALUES (49,108,'Saturday',8,4);
INSERT INTO Dinner VALUES (50,106,'Monday',9,4);
INSERT INTO Dinner VALUES (50,111,'Tuesday',10,3);
INSERT INTO Dinner VALUES (50,104,'Wednesday',8,5);
INSERT INTO Dinner VALUES (50,110,'Friday',12,3);
INSERT INTO Dinner VALUES (50,109,'Saturday',8,3);
INSERT INTO Dinner VALUES (50,101,'Sunday',12,3);
INSERT INTO Dinner VALUES (51,104,'Monday',12,3);
INSERT INTO Dinner VALUES (51,108,'Tuesday',11,5);
INSERT INTO Dinner VALUES (51,109,'Wednesday',9,4);
INSERT INTO Dinner VALUES (51,111,'Friday',12,5);
INSERT INTO Dinner VALUES (51,110,'Saturday',8,1);
INSERT INTO Dinner VALUES (51,110,'Sunday',10,1);
INSERT INTO Dinner VALUES (52,105,'Monday',12,1);
INSERT INTO Dinner VALUES (52,102,'Tuesday',12,1);
INSERT INTO Dinner VALUES (52,112,'Wednesday',12,4);
INSERT INTO Dinner VALUES (52,110,'Friday',12,5);
INSERT INTO Dinner VALUES (52,106,'Saturday',10,1);
INSERT INTO Dinner VALUES (52,113,'Sunday',12,2);
INSERT INTO Dinner VALUES (53,105,'Monday',9,3);
INSERT INTO Dinner VALUES (53,101,'Tuesday',12,1);
INSERT INTO Dinner VALUES (53,105,'Wednesday',8,5);
INSERT INTO Dinner VALUES (53,104,'Friday',11,2);
INSERT INTO Dinner VALUES (53,113,'Saturday',9,4);
INSERT INTO Dinner VALUES (53,103,'Sunday',9,3);
INSERT INTO Dinner VALUES (54,111,'Monday',12,3);
INSERT INTO Dinner VALUES (54,103,'Tuesday',12,2);
INSERT INTO Dinner VALUES (54,101,'Wednesday',12,1);
INSERT INTO Dinner VALUES (54,107,'Friday',12,3);
INSERT INTO Dinner VALUES (54,110,'Saturday',10,1);
INSERT INTO Dinner VALUES (54,111,'Sunday',12,5);
INSERT INTO Dinner VALUES (55,111,'Monday',9,5);
INSERT INTO Dinner VALUES (55,113,'Tuesday',12,5);
INSERT INTO Dinner VALUES (55,108,'Wednesday',8,1);
INSERT INTO Dinner VALUES (55,105,'Friday',11,2);
INSERT INTO Dinner VALUES (55,105,'Saturday',9,1);
INSERT INTO Dinner VALUES (55,106,'Sunday',9,4);
