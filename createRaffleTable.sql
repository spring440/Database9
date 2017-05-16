USE [s17guest09]
GO

/****** Object:  Table [dbo].[Raffle]    Script Date: 5/15/2017 8:59:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Raffle](
	[RaffleID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[Gift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Raffle] PRIMARY KEY CLUSTERED 
(
	[RaffleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Raffle]  WITH CHECK ADD  CONSTRAINT [FK_Raffle_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO

ALTER TABLE [dbo].[Raffle] CHECK CONSTRAINT [FK_Raffle_Vendor]
GO


