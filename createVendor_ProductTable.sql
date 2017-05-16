USE [s17guest09]
GO

/****** Object:  Table [dbo].[Vendor_Product]    Script Date: 5/15/2017 9:05:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vendor_Product](
	[VendorID] [int] NOT NULL,
	[ProductID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Vendor_Product]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO

ALTER TABLE [dbo].[Vendor_Product] CHECK CONSTRAINT [FK_Vendor_Product_Products]
GO

ALTER TABLE [dbo].[Vendor_Product]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Product_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO

ALTER TABLE [dbo].[Vendor_Product] CHECK CONSTRAINT [FK_Vendor_Product_Vendor]
GO


