create trigger tr_tblEmployee_Triggers_Forupdate_Practice
on tblEmployee_Triggers
for Update
as
begin
		declare @id int
		declare @oldname nvarchar(50), @newname nvarchar(50)
		declare @oldSalary nvarchar(50), @newSalary nvarchar(50)
		declare @oldgender nvarchar(50), @newgender nvarchar(50)
		declare @oldDeptID nvarchar(50), @newDeptID nvarchar(50)
		
		declare @AuditString nvarchar(max)


		select * into #temptable from inserted

		While(Exists(Select EmployeeID from #temptable))
		begin
		
				set @AuditString=''


				select top 1 @id=EmployeeID, @newname=Name,@newSalary=Salary,@newgender=Gender,@newDeptID=DepartmentID from #temptable

				select @oldname=Name, @oldSalary=Salary,@oldgender=Gender,@oldDeptID=DepartmentID from deleted where EmployeeID=@id

				--Build AuditString Value with changed values
		Set @AuditString = @AuditString +  'Employee with ID ' + cast(@ID as nvarchar(50)) + ' changed '

		--Compare values from Temp and deleted Table
		if(@oldname<>@newname)
			Set @AuditString = @AuditString + 'Name from ' + @oldname + ' to ' + @newname 

		if(@oldSalary<>@newSalary)
			Set @AuditString = @AuditString + ' ,Salary from ' + @oldSalary + ' to ' + @newSalary

		if(@oldgender<>@newgender)
			Set @AuditString = @AuditString + ' ,Gender from ' + @oldgender + ' to ' + @newgender

	    if(@oldDeptID<>@newDeptID)
			Set @AuditString = @AuditString + ' ,DepartmentID from ' + @OldDeptID + ' to ' + @NewDeptID
	
			

--Insert changed values to AuditTable
Insert into tblAudit(AuditData) values (@AuditString  +' at '+ cast(GETDATE() as nvarchar(100)))

--Delete record from Temptable
Delete from #temptable where EmployeeID=@ID
End
End

select * from tblAudit


update tblEmployee_Triggers 
set name='Harry'where EmployeeID =4









