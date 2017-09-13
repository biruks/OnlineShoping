--****************** [OnlineShoppingSystem] *********************--
-- This file will drop and create the [OnlineShoppingSystem]
-- database, with all its objects. 
--****************** Instructors Version ***************************--

USE [master]
If Exists (Select Name from SysDatabases Where Name = 'OnlineShoppingSystem')
  Begin
   ALTER DATABASE OnlineShoppingSystem SET SINGLE_USER WITH ROLLBACK IMMEDIATE
   DROP DATABASE OnlineShoppingSystem
  End
Go
Create Database OnlineShoppingSystem;
Go
USE OnlineShoppingSystem;
Go
--********************************************************************--
-- Create  Tables
--********************************************************************--
if OBJECT_ID(N'dbo.Customer',N'u') is null
begin
create table dbo.Customer
(
CustomerID INT IDENTITY(1,1),
Name nvarchar (50),
MailingAddress nvarchar (100),
CartID int
 CONSTRAINT [PK_Customer_ID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
)end
if OBJECT_ID(N'dbo.Transactions',N'u') is null
begin
create table dbo.Transactions
(
TransactionID INT IDENTITY(1,1),
Amountpaid int,
Date Date
 CONSTRAINT [PK_Transactions_TransactionID] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
)end
if OBJECT_ID(N'dbo.CustTrans',N'u') is null
begin
create table dbo.CustTrans
(
TransactionID INT IDENTITY(1,1),
CustomerID int,

 CONSTRAINT [PK_CustTrans_TransactionID_CustomerID] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC,[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
)end


if OBJECT_ID(N'dbo.Cart',N'u') is null
begin
create table dbo.Cart
(
CartID INT IDENTITY(1,1),
Quantity int

 CONSTRAINT [PK_Cart_CartID] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
)end
if OBJECT_ID(N'dbo.Item',N'u') is null
begin
create table dbo.Item
(

ItemID int,
name nvarchar(50),
Price  int,
type nvarchar(50),
DeliveryStatus bit
 CONSTRAINT [PK_Item_ItemID] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
end
if OBJECT_ID(N'dbo.ItemCart',N'u') is null
begin
create table dbo.ItemCart
(

ItemID int,
CartID  int,

 CONSTRAINT [PK_CartId_ItemID] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,[CartID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

end
--********************************************************************--
-- Create the FOREIGN KEY CONSTRAINTS
--********************************************************************--
ALTER TABLE [dbo].[CustTrans]  WITH CHECK ADD  CONSTRAINT [FK_transaction] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transactions] ([TransactionID])

ALTER TABLE [dbo].[CustTrans]  WITH CHECK ADD  CONSTRAINT [FK_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])

ALTER TABLE [dbo].[ItemCart]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[CART] ([CARTID])
ALTER TABLE [dbo].[ItemCart]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])



