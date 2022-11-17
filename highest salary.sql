/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[Name]
      ,[Salary]
      ,[Gender]
      ,[DepartmentID]
  FROM [KUDVideosSQLServer].[dbo].[tblEmployee_Triggers]

  --Max Salary
  Select top 1 EmployeeID, Name, Salary
  from tblEmployee_Triggers
  order by salary desc

  --Next to max salary
  select Min(Salary)
  from tblEmployee_Triggers
  where Salary in (Select top 3 Salary from tblEmployee_Triggers order by salary desc)
  --Group by Salary

  Select EmployeeID, Name, Salary
  from tblEmployee_Triggers
  order by salary desc