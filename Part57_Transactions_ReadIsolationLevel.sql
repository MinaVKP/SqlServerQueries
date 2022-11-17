--Transaction Read Isolation Level

Select * from tblProductsErrorHandling

Begin Tran

	Update tblProductsErrorHandling 
	Set QtyAvailable=200 where ProductId=1;

Commit tran

--Commit and Rollback

Create table tblPhysicalAddress
(
	AddressID int,
	CustomerID int,
	HouseNumber int,
	Street nvarchar(100),
	City nvarchar(10),
	PostalCode int

)

Create table tblMailingAddress
(
	AddressID int,
	CustomerID int,
	HouseNumber int,
	Street nvarchar(100),
	City nvarchar(10),
	PostalCode int

)

Insert into tblPhysicalAddress values(101,2345,45, '5th Cross St', 'Loondoon', 01721);
Insert into tblMailingAddress values(101,2345,45, '5th Cross St', 'Londoons', 01721);

Select * from tblPhysicalAddress
Select * from tblMailingAddress

execute spUpdateAddress

alter procedure spUpdateAddress
as
Begin 
	Begin try
		Begin Tran
			Update tblPhysicalAddress set City='LONDON' where AddressID=101;
	
			Update tblMailingAddress set City='LONDON' where AddressID=101;

		Commit Tran
		Print 'Transaction Committed'
	End Try
	
	Begin Catch
		Rollback tran
		Print 'Transaction Rolled back'
	End Catch
End
 

