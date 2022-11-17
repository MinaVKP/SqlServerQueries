create table tblProductSalesPivot
(
	SalesAgent varchar(100),
	SalesCountry varchar(100),
	SalesAmount int


)

alter table tblProductSalesPivot
alter column SalesAmount int

create table tblProductSalesPivotID
(
	ID int primary key not null,
	SalesAgent varchar(100),
	SalesCountry varchar(100),
	SalesAmount int
	
)
select * from tblProductSalesPivotID


Insert into tblProductSalesPivotID values(1,'Tom','UK',200);
Insert into tblProductSalesPivotID values(2,'John','US',180);
Insert into tblProductSalesPivotID values(3,'John','UK',260);
Insert into tblProductSalesPivotID values(4,'David','India',450);
Insert into tblProductSalesPivotID values(5,'Tom','India',350);
Insert into tblProductSalesPivotID values(6,'David','US',200);
Insert into tblProductSalesPivotID values(7,'Tom','US',130);
Insert into tblProductSalesPivotID values(8,'John','India',540);
Insert into tblProductSalesPivotID values(9,'John','UK',120);
Insert into tblProductSalesPivotID values(10,'David','UK',220);
Insert into tblProductSalesPivotID values(11,'John','UK',420);
Insert into tblProductSalesPivotID values(12,'David','US',320);
Insert into tblProductSalesPivotID values(13,'Tom','US',340);
Insert into tblProductSalesPivotID values(14,'Tom','UK',660);
Insert into tblProductSalesPivotID values(15,'John','India',430);
Insert into tblProductSalesPivotID values(16,'David','India',230);
Insert into tblProductSalesPivotID values(17,'David','India',280);
Insert into tblProductSalesPivotID values(18,'Tom','UK',480);
Insert into tblProductSalesPivotID values(19,'John','US',360);
Insert into tblProductSalesPivotID values(20,'David','UK',140);


--Pivottable

Select SalesAgent,India,UK,US
from
(
	Select SalesAgent,SalesCountry,SalesAmount
	from tblProductSalesPivot
) as Sourcetable
Pivot
(
	Sum(SalesAmount) 
	For SalesCountry
	in (India,UK,US)
) as PivotTable

--If tblProductPivot has columns like ID

Select SalesAgent, India,UK,US from tblProductSalesPivotID
Pivot
(
	Sum(SalesAmount) 
	For SalesCountry
	in (India,UK,US)
) as PivotTable

--Then use derived table
Select SalesAgent, India,UK,US from 
( 
	Select SalesAgent, SalesCountry, SalesAmount
	from tblProductSalesPivotID

) as SourceTable
Pivot
(
	Sum(SalesAmount)
	for SalesCountry
	in (India,UK, US)
)
as PivotTable

