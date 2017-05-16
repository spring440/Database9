USE [s17guest09]
GO

/****** Object:  Table [dbo].[StatesCountry]    Script Date: 5/15/2017 9:02:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StatesCountry](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[Abreviation] [varchar](3) NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_StatesCountry] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[StatesCountry]  WITH CHECK ADD  CONSTRAINT [FK_StatesCountry_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO

ALTER TABLE [dbo].[StatesCountry] CHECK CONSTRAINT [FK_StatesCountry_Country]
GO


