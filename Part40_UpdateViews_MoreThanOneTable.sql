Select * from tblEmployee;
Select * from tblDepartment;
select * from vWEmployees_byDepartment_UpdateCorrectly;


Alter view vWEmployees_byDepartment
as
Select EmpID, Name, Gender, Salary, Department_Name
From tblEmployee
Inner join tblDepartment 
on tblEmployee.DeptID=tblDepartment.DeptId;

Select * from vWEmployees_byDepartment;

Update vWEmployees_byDepartment
Set Department_Name='Information Technology' where Name='Sammy';

--Views can be updated using SchemBindingOption

Create view vWEmployees_byDepartment_UpdateCorrectly
with SchemaBinding
as
Select EmpID, Name, Gender, Salary, Department_Name
From dbo.tblEmployee
Inner join dbo.tblDepartment 
on dbo.tblEmployee.DeptID=dbo.tblDepartment.DeptId;

select * from vWEmployees_byDepartment_UpdateCorrectly;

Update vWEmployees_byDepartment
Set Department_Name='HR' where Name='Sammy';