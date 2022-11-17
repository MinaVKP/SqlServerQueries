--Options for views

select * from tblEmp
Select * from tblDept

--Create view
alter view vwTotalEmployee
as
Select tblDept.DeptName, tblEmp.DeptID, Count(*) as TotalEmployees
from tblEmp
join tblDept
on tblEmp.DeptID=tblDept.DeptID
group by tblDept.DeptName, tblEmp.DeptID

--Select from view
Select DeptName,TotalEmployees
from vwTotalEmployee
where TotalEmployees>=2



--Temporary Table

Select DeptName, tblEmp.DeptID, Count(*) as TotalEmployees
into #tempEmployeeCountbyDepartment
from tblEmp
join tblDept
on tblEmp.DeptID=tblDept.DeptID
Group by tblDept.DeptName,tblEmp.DeptID

--Select from temptable
Select DeptName,TotalEmployees from #tempEmployeeCountbyDepartment
where TotalEmployees>=2

Drop Table #tempEmployeeCountbyDepartment



--Table Variable
Declare @tblEmployeeCount table (DeptName nvarchar(50), DeptID int, TotalEmployees int)


Insert @tblEmployeeCount
Select tblDept.DeptName, tblEmp.DeptID, Count(*) as TotalEmployees
from tblEmp
join tblDept
on tblEmp.DeptID = tblDept.DeptID
Group by tblDept.DeptName,tblEmp.DeptID

--Select from table variable
Select DeptName, TotalEmployees
from @tblEmployeeCount
where TotalEmployees>=2

--Derived Table
Select DeptName, TotalEmployees
from
(
		Select DeptName, tblEmp.DeptID, Count(*) as TotalEmployees
		from tblEmp
		join tblDept
		on tblEmp.DeptID=tblDept.DeptID
		Group by tblDept.DeptName,tblEmp.DeptID
)
as EmployeesCount  --derived Table
where TotalEmployees>=2



