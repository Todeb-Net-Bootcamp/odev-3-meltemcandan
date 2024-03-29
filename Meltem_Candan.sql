USE [master]
GO
/****** Object:  Database [MeltemCandan]    Script Date: 13.07.2022 22:55:03 ******/
CREATE DATABASE [MeltemCandan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MeltemCandan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MeltemCandan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MeltemCandan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MeltemCandan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MeltemCandan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MeltemCandan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MeltemCandan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MeltemCandan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MeltemCandan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MeltemCandan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MeltemCandan] SET ARITHABORT OFF 
GO
ALTER DATABASE [MeltemCandan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MeltemCandan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MeltemCandan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MeltemCandan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MeltemCandan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MeltemCandan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MeltemCandan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MeltemCandan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MeltemCandan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MeltemCandan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MeltemCandan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MeltemCandan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MeltemCandan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MeltemCandan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MeltemCandan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MeltemCandan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MeltemCandan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MeltemCandan] SET RECOVERY FULL 
GO
ALTER DATABASE [MeltemCandan] SET  MULTI_USER 
GO
ALTER DATABASE [MeltemCandan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MeltemCandan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MeltemCandan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MeltemCandan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MeltemCandan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MeltemCandan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MeltemCandan', N'ON'
GO
ALTER DATABASE [MeltemCandan] SET QUERY_STORE = OFF
GO
USE [MeltemCandan]
GO
/****** Object:  UserDefinedFunction [dbo].[Fnc_AvgYear]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Fnc_AvgYear]()
Returns int
As
Begin
Declare @avgYear int

Set @avgYear = (select Sum(CAST(f.Year AS Int)) / COUNT(f.Year) from Films f)

Return @avgYear
End

/*
Tabloda ki tüm filmlerin yayın yıllarının ortalamasını alan bir fonksiyon oluşturulmuştur.
*/
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmActorMatches]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmActorMatches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActorId] [int] NOT NULL,
	[FilmId] [int] NOT NULL,
 CONSTRAINT [PK_FilmActorMatches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Films]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Films](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Year] [varchar](4) NOT NULL,
	[Imdb] [varchar](5) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DirectorId] [int] NOT NULL,
 CONSTRAINT [PK_Films] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[Fnc_GetFilmInfoByActorId]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Fnc_GetFilmInfoByActorId](@actorId int)
Returns Table
As

Return (Select f.Id, f.Name AS FilmName, f.Year, f.Imdb, c.Name AS CategoryName, CONCAT(d.Name,d.Surname) AS DirectorName, fam.ActorId

from Films f
	inner join FilmActorMatches fam on fam.FilmId = f.Id 
	inner join Categories c on f.CategoryId = c.Id
	inner join Directors d on f.DirectorId= d.Id
where fam.ActorId = @actorId )

/*
Aktör ID ye göre aktörün oynadığı filmleri kategorileriyle ve yönetmen bilgileriyle dönderen fonksiyon oluşturulmuştur.
*/
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (1, N'Belén', N'Rueda')
INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (2, N'Nugonzalo ', N'De Castroll')
INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (3, N'Jose ', N'Coronado')
INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (4, N'Pepa ', N'Aniorte')
INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (5, N'Bryce Dallas ', N'Howard')
INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (6, N'Chris', N'Pratt')
INSERT [dbo].[Actors] ([Id], [Name], [Surname]) VALUES (7, N'Fernando ', N'Cayo')
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Comedy')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Action')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Drama')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([Id], [Name], [Surname]) VALUES (2, N'Arantxa', N'Echevarría')
INSERT [dbo].[Directors] ([Id], [Name], [Surname]) VALUES (3, N'J.A. ', N'Bayona')
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[FilmActorMatches] ON 

INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (1, 1, 1)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (4, 2, 1)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (5, 3, 1)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (6, 4, 1)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (7, 1, 2)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (8, 7, 2)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (10, 5, 3)
INSERT [dbo].[FilmActorMatches] ([Id], [ActorId], [FilmId]) VALUES (11, 6, 3)
SET IDENTITY_INSERT [dbo].[FilmActorMatches] OFF
GO
SET IDENTITY_INSERT [dbo].[Films] ON 

INSERT [dbo].[Films] ([Id], [Name], [Year], [Imdb], [CategoryId], [DirectorId]) VALUES (1, N'La Familia Perfecta', N'2021', N'5,4', 1, 2)
INSERT [dbo].[Films] ([Id], [Name], [Year], [Imdb], [CategoryId], [DirectorId]) VALUES (2, N'The Orphanage', N'2007', N'7,4', 3, 3)
INSERT [dbo].[Films] ([Id], [Name], [Year], [Imdb], [CategoryId], [DirectorId]) VALUES (3, N'Jurassic World 2 Fallen Kingdom', N'2018', N'6,2', 2, 3)
SET IDENTITY_INSERT [dbo].[Films] OFF
GO
ALTER TABLE [dbo].[FilmActorMatches]  WITH CHECK ADD  CONSTRAINT [FK_FilmActorMatches_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[FilmActorMatches] CHECK CONSTRAINT [FK_FilmActorMatches_Actors]
GO
ALTER TABLE [dbo].[FilmActorMatches]  WITH CHECK ADD  CONSTRAINT [FK_FilmActorMatches_Films] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Films] ([Id])
GO
ALTER TABLE [dbo].[FilmActorMatches] CHECK CONSTRAINT [FK_FilmActorMatches_Films]
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Categories]
GO
ALTER TABLE [dbo].[Films]  WITH CHECK ADD  CONSTRAINT [FK_Films_Directors] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Films] CHECK CONSTRAINT [FK_Films_Directors]
GO
/****** Object:  StoredProcedure [dbo].[AddActor]    Script Date: 13.07.2022 22:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddActor]
@name nvarchar(20),
@surname nvarchar(25)

AS
INSERT INTO Actors(Name, Surname)
values(@name,@surname);


SELECT * FROM Actors 

/*
Aktör tablosuna yeni kayıt yapan ve kayıt sonrası listenin güncel halini dönen prosedür oluşturulmuştur.
*/
GO
USE [master]
GO
ALTER DATABASE [MeltemCandan] SET  READ_WRITE 
GO
