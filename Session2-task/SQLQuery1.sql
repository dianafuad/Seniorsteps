/*
Students, Courses and Tutors Scenario

The following data model is designed to hold information relating to Students, Student Courses and Tutors who deal with these students. For this scenario we need to define the following facts:

These facts define the requirements which the Database must meet and should be agreed between the Database User and the Database Designer prior to physical creation.

The draft facts have been defined as:

The Entities required should include:

Student Information
Courses
Student Courses
Employees (Tutors)
Contact Information (Contact between the Student and the Tutor by e-mail, phone, projects etc.)
Contact Types (e-mail, phone, projects, assessments)
The Entities are related as follows:

-One Student can enroll on One or Many Courses
-One Course can have One or Many Students enrolled on it.
-One Student can have zero, one or many forms of Contact with the Course Tutor
-One Employee (Tutor) can deal with many Contacts
One Contact Type (Phone, E-mail, Assessments, Projects etc.) can have zero, one or many Contacts
*/

create database CoursesCenter
USE CoursesCenter

create table Tutor(
 Id  int Primary key identity(1,1),
 Name nvarchar(50)
)


create table ContactType(
 Id  int Primary key identity(1,1),
 Name nvarchar(50)
)

create table Student(
 Id  int Primary key identity(1,1),
 Name nvarchar(50)

)
create table Course(
 Id  int Primary key identity(1,1),
 Name nvarchar(50)

)
create table Contact(
 Id  int Primary key identity(1,1),
 ContactTypeId int,
 TutorId int,
 StudentId int,
 FOREIGN KEY ( ContactTypeId) REFERENCES ContactType ( Id),
 FOREIGN KEY ( TutorId) REFERENCES Tutor ( Id),
  FOREIGN KEY (  StudentId) REFERENCES  Student ( Id),
)

create table Students_Courses(

 StudentId int,
 CourseId int,
 FOREIGN KEY (  StudentId) REFERENCES  Student ( Id),
 FOREIGN KEY (  CourseId) REFERENCES  Course ( Id),
 PRIMARY KEY (StudentId, CourseId) 
)
--******************************************************
--- Test Your Scenario (T-sql "Insert - Select")
insert into Tutor (Name) values ('ahmed ali'),
                                ('diana fuad'),
								('hamza rabie')
insert into ContactType (Name) values ('e-mail'),('phone'),(' projects'),('assessments')
insert into Student (Name) values ('Rania sameer'),
                                ('Abdulrahman ali'),
								('Habeba hasan'),
								('Sara Tamer');

insert into Contact ( ContactTypeId,TutorId,StudentId) values (4,2,2),
                                                               (2,1,3),
															   (2,3,1),
															   (3,3,4);

insert into Course(Name) values ('Front End'),
                                ('Back End'),
								('Full Stack'),
								('Python');

insert into [dbo].[Students_Courses] values (1,2),
                                            (1,4),
											(2,1),
											(2,3),
											(3,2),
											(3,3),
											(4,1),
											(4,4)
--******************************************************

