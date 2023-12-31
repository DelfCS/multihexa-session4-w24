USE [master]
GO
/****** Object:  Database [GamesForum]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE DATABASE [GamesForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GamesForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GamesForum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GamesForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GamesForum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GamesForum] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GamesForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GamesForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GamesForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GamesForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GamesForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GamesForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [GamesForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GamesForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GamesForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GamesForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GamesForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GamesForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GamesForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GamesForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GamesForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GamesForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GamesForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GamesForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GamesForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GamesForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GamesForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GamesForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GamesForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GamesForum] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GamesForum] SET  MULTI_USER 
GO
ALTER DATABASE [GamesForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GamesForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GamesForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GamesForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GamesForum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GamesForum] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GamesForum] SET QUERY_STORE = ON
GO
ALTER DATABASE [GamesForum] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GamesForum]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discussions]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discussions](
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[UserID] [nvarchar](450) NULL,
	[Text] [nvarchar](1000) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Discussions] PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[UserID] [nvarchar](450) NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Text] [nvarchar](1000) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Views] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 2/23/2023 11:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Image] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.13')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'Moderator', N'MODERATOR', N'MODERATOR')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3', N'User', N'USER', N'USER')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'1')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'069acbb7-2a85-409b-a5b7-a68fea9a77f7', N'lat', N'LAT', N'lat@lat.com', N'LAT@LAT.COM', 0, N'AQAAAAEAACcQAAAAENKl3PVoh1KlAPEW9+WCZ6nHdgBOW1f8JLNlZlq3MA7wRUBsyZSx4O0al1o42Ceayg==', N'IC3WT2NK46NJEP5DXL4RR632WLKDSEQW', N'2437590d-0a59-4c6d-a4fe-1446515627e2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'13dca163-e1b6-4600-a523-76a53476bb2f', N'delfcs', N'DELFCS', N'delfcsgo@gmail.com', N'DELFCSGO@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOwSo58VDrN1RMqwQIe4nc+2bLJBFZd6heHSbbFBXcXOX+Xow+JwaPNlg8K90Jw0aw==', N'2734FSSQH5WFNG2LYX3WJUJ2H454NGFA', N'40610020-41f4-468e-abcc-d70fc0958002', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'poisson', N'POISSON', N'poisson@gmail.com', N'POISSON@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELvrJtvnw+FkNbiqtH+9TcVHlly5xpz6cIPIRgxPeU9SnK5oXFO6hhgcNGDdVbcZzQ==', N'RWMFOQRZC2W4IGIDT7HHO4P2SRUADKIO', N'74e62e93-251c-4c33-a821-2f515d97bdef', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'admin', N'ADMIN', N'admin@admin.com', N'ADMIN@ADMIN.COM', 0, N'AQAAAAEAACcQAAAAENHoP1QLCX+bEhao/MpcxgQhFKjJkgax9Fetux9W88yiw1NAhKSYK1ZWQGqm2B0DLQ==', N'7QXTO7XOLAMDS75BGZY6EUZYYAJGL3IW', N'adb9959b-0608-4aa0-9aca-3f324d87ce45', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Discussions] ON 

INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (1, 26, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>Apparently, there''s gonna be a Collector''s Edition with sick in-game goodies for other Blizzard games</p>', CAST(N'2023-02-23T21:18:19.120' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (2, 26, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>And the leaked internal spreadsheet that got all the dates right says that the game is gonna drop in April 2023 with early access and Open Beta coming in February 2023.</p>', CAST(N'2023-02-23T21:18:40.423' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (3, 27, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>It''s good to see BSG increasing the XP earned.</p>', CAST(N'2023-02-23T21:24:56.200' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (4, 32, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>It''s simply the&nbsp;<em>BEST !</em></p>', CAST(N'2023-02-23T21:36:39.680' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (5, 32, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>YEAHHHH !!!!!!</p>', CAST(N'2023-02-23T21:40:11.550' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (6, 37, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>Wanted: Dead is a simple and straightforward yet challenging action game. The story is weak, there are few stages and the minigames are generally uninteresting. On the other hand, the gameplay is pretty good once you get the hang of it. If you don''t care about the plot, overlook some technical problems and have the patience to learn the game, you might end up finding a good source of fun.</p>', CAST(N'2023-02-23T21:59:55.687' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (7, 37, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>Wanted: Dead tries to rekindle that flame of passion for gaming''s earliest titles, and while it might resonate with some who unconditionally loved this era of gaming, the final product is very unsatisfying and a reminder of why going back in time is a double-edged sword.</p>', CAST(N'2023-02-23T22:00:17.363' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (8, 37, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>As someone who considers themself an action game buff, Wanted: Dead let me down on just about every front. Its combat may be fun for a few hours, but eventually I realized that it was just a pool of shallow water to splash around in. The fights never evolved in any interesting or meaningful way, the minimal enemy variety never challenged me to change up my tactics, and worst of all I always felt weak, even when I fully maxed out the skill tree. Add on bland visuals, a distinct lack of personality and charm, and frequent crashes, and it all amounts to one of the first big disappointments of 2023.</p>', CAST(N'2023-02-23T22:00:26.867' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (9, 37, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'<p>To put it another way: This game does everything poorly, but mostly because it tries to do everything. It''s an anime, a cooking show, a&nbsp;<em>Family Guy</em>-esque pop culture reference-palooza, a biting critique of the military industrial complex, a meme graveyard, an ode to Tarantino, an ode to Suda51, and an ode to bad taste.<br><br>I can''t recommend you play this video game, but I won''t encourage you to look away. And so, here I am at the end, and all I really know for certain is this: Thank goodness I don''t have to assign a score.</p>', CAST(N'2023-02-23T22:00:38.460' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (10, 37, N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'<p>To conclude then, I really like this game once I got into the flow, as the hybrid shooting and melee combat works really well. I enjoyed Hannah''s character and the plentiful goofy moments. However, I think some gamers won''t get it, and frustrations with the camera, stun-lock and long checkpoints will dampen your experience. That said, Wanted: Dead comes highly recommended for anyone looking for an old-school challenge.</p>', CAST(N'2023-02-23T22:00:59.073' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (11, 37, N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'<p>Wanted: Dead doesn''t give a damn what you think. It throws ideas at you left, right and centre, with reckless abandon. Luckily, most of them stick to form this weird and wonderful video game. Just when you think you''ve finished second guessing Wanted: Dead, it throws something new at you just for the hell of it. The combat is hugely satisfying, and even on the lowest difficulty can provide a decent challenge in the later levels. Which is just as well because you will spend a long-time hacking, slashing and shooting away at thousands of enemies. It makes the moments in between all the more enjoyable by offering something completely different to the blood-drenched world that you leave behind.</p>', CAST(N'2023-02-23T22:01:07.857' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (12, 37, N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'<p>As the game and its plot drew to a close, as characters conversed about the&nbsp;<em>truth</em>&nbsp;being revealed, we''re treated to a final cutscene before the credits rolled. Maybe there is more to it at higher difficulties? After being brought back to the main menu in a state of genuine bemusement, I considered pursuing another playthrough. I decided against it &ndash; I actually value my time, and the one saving grace of the game &ndash; it''s unique sword/gun combat &ndash; is not enough to suffer through it again. I''ll leave it to others to find out.</p>', CAST(N'2023-02-23T22:01:16.880' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (13, 38, N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'<p>Despite the destruction wrought by the Kemono, the land of Azuma remains quite beautiful. In WILD HEARTS<strong>&trade;&nbsp;</strong>you''ll explore this fantasy world inspired by feudal Japan &ndash; from its flower-filled meadows to towering ruins.</p>', CAST(N'2023-02-23T22:02:11.243' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (14, 38, N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'<p>You are the only one in Azuma able to wield the Karakuri technology. This ancient tech enables you to adapt your environment into creative hunting grounds ideal for taking down the giant Kemono</p>', CAST(N'2023-02-23T22:02:17.860' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (15, 38, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>For some, the thrill of the hunt is best savored alone. But even the most deadly hunter may face a beast they cannot take down on their own. In WILD HEARTS you can unite with up to two friends (or other players) to stalk and hunt your prey.</p>', CAST(N'2023-02-23T22:02:35.783' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (16, 38, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>Kemono are the embodiment of the power of nature. These giant beasts fused with natural elements over time, modifying their environment to accommodate their needs. How can mere humans hope to take down such massive foes?</p>', CAST(N'2023-02-23T22:02:47.580' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (43, 38, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>123</p>', CAST(N'2023-02-23T22:57:30.980' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (44, 39, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>SIIII</p>', CAST(N'2023-02-23T22:57:57.167' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (45, 31, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>also like to thank the community for voting and commenting. ResetEra GotY is a celebration of your favorites.</p>', CAST(N'2023-02-23T22:58:48.663' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (46, 40, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>&nbsp;to the site, "Blizzard Diablo IV will adopt a season-based live service supported by microtransactions". The first Season is tentatively slated for Q3 2023 despite the game launching in April.</p>', CAST(N'2023-02-23T23:02:15.127' AS DateTime), 1)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (47, 42, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>Of course... REDO !</p>', CAST(N'2023-02-23T23:04:54.490' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (48, 39, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>123</p>', CAST(N'2023-02-23T23:10:51.457' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (49, 39, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>123</p>', CAST(N'2023-02-23T23:11:51.630' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (50, 39, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>123 !</p><p>&nbsp;</p>', CAST(N'2023-02-23T23:12:19.573' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (51, 39, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>Siiii !</p>', CAST(N'2023-02-23T23:13:51.503' AS DateTime), 0)
INSERT [dbo].[Discussions] ([MsgID], [PostID], [UserID], [Text], [Date], [Active]) VALUES (52, 39, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'<p>Best one so far !&nbsp;</p>', CAST(N'2023-02-23T23:14:25.310' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Discussions] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (26, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Diablo IV might be launching in August 2023', N'<p>Windows central published this, about Diablo IV, where "their own proven sources confirmed a release window for the upcoming title." We''ve recapped some interesting highlights below, but we advise you to read the full article on their site.</p>', CAST(N'2023-02-23T21:17:44.760' AS DateTime), 8, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (27, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Escape From Tarkov November 8th patch', N'<p>What pach did was increase in experience from daily and weekly tasks, u get same amount from daily task like u used to get from weeklies and ubget quadruple amount on weeklies.</p>', CAST(N'2023-02-23T21:24:32.477' AS DateTime), 3, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (28, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Pokemon Go Ditto', N'<p>Last month I caught 5 Ditto''s in the same day. Unfortunately none was a shinny. So now I have 9 Ditto''s and still looking for a shinny</p>', CAST(N'2023-02-23T21:25:36.210' AS DateTime), 1, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (29, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Steps Counter Compatible for POGO', N'<p>Has anyone ever been banned as of late for using a step counter to hatch eggs and walk to earn candy for your buddy? I&rsquo;m skeptical, but from what I&rsquo;ve seen it&rsquo;s only spoofers and third party apps or software that ban you.</p>', CAST(N'2023-02-23T21:28:24.097' AS DateTime), 0, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (31, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'ResetEra Games of the Year Awards 2022', N'<p>What can more be said about Elden Ring? It''s an evolved Souls game with absolutely massive scope. I was in the middle playing it when my first child was born, and playing through the rest of it over parental leave helped keep me sane? It was an amazing journey, and I''m looking forward to seeing what else is coming with some DLC</p>', CAST(N'2023-02-23T21:35:20.160' AS DateTime), 3, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (32, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Rumor: ''Half-Life: Alyx'' is coming to PlayStation ', N'<p>The Lands Between is an absolutely stunning world, the second best open world ever made (behind BOTW) and the only world other than BOTW to really evoke strong feelings of adventure and discovery on a grand scale. Also -</p>', CAST(N'2023-02-23T21:36:20.000' AS DateTime), 6, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (33, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Concerning "Hogwarts Legacy" and JK Rowling', N'<p>After continued internal discussion, we began to start outlining the issues put forth by Rowling and the game in question and each time, and as we discussed it all, we kept coming back to the simple fact that Rowling is not only a bigot but is actively pushing, in her position as a wealthy and famous individual, for legislation that will hurt trans people. That she uses the influence and money gained from her success with Harry Potter to push transphobic legislation.</p>', CAST(N'2023-02-23T21:51:14.117' AS DateTime), 1, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (34, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Baldur''s Gate 3 releases August 31st, 2023 (PC)', N'<p>Baldur''s Gate 3 will also support cross-progression between PC, Mac and PS5, allowing you to transfer your saves between platforms and continue your adventure wherever you purchase the game.</p>', CAST(N'2023-02-23T21:51:40.200' AS DateTime), 9, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (35, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'I''m just gonna say it...', N'<p>I''ve been active on gaming forums for most of my life, starting as a wee lad back in the late 90''s on GameFAQs. I bounced around various community forums for years back then before finding the Old Site sometime around 2009. I very much enjoyed my time on the Old Site for years before its implosion and then happily hopped aboard the Discord life boats during the exodus to ERA. My point is I''ve been around the block and have seen all the forms that online gaming discussion can take in forums, chat rooms, you name it. And I honestly haven''t experienced an overall better community for thoughtful, respectful discussion about this hobby that we all love than this one.</p>', CAST(N'2023-02-23T21:52:07.483' AS DateTime), 12, 0)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (37, 2, N'13dca163-e1b6-4600-a523-76a53476bb2f', N'Wanted: Dead Review Thread', N'<p><em>Wanted: Dead</em>&nbsp;is a commendable effort from this team and a sign of much better things to come. It is unapologetic in what it wants to be, and so despite all of its quirks and faults, it offers a charming and memorable action game experience that is backed by a captivating presentation. Come for the brutally effective combat but stay for the utterly surreal game world filled with fun distractions and addictive carnage. With this debut title, 110 Industries takes us back to a time when a standout vibe made up for a lack of polish.</p>', CAST(N'2023-02-23T21:59:42.433' AS DateTime), 25, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (38, 2, N'd4e15f0e-4d0a-47ae-b16d-d2470468b666', N'Wild Hearts |OT| A wild Monster Hunter challenger ', N'<p>Master ancient tech to hunt down giant beasts. WILD HEARTS&trade; is a twist on the hunting genre where technology gives you a fighting chance against giant nature-infused beasts.</p><p>Harness nature''s energy to power the ancient Karakuri technology in WILD HEARTS&trade;. Both weapons and tools, the Karakuri can be shaped into many forms. With them, you can set traps, react to attackers, and deliver devastating damage to the mighty Kemono. But you can build as well as destroy. Gathering resources, training, and swift travel are just a few of the Karakuri''s many constructive uses.</p>', CAST(N'2023-02-23T22:02:03.220' AS DateTime), 44, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (39, 2, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'NEW GAMEEEEE', N'<p>I''ve greatly enjoyed playing this mod. I understand it''s no longer in development (probably?) but thought I would leave my thoughts here as feedback and for anyone else looking to play. I know I enjoyed reading other accounts while deciding whether to play the mod. So here it is! I''ve played through all the endgame sidequests at this point but haven''t started the Black Omen. I thought I''d get my ideas down before they fade any more.</p>', CAST(N'2023-02-23T22:25:31.000' AS DateTime), 40, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (40, 4, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'Looook at this clip ! ', N'<p>&nbsp;to the site, "Blizzard Diablo IV will adopt a season-based live service supported by microtransactions". The first Season is tentatively slated for Q3 2023 despite the game launching in April.</p>', CAST(N'2023-02-23T23:02:08.697' AS DateTime), 3, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (41, 4, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'Apparently, there''s gonna be a Collector''s Edition', N'<p>&nbsp;And the leaked internal spreadsheet that got all the dates right says that the game is gonna drop in April 2023 with early access and Open Beta coming in February 2023. Blizzard is gonna adopt a season-based live service</p>', CAST(N'2023-02-23T23:02:55.203' AS DateTime), 0, 1)
INSERT [dbo].[Posts] ([PostID], [TopicID], [UserID], [Title], [Text], [Date], [Views], [Active]) VALUES (42, 2, N'f55653ce-e467-4fcb-9043-6762d7a8af9d', N'Phoned-in celebrity performances in video games', N'<p>Patrick Stewart as the emperor in Oblivion comes to mind immediately. He sounds like he''s falling asleep in that role, though to be fair, his character had nothing to do. REDO !</p>', CAST(N'2023-02-23T23:04:35.000' AS DateTime), 15, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (1, N'Gussssss', N'Links & any usefull guide or information for players !', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (2, N'Upcomming', N'<p>Discuss events, new games, share trailers ! EDITED VERSION ! Hehe !</p>', NULL, 1)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (3, N'Ask ', N'Stuck somewhere ? Can''t get going with your quest ? Ask another player !', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (4, N'Clip sharing', N'Share your clips !', NULL, 1)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (5, N'Rating ', N'Feeling critical ? Come rate your gaming expenriences !', NULL, 1)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (9, N'Welcome to the Jungle', N'Anything meme related ', NULL, 1)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (22, N'INSANE IN THE BRAIN', N'INSANE IN THE MEMBRANEEE', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (23, N'123123', N'123213', N'12312', 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (24, N'1231', NULL, NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (25, N'213123', NULL, NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (26, N'Upcomming 123', N'<p>Discuss events, new games, share trailers !</p>', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (27, N'Upcomming 123', N'<p>Discuss events, new games, share trailers !</p>', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (28, N'Upcomming ', N'<p>Discuss events, new games, share trailers ! sss</p>', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (29, N'Upcomming 123', N'<p>Discuss events, new games, share trailers !</p>', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (30, N'Topic Test - Admin ', N'<p>Test topic - 5h52 PM</p>', NULL, 0)
INSERT [dbo].[Topics] ([TopicID], [Name], [Description], [Image], [Active]) VALUES (31, N'Test DELETE', N'<p>DELETE ME</p>', NULL, 0)
SET IDENTITY_INSERT [dbo].[Topics] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/23/2023 11:55:54 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Discussions] ADD  CONSTRAINT [DF_Discussions_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_Actif]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [DF_Topics_Actif]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Discussions]  WITH CHECK ADD  CONSTRAINT [FK_Discussions_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Discussions] CHECK CONSTRAINT [FK_Discussions_AspNetUsers]
GO
ALTER TABLE [dbo].[Discussions]  WITH CHECK ADD  CONSTRAINT [FK_Discussions_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Discussions] CHECK CONSTRAINT [FK_Discussions_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_AspNetUsers]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Topics] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Topics]
GO
USE [master]
GO
ALTER DATABASE [GamesForum] SET  READ_WRITE 
GO
