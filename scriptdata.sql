USE [master]
GO
/****** Object:  Database [RaceofQuestions]    Script Date: 6.01.2023 16:39:06 ******/
CREATE DATABASE [RaceofQuestions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Questions', FILENAME = N'C:\Users\murat.kaplan\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Questions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Questions_log', FILENAME = N'C:\Users\murat.kaplan\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Questions.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RaceofQuestions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RaceofQuestions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RaceofQuestions] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [RaceofQuestions] SET ANSI_NULLS ON 
GO
ALTER DATABASE [RaceofQuestions] SET ANSI_PADDING ON 
GO
ALTER DATABASE [RaceofQuestions] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [RaceofQuestions] SET ARITHABORT ON 
GO
ALTER DATABASE [RaceofQuestions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RaceofQuestions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RaceofQuestions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RaceofQuestions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RaceofQuestions] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [RaceofQuestions] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [RaceofQuestions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RaceofQuestions] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [RaceofQuestions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RaceofQuestions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RaceofQuestions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RaceofQuestions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RaceofQuestions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RaceofQuestions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RaceofQuestions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RaceofQuestions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RaceofQuestions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RaceofQuestions] SET RECOVERY FULL 
GO
ALTER DATABASE [RaceofQuestions] SET  MULTI_USER 
GO
ALTER DATABASE [RaceofQuestions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RaceofQuestions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RaceofQuestions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RaceofQuestions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RaceofQuestions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RaceofQuestions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RaceofQuestions] SET QUERY_STORE = OFF
GO
USE [RaceofQuestions]
GO
/****** Object:  UserDefinedTableType [dbo].[IdList]    Script Date: 6.01.2023 16:39:06 ******/
CREATE TYPE [dbo].[IdList] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6.01.2023 16:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[A] [nvarchar](50) NULL,
	[B] [nvarchar](50) NULL,
	[C] [nvarchar](50) NULL,
	[D] [nvarchar](50) NULL,
	[Correct] [nvarchar](50) NULL,
	[order_number] [int] NULL,
	[Lang] [nvarchar](10) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6.01.2023 16:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (2, N'Yazları sıcak ve kurak kışları karlı geçen iklim türü nedir?', N'Muson İklimi', N'Karasal İklim', N'Ekvatoral İklim', N'Step İklimi', N'Karasal İklim', 1, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (3, N'Çanakkale savaşında 215 kglık mermiyi kim kaldırmıştır', N'Mehmet Onbaşı', N'Ali Onbaşı', N'Hassan Onbaşı', N'Seyyit Onbaşı', N'Seyyit Onbaşı', 2, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (4, N'Rumeli Hisarını Kim Yaptırmıştır', N'Abdulhamid', N'Fatih Sultan Mehmet', N'Kanuni Sultan Süleyman', N'4. Murat', N'Fatih Sultan Mehmet', 3, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (5, N'İbn Haldun''un bir eserinin adı da olan "mukaddime" kelimesi ne anlama gelir?', N'Ön söz', N'Kaynakça', N'Dipnot', N'Çeviri', N'Ön söz', 4, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (11, N'Lise öğrencilerinin yarıştığı Uluslararası Matematik Olimpiyatı''nda 1991 ve 2010''da kopya çektiği şüphesiyle diskalifiye edilen ülke hangisidir?', N'Kuzey Kore', N'Hindistan', N'Venezuela', N'Pakistan', N'Kuzey Kore', 5, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (12, N'Guinness Dünya Rekorlarına göre Hintli Karate Nataraj ellerini kullanmadan ağzında kaç tane pipet tutabilmiştir?', N'50', N'250', N'450', N'650', N'650', 6, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (1012, N'Hangisi sırasında Atatürk 40''lı yaşlarının başındaydı?', N'Trablusgarp Savaşı', N'I. Balkan Savaşı', N'Cumhuriyetin ilanı', N'Hatay''ın Türkiye''ye katılması', N'Cumhuriyetin ilanı', 7, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (2012, N'Hangi romanın yazarı John Steinbeck değildir?', N'Fareler ve İnsanlar', N'Hayvan Çiftliği', N'Gazap Üzümleri', N'İnci', N'Hayvan Çiftliği', 8, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (2013, N'"Büyükbaş" kelimesinin sözlük tanımına göre hangisi büyükbaş hayvandır?', N'At', N'Eşek', N'Sığır', N'Koyun', N'Sığır', 9, N'tr')
INSERT [dbo].[Questions] ([Id], [Question], [A], [B], [C], [D], [Correct], [order_number], [Lang]) VALUES (2014, N'Halk arasında kaplumbağaya verilen diğer ad hangisidir?', N'Gazal', N'Karakaçan', N'Kömüş', N'Tosbağa', N'Tosbağa', 10, N'tr')
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Score], [CreateDate]) VALUES (9002, N'Murat', 25, CAST(N'2022-12-13T10:28:50.550' AS DateTime))
INSERT [dbo].[User] ([Id], [Name], [Score], [CreateDate]) VALUES (9003, N'Zeynep', 30, CAST(N'2022-12-13T10:29:52.827' AS DateTime))
INSERT [dbo].[User] ([Id], [Name], [Score], [CreateDate]) VALUES (9004, N'Ali', 45, CAST(N'2022-12-13T10:30:27.657' AS DateTime))
INSERT [dbo].[User] ([Id], [Name], [Score], [CreateDate]) VALUES (9005, N'Melis', 85, CAST(N'2022-12-13T10:31:03.740' AS DateTime))
INSERT [dbo].[User] ([Id], [Name], [Score], [CreateDate]) VALUES (9006, N'Metehan', 90, CAST(N'2022-12-13T10:31:42.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  StoredProcedure [dbo].[Game_Process]    Script Date: 6.01.2023 16:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Game_Process]
@ProcessID int,
@Name nvarchar(50)=null,
@Score nvarchar(50)=null,
@CreateDate DateTime=null,
@Lang nvarchar(10)='tr',
@IdQuery2 nvarchar(100)=null,
@IdQuery AS dbo.IdList READONLY
AS
BEGIN
	if(@ProcessID=0)
	begin
		SELECT TOP 5 Name,Score  FROM "User" ORDER BY Score DESC
	end
	if(@ProcessID=1)
	begin
		INSERT INTO "User" (Name,Score,CreateDate) VALUES(@Name,@Score,@CreateDate)
	end
	if(@ProcessID=2)
	begin
     SELECT TOP 1 * FROM Questions where Id not in (SELECT Id FROM @IdQuery) and Lang = @Lang  ORDER BY NEWID()
	end
	if(@ProcessID=3)
	begin
     SELECT TOP 1 * FROM "Questions" Where Lang = @Lang ORDER BY NEWID()
	end
	if(@ProcessID=4)
	begin
	declare @queryString nvarchar(max) = N'SELECT TOP 1 * FROM Questions where Id not in ('+@IdQuery2+')'
	EXECUTE sp_executesql @queryString
	end
END

GO
USE [master]
GO
ALTER DATABASE [RaceofQuestions] SET  READ_WRITE 
GO
