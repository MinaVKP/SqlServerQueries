Create table tblEmployees_Mgr
(

		EmployeeId int primary key,
		EmpName varchar(100),
		ManagerId int

)

insert into tblEmployees_Mgr values(1,'Tom',2)
insert into tblEmployees_Mgr values(2,'Josh',Null)
insert into tblEmployees_Mgr values(3,'Mike',2)
insert into tblEmployees_Mgr values(4,'John',3)
insert into tblEmployees_Mgr values(5,'Pam',1)
insert into tblEmployees_Mgr values(6,'Mary',3)
insert into tblEmployees_Mgr values(7,'James',1)
insert into tblEmployees_Mgr values(8,'Sam',5)
insert into tblEmployees_Mgr values(9,'Simon',1)

select * from tblEmployees_Mgr;