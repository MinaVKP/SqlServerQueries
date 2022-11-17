--Common Table Expressions
--Alternative to Views that are used once

Select * from tblEmp;
Select * from tblDept;

With EmployeeCount(DepartmentID, TotalEmployees)
as
(
	Select DepartmentID, Count(*) as TotalEmployees
	from tblEmp
	group by DepartmentID

)

Select DeptName, TotalEmployees
from EmployeeCount
join tblDept
on DepartmentID=DeptID
order by TotalEmployees

--where TotalEmployees>=2

--Part50

--Updatable CTE
--Update affects single base table

With Employee_Details
as
(
		Select Id, EmpName, Gender, Salary, DeptName
		from tblEmp
		join tblDept
		on tblEmp.DepartmentID=tblDept.DeptID

)
--Select * from Employee_Details

Update Employee_Details
set EmpName='Mikey', Salary=3000 where ID=4


--Updating CTE which has multiple base tables
--Update 
With EmployeeDetails
as
(	
		Select Id, EmpName, Gender, Salary, DeptName
		from tblEmp
		join tblDept
		on tblEmp.DepartmentID=tblDept.DeptID

)
Update EmployeeDetails 
set EmpName='Sammy', Gender='Female', DeptName='Information Technology' where Id=2

--Update CTE which affects only one base table but is based on two base tables
With EmployeeDetails
as
(	
		Select Id, EmpName, Gender, Salary, DeptName
		from tblEmp
		join tblDept
		on tblEmp.DepartmentID=tblDept.DeptID

)
select * from EmployeeDetails

Update EmployeeDetails 
set DeptName='Information Technology' where Id=1

--update tblDept
--set DeptName='Transportation' where DeptID=1


Select * from tblEmp;
Select * from tblDept;




