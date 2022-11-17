use KUDVideosSQLServer;

alter procedure spProductSales
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
		Begin Try
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

				--Set @MaxProductSalesID = @MaxProductSalesID+1;

				--Insert into tblProductSalesErrorHandling
				Insert into tblProductSalesErrorHandling values(@MaxProductSalesID,@ProductId,@QtySold);
			Commit tran
		End Try
		Begin Catch
			Rollback Transaction
			Select
				ERROR_NUMBER() as ErrorNumber,
				ERROR_MESSAGE() as ErrorMessage,
				ERROR_PROCEDURE() as ErrorProcedure,
				ERROR_STATE() as ErrorState,
				ERROR_SEVERITY() as Severity,
				ERROR_LINE() as Line
							   
		End Catch
	End

End


EXECUTE spProductSales 2,10

SELECT * FROM tblProductsErrorHandling;
Select * from tblProductSalesErrorHandling;