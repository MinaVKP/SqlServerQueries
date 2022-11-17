
Select * from tblEmployee_Triggers;
Select * from tblAudit;

--Update DML Trigger--

Alter trigger tr_tblEmpployee_triggers_Update
on tblEmployee_Triggers
FOR Update
as
Begin
		Declare @ID int, @NewName varchar(50), @NewSalary varchar(50),@NewGender varchar(50), @NewDeptID int;
		Declare @OldName varchar(50), @OldSalary varchar(50),@OldGender varchar(50), @OldDeptID int;
		Declare @AuditString nvarchar(1000);
		Set @AuditString = '';

		--Make copy of 'inserted' table to temptable
		Select * into #temptable from inserted;

		--Select latest value from temptable 
		--Assign values to New variables
		Select TOP 1 @ID=EmployeeID, @NewName=Name, @NewSalary=Salary, @NewGender=Gender, @NewDeptID=DepartmentID 
		from #temptable

		--Select values from deleted table and assign to OLD variables
		Select @OldName=Name, @OldSalary=Salary, @OldGender=Gender, @OldDeptID=DepartmentID
		from deleted where EmployeeID=@ID

		--Build AuditString Value with changed values
		Set @AuditString = @AuditString +  'Employee with ID ' + cast(@ID as nvarchar(50)) + ' changed '

		--Compare values from Temp and deleted Table
		if(@OldName<>@NewName)
			Set @AuditString = @AuditString + 'Name from ' + @OldName + ' to ' + @NewName 

		if(@OldSalary<>@NewSalary)
			Set @AuditString = @AuditString + ' ,Salary from ' + @OldSalary + ' to ' + @NewSalary

		if(@OldGender<>@NewGender)
			Set @AuditString = @AuditString + ' ,Gender from ' + @OldGender + ' to ' + @NewGender

	    if(@OldDeptID<>@NewDeptID)
			Set @AuditString = @AuditString + ' ,DepartmentID from ' + @OldDeptID + ' to ' + @NewDeptID

			

--Insert changed values to AuditTable
Insert into tblAudit(AuditData) values (@AuditString  +' at '+ cast(GETDATE() as nvarchar(100)))

--Delete record from Temptable
Delete from #temptable where EmployeeID=@ID

End

Update tblEmployee_Triggers
Set Name='Molly',Salary=5500 where EmployeeID=7
