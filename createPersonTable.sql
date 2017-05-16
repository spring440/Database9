USE [s17guest09]
GO

/****** Object:  Table [dbo].[Person]    Script Date: 5/15/2017 8:56:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[LName] [varchar](250) NOT NULL,
	[FName] [varchar](250) NOT NULL,
	[StreetAddress] [varchar](max) NULL,
	[Unit] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[Zipcode] [varchar](10) NULL,
	[State] [int] NULL,
	[Email] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_StatesCountry] FOREIGN KEY([State])
REFERENCES [dbo].[StatesCountry] ([StateID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_StatesCountry]
GO


