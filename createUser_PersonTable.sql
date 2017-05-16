USE [s17guest09]
GO

/****** Object:  Table [dbo].[User_Person]    Script Date: 5/15/2017 9:03:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User_Person](
	[UserID] [int] NOT NULL,
	[PersonID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[User_Person]  WITH CHECK ADD  CONSTRAINT [FK_User_Person_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[User_Person] CHECK CONSTRAINT [FK_User_Person_Person]
GO

ALTER TABLE [dbo].[User_Person]  WITH CHECK ADD  CONSTRAINT [FK_User_Person_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[User_Person] CHECK CONSTRAINT [FK_User_Person_Users]
GO


