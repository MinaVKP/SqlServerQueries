use KUDVideosSQLServer

SELECT EmpID, Name, Salary, Gender, DeptID
FROM     tblEmployee
Select * from tblDepartment;

--Create view
Alter view vWEmployees_Details
as
Select EmpID, Name, Salary,Gender, Department_Name from tblEmployee
Join tblDepartment
on tblEmployee.DeptID = tblDepartment.DeptId;

--Retrieve Data from View
Select * from vWEmployees_Details;

Update vWEmployees_Details
set Department_Name='Billing'
where [Name]='Sam'

Update tblDepartment
set Department_Name='Human Resources' where DeptId=1;

Select * from tblDepartment
--Views are updateable
Update vWEmployees_Details
Set Name='Sammy' where EmpId=1

--Delete from Views
Delete from vWEmployees_Details
where EmpID=2;

--Insert into Views
Insert into vWEmployees_Details values (8,'Dino',4500,'M',4);




Create View vWEmployeeExcept_Salary
as
Select EmpID,Name,Gender,DeptID
From tblEmployee

Select * From vWEmployeeExcept_Salary

Delete from vWEmployeeExcept_Salary where EmpID=2;

Insert into vWEmployeeExcept_Salary values(2,'john','M',2)



