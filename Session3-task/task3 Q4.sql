

--1)Write code to Create view with name (display_all_data)
--to display all data to all columns in all tables?
USE company
create view display_all_data
as
select emp.Name empName ,dept.Name DeptName,proj.Name Project,
       dist.Name District ,city.Name City,country.Name country
from [dbo].[Employee] emp inner join [dbo].[Department] dept
on emp.DeptId=dept.Id

inner join [dbo].[ProjectEmployee] projEmp
on emp.Id=projEmp.EmployeeId

inner join [dbo].[Project] proj
on proj.Id=projEmp.ProjectId

inner join [dbo].[District] dist
on emp.DistrictId=dist.Id

inner join [dbo].[City] city
on dist.CityId = city.Id

inner join [dbo].[Country] country
on city.CountryId=country.Id




select * from [dbo].[display_all_data]

go
--------------------------------------------
--2)Write code to Create Procedure with name (Country_proc) to
--execute insert ,update, delete and select.



alter proc [dbo].[Country_proc]

@operation int=1 , @id int = 0,@CountryName nvarchar(50)=''
as
if(@operation=1)
begin
select * from Country
where Id = @id
end

if(@operation=2)
begin
insert into Country (Name) values (@CountryName)

end

if(@operation=3)
begin


update Country
set Name = @CountryName 
where Id = @id


end



if(@operation=4)
begin

delete from Country
where Id = @id

end

exec Country_proc 1, 2    --select
exec  Country_proc 2,0,'USA'  --insert
exec Country_proc 3,3,'India' -- update
exec Country_proc  4,3,'' --delete

select* from Country


---------------------------------
/*3) Write code to Create view with name (department_empcount_projectcount) 
to display  Departmentname ,count of employees  , total salary  and count of projects
for this department

*/

select dept.Name [Department Name],count(emp.Id)[count of employees],sum(emp.Salary) [Total Salary],count(proj.ProjectId)[Number of Projects]
from employee emp inner join Department dept
on emp.DeptId=dept.Id
inner join [dbo].[ProjectEmployee] proj
on emp.Id=proj.EmployeeId
group by dept.Name

go
----------------------------------
--4)Design  Logdata table and write Structure for this table.


create table Dept_Logdataa(
Id int primary key identity(1,1),
ColumnName nvarchar(50),
ActionType nvarchar(50),
OldValue nvarchar(50),
NewValue nvarchar(50)

)
-----------------------------------------

--5)Create trigger on Department  for insert data to Logdata  after updat



go 
create trigger T1 on [dbo].[Department]
after update
as

declare @oldName nvarchar(50) = (select Name from deleted)
declare @newName nvarchar(50) = (select Name from inserted)


insert into [dbo].[Dept_Logdataa] ([ColumnName],[ActionType],[OldValue],[NewValue]) values
('Name' , 'Update' , @oldName , @newName )






update [dbo].[Department]
set Name = 'Finance' 
where Id = 3















Design  Logdata table and write Structure for this table.