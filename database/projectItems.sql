/****** Object:  Table [ABUNDEZA6303].[Categories]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Categories]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[Categories]
GO
/****** Object:  Table [ABUNDEZA6303].[Customers]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Customers]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[Customers]
GO
/****** Object:  Table [ABUNDEZA6303].[Invoices]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Invoices]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[Invoices]
GO
/****** Object:  Table [ABUNDEZA6303].[OrderDetails]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[OrderDetails]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[OrderDetails]
GO
/****** Object:  Table [ABUNDEZA6303].[Orders]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Orders]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[Orders]
GO
/****** Object:  Table [ABUNDEZA6303].[Products]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Products]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[Products]
GO
/****** Object:  Table [ABUNDEZA6303].[Suppliers]    Script Date: 03/24/2013 20:47:50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Suppliers]') AND type in (N'U'))
DROP TABLE [ABUNDEZA6303].[Suppliers]
GO

/****** Object:  Role [ABUNDEZA6303]    Script Date: 03/24/2013 20:47:50 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ABUNDEZA6303')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ABUNDEZA6303' AND type = 'R')
CREATE ROLE [ABUNDEZA6303]
END
GO

/****** Object:  Table [ABUNDEZA6303].[Suppliers]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Suppliers]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContactName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactTitle] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HomePage] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [ABUNDEZA6303].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone], [HomePage]) VALUES (2, N'New Orleans Cajun Delights', N'Shelley Burke', N'Order Administrator', N'P.O. Box 78934', N'New Orleans', N'LA', N'70117     ', N'(100) 555-4822', NULL)
INSERT [ABUNDEZA6303].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone], [HomePage]) VALUES (3, N'Grandma Kelly''s Homestead', N'Regina Murphy', N'Sales Representative', N'707 Oxford Rd.', N'Ann Arbor', N'MI', N'48104     ', N'(313) 555-5735', NULL)
INSERT [ABUNDEZA6303].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone], [HomePage]) VALUES (16, N'Bigfoot Breweries', N'Cheryl Saylor', N'Regional Account Rep.', N'3400 - 8th Avenue Suite 210', N'Bend', N'OR', N'97101     ', N'(503) 555-9931', NULL)
INSERT [ABUNDEZA6303].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone], [HomePage]) VALUES (19, N'New England Seafood Cannery', N'Robb Merchant', N'Wholesale Account Agent', N'Order Processing Dept. 2100 Paul Revere Blvd.', N'Boston', N'MA', N'2134      ', N'(617) 555-3267', NULL)
/****** Object:  Table [ABUNDEZA6303].[Products]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [int] NULL,
	[UnitsOnOrder] [int] NULL,
	[RecorderLevel] [int] NULL,
	[Discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, 2, N'48 - 6 oz jars', 22.0000, 53, 0, 0, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, 2, N'36 boxes', 21.3500, 0, 0, 0, 1)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (6, N'Grandma''s Boysenberry Spread', 3, 2, N'12 - 8 oz jars', 25.0000, 120, 0, 25, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 3, 7, N'12 - 1 lb pkgs.', 30.0000, 15, 0, 10, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (8, N'Northwoods Cranberry Sauce', 3, 2, N'12 - 12 oz jars', 40.0000, 6, 0, 0, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (34, N'Sasquatch Ale', 16, 1, N'24 - 12 oz bottles', 14.0000, 111, 0, 15, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (35, N'Steeleye Stout', 16, 1, N'24 - 12 oz bottles', 18.0000, 20, 0, 15, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (40, N'Boston Crab Meat', 19, 8, N'24 - 4 oz tins', 18.4000, 123, 0, 30, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (41, N'Jack''s New England Clam Chowder', 19, 8, N'12 - 12 oz cans', 9.6500, 85, 0, 10, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', 2, 2, N'32 - 8 oz bottles', 21.0500, 76, 0, 0, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (66, N'Louisiana Hot Spiced Okra', 2, 2, N'24 - 8 oz jars', 17.0000, 4, 100, 20, 0)
INSERT [ABUNDEZA6303].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [RecorderLevel], [Discontinued]) VALUES (67, N'Laughing Lumberjack Lager', 16, 1, N'24 - 12 oz bottles', 14.0000, 52, 0, 10, 0)
/****** Object:  Table [ABUNDEZA6303].[Orders]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [nchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippingID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [ABUNDEZA6303].[OrderDetails]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[OrderDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [ABUNDEZA6303].[Invoices]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Invoices]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductCost] [money] NULL,
	[ShippingCost] [money] NULL,
	[Tax] [money] NULL,
	[CustomerID] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EmployeeID] [int] NULL,
	[InvoiceDate] [datetime] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [ABUNDEZA6303].[Customers]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[Customers](
	[CustomerID] [nchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CompanyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactTitle] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'GREAL', N'Great Lakes Food Market', N'Howard Snyder', N'Marketing Manager', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403     ', N'(503) 555-7555')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'HUNGC', N'Hungry Coyote Import Store', N'Yoshi Latimer', N'Sales Representative', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827     ', N'(503) 555-6874')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'LAZYK', N'Lazy K Kountry Store', N'John Steel', N'Marketing Manager', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362     ', N'(509) 555-7969')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'LETSS', N'Let''s Stop N Shop', N'Jaime Yorres', N'Owner', N'87 Polk St. Suite 5', N'San Francisco', N'CA', N'94117     ', N'(415) 555-5938')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'LONEP', N'Lonesome Pine Restaurant', N'Fran Wilson', N'Sales Manager', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219     ', N'(503) 555-9573')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'OLDWO', N'Old World Delicatessen', N'Rene Phillips', N'Sales Representative', N'2743 Bering St.', N'Anchorage', N'AK', N'99508     ', N'(907) 555-7584')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'RATTC', N'Rattlesnake Canyon Grocery', N'Paula Wilson', N'Assistant Sales Representative', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110     ', N'(505) 555-5939')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'SAVEA', N'Save-a-lot Markets', N'Jose Pavarotti', N'Sales Representative', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720     ', N'(208) 555-8097')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'SPLIR', N'Split Rail Beer & Ale', N'Art Braunschweiger', N'Sales Manager', N'P.O. Box 555', N'Lander', N'WY', N'82520     ', N'(307) 555-4680')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'THECR', N'The Cracker Box', N'Liu Wong', N'Marketing Assistant', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801     ', N'(406) 555-5834')
INSERT [ABUNDEZA6303].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [State], [Zip], [Phone]) VALUES (N'WHITC', N'White Clover Markets', N'Karl Jablonski', N'Owner', N'305 - 14th Ave. S. Suite 3B', N'Seattle', N'WA', N'98128     ', N'(206) 555-4112')
/****** Object:  Table [ABUNDEZA6303].[Categories]    Script Date: 03/24/2013 20:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ABUNDEZA6303].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [ABUNDEZA6303].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (4, N'Dairy Products', N'Cheeses', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (6, N'Meat/Poultry', N'Prepared meats', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (7, N'Produce', N'Dried fruit and bean curd', NULL)
INSERT [ABUNDEZA6303].[Categories] ([CategoryID], [CategoryName], [Description], [Picture]) VALUES (8, N'Seafood', N'Seaweed and fish', NULL)
