use KUDVideosSQLServer;

create table tblProducts
(
	ProdID int primary key,
	Prod_name varchar(500),
	UnitPrice int
)

Insert into tblProducts values(1,'Books',20);
Insert into tblProducts values(2,'Pens',14);
Insert into tblProducts values(3,'Pencils',11);
Insert into tblProducts values(4,'Cups',10);

Select * from tblProducts;

Create table tblProductSales
(
	ProdID int Foreign Key,
	QuantitySold int
)



Alter Table tblProductSales
ADD Foreign key(ProdID) references tblProducts(ProdID);

Insert into tblProductSales values(1,10);
Insert into tblProductSales values(3,23);
Insert into tblProductSales values(4,21);
Insert into tblProductSales values(2,12);
Insert into tblProductSales values(1,13);
Insert into tblProductSales values(3,12);
Insert into tblProductSales values(4,13);
Insert into tblProductSales values(1,11);
Insert into tblProductSales values(2,12);
Insert into tblProductSales values(1,14);

Delete from tblProductSales;
Select * from tblProductSales