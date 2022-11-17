
--Left outer self join
select Employee.EmpName as EmployeeName, Employee.ManagerId, Manager.EmpName as ManagerName
from tblEmployees_Mgr as Employee
left join tblEmployees_Mgr as Manager
on Employee.ManagerId=Manager.EmployeeId


--Uses Self joins
With Employee_Details
as
(
	select Employee.EmpName as EmployeeName, Employee.ManagerId, Manager.EmpName as ManagerName
	from tblEmployees_Mgr as Employee
	left join tblEmployees_Mgr as Manager
	on Employee.ManagerId=Manager.EmployeeId

)
select * from Employee_Details;

--Recursive CTE's
With EmployeeCTE (EmployeeId, [Name], ManagerId, [Level])
as
(
	Select Employee.EmployeeId, Employee.[EmpName], Employee.ManagerId, 1 as Level
	from tblEmployees_Mgr as Employee
	where ManagerId is null

	union all

	Select Employee.EmployeeId, Employee.EmpName, Employee.ManagerId, EmployeeCTE.[Level]+1
	from tblEmployees_Mgr as Employee
	join EmployeeCTE 
	on Employee.ManagerId = EmployeeCTE.EmployeeId			

)

Select EmpCTE.Name, IsNull(MgrCTE.Name,'Super Boss') as Manager, EmpCTE.Level
from EmployeeCTE EmpCTE
left join EmployeeCTE MgrCTE
on EmpCTE.ManagerId = MgrCTE.EmployeeId

