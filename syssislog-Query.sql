/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[event]
      ,[computer]
      ,[operator]
      ,[source]
      ,[sourceid]
      ,[executionid]
      ,[starttime]
      ,[endtime]
      ,[datacode]
      ,[databytes]
      ,[message]
  FROM [VinayTechSolutions].[dbo].[sysssislog]

  delete from [VinayTechSolutions].[dbo].[sysssislog]