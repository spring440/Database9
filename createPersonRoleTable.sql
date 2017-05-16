USE [s17guest09]
GO

/****** Object:  Table [dbo].[Person_Role]    Script Date: 5/15/2017 8:57:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Person_Role](
	[PersonID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Person_Role]  WITH CHECK ADD  CONSTRAINT [FK_Person_Role_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[Person_Role] CHECK CONSTRAINT [FK_Person_Role_Person]
GO

ALTER TABLE [dbo].[Person_Role]  WITH CHECK ADD  CONSTRAINT [FK_Person_Role_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO

ALTER TABLE [dbo].[Person_Role] CHECK CONSTRAINT [FK_Person_Role_Role]
GO


