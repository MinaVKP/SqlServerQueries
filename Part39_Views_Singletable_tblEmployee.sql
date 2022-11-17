--Views

Alter view vWEmployee_Details
as
Select EmpID, Name, Salary, Gender,DeptID
From tblEmployee;

Select * from vWEmployee_Details;

Update  vWEmployee_Details
set Salary=7500 where Name ='John';

Delete from vWEmployee_Details
where EmpID=2

Insert into vWEmployee_Details values(2,'John',7500,'M');


Update  vWEmployee_Details
set DeptID=2 where Name ='John';