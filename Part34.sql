--Create Local Temporary Table

Create Table #PersonDetails(ID int, Name varchar(100));

Select * from #PersonDetails;


Alter Procedure sp_Employee_byDepartment
as
Begin
	Select EmpID,Gender,Department_Name into #EmployeeDetails
	from tblEmployee 
	inner join tblDepartment
	on tblEmployee.DeptID = tblDepartment.DeptId

	Select * from #EmployeeDetails;
End


Exec sp_Employee_byDepartment;

Select * from #EmployeeDetails;