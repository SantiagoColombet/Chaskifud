USE [Chaskibase]
GO
/****** Object:  Table [dbo].[CategoriasComidas]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriasRestaurantes]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comida]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPedido]    Script Date: 4/5/2025 23:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPedido](
	[IdPedido] [int] NOT NULL,
	[IdComida] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 4/5/2025 23:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdUsuario] [int] NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Total] [int] NOT NULL,
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resenas]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurantes]    Script Date: 4/5/2025 23:48:36 ******/
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
	[IdUsuarioRestaurante] [int] NULL,
	[Acepta] [bit] NULL,
	[Imagen] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Restaurantes] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantesYComidas]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestriccionAlimenticia]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/5/2025 23:48:36 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioRestaurante]    Script Date: 4/5/2025 23:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRestaurante](
	[IdUsuarioRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[NumeroTelefono] [varchar](50) NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UsuarioRestaurante] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoriasComidas] ON 

INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (1, N'Milanesa')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (2, N'Papas fritas')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (3, N'Shawarma')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (4, N'Pasta')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (5, N'Calentitos')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (6, N'pescado')
INSERT [dbo].[CategoriasComidas] ([IdCategoriaComida], [Nombre]) VALUES (7, N'Snacks')
SET IDENTITY_INSERT [dbo].[CategoriasComidas] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriasRestaurantes] ON 

INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (1, N'Milanesa')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (2, N'Sandwiches')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (3, N'Shawarma')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (4, N'Papas Fritas')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (5, N'Empanadas')
INSERT [dbo].[CategoriasRestaurantes] ([IdCategoriaRestaurante], [Nombre]) VALUES (6, N'Pastas')
SET IDENTITY_INSERT [dbo].[CategoriasRestaurantes] OFF
GO
SET IDENTITY_INSERT [dbo].[Comida] ON 

INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (2, N'mila-poyin.jpg', 1000, 1, 1, 1, N'Milanesa', N'Disfruta de nuestra deliciosa milanesa, un clásico irresistible. Preparada con carne de primera calidad, empanizada a la perfección y frita hasta obtener un dorado crujiente. Ideal para acompañar con papas fritas, ensalada o en un sándwich. Perfecta para cualquier ocasión, ¡no te la puedes perder!

')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (6, N'empanada-vasquito.jpg', 1500, 2, 1, 1, N'Empanada', N'Empanada nashe del vasquito')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (7, N'Gordo', 2000, 2, 1, 1, N'Dulce de leche', N'El gordo bebeSUCK es un autentico lame pollas')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (8, N'ñoquis.jpg', 4000, 4, 1, 4, N'Ñoquis', N'Los ñoquis son una excelencia de la casa, vienen acompañados de boloñesa y mucho queso')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (9, N'papas_fritas.jpg', 1500, 1, 1, 2, N'Papas Fritas', N'La mejores papas fritas del condado')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (10, N'Spaghetti.jfif', 2500, 4, 1, 4, N'Spaghetti', N'Estos fideos son revolucionarios')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (11, N'Lajmashin.jfif', 7000, 6, 1, 5, N'Lajmashin', N'Los lajmashin mas ricos que existen')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (13, N'sushi.jfif', 8000, 6, 1, 6, N'Sushi', N'sushi con queso, palta y cosas varias')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (14, N'Cookie.jfif', 800, 8, 1, 7, N'Cookie', N'Las cookies mas sabrosas que hay')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (15, N'Macncheese.jfif', 2000, 8, 1, 4, N'Mac and cheese', N'Fideos exquisitos con queso cheddar')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (16, NULL, 21, 1, 2, 4, N'ads', N'as')
INSERT [dbo].[Comida] ([IdComida], [Imagen], [Precio], [IdRestaurante], [IdRestriccionAlimenticia], [IdCategoriaComida], [Nombre], [Descripcion]) VALUES (17, NULL, 2000, 1, 2, 4, N'Fideos', N'Con salsa')
SET IDENTITY_INSERT [dbo].[Comida] OFF
GO
INSERT [dbo].[DetallesPedido] ([IdPedido], [IdComida], [Cantidad], [Precio]) VALUES (1, 2, 1, 1000)
INSERT [dbo].[DetallesPedido] ([IdPedido], [IdComida], [Cantidad], [Precio]) VALUES (1, 9, 2, 1500)
INSERT [dbo].[DetallesPedido] ([IdPedido], [IdComida], [Cantidad], [Precio]) VALUES (2, 8, 1, 4000)
INSERT [dbo].[DetallesPedido] ([IdPedido], [IdComida], [Cantidad], [Precio]) VALUES (2, 10, 1, 2500)
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([IdUsuario], [IdRestaurante], [Estado], [Total], [IdPedido]) VALUES (2, 1, N'Entregado', 4000, 1)
INSERT [dbo].[Pedidos] ([IdUsuario], [IdRestaurante], [Estado], [Total], [IdPedido]) VALUES (2, 4, N'Pendiente', 6500, 2)
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Resenas] ON 

INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 3, N'Esta comida es increible el pollo se saborea de una manera esplendida, sin embargo el lugar es muy feo y siento que no tiene el suficiente higiene', 3, CAST(N'2018-05-10' AS Date), 4, 90, 38)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (2, 1, 5, N'Es la mejor comida que probe, el local es hermosos y te atienden super bien', 4, CAST(N'2015-02-03' AS Date), 10, 68, 53)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (4, 1, 2, N'Es un negocio lleno de nenes de 10 añitos que vienen a molestar todos los mediodias. ', 5, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (6, 1, 1, N'Detesto el tipo de comida que sirven, la manera de atenderte es odiosa y siempre esta explotado con gente', 6, CAST(N'2024-12-05' AS Date), 0, 20, 26)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (8, 1, 1, N'Nunca se puede ni entrar a comer porque siempre hay gente molestando y metiendo cuerpo, una vez que se van todos la comida es fea y no vale la pena la espera', 7, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (8, 1, 1, N'Dalton es feisimo y la manera de atender de la gente es penosa parece que trabajaran sin ganas', 8, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 2, N'El local no me gusto nada, parece que cocinan con todas las manos sucias y ni se preocupan por la salud del cleinte, zafa solo por la comida que a grandes rasgos es rica', 9, CAST(N'2024-12-05' AS Date), 0, 1, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (6, 1, 3, N'Comida bastante buena calidad precio, a veces llega un poco fria pero es rico.', 10, CAST(N'2024-12-05' AS Date), 0, 2, 11)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (4, 1, 3, N'La comida esta buena y te atienden bien, no me gustan las instalaciones y el hecho de que siempre me venga fria la comida', 14, CAST(N'2024-12-05' AS Date), 2, 20, 10)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (2, 1, 5, N'La verdad es que es increiblemente bueno, me alegro que hayan hecho un lugar asi de increible', 15, CAST(N'2024-12-05' AS Date), 1, 17, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 1, 5, N'soy el dueño', 17, CAST(N'2024-12-05' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (4, 1, 1, N'asd', 18, CAST(N'2025-05-04' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 2, 2, N'asdasd', 21, CAST(N'2025-05-04' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (1, 2, 3, N'La verdad que extremadamente regular', 22, CAST(N'2025-05-04' AS Date), 0, 0, 0)
INSERT [dbo].[Resenas] ([IdRestaurante], [IdUsuario], [Valoracion], [Opinion], [IdResena], [FechaEscrita], [CantidadAportes], [CantidadVotosArriba], [CantidadVotosAbajo]) VALUES (6, 2, 1, N'Muy malo, no me gusto para nadax', 23, CAST(N'2025-05-04' AS Date), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Resenas] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurantes] ON 

INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [IdUsuarioRestaurante], [Acepta], [Imagen]) VALUES (1, 1, N'Gra-Hu', N'Río de Janeiro 320', N'5         ', 1, 0, N'Gra-Hu-Logo.jpeg')
INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [IdUsuarioRestaurante], [Acepta], [Imagen]) VALUES (2, 5, N'Vasquito', N'Río de Janeiro 310', N'4.5       ', 2, 1, N'vasquito.jfif')
INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [IdUsuarioRestaurante], [Acepta], [Imagen]) VALUES (4, 6, N'Matilidita', N'Av dias velez 5289', N'3         ', 4, 1, N'matildita.jpg')
INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [IdUsuarioRestaurante], [Acepta], [Imagen]) VALUES (6, 2, N'Menora', N'Yatay 244', N'4         ', 6, 1, N'menora.png')
INSERT [dbo].[Restaurantes] ([IdRestaurante], [IdCategoriaRestaurante], [Nombre], [Direccion], [Puntuacion], [IdUsuarioRestaurante], [Acepta], [Imagen]) VALUES (8, 4, N'Dalton', N'Yatay 290', N'4         ', 8, 0, N'dalton.jfif')
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
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (11, N'Matias', N'Bebczuk', N'matiasbeck07@gmail.com', CAST(N'2024-12-03' AS Date), N'1234', N'15 5568 5941', 0, N'https://static.wikia.nocookie.net/mamarre-estudios-espanol/images/3/33/Jimbo.jpeg/revision/latest?cb=20201124234429&path-prefix=es')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (12, N'Ilan', N'Tauscher', N'ilu@gmail.com', CAST(N'2007-09-26' AS Date), N'ilu', N'11 2703 5580', 0, N'Ilan.jpg')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (13, N'Mati', N'Halac', N'mati@gmail.com', CAST(N'2008-06-27' AS Date), N'caca', N'1234567890', 0, N'd')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (14, N'julian', N'medina', N'julian.medina@ort.edu.ar', CAST(N'2022-11-11' AS Date), N'julian.medina@ort.edu.ar', N'11111', 0, N'Ilan.jpg')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Email], [FechaNacimiento], [Contrasena], [NumeroTelefono], [Puntos], [Imagen]) VALUES (15, N'Santi', N'Halac', N'halac@gmail.com', CAST(N'2000-02-20' AS Date), N'halac', N'202002020', 0, N'dekel.jpg')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioRestaurante] ON 

INSERT [dbo].[UsuarioRestaurante] ([IdUsuarioRestaurante], [Contrasena], [Nombre], [NumeroTelefono], [Imagen], [Email]) VALUES (1, N'GraHu123', N'Gra-Hu', N'1234567891', N'Gra-Hu-Logo.jpg', N'grahu@restaurante.com')
INSERT [dbo].[UsuarioRestaurante] ([IdUsuarioRestaurante], [Contrasena], [Nombre], [NumeroTelefono], [Imagen], [Email]) VALUES (2, N'Vasquito123', N'Vasquito', N'1234567892', N'vasquito.jfff', N'vasquito@restaurante.com')
INSERT [dbo].[UsuarioRestaurante] ([IdUsuarioRestaurante], [Contrasena], [Nombre], [NumeroTelefono], [Imagen], [Email]) VALUES (4, N'Matilidita123', N'Matilidita', N'1234567893', N'matilidita.jpg', N'matilidita@restaurante.com')
INSERT [dbo].[UsuarioRestaurante] ([IdUsuarioRestaurante], [Contrasena], [Nombre], [NumeroTelefono], [Imagen], [Email]) VALUES (6, N'Menora123', N'Menora', N'1234567894', N'menora.png', N'menora@restaurante.com')
INSERT [dbo].[UsuarioRestaurante] ([IdUsuarioRestaurante], [Contrasena], [Nombre], [NumeroTelefono], [Imagen], [Email]) VALUES (8, N'Dalton123', N'Dalton', N'1234567895', N'dalton.jfff', N'dalton@restaurante.com')
SET IDENTITY_INSERT [dbo].[UsuarioRestaurante] OFF
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPedido_Pedidos] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedidos] ([IdPedido])
GO
ALTER TABLE [dbo].[DetallesPedido] CHECK CONSTRAINT [FK_DetallesPedido_Pedidos]
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
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Restaurantes] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurantes] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Restaurantes]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuario]
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
ALTER TABLE [dbo].[Restaurantes]  WITH CHECK ADD  CONSTRAINT [FK_Restaurantes_UsuarioRestaurante] FOREIGN KEY([IdUsuarioRestaurante])
REFERENCES [dbo].[UsuarioRestaurante] ([IdUsuarioRestaurante])
GO
ALTER TABLE [dbo].[Restaurantes] CHECK CONSTRAINT [FK_Restaurantes_UsuarioRestaurante]
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
/****** Object:  StoredProcedure [dbo].[ObtenerResenasRestaurante]    Script Date: 4/5/2025 23:48:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Registrarse]    Script Date: 4/5/2025 23:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Registrarse]
@Nombre varchar(50),
@Imagen varchar(1000),
@Apellido varchar(50),
@Email varchar(50),
@Contrasena varchar(50),
@NumeroTelefono varchar(50),
@FechaNacimiento Date,
@Puntos int
AS
BEGIN
    -- Iniciar la transacción
    BEGIN TRANSACTION

    BEGIN TRY
        -- Verificar si el usuario ya existe
        IF (SELECT COUNT(*) FROM Usuario WHERE Email = @Email OR NumeroTelefono = @NumeroTelefono) != 0
        BEGIN
            -- Si existe, revertir la transacción
            ROLLBACK TRANSACTION
            RETURN
        END

        -- Insertar el nuevo usuario
        INSERT INTO Usuario (Nombre, Apellido, Email, FechaNacimiento, Contrasena, NumeroTelefono, Puntos, Imagen)
        VALUES (@Nombre, @Apellido, @Email, @FechaNacimiento, @Contrasena, @NumeroTelefono, @Puntos, @Imagen)

        -- Confirmar la transacción si todo salió bien
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        -- Manejo de errores: revertir la transacción si está activa
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION

        -- Propagar el error
        THROW
    END CATCH
END
GO
