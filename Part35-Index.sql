--Index

--Create Index on Table Employee

use KUDVideosSQLServer;

create table tblEmp(ID int primary key,EmpName varchar(500),Gender varchar(500),Salary int);

Insert into tblEmp values(1,'Sam','Male',6700);
Insert into tblEmp values(1,'John','Male',7600);

select * from tblEmp;

Create Index IX_tblEmp_Salary
on tblEmp (Salary Asc);

Drop index tblEmp.IX_tblEmp_Salary;

--Index Constraint
Alter table tblEmp
ADD constraint UIX_Emp_IDName
unique clustered (ID, EmpName);

execute sp_Helpindex tblEmp;