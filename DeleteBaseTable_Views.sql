create table tblDept(id int, dept_name varchar(50));

insert into tblDept values (1,'Tranportation');
insert into tblDept values (2,'Human REsources');

Select id, dept_name from tblDept;

Create view vwDept
with schemabinding
as
Select id, dept_name from dbo.tblDept;

Select * from vwDept;

Drop table tblDept;