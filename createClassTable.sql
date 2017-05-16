USE [s17guest09]
GO

/****** Object:  Table [dbo].[Class]    Script Date: 5/15/2017 8:49:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[ClassDescription] [varchar](max) NULL,
	[Duration] [int] NULL,
	[DificultyLevelID] [int] NULL,
	[TrackID] [int] NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_DifficultyLevel] FOREIGN KEY([DificultyLevelID])
REFERENCES [dbo].[DifficultyLevel] ([DifficultyLevelID])
GO

ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_DifficultyLevel]
GO

ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_PotentialLectureStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[PotentialLectureStatus] ([StatusID])
GO

ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_PotentialLectureStatus]
GO

ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Track] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
GO

ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Track]
GO


