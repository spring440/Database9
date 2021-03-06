USE [master]
GO
/****** Object:  Database [s17guest09]    Script Date: 5/15/2017 11:35:09 PM ******/
CREATE DATABASE [s17guest09]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's17guest09', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s17guest09.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N's17guest09_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s17guest09_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [s17guest09] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s17guest09].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s17guest09] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s17guest09] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s17guest09] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s17guest09] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s17guest09] SET ARITHABORT OFF 
GO
ALTER DATABASE [s17guest09] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s17guest09] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s17guest09] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s17guest09] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s17guest09] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s17guest09] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s17guest09] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s17guest09] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s17guest09] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s17guest09] SET  ENABLE_BROKER 
GO
ALTER DATABASE [s17guest09] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s17guest09] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s17guest09] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s17guest09] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s17guest09] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s17guest09] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s17guest09] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s17guest09] SET RECOVERY FULL 
GO
ALTER DATABASE [s17guest09] SET  MULTI_USER 
GO
ALTER DATABASE [s17guest09] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s17guest09] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s17guest09] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s17guest09] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N's17guest09', N'ON'
GO
USE [s17guest09]
GO
/****** Object:  User [s17guest09]    Script Date: 5/15/2017 11:35:09 PM ******/
CREATE USER [s17guest09] FOR LOGIN [s17guest09] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s17guest09]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUserIDFromToken]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetUserIDFromToken] 
(
	-- Add the parameters for the function here
	@UserToken uniqueidentifier
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @PersonID int

	-- Add the T-SQL statements to compute the return value here
	set @PersonID = (SELECT PersonID from UserToken t join User_Person u on t.UserID = u.UserID where Token = @UserToken)

	-- Return the result of the function
	RETURN @PersonID

END

GO
/****** Object:  Table [dbo].[Class]    Script Date: 5/15/2017 11:35:09 PM ******/
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
/****** Object:  Table [dbo].[Class_Participant]    Script Date: 5/15/2017 11:35:09 PM ******/
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
/****** Object:  Table [dbo].[Class_Presenter]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Presenter](
	[ClassID] [int] NOT NULL,
	[PersonID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryName] [varchar](50) NOT NULL,
	[Abreviation] [varchar](2) NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DifficultyLevel]    Script Date: 5/15/2017 11:35:09 PM ******/
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
/****** Object:  Table [dbo].[Events]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventDate] [date] NOT NULL,
	[EventName] [varchar](50) NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [varchar](max) NOT NULL,
	[Unit] [varchar](25) NULL,
	[City] [varchar](50) NULL,
	[Zipcode] [varchar](20) NULL,
	[StateID] [int] NULL,
	[EventID] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[LName] [varchar](250) NOT NULL,
	[FName] [varchar](250) NOT NULL,
	[StreetAddress] [varchar](max) NULL,
	[Unit] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[Zipcode] [varchar](10) NULL,
	[State] [int] NULL,
	[Email] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person_Role]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Role](
	[PersonID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PotentialLectureStatus]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PotentialLectureStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](25) NULL,
 CONSTRAINT [PK_PotentialLectureStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductVersion] [varchar](25) NULL,
	[ProductPrice] [money] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Raffle]    Script Date: 5/15/2017 11:35:09 PM ******/
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
/****** Object:  Table [dbo].[Raffle_Participant]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raffle_Participant](
	[RaffleID] [int] NOT NULL,
	[PersonID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region_Country]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region_Country](
	[RegionID] [int] NOT NULL,
	[CountryID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[Capacity] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room_Class]    Script Date: 5/15/2017 11:35:09 PM ******/
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
/****** Object:  Table [dbo].[Sponsors]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsors](
	[SponsorName] [varchar](100) NOT NULL,
	[SponsorTier] [varchar](25) NOT NULL,
	[EventID] [int] NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[SponsorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatesCountry]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatesCountry](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[Abreviation] [varchar](3) NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_StatesCountry] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Track]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[TrackName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Person]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Person](
	[UserID] [int] NOT NULL,
	[PersonID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserToken]    Script Date: 5/15/2017 11:35:09 PM ******/
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
/****** Object:  Table [dbo].[Vendor]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[VendorPhone] [varchar](25) NULL,
	[VendorEmail] [varchar](250) NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Class]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Class](
	[VendorID] [int] NOT NULL,
	[Class] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor_Product]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor_Product](
	[VendorID] [int] NOT NULL,
	[ProductID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VendorTable]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTable](
	[TableID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[TableNumber] [int] NOT NULL,
 CONSTRAINT [PK_VendorTable] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Region]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Events] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Events]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_StatesCountry] FOREIGN KEY([StateID])
REFERENCES [dbo].[StatesCountry] ([StateID])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_StatesCountry]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_StatesCountry] FOREIGN KEY([State])
REFERENCES [dbo].[StatesCountry] ([StateID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_StatesCountry]
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
ALTER TABLE [dbo].[Raffle]  WITH CHECK ADD  CONSTRAINT [FK_Raffle_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[Raffle] CHECK CONSTRAINT [FK_Raffle_Vendor]
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
ALTER TABLE [dbo].[Region_Country]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Region_Country] CHECK CONSTRAINT [FK_Region_Country_Country]
GO
ALTER TABLE [dbo].[Region_Country]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Region_Country] CHECK CONSTRAINT [FK_Region_Country_Region]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Locations]
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
ALTER TABLE [dbo].[Sponsors]  WITH CHECK ADD  CONSTRAINT [FK_Sponsors_Events] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO
ALTER TABLE [dbo].[Sponsors] CHECK CONSTRAINT [FK_Sponsors_Events]
GO
ALTER TABLE [dbo].[StatesCountry]  WITH CHECK ADD  CONSTRAINT [FK_StatesCountry_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[StatesCountry] CHECK CONSTRAINT [FK_StatesCountry_Country]
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
ALTER TABLE [dbo].[UserToken]  WITH CHECK ADD  CONSTRAINT [FK_UserToken_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserToken] CHECK CONSTRAINT [FK_UserToken_Users]
GO
ALTER TABLE [dbo].[Vendor_Class]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Class_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Vendor_Class] CHECK CONSTRAINT [FK_Vendor_Class_Class]
GO
ALTER TABLE [dbo].[Vendor_Class]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Class_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[Vendor_Class] CHECK CONSTRAINT [FK_Vendor_Class_Vendor]
GO
ALTER TABLE [dbo].[Vendor_Product]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Vendor_Product] CHECK CONSTRAINT [FK_Vendor_Product_Products]
GO
ALTER TABLE [dbo].[Vendor_Product]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Product_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[Vendor_Product] CHECK CONSTRAINT [FK_Vendor_Product_Vendor]
GO
ALTER TABLE [dbo].[VendorTable]  WITH CHECK ADD  CONSTRAINT [FK_VendorTable_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[VendorTable] CHECK CONSTRAINT [FK_VendorTable_Vendor]
GO
/****** Object:  StoredProcedure [dbo].[AddLocation]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddLocation]
@EventID int,
@Street varchar(max),
@Unit varchar(25) = null,
@City varchar(50),
@Zip varchar(20),
@StateID int,
@Token uniqueidentifier

as begin

declare @AdminRole int

set @AdminRole = (select RoleID from Person_Role  where PersonID = dbo.GetUserIDFromToken(@Token) and RoleID = 3)

if @AdminRole != 3
begin;
	throw 5001, 'User Not Authorized', 1
end

insert Locations values(@Street, @Unit, @City, @Zip, @StateID, @EventID)

end
GO
/****** Object:  StoredProcedure [dbo].[AddPersonToRaffle]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddPersonToRaffle]
@PersonID int,
@RaffleID int
as begin

	insert Raffle_Participant
	values (@RaffleID, @PersonID)

end
GO
/****** Object:  StoredProcedure [dbo].[AddRoomToLocation]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddRoomToLocation]
@LocationID int,
@Capacity int,
@Token uniqueidentifier

as begin

declare @AdminRole int

set @AdminRole = (select RoleID from Person_Role  where PersonID = dbo.GetUserIDFromToken(@Token) and RoleID = 3)

if @AdminRole != 3
begin;
	throw 5001, 'User Not Authorized', 1
end

insert Room
values(@Capacity, @LocationID)


end
GO
/****** Object:  StoredProcedure [dbo].[AddStudentToClass]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddStudentToClass]
@PersonID int,
@ClassID int
as begin



insert Class_Participant
values(@ClassID, @PersonID, null)

end
GO
/****** Object:  StoredProcedure [dbo].[AssignRole]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AssignRole]
@UserID int,
@RoleID int,
@Remove bit,
@Token uniqueidentifier

as begin
-- this usp allow orginizers to assign or remove a role to someone else

declare @AdminRole int

set @AdminRole = (select RoleID from Person_Role  where PersonID = dbo.GetUserIDFromToken(@Token) and RoleID = 3)

if @AdminRole != 3
begin;
	throw 5001, 'User Not Authorized', 1
end

if @Remove = 0
begin;
	insert Person_Role values(@UserID, @RoleID)
end

else
begin;
	delete Person_Role where PersonID = @UserID and RoleID = @RoleID
end
end


GO
/****** Object:  StoredProcedure [dbo].[AssignRoomToClass]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AssignRoomToClass]
@ClassID int,
@RoomID int,
@Time time,
@Token uniqueidentifier


as begin

declare @AdminRole int

set @AdminRole = (select RoleID from Person_Role  where PersonID = dbo.GetUserIDFromToken(@Token) and RoleID = 3)

if @AdminRole != 3
begin;
	throw 5001, 'User Not Authorized', 1
end

if (select count(*) from Room_Class where RoomID = @RoomID and ClassTime != @Time) = 0
begin;
	insert Room_Class values(@RoomID, @ClassID, @Time)
end


end
GO
/****** Object:  StoredProcedure [dbo].[CreateEvent]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CreateEvent]
@EventName varchar(50),
@EventDate date,
@RegionID int,
@Token uniqueidentifier
as begin

declare @AdminID int
set @AdminID = dbo.GetUserIDFromToken(@Token)
if (select RoleID from Person_Role where PersonID = @AdminID and RoleID = 3) != 3
begin;
	throw 5001, 'Unauthorized user.', 1
end

insert Events values(@EventDate, @EventName, @RegionID)


end
GO
/****** Object:  StoredProcedure [dbo].[createPersonAccount]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[createPersonAccount]
@lName varchar(250),
@fName varchar(250),
@Email varchar(250),
@Pass varchar(250),
@Street varchar(max),
@Unit varchar(10),
@City varchar(50),
@Zip varchar(10),
@State int

as begin
-- this usp is used to create a new account
-- this assumes the email format and password has been check on the server side or front end
-- email is provided in person separetly in case someone is manually added to the table rather than create an account
-- everyone is set as an atteendee since it assumes someone creating an account is planning on attending the event

insert Users values(@Email, @Pass)
declare @UserID int
set @UserID = @@identity

insert Person values(@lName, @fName, @Street, @Unit, @City, @Zip, @State, @Email)
declare @PersonID int
set @PersonID = @@IDENTITY

insert User_Person values(@UserID, @PersonID)

insert Person_Role values(@PersonID, 2)

end
GO
/****** Object:  StoredProcedure [dbo].[CreateRaffle]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateRaffle]
@VendorID int,
@Gift varchar(50)

as begin

insert Raffle
values(@VendorID, @Gift)

end
GO
/****** Object:  StoredProcedure [dbo].[GetScheduleForLocation]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetScheduleForLocation]
@LocationID int
as begin

select c.Title from Class c 
join Room_Class rc on rc.ClassID = c.ClassID
join Room r on rc.RoomID = r.RoomID
join Locations l on l.LocationID = r.LocationID
order by rc.ClassTime asc

end
GO
/****** Object:  StoredProcedure [dbo].[GradeClass]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GradeClass]
@ClassID int,
@TokenID uniqueidentifier,
@Grade int

as begin

declare @StudentID int
set @StudentID = dbo.GetUserIDFromToken(@TokenID)

if (select count(*) from Class_Participant where ClassID = @ClassID and PersonID = @StudentID) > 0
begin
	update Class_Participant 
	set Grade = @Grade
	where ClassID = @ClassID
	and PersonID = @StudentID
end 
else
begin;
	throw 5001, 'Error: You have to participate in the class to grade it', 1
end

end
GO
/****** Object:  StoredProcedure [dbo].[RefreshToken]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RefreshToken]
@RefreshToken uniqueidentifier
as
begin
-- This usp refreshes a token to keep the user logged in
declare @Token uniqueidentifier
select @Token = Token 
from UserToken
Where RefreshToken = @RefreshToken

if @Token is null
begin;
	throw 50001, 'RefreshToken Is Invalid', 1;
end

declare @NewToken  uniqueidentifier
set @NewToken = NEWID()

update UserToken
set Token = @NewToken,
RefreshToken = NEWID(),
Expires = DATEADD(HOUR, 1 ,GETDATE())
where Token = @Token


select * from UserToken where Token = @NewToken


end



GO
/****** Object:  StoredProcedure [dbo].[ReviewClass]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ReviewClass]
@TrackID int = null,
@StatusID int,
@ClassID int,
@Token uniqueidentifier
as begin
-- assgins the class to either approved and sets a track or to declined 
declare @AdminRole int
set @AdminRole = (select RoleID from Person_Role  where PersonID = dbo.GetUserIDFromToken(@Token) and RoleID = 3)

if @AdminRole != 3
begin;
	throw 5001, 'User Not Authorized', 1
end

update Class
set TrackID = @TrackID,
StatusID = @StatusID
where ClassID = @ClassID


end
GO
/****** Object:  StoredProcedure [dbo].[SignIn]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignIn]
@Email varchar(250),
@Pass varchar(250)

as begin

declare @UserID int;

set @UserID = (select top 1 UserID from Users where Email = @Email and Password = @Pass)

if @UserID is null
begin;
	throw 5000, 'Email or Password is incorrect.', 1
end

insert UserToken values(@UserID, NEWID(), NEWID(), DATEADD(HOUR, 1 ,GETDATE()))

set nocount on;

select * from UserToken
where UserID = @UserID

end
GO
/****** Object:  StoredProcedure [dbo].[SignOut]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignOut]
@Token uniqueidentifier
as begin
-- this usp deletes the token so it can not be used to access the data anymore
delete UserToken 
where Token = @Token

end
GO
/****** Object:  StoredProcedure [dbo].[SubmitClass]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SubmitClass]
@Title varchar(max),
@Des varchar(max) = null,
@DificultyLevelID int

as begin

insert Class
values(@Title, @Des, 60, @DificultyLevelID, null, 1)

end

GO
/****** Object:  StoredProcedure [dbo].[UpdateEvents]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateEvents]
@EventName varchar(50),
@EventID int,
@Token uniqueidentifier,
@EventDate date,
@Region int

as begin

declare @AdminID int
set @AdminID = dbo.GetUserIDFromToken(@Token)
if (select RoleID from Person_Role where PersonID = @AdminID and RoleID = 3) != 3
begin;
	throw 5001, 'Unauthorized user.', 1
end

update Events
set EventName = @EventName,
EventDate = @EventDate,
RegionID = @Region
where EventID = @EventID


end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePeronInfo]    Script Date: 5/15/2017 11:35:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdatePeronInfo]
@PersonID int,
@Street varchar(max),
@Unit varchar(10),
@City varchar(50),
@Zip varchar(10),
@State int,
@Token uniqueidentifier

as begin
-- this usp updates the address of a person if its accessed by an orginizer or by the person himself
declare @AccountID int
set @AccountID = dbo.GetUserIDFromToken(@Token)

if @AccountID = @PersonID or (select RoleID from Person_Role where PersonID = @PersonID) = 3
begin;
	update Person
	set StreetAddress = @Street,
	Unit = @Unit,
	City = @City,
	Zipcode = @Zip,
	State = @State
	where PersonID = @PersonID
end

end
GO
USE [master]
GO
ALTER DATABASE [s17guest09] SET  READ_WRITE 
GO
