USE [s17guest09]
GO

/****** Object:  Table [dbo].[Sponsors]    Script Date: 5/15/2017 9:02:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sponsors](
	[SponsorName] [varchar](100) NOT NULL,
	[SponsorTier] [varchar](25) NOT NULL,
	[EventID] [int] NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[SponsorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Sponsors]  WITH CHECK ADD  CONSTRAINT [FK_Sponsors_Events] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO

ALTER TABLE [dbo].[Sponsors] CHECK CONSTRAINT [FK_Sponsors_Events]
GO


