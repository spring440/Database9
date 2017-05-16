USE [s17guest09]
GO

/****** Object:  Table [dbo].[Region_Country]    Script Date: 5/15/2017 9:00:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Region_Country](
	[RegionID] [int] NOT NULL,
	[CountryID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Region_Country]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO

ALTER TABLE [dbo].[Region_Country] CHECK CONSTRAINT [FK_Region_Country_Country]
GO

ALTER TABLE [dbo].[Region_Country]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO

ALTER TABLE [dbo].[Region_Country] CHECK CONSTRAINT [FK_Region_Country_Region]
GO


