USE [s17guest09]
GO

/****** Object:  Table [dbo].[Vendor_Class]    Script Date: 5/15/2017 9:04:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vendor_Class](
	[VendorID] [int] NOT NULL,
	[Class] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Vendor_Class]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Class_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassID])
GO

ALTER TABLE [dbo].[Vendor_Class] CHECK CONSTRAINT [FK_Vendor_Class_Class]
GO

ALTER TABLE [dbo].[Vendor_Class]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Class_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO

ALTER TABLE [dbo].[Vendor_Class] CHECK CONSTRAINT [FK_Vendor_Class_Vendor]
GO


