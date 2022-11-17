--View Limitations
--1. Cannot create Parameterized Views

Create view vwEmployee_byGender
--@Gender nvarchar(20);
as
Select EmpId, Name, Gender, Department_Name from dbo.tblEmployee
join dbo.tblDepartment on dbo.tblEmployee.DeptID = dbo.tblDepartment.DeptId
--Where Gender= @Gender;

Select * from vwEmployee_byGender where Gender='M'

--Use Where Clause to filter rows

--Use Functions as a Replacement to Parameterized Views

Create Function fnEmployeebyGender(@Gender nvarchar(20))
Returns Table
as
Return
Select EmpId, Name, Gender, Department_Name from dbo.tblEmployee
join dbo.tblDepartment on dbo.tblEmployee.DeptID = dbo.tblDepartment.DeptId
Where Gender = @Gender;


Select * from fnEmployeebyGender('M');

--Cannot be based on Temporary tables

Drop table ##Temp_Employee;

Create table ##Temp_Employee
(
	EmpID int Primary Key,
	Name varchar(100),
	Gender varchar(50),
	Salary int, DeptID varchar(50)

	)

Insert into ##Temp_Employee values(1,'Sam','Male',7000,1);
Insert into ##Temp_Employee values(3,'Johnny','Male',6520,2);
Insert into ##Temp_Employee values(4,'Else','Female',4500,3);
Insert into ##Temp_Employee values(2,'Emily','Female',5700,4);


Select * from ##Temp_Employee;

Create view vwEmployeebyGender
as
Select EmpID, Name, Gender, Salary
from ##Temp_Employee
