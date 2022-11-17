/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [KUDVideosSQLServer].[dbo].[tblEmp]

  delete from tblEmp where EmpName='Sam'

  alter table tblEmp 
  add constraint PK_Emp_ID primary key(ID) 

  alter table tblEmp
  add DeptID int
  Update tblEmp set DeptID=1 where ID=1
  Insert into tblEmp values(2,'Sam','Male',3500,1);
    Insert into tblEmp values(3,'Todd','Male',4500,2);
	  Insert into tblEmp values(4,'Mike','Male',2500,3);
	    Insert into tblEmp values(5,'Pam','Female',2700,4);
		  Insert into tblEmp values(6,'Ben','Male',3900,3);
 