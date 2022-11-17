alter trigger tr_vwEmployee_Triggers_InsteadofDeleteP
on vwtblEmployee_Triggers
Instead of delete
as
begin
		delete tblEmployee_Triggers
		from tblEmployee_Triggers
		join deleted
		on tblEmployee_Triggers.EmployeeID=deleted.EmployeeID
		
		
		select * from deleted
End


delete from vwtblEmployee_Triggers where EmployeeID=10

select * from tblEmployee_Triggers
select *from tblDepartment
