/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [local]
GO
/****** Object:  Table [dbo].[DemoProduct]    Script Date: 6/6/2018 3:48:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DemoProduct](
	[Si] [int] IDENTITY(1,1) NOT NULL,
	[Product] [varchar](20) NOT NULL,
	[Brand] [varchar](20) NOT NULL,
	[Month] [varchar](20) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_DemoProduct] PRIMARY KEY CLUSTERED 
(
	[Si] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DemoProduct] ON 
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (1, N'Model S', N'Tesla', N'2018-01', N'CO', 1)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (2, N'Model S', N'Tesla', N'2018-02', N'CO', 2)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (3, N'Model S', N'Tesla', N'2018-03', N'CO', 3)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (4, N'Model S', N'Tesla', N'2018-04', N'CO', 2)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (5, N'Model S', N'Tesla', N'2018-01', N'IA', 2)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (6, N'Model S', N'Tesla', N'2018-02', N'IA', 1)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (7, N'Model S', N'Tesla', N'2018-03', N'IA', 2)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (8, N'Model S', N'Tesla', N'2018-04', N'IA', 1)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (9, N'Model 3', N'Tesla', N'2018-01', N'CO', 3)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (10, N'Model 3', N'Tesla', N'2018-02', N'CO', 4)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (11, N'Model 3', N'Tesla', N'2018-03', N'CO', 5)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (12, N'Model 3', N'Tesla', N'2018-01', N'IA', 3)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (13, N'Model 3', N'Tesla', N'2018-02', N'IA', 4)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (14, N'Model 3', N'Tesla', N'2018-03', N'IA', 5)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (15, N'Model 3', N'Tesla', N'2018-03', N'IA', 6)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (16, N'S9+', N'Samsung', N'2018-01', N'CO', 12)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (17, N'S9+', N'Samsung', N'2018-02', N'CO', 11)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (18, N'S9+', N'Samsung', N'2018-03', N'CO', 13)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (19, N'S9+', N'Samsung', N'2018-04', N'CO', 14)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (20, N'Note 9', N'Samsung', N'2018-01', N'CO', 7)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (21, N'Note 9', N'Samsung', N'2018-02', N'CO', 8)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (22, N'Note 9', N'Samsung', N'2018-03', N'CO', 9)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (23, N'Note 9', N'Samsung', N'2018-04', N'CO', 10)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (24, N'S9+', N'Samsung', N'2018-01', N'IA', 11)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (25, N'S9+', N'Samsung', N'2018-02', N'IA', 10)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (26, N'S9+', N'Samsung', N'2018-03', N'IA', 9)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (27, N'S9+', N'Samsung', N'2018-04', N'IA', 8)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (28, N'Note 9', N'Samsung', N'2018-01', N'IA', 7)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (29, N'Note 9', N'Samsung', N'2018-02', N'IA', 8)
GO
INSERT [dbo].[DemoProduct] ([Si], [Product], [Brand], [Month], [State], [Value]) VALUES (31, N'Note 9', N'Samsung', N'2018-04', N'IA', 6)
GO
SET IDENTITY_INSERT [dbo].[DemoProduct] OFF
GO
