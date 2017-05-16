USE [s17guest09]
GO

/****** Object:  Table [dbo].[VendorTable]    Script Date: 5/15/2017 9:05:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VendorTable](
	[TableID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[TableNumber] [int] NOT NULL,
 CONSTRAINT [PK_VendorTable] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[VendorTable]  WITH CHECK ADD  CONSTRAINT [FK_VendorTable_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO

ALTER TABLE [dbo].[VendorTable] CHECK CONSTRAINT [FK_VendorTable_Vendor]
GO


