USE [s17guest09]
GO

/****** Object:  Table [dbo].[Class_Presenter]    Script Date: 5/15/2017 8:53:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Class_Presenter](
	[ClassID] [int] NOT NULL,
	[PersonID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Class_Presenter]  WITH CHECK ADD  CONSTRAINT [FK_Class_Presenter_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO

ALTER TABLE [dbo].[Class_Presenter] CHECK CONSTRAINT [FK_Class_Presenter_Class]
GO

ALTER TABLE [dbo].[Class_Presenter]  WITH CHECK ADD  CONSTRAINT [FK_Class_Presenter_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[Class_Presenter] CHECK CONSTRAINT [FK_Class_Presenter_Person]
GO


