USE [s17guest09]
GO

/****** Object:  Table [dbo].[DifficultyLevel]    Script Date: 5/15/2017 8:54:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DifficultyLevel](
	[DifficultyLevelID] [int] IDENTITY(1,1) NOT NULL,
	[DifficultyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DifficultyLevel] PRIMARY KEY CLUSTERED 
(
	[DifficultyLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


