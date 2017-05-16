USE [s17guest09]
GO

/****** Object:  Table [dbo].[Locations]    Script Date: 5/15/2017 8:55:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](max) NOT NULL,
	[Unit] [varchar](25) NULL,
	[City] [varchar](50) NULL,
	[Zipcode] [varchar](20) NULL,
	[StateID] [int] NULL,
	[EventID] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Events] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO

ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Events]
GO

ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_StatesCountry] FOREIGN KEY([StateID])
REFERENCES [dbo].[StatesCountry] ([StateID])
GO

ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_StatesCountry]
GO


