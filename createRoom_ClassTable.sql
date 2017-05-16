USE [s17guest09]
GO

/****** Object:  Table [dbo].[Room_Class]    Script Date: 5/15/2017 9:01:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Room_Class](
	[RoomID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[ClassTime] [time](0) NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Room_Class]  WITH CHECK ADD  CONSTRAINT [FK_Room_Class_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO

ALTER TABLE [dbo].[Room_Class] CHECK CONSTRAINT [FK_Room_Class_Class]
GO

ALTER TABLE [dbo].[Room_Class]  WITH CHECK ADD  CONSTRAINT [FK_Room_Class_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO

ALTER TABLE [dbo].[Room_Class] CHECK CONSTRAINT [FK_Room_Class_Room]
GO


