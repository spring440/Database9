USE [s17guest09]
GO

/****** Object:  Table [dbo].[UserToken]    Script Date: 5/15/2017 9:04:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserToken](
	[UserID] [int] NOT NULL,
	[Token] [uniqueidentifier] NOT NULL,
	[RefreshToken] [uniqueidentifier] NOT NULL,
	[Expires] [smalldatetime] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserToken]  WITH CHECK ADD  CONSTRAINT [FK_UserToken_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[UserToken] CHECK CONSTRAINT [FK_UserToken_Users]
GO


