--Create Table tblProductsSubQueries
--(
-- [Id] int identity primary key,
-- [Name] nvarchar(50),
-- [Description] nvarchar(250)
--)

--Create Table tblProductSalesSubQueries
--(
-- Id int primary key identity,
-- ProductId int foreign key references tblProductsSubQueries(Id),
-- UnitPrice int,
-- QuantitySold int
--)

--Insert into tblProductsSubQueries values ('TV', '52 inch black color LCD TV')
--Insert into tblProductsSubQueries values ('Laptop', 'Very thin black color acer laptop')
--Insert into tblProductsSubQueries values ('Desktop', 'HP high performance desktop')

--Insert into tblProductSalesSubQueries values(3, 450, 5)
--Insert into tblProductSalesSubQueries values(2, 250, 7)
--Insert into tblProductSalesSubQueries values(3, 450, 4)
--Insert into tblProductSalesSubQueries values(3, 450, 9)

Select * from tblProductsSubQueries;
Select * from tblProductSalesSubQueries;

--Write a query to retrieve products that are not at all sold?
--Using SubQuery

Select tblProductsSubQueries.Id , tblProductsSubQueries.Name, tblProductsSubQueries.Description from tblProductsSubQueries
where tblProductsSubQueries.Id not in ( Select Distinct ProductID from tblProductSalesSubQueries)

--SubQueriescan be replaced by joins
--using Joins

Select distinct tblProductsSubQueries.Id , tblProductsSubQueries.Name, tblProductsSubQueries.Description 
from tblProductsSubQueries
left join tblProductSalesSubQueries
on tblProductSalesSubQueries.ProductID=tblProductsSubQueries.Id
where tblProductSalesSubQueries.ProductID is null

--Write a query to retrieve the NAME and TOTALQUANTITY sold, using a subquery

Select Name, (Select Sum(QuantitySold) from tblProductSalesSubQueries where tblProductSalesSubQueries.ProductId = tblProductsSubQueries.Id) as TotalQty
from tblProductsSubQueries
order by Name


Select Name, Sum(QuantitySold) as TotalQty
from tblProductsSubQueries
left join tblProductSalesSubQueries
on tblProductSalesSubQueries.ProductID=tblProductsSubQueries.Id
group by Name