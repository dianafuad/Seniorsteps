/*create a university database to manage tasks between teachers and students, where teachers data include (TName,TSalary,TGender, TBirthdate,TAddress , TAge)
and students data (StdName,StdGender,StdBirthdate,StdAddress , StdAge),
every Entity have a unique id 
=====================
using T-sql :
============*/
--- create database for this scenario
create database univarsity
use univarsity

-- create tables for each Entity
CREATE TABLE student(
	SID int PRIMARY KEY IDENTITY(1,1) ,
	StdName nvarchar(20),
	StdGender bit,
	StdBirthdate date ,
	StdAddress nvarchar(max) ,
       StdAge int
	)

	CREATE TABLE teachers(
	TID int PRIMARY KEY IDENTITY(1,1),
	TName nvarchar(20) ,
	TGender BIT,
	 TSalary decimal,
     TBirthdate date ,
	 TAddress nvarchar(max) ,
	 TAge   int 
	)
--- insert 6 Rows for each Entity 
INSERT [dbo].[student] ( [StdName], [StdGender], [StdBirthdate], [StdAddress], [StdAge]) VALUES 
('abdallah', 0, '2005-05-25', 'cairo', 17),
 ( 'anas', 0, '2006-08-02', 'cairo', 16),
  ( 'sara', 1, '2005-05-25', 'giza', 17),
 ('aser', 0, '2006-09-09', 'cairo', 16),
 ('aya', 1, '2005-12-19' , 'cairo', 17),
('gamal', 0, '2005-08-07', 'giza', 17)

INSERT [dbo].[teachers] ([TName], [TGender], [TSalary], [TBirthdate], [TAddress], [TAge]) VALUES 
('hamza', 0, 5500.0000, '1988-08-02' , 'cairo', 33),
 ('MOHAMMED', 0, 7000.0000, '1980-05-25', 'cairo', 41),
 ('ahmed', 0, 5000.0000, '1980-09-09', 'cairo', 41),
 ('mona', 1, 6600.0000, '1980-12-19', 'cairo', 41),
 ('soha', 1, 9000.0000, '1970-08-07' , 'Rehab', 51),
 ('nana', 1, 5000.0000, '1980-05-25', 'cairo', 41)

 --- update student name at id 1 to ' StdName '
 update  [dbo].[student]
 set StdName='StdName'
 where [SID]=1

 --- update Teacher name at id 5 to ' TechName'
  update  [dbo].[teachers]
 set [TName]='TechName'
 where [TID]=5

 -- Delete Rocord number 6 at each Entity (Student and Teacher)
 delete from [dbo].[student]
 where [SID]=6

  delete from [dbo].[teachers]
 where [TID]=6

-- Select All From Teacher 
Select * From [dbo].[teachers]

--- Select StdName,StdGender From Student
Select StdName,StdGender From Student