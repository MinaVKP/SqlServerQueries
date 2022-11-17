use KUDVideosSQLServer;
--Clustered Index determines the physical order in which the records are stored

drop table tblEmployee;

--automatically creates a clustered index on tblEmployee table with index on ID column since ID column is mentioned as primary key

Create table tblEmployee
(
	ID int Primary Key,
	Name nvarchar(50),
	Salary int,
	Gender nvarchar(10),
	City nvarchar(50)
);

-- Check if a table has a clustered index
-- 1. using query

Execute sp_helpindex tblEmployee;

-- 2. check the object explorer
		-- Expand tables and click on desired table and then click on indexes

--To create a clustered index
--using a query

create clustered index IX_tblEmployee_Gender_Salary
on tblEmployee (Gender, Salary)

--a table can have only one clustered index since Clustered indexes affect the physical order of the table
-- if there are more than one clustered index, it messes up the order of the data

