USE [s17guest09]
GO

/****** Object:  Table [dbo].[Raffle_Participant]    Script Date: 5/15/2017 8:59:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Raffle_Participant](
	[RaffleID] [int] NOT NULL,
	[PersonID] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Raffle_Participant]  WITH CHECK ADD  CONSTRAINT [FK_Raffle_Participant_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[Raffle_Participant] CHECK CONSTRAINT [FK_Raffle_Participant_Person]
GO

ALTER TABLE [dbo].[Raffle_Participant]  WITH CHECK ADD  CONSTRAINT [FK_Raffle_Participant_Raffle] FOREIGN KEY([RaffleID])
REFERENCES [dbo].[Raffle] ([RaffleID])
GO

ALTER TABLE [dbo].[Raffle_Participant] CHECK CONSTRAINT [FK_Raffle_Participant_Raffle]
GO


