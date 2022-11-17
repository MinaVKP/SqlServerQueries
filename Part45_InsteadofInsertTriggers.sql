create table tblDepartment_Triggers
(
DeptID int primary key,
DeptName varchar(100)
)


Insert into tblDepartment_Triggers values(1,'Information Technology');
Insert into tblDepartment_Triggers values(2,'Transportation');
Insert into tblDepartment_Triggers values(3,'Human Resources');
Insert into tblDepartment_Triggers values(4,'Billing');

--Create view on tblEmployee_Triggers and tblDepartment_Triggers tables
create view vwtblEmployee_Triggers
as
	select EmployeeID, Name, Salary,Gender,DeptName 
	from tblEmployee_Triggers 
	join tblDepartment_Triggers
	on tblEmployee_Triggers.DepartmentID = tblDepartment_Triggers.DeptID

Select * from vwtblEmployee_Triggers;

--Create Instead of Insert trigger
Alter trigger tr_tblEmployee_Triggers_InsteadofInsert
on vwtblEmployee_Triggers
Instead of Insert
as
Begin
	--Select * from inserted;
	--Select * from deleted;

	Declare @DeptID int;
	--Select DeptID from inserted
	Select @DeptID=DeptID 
	from tblDepartment_Triggers
	join inserted 
	on tblDepartment_Triggers.DeptName=inserted.DeptName

	--Raise error if DeptID not found in tblDepartment table
	if (@DeptID is null)
	Begin
		Raiserror('DeptID not found. Statement terminated',16,1)
		Return
	End

	--Finally Select from inserted and insert into tblEmployee_Triggers
	Insert into tblEmployee_Triggers(EmployeeID,Name,Salary,Gender,DepartmentID)
	Select EmployeeID,Name,Salary,Gender,@DeptID from inserted

End


--Insert statement to insert record into view vwtblEmployee_Triggers
--Insert record through views
Insert into vwtblEmployee_Triggers values(11,'Prak',4500,'F','Human Resources');