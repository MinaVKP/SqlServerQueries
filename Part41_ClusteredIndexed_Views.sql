Alter view vWTotalProductSales
With SchemaBinding
as
Select Prod_Name, Sum(ISNULL((UnitPrice*QuantitySold),0)) as TotalSales, Count_Big(*) as TotalTransaction
from dbo.tblProducts
Join dbo.tblProductSales on dbo.tblProducts.ProdID = dbo.tblProductSales.ProdID
Group by Prod_Name;

Select * from vWTotalProductSales;

--Create Indexed View

Create Unique Clustered Index UIX_TotalProductSales
on vWTotalProductSales(Prod_Name);