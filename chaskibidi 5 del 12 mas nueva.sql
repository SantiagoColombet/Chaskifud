USE [master]
GO
/****** Object:  Database [Chaskibase]    Script Date: 5/12/2024 10:42:11 ******/
CREATE DATABASE [Chaskibase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chaskibase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Chaskibase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chaskibase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Chaskibase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Chaskibase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chaskibase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chaskibase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chaskibase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chaskibase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chaskibase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chaskibase] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chaskibase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chaskibase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chaskibase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chaskibase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chaskibase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chaskibase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chaskibase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chaskibase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chaskibase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chaskibase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Chaskibase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chaskibase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chaskibase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chaskibase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chaskibase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chaskibase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chaskibase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chaskibase] SET RECOVERY FULL 
GO
ALTER DATABASE [Chaskibase] SET  MULTI_USER 
GO
ALTER DATABASE [Chaskibase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chaskibase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chaskibase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chaskibase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chaskibase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Chaskibase', N'ON'
GO
ALTER DATABASE [Chaskibase] SET QUERY_STORE = OFF
GO
USE [Chaskibase]
GO
/****** Object:  Table [dbo].[CategoriasComidas]    Script Date: 5/12/2024 10:42:11 ******/
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
/****** Object:  Table [dbo].[CategoriasRestaurantes]    Script Date: 5/12/2024 10:42:11 ******/
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
/****** Object:  Table [dbo].[Comida]    Script Date: 5/12/2024 10:42:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comida](
	[IdComida] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [varchar](max) NULL,
	[Precio] [int] NULL,
	[IdRestaurante] [int] NULL,
	[IdRestriccionAlimenticia] [int] NOT NULL,
	[IdCategoriaComida] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_Comida] PRIMARY KEY CLUSTERED 
(
	[IdComida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 5/12/2024 10:42:11 ******/
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
/****** Object:  Table [dbo].[Resenas]    Script Date: 5/12/2024 10:42:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resenas](
	[IdRestaurante] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Valoracion] [smallint] NOT NULL,
	[Opinion] [text] NULL,
	[IdResena] [int] IDENTITY(1,1) NOT NULL,
	[FechaEscrita] [date] NULL,
	[CantidadAportes] [int] NOT NULL,
	[CantidadVotosArriba] [int] NOT NULL,
	[CantidadVotosAbajo] [int] NOT NULL,
 CONSTRAINT [PK_Resenas] PRIMARY KEY CLUSTERED 
(
	[IdResena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurantes]    Script Date: 5/12/2024 10:42:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurantes](
	[IdRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoriaRestaurante] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Puntuacion] [nchar](10) NULL,
	[Imagen] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Restaurantes] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantesYComidas]    Script Date: 5/12/2024 10:42:11 ******/
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
/****** Object:  Table [dbo].[RestriccionAlimenticia]    Script Date: 5/12/2024 10:42:11 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/12/2024 10:42:11 ******/
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
SET IDENTITY_INSERT [dbo].[CategoriasComidas] ON 

INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (1, N'Milanesa')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (2, N'Papas fritas')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (3, N'Shawarma')
SET IDENTITY_INSERT [dbo].[CategoriasComidas] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriasRestaurantes] ON 

INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (1, N'Milanesa')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (2, N'Sandwiches')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (3, N'Shawarma')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (4, N'Papas Fritas')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (5, N'Empanadas')
SET IDENTITY_INSERT [dbo].[CategoriasRestaurantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Comida] ON 

INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (2, N'mila-poyin.jpg', 1000, 1, 1, 1, N'Milanesa', N'Disfruta de nuestra deliciosa milanesa, un clásico irresistible. Preparada con carne de primera calidad, empanizada a la perfección y frita hasta obtener un dorado crujiente. Ideal para acompañar con papas fritas, ensalada o en un sándwich. Perfecta para cualquier ocasión, ¡no te la puedes perder!

')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (6, N'empanada-vasquito.jpg', 1500, 2, 1, 1, N'Empanada', N'Empanada nashe del vasquito')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (7, N'Gordo', 2000, 2, 1, 1, N'Dulce de leche', N'El gordo bebeSUCK es un autentico lame pollas')
SET IDENTITY_INSERT [dbo].[Comida] OFF
GO
SET IDENTITY_INSERT [dbo].[Resenas] ON 

INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 3, N'"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3, CAST(N'2018-05-10' AS Date), 4, 90, 38)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 5, N'hola', 4, CAST(N'2015-02-03' AS Date), 10, 68, 53)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 2, N'dwada', 5, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 1, N'wddaw', 6, CAST(N'2024-12-05' AS Date), 0, 6, 1)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 1, N'wddawdwadwa', 7, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 1, N'wddawdwadwa', 8, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 2, N'dwadwa', 9, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 3, N'dwadwadw', 10, CAST(N'2024-12-05' AS Date), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Resenas] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurantes] ON 

INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [Imagen]) VALUES (1, 1, N'Gra-Hu', N'Río de Janeiro 320', N'5         ', N'Gra-Hu-Logo.jpeg')
INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [Imagen]) VALUES (2, 5, N'Vasquito', N'Río de Janeiro 310', N'4.5       ', N'vasquito.jfif')
SET IDENTITY_INSERT [dbo].[Restaurantes] OFF
GO
SET IDENTITY_INSERT [dbo].[RestriccionAlimenticia] ON 

INSERT [dbo].[RestriccionAlimenticia] ([IdRestriccionAlimenticia], [TipoRestriccion]) VALUES (1, N'Todo')
INSERT [dbo].[RestriccionAlimenticia] ([IdRestriccionAlimenticia], [TipoRestriccion]) VALUES (2, N'Vegano')
INSERT [dbo].[RestriccionAlimenticia] ([IdRestriccionAlimenticia], [TipoRestriccion]) VALUES (3, N'Carnivoro')
SET IDENTITY_INSERT [dbo].[RestriccionAlimenticia] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (1, N'Pelado', N'Halac', N'halac.down@halacdown.com', CAST(N'2000-03-03' AS Date), N'ii', N'1321', 0, N'foto-ramon.jpg')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (2, N'Dekel', N'Usach', N'dekel.usach@gmail.com', CAST(N'2000-03-03' AS Date), N'dekel', N'123', 20, N'dekel.jpg')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (3, N'hola', N'hola', N'hola@gmail.com', CAST(N'2222-02-02' AS Date), N'jola', N'123122', 0, N'3333')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
/****** Object:  Index [IX_Restaurantes_IdCategoriaRestaurante]    Script Date: 5/12/2024 10:42:11 ******/
CREATE NONCLUSTERED INDEX [IX_Restaurantes_IdCategoriaRestaurante] ON [dbo].[Restaurantes]
(
	[IdCategoriaRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[RestaurantesYComidas]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantesYComidas_Comida] FOREIGN KEY([IdComida])
REFERENCES [dbo].[Comida] ([IdComida])
GO
ALTER TABLE [dbo].[RestaurantesYComidas] CHECK CONSTRAINT [FK_RestaurantesYComidas_Comida]
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
/****** Object:  StoredProcedure [dbo].[ObtenerResenasRestaurante]    Script Date: 5/12/2024 10:42:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerResenasRestaurante]
    @IdRestaurante INT
AS
BEGIN
    SELECT r.IdRestaurante,r.Nombre,r.Direccion, r.Puntuacion,
        r.Imagen,
        rs.IdResena,
        rs.IdUsuario,
        rs.Valoracion,
        rs.Opinion,
        rs.FechaEscrita,
        rs.CantidadAportes,
        rs.CantidadVotosArriba,
        rs.CantidadVotosAbajo
    FROM Restaurantes r
    INNER JOIN Resenas rs ON r.IdRestaurante = rs.IdRestaurante
    WHERE r.IdRestaurante = @IdRestaurante ORDER BY rs.FechaEscrita DESC;
END;

GO
/****** Object:  StoredProcedure [dbo].[Registrarse]    Script Date: 5/12/2024 10:42:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Registrarse]
@Nombre varchar(50),
@Imagen varchar(1000),
@Apellido varchar(50),
@Email varchar(50),
@Contrasena varchar(50),
@NumeroTelefono varchar(50),
@FechaNacimiento Date,
@Puntos int
as
begin
	begin transaction
		begin try
			if(select count(*) from Usuario where Email=@Email or NumeroTelefono=@NumeroTelefono) != 0
			begin
				rollback transaction
				return
			end
			

			insert into Usuario(Nombre, Apellido, Email, FechaNacimiento, Contrasena, NumeroTelefono, Puntos, Imagen)
			values(@Nombre, @Apellido, @Email, @FechaNacimiento, @Contrasena, @NumeroTelefono, @Puntos, @Imagen)
		end try
		begin catch
			rollback transaction
		end catch
	commit transaction
end
GO
USE [master]
GO
ALTER DATABASE [Chaskibase] SET  READ_WRITE 
GO
