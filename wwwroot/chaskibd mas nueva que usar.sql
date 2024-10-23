USE [master]
GO
/****** Object:  Database [ChaskiBase]    Script Date: 23/10/2024 11:40:41 ******/
CREATE DATABASE [ChaskiBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChaskiBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ChaskiBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChaskiBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ChaskiBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ChaskiBase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChaskiBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChaskiBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChaskiBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChaskiBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChaskiBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChaskiBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChaskiBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChaskiBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChaskiBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChaskiBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChaskiBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChaskiBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChaskiBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChaskiBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChaskiBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChaskiBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChaskiBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChaskiBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChaskiBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChaskiBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChaskiBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChaskiBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChaskiBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChaskiBase] SET RECOVERY FULL 
GO
ALTER DATABASE [ChaskiBase] SET  MULTI_USER 
GO
ALTER DATABASE [ChaskiBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChaskiBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChaskiBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChaskiBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChaskiBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChaskiBase', N'ON'
GO
ALTER DATABASE [ChaskiBase] SET QUERY_STORE = OFF
GO
USE [ChaskiBase]
GO
/****** Object:  User [alumno]    Script Date: 23/10/2024 11:40:41 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CategoriasComidas]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasComidas](
	[IdCategoriaComida] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriasComidas] PRIMARY KEY CLUSTERED 
(
	[IdCategoriaComida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriasRestaurantes]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasRestaurantes](
	[IdCategoriaRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriasRestaurantes] PRIMARY KEY CLUSTERED 
(
	[IdCategoriaRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comida]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comida](
	[IdComida] [int] IDENTITY(1,1) NOT NULL,
	[IdRestriccionAlimenticia] [int] NOT NULL,
	[IdCategoriaComida] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [text] NULL,
 CONSTRAINT [PK_Comida] PRIMARY KEY CLUSTERED 
(
	[IdComida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[IdUsuario] [int] NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[Mensaje] [varchar](200) NOT NULL,
	[FechaMensaje] [date] NOT NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resenas]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resenas](
	[IdRestaurante] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Valoracion] [smallint] NOT NULL,
 CONSTRAINT [PK_Resenas] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurantes]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurantes](
	[IdRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoriaRestaurante] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Imagen] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Restaurantes] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantesYComidas]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantesYComidas](
	[IdComida] [int] NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_RestaurantesYComidas] PRIMARY KEY CLUSTERED 
(
	[IdComida] ASC,
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestriccionAlimenticia]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestriccionAlimenticia](
	[IdRestriccionAlimenticia] [int] IDENTITY(1,1) NOT NULL,
	[TipoRestriccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RestriccionAlimenticia] PRIMARY KEY CLUSTERED 
(
	[IdRestriccionAlimenticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/10/2024 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[NumeroTelefono] [varchar](50) NOT NULL,
	[Puntos] [int] NOT NULL,
	[Imagen] [varchar](200) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (1, N'no', N'no', N'', CAST(N'2000-03-03' AS Date), N'ii', N'1321', 0, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Comida]  WITH CHECK ADD  CONSTRAINT [FK_Comida_CategoriasComidas] FOREIGN KEY([IdRestriccionAlimenticia])
REFERENCES [dbo].[CategoriasComidas] ([IdCategoriaComida])
GO
ALTER TABLE [dbo].[Comida] CHECK CONSTRAINT [FK_Comida_CategoriasComidas]
GO
ALTER TABLE [dbo].[Comida]  WITH CHECK ADD  CONSTRAINT [FK_Comida_RestriccionAlimenticia] FOREIGN KEY([IdRestriccionAlimenticia])
REFERENCES [dbo].[RestriccionAlimenticia] ([IdRestriccionAlimenticia])
GO
ALTER TABLE [dbo].[Comida] CHECK CONSTRAINT [FK_Comida_RestriccionAlimenticia]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Restaurantes] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurantes] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Restaurantes]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Usuario]
GO
ALTER TABLE [dbo].[Resenas]  WITH CHECK ADD  CONSTRAINT [FK_Resenas_Restaurantes] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurantes] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Resenas] CHECK CONSTRAINT [FK_Resenas_Restaurantes]
GO
ALTER TABLE [dbo].[Resenas]  WITH CHECK ADD  CONSTRAINT [FK_Resenas_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Resenas] CHECK CONSTRAINT [FK_Resenas_Usuario]
GO
ALTER TABLE [dbo].[Restaurantes]  WITH CHECK ADD  CONSTRAINT [FK_Restaurantes_CategoriasRestaurantes] FOREIGN KEY([IdCategoriaRestaurante])
REFERENCES [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante])
GO
ALTER TABLE [dbo].[Restaurantes] CHECK CONSTRAINT [FK_Restaurantes_CategoriasRestaurantes]
GO
ALTER TABLE [dbo].[RestaurantesYComidas]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantesYComidas_Comida1] FOREIGN KEY([IdComida])
REFERENCES [dbo].[Comida] ([IdComida])
GO
ALTER TABLE [dbo].[RestaurantesYComidas] CHECK CONSTRAINT [FK_RestaurantesYComidas_Comida1]
GO
ALTER TABLE [dbo].[RestaurantesYComidas]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantesYComidas_Restaurantes] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurantes] ([IdRestaurante])
GO
ALTER TABLE [dbo].[RestaurantesYComidas] CHECK CONSTRAINT [FK_RestaurantesYComidas_Restaurantes]
GO
USE [master]
GO
ALTER DATABASE [ChaskiBase] SET  READ_WRITE 
GO
