USE [s17guest09]
GO

/****** Object:  Table [dbo].[Class_Participant]    Script Date: 5/15/2017 8:53:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Class_Participant](
	[ClassID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[Grade] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Class_Participant]  WITH CHECK ADD  CONSTRAINT [FK_Class_Participant_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO

ALTER TABLE [dbo].[Class_Participant] CHECK CONSTRAINT [FK_Class_Participant_Class]
GO

ALTER TABLE [dbo].[Class_Participant]  WITH CHECK ADD  CONSTRAINT [FK_Class_Participant_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[Class_Participant] CHECK CONSTRAINT [FK_Class_Participant_Person]
GO


