----Create tblProductsErrorHandling
--create table tblProductsErrorHandling
--(
--	ProductID int primary key,
--	ProdName varchar(100),
--	UnitPrice int,
--	QtyAvailable int
--)

--Insert into tblProductsErrorHandling values (1,'Laptop',2340,100)
--Insert into tblProductsErrorHandling values (2,'Desktop',5540,50)

--create table tblProductSalesErrorHandling
--(
--	ProductSalesID int primary key,
--	ProductID int,
--	QtySold int

--)


select * from tblProductsErrorHandling;
select * from tblProductSalesErrorHandling;
 
 Update tblProductsErrorHandling set QtyAvailable=90 where ProductID=1
 Update tblProductsErrorHandling set QtyAvailable=50 where ProductID=2
Delete from tblProductSalesErrorHandling where ProductSalesID=0

Execute spProductSales 2,5

--StoredProcedure

Alter procedure spProductSales
@ProductId int , @QtySold int
as
Begin
Declare @StockAvailable int 

--Check if Stock is available

Select @StockAvailable=QtyAvailable from tblProductsErrorHandling where ProductID=@ProductId;

if(@StockAvailable<@QtySold)
Begin
	Raiserror('Not enough Stock',16,1)
End
else
	Begin
		Begin Tran
			--Update tblProductsErrorHandling 
			Update tblProductsErrorHandling 
			set QtyAvailable=QtyAvailable-@QtySold where ProductID=@ProductId;

			--Compute ProductSalesID for tblProductSalesErrorHandling
			Declare @MaxProductSalesID int;

			select @MaxProductSalesID = case when Max(ProductSalesID) is null 
											then 0 else Max(ProductSalesID)
									 end 
			from tblProductSalesErrorHandling;

			Set @MaxProductSalesID = @MaxProductSalesID+1;

			--Insert into tblProductSalesErrorHandling
			Insert into tblProductSalesErrorHandling values(@MaxProductSalesID,@ProductId,@QtySold);
			if(@@ERROR<>0)
			Begin
				Rollback tran
				Print 'Transaction Rolledback'
			End
			else
			Begin
				Commit tran
				Print 'Transaction Committed'
			End
	End
End




--Drawback of @@ERROR
Insert into tblProductsErrorHandling values(2,'Iphone',1399,70);
select * from tblProductsErrorHandling
if(@@Error<>0)
Print 'Error Occured'
else
Print 'Successfully inserted'

select * From tblProductsErrorHandling
Select * from tblProductSalesErrorHandling


--Rectify either capturing @@ERROR to a avariable or check immediately after the statement that is verified

Declare @ErrorCount int
Insert into tblProductsErrorHandling values(2,'Iphone',1399,70);
set @ErrorCount=@@ERROR
select * from tblProductsErrorHandling
if(@ErrorCount<>0)
Print 'Error Occured'
else
Print 'Successfully inserted'