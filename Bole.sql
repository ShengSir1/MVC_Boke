USE [master]
GO
/****** Object:  Database [boke]    Script Date: 2021/7/4 22:11:26 ******/
CREATE DATABASE [boke]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'boke', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\boke.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'boke_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\boke_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [boke] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [boke].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [boke] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [boke] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [boke] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [boke] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [boke] SET ARITHABORT OFF 
GO
ALTER DATABASE [boke] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [boke] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [boke] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [boke] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [boke] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [boke] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [boke] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [boke] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [boke] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [boke] SET  ENABLE_BROKER 
GO
ALTER DATABASE [boke] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [boke] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [boke] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [boke] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [boke] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [boke] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [boke] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [boke] SET RECOVERY FULL 
GO
ALTER DATABASE [boke] SET  MULTI_USER 
GO
ALTER DATABASE [boke] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [boke] SET DB_CHAINING OFF 
GO
ALTER DATABASE [boke] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [boke] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [boke] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'boke', N'ON'
GO
ALTER DATABASE [boke] SET QUERY_STORE = OFF
GO
USE [boke]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [boke]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Type] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
 CONSTRAINT [PK_admins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[articles]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articles](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[text] [text] NULL,
	[title] [varchar](50) NOT NULL,
	[content] [text] NOT NULL,
	[lable] [varchar](150) NULL,
	[is_del] [int] NOT NULL,
	[pv] [int] NULL,
	[state] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_articles] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collect]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collect](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[createTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Collect] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[content] [text] NOT NULL,
	[praies] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drafts]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drafts](
	[did] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NOT NULL,
	[tittle] [varchar](50) NOT NULL,
	[content] [text] NOT NULL,
	[labId] [varchar](50) NOT NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_drafts] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[informs]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[informs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[type] [varchar](50) NULL,
	[content] [varchar](100) NOT NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_informs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recommends]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recommends](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[uid] [int] NOT NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
 CONSTRAINT [PK_recommends] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021/7/4 22:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](15) NOT NULL,
	[email] [varchar](255) NULL,
	[LoginID] [varchar](18) NULL,
	[password] [varchar](300) NOT NULL,
	[img] [varchar](max) NOT NULL,
	[sign] [varchar](500) NOT NULL,
	[cover] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[state] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[articles] ON 

INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (8, 6, N'如何系统的学习C#？', N'C#该怎么学？', N'<p><b>如何系统的学习C#？</b></p>', N'C#,学习,', 0, 0, 0, CAST(N'2021-06-13T14:44:29.3933333' AS DateTime2), CAST(N'2021-06-13T14:44:29.393' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (9, 5, N'如何系统的学习JavaScript?请帮帮萌新。', N'JavaScript', N'<p>如何系统的学习JavaScript?</p><p>请帮帮萌新。</p>', N'学习,Javascript,', 0, 0, 0, CAST(N'2021-06-13T14:58:33.3700000' AS DateTime2), CAST(N'2021-06-13T14:58:33.370' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (10, 6, N'Jquery比JavaScript方便，建议多使用Jquery??', N'Jquery比JavaScript方便', N'<p>Jquery比JavaScript方便，建议多使用Jquery??</p>', N'JavaScript,html,Jquery,', 0, 0, 0, CAST(N'2021-06-13T16:20:52.6766667' AS DateTime2), CAST(N'2021-06-13T16:20:52.677' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (11, 4, N'JS真好用', N'JSSS', N'<p>JS真好用</p>', N'jacascript,html,', 0, 0, 0, CAST(N'2021-06-13T20:11:30.3300000' AS DateTime2), CAST(N'2021-06-26T23:40:11.940' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1011, 4, N'更改样式实在是太麻烦了啊', N'更改样式太麻烦了', N'<p><strike>更改样式实在是太麻烦了啊</strike></p>', N'学习,', 0, 0, 0, CAST(N'2021-06-17T20:31:24.4000000' AS DateTime2), CAST(N'2021-06-17T20:31:24.400' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1012, 4, N'JS', N'JSS', N'<h1 id="9fmve">JS</h1>', N'js,', 0, 0, 0, CAST(N'2021-06-13T20:11:30.3300000' AS DateTime2), CAST(N'2021-06-13T20:11:30.330' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1013, 4, N'更改样式实在是太麻烦了啊', N'更改样式太麻烦了', N'<p><strike>更改样式实在是太麻烦了啊</strike></p>', N'学习,', 0, 0, 0, CAST(N'2021-06-17T20:31:24.4000000' AS DateTime2), CAST(N'2021-06-17T20:31:24.400' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1014, 4, N'JS', N'JSS', N'<h1 id="9fmve">JS</h1>', N'js,', 0, 0, 0, CAST(N'2021-06-13T20:11:30.3300000' AS DateTime2), CAST(N'2021-06-13T20:11:30.330' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1015, 4, N'更改样式实在是太麻烦了啊', N'更改样式太麻烦了', N'<p><strike>更改样式实在是太麻烦了啊</strike></p>', N'学习,', 0, 0, 0, CAST(N'2021-06-17T20:31:24.4000000' AS DateTime2), CAST(N'2021-06-17T20:31:24.400' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1016, 4, N'JS', N'JSS', N'<h1 id="9fmve">JS</h1>', N'js,', 0, 0, 0, CAST(N'2021-06-13T20:11:30.3300000' AS DateTime2), CAST(N'2021-06-13T20:11:30.330' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1017, 4, N'更改样式实在是太麻烦了啊', N'更改样式太麻烦了', N'<p><strike>更改样式实在是太麻烦了啊</strike></p>', N'学习,', 0, 0, 0, CAST(N'2021-06-17T20:31:24.4000000' AS DateTime2), CAST(N'2021-06-17T20:31:24.400' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1018, 4, N'JS', N'JSS', N'<h1 id="9fmve">JS</h1>', N'js,', 0, 0, 0, CAST(N'2021-06-13T20:11:30.3300000' AS DateTime2), CAST(N'2021-06-13T20:11:30.330' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1019, 4, N'更改样式实在是太麻烦了啊', N'更改样式太麻烦了', N'<p><strike>更改样式实在是太麻烦了啊</strike></p>', N'学习,', 0, 0, 0, CAST(N'2021-06-17T20:31:24.4000000' AS DateTime2), CAST(N'2021-06-17T20:31:24.400' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1024, 4, N'水水水水水水水水水水水水', N'测试测试', N'<p>这是测试</p>', N'测试,', 0, 0, 0, CAST(N'2021-06-26T22:21:46.9200000' AS DateTime2), CAST(N'2021-06-26T22:24:02.330' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1026, 4, N'古力特', N'JS', N'<p>古力特</p>', N'ssss,', 0, 0, 0, CAST(N'2021-06-27T17:04:41.2000000' AS DateTime2), CAST(N'2021-06-27T17:04:41.200' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1027, 4, N'sssss', N'JS', N'<p>古力特</p>', N'ssss,', 0, 0, 0, CAST(N'2021-06-26T16:04:41.2000000' AS DateTime2), CAST(N'2021-06-27T17:04:41.200' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1031, 4, N'古力特', N'SSSS', N'<p>古力特</p>', N'动漫,', 0, 0, 0, CAST(N'2021-06-27T20:30:39.2873749' AS DateTime2), CAST(N'2021-06-27T20:30:39.287' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1032, 4, N'测试', N'草稿测试', N'<p>测试</p>', N'HTML,', 0, 0, 0, CAST(N'2021-06-27T20:30:52.6651639' AS DateTime2), CAST(N'2021-06-27T20:30:52.667' AS DateTime))
INSERT [dbo].[articles] ([aid], [uid], [text], [title], [content], [lable], [is_del], [pv], [state], [created_at], [updated_at]) VALUES (1033, 4, N'ces', N'草稿测试ssss', N'<p>ces</p>', N'HTML,', 0, 0, 1, CAST(N'2021-06-27T20:38:50.0322659' AS DateTime2), CAST(N'2021-06-27T20:45:00.540' AS DateTime))
SET IDENTITY_INSERT [dbo].[articles] OFF
GO
SET IDENTITY_INSERT [dbo].[Collect] ON 

INSERT [dbo].[Collect] ([id], [aid], [uid], [createTime]) VALUES (1, 11, 5, CAST(N'2021-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Collect] ([id], [aid], [uid], [createTime]) VALUES (2, 11, 6, CAST(N'2021-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Collect] ([id], [aid], [uid], [createTime]) VALUES (32, 8, 4, CAST(N'2021-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Collect] ([id], [aid], [uid], [createTime]) VALUES (34, 1033, 4, CAST(N'2021-07-04T21:02:37.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[Collect] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [aid], [uid], [content], [praies], [created_at], [update_at]) VALUES (1, 1027, 5, N'好耶', 0, CAST(N'2021-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[comments] ([id], [aid], [uid], [content], [praies], [created_at], [update_at]) VALUES (2, 1033, 4, N'123', 1, CAST(N'2021-07-04T20:41:22.037' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[informs] ON 

INSERT [dbo].[informs] ([id], [aid], [uid], [type], [content], [create_at], [update_at]) VALUES (6, 8, 6, N'低俗                ', N'123', CAST(N'2021-07-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[informs] ([id], [aid], [uid], [type], [content], [create_at], [update_at]) VALUES (7, 1033, 4, N'低俗', N'snm', CAST(N'2021-07-04T21:21:34.047' AS DateTime), NULL)
INSERT [dbo].[informs] ([id], [aid], [uid], [type], [content], [create_at], [update_at]) VALUES (8, 1033, 4, N'低俗', N'snm', CAST(N'2021-07-04T21:25:03.430' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[informs] OFF
GO
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([id], [aid], [uid], [created_at], [update_at]) VALUES (2, 1033, 4, CAST(N'2021-07-04T21:09:55.533' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Like] OFF
GO
SET IDENTITY_INSERT [dbo].[recommends] ON 

INSERT [dbo].[recommends] ([id], [aid], [uid], [create_at], [update_at]) VALUES (1, 1011, 6, CAST(N'2021-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[recommends] ([id], [aid], [uid], [create_at], [update_at]) VALUES (2, 1027, 6, CAST(N'2021-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[recommends] ([id], [aid], [uid], [create_at], [update_at]) VALUES (4, 1027, 5, CAST(N'2021-06-27T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[recommends] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [LoginID], [password], [img], [sign], [cover], [created_at], [update_at], [state]) VALUES (4, N'Roselia', N'2720443915@qq.com', N'roselia', N'202cb962ac59075b964b07152d234b70', N'/Content/Image/users/傲娇.png', N'这个用户很懒，什么都没有写。', N'/Content/Image/covers/1.jpg', CAST(N'2021-06-09T22:02:07.683' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [name], [email], [LoginID], [password], [img], [sign], [cover], [created_at], [update_at], [state]) VALUES (5, N'博客用户48023', NULL, N'ras', N'202cb962ac59075b964b07152d234b70', N'/Content/Image/users/1.png', N'这个用户很懒，什么都没有写。', N'/Content/Image/covers/1.jpg', CAST(N'2021-06-13T14:02:26.613' AS DateTime), NULL, 0)
INSERT [dbo].[users] ([id], [name], [email], [LoginID], [password], [img], [sign], [cover], [created_at], [update_at], [state]) VALUES (6, N'博客用户43721', NULL, N'kksk', N'202cb962ac59075b964b07152d234b70', N'/Content/Image/users/1.png', N'这个用户很懒，什么都没有写。', N'/Content/Image/covers/1.jpg', CAST(N'2021-06-13T14:06:57.490' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[admins] ADD  CONSTRAINT [DF_admins_Created_at]  DEFAULT (getdate()) FOR [Created_at]
GO
ALTER TABLE [dbo].[articles] ADD  CONSTRAINT [DF_articles_pv]  DEFAULT ((0)) FOR [pv]
GO
ALTER TABLE [dbo].[articles]  WITH CHECK ADD  CONSTRAINT [FK_articles_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[articles] CHECK CONSTRAINT [FK_articles_users]
GO
ALTER TABLE [dbo].[Collect]  WITH CHECK ADD  CONSTRAINT [FK_Collect_articles] FOREIGN KEY([aid])
REFERENCES [dbo].[articles] ([aid])
GO
ALTER TABLE [dbo].[Collect] CHECK CONSTRAINT [FK_Collect_articles]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_articles] FOREIGN KEY([aid])
REFERENCES [dbo].[articles] ([aid])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_articles]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_users]
GO
ALTER TABLE [dbo].[drafts]  WITH CHECK ADD  CONSTRAINT [FK_drafts_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[drafts] CHECK CONSTRAINT [FK_drafts_users]
GO
ALTER TABLE [dbo].[informs]  WITH CHECK ADD  CONSTRAINT [FK_informs_articles] FOREIGN KEY([aid])
REFERENCES [dbo].[articles] ([aid])
GO
ALTER TABLE [dbo].[informs] CHECK CONSTRAINT [FK_informs_articles]
GO
ALTER TABLE [dbo].[informs]  WITH CHECK ADD  CONSTRAINT [FK_informs_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[informs] CHECK CONSTRAINT [FK_informs_users]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_articles] FOREIGN KEY([aid])
REFERENCES [dbo].[articles] ([aid])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_articles]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_users]
GO
ALTER TABLE [dbo].[recommends]  WITH CHECK ADD  CONSTRAINT [FK_recommends_articles] FOREIGN KEY([aid])
REFERENCES [dbo].[articles] ([aid])
GO
ALTER TABLE [dbo].[recommends] CHECK CONSTRAINT [FK_recommends_articles]
GO
ALTER TABLE [dbo].[recommends]  WITH CHECK ADD  CONSTRAINT [FK_recommends_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[recommends] CHECK CONSTRAINT [FK_recommends_users]
GO
USE [master]
GO
ALTER DATABASE [boke] SET  READ_WRITE 
GO
