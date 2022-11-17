SET Identity_Insert ON;
create table tblAudit
(
	ID int IDENTITY(1,1) primary key,
	AuditData nvarchar(100)
	)


select * from tblEmployee_Triggers;
Select * from tblAudit;

sp_HelpIndex tblEmployee_Triggers;

--FOR INSERT Triggers--

Alter Trigger tr_tblEmployee_triggers_ForInsert
ON tblEmployee_Triggers
FOR Insert
AS
Begin
	Select * from inserted;

	--Declare @ID int
	--Select @ID=EmployeeID from inserted;
	--Insert into tblAudit(AuditData) values ('New Employee with ID = ' + cast(@ID as nvarchar(20)) + ' has been inserted at ' + cast(GETDATE() as nvarchar(100)));
		
End


Insert into tblEmployee_Triggers values (19,'Mary',3700,'Female',4);

--For Delete Triggers--

Alter Trigger tr_tblEmployee_Triggers_ForDelete
on tblEmployee_Triggers
FOR Delete
as
Begin
	
	Select * from deleted;
	Declare @ID int;

	Select @ID=EmployeeID from deleted

	Insert into tblAudit(AuditData) values ('A Record with ID = ' + cast(@ID as nvarchar(20)) + ' has been deleted at ' + CAST(GetDate() as nvarchar(50)))

End

--Delete Stmt--
Delete from tblEmployee_Triggers
Where EmployeeID=8;
