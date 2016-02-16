USE [todo_test]
GO
/****** Object:  User [todotest]    Script Date: 14/02/2016 11:23:42 ******/
CREATE USER [todotest] FOR LOGIN [todotest] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [todotest]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [todotest]
GO
/****** Object:  Table [dbo].[ToDoItems]    Script Date: 14/02/2016 11:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ToDoItems](
	[id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[title] [varchar](50) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[complete] [bit] NOT NULL,
	[relatedid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ToDoItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ToDoItems] ADD  CONSTRAINT [DF_ToDoItems_id]  DEFAULT (newid()) FOR [id]
GO
