USE [ChaskiBase]
GO
/****** Object:  User [alumno]    Script Date: 23/10/2024 09:48:30 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CategoriasComidas]    Script Date: 23/10/2024 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasComidas](
	[IdCategoriaComida] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriasComidas] PRIMARY KEY CLUSTERED 
(
	[IdCategoriaComida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriasRestaurantes]    Script Date: 23/10/2024 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasRestaurantes](
	[IdCategoriaRestaurante] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriasRestaurantes] PRIMARY KEY CLUSTERED 
(
	[IdCategoriaRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comida]    Script Date: 23/10/2024 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comida](
	[IdComida] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Mensajes]    Script Date: 23/10/2024 09:48:30 ******/
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
/****** Object:  Table [dbo].[Resenas]    Script Date: 23/10/2024 09:48:30 ******/
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
/****** Object:  Table [dbo].[Restaurantes]    Script Date: 23/10/2024 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurantes](
	[IdRestaurante] [int] NOT NULL,
	[IdCategoriaRestaurante] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Restaurantes] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantesYComidas]    Script Date: 23/10/2024 09:48:30 ******/
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
/****** Object:  Table [dbo].[RestriccionAlimenticia]    Script Date: 23/10/2024 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestriccionAlimenticia](
	[IdRestriccionAlimenticia] [int] NOT NULL,
	[TipoRestriccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RestriccionAlimenticia] PRIMARY KEY CLUSTERED 
(
	[IdRestriccionAlimenticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/10/2024 09:48:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[NumeroTelefono] [varchar](50) NOT NULL,
	[Puntos] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
