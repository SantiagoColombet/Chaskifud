using System.Data.SqlClient;
using Dapper;
using System.Data;
public class BD
{
    private static string _connectionString = @"Server=DESKTOP-D34G2CV\SQLEXPRESS;Database=Chaskibase;Trusted_Connection=True;";

    public static Usuario ObtenerInfoUsuario(int IdUsuario)
    {
        Usuario usuario = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuario WHERE IdUsuario = @pIdUsuario ";
            usuario = db.QueryFirstOrDefault<Usuario>(sql, new { pIdUsuario = IdUsuario });
        }
        return usuario;
    }
    public static Restaurante ObtenerRestaurantesElegido(int IdRestaurante)
    {
        Restaurante local = null;

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Restaurantes WHERE IdRestaurante = @pIdRestaurante";
            local = db.QueryFirstOrDefault<Restaurante>(sql, new { pIdRestaurante = IdRestaurante });
        }
        return local;
    }


    public static List<Restaurante> ObtenerRestaurantesElegidoXCategoriaRestaurante(int IdCategoriaRestaurante)
    {
        List<Restaurante> locales = new List<Restaurante>();

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Restaurantes WHERE IdCategoriaRestaurante = @pIdCategoriaRestaurante;";
            locales = db.Query<Restaurante>(sql, new { pIdCategoriaRestaurante = IdCategoriaRestaurante }).ToList();
        }
        return locales;
    }
    public static List<Restaurante> ObtenerRestaurantes()
    {
        List<Restaurante> locales = new List<Restaurante>();

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Restaurantes";
            locales = db.Query<Restaurante>(sql).ToList();
        }
        return locales;
    }
    public static List<Comida> ObtenerComidasDeRestauranteElegido(int IdRestaurante)
    {
        List<Comida> comida = new List<Comida>();

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Comida WHERE IdRestaurante = @pIdRestaurante";
            comida = db.Query<Comida>(sql, new { pIdRestaurante = IdRestaurante }).ToList();
        }
        return comida;
    }
    public static Usuario ObtenerUsuarioPorEmail(string Email)
    {
        Usuario usuario = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuario WHERE Email = @pEmail";
            usuario = db.QueryFirstOrDefault<Usuario>(sql, new { pEmail = Email });
        }
        return usuario;
    }


    public static List<Resena> ObtenerResenasRestaurante(int IdRestaurante)
    {
        List<Resena> resenas;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string storedProcedure = "ObtenerResenasRestaurante";
            resenas = db.Query<Resena>(
                storedProcedure,
                new { IdRestaurante = IdRestaurante },
                commandType: CommandType.StoredProcedure
            ).ToList();
        }
        return resenas;
    }

    public static void AgregarResena(int IdUsuario, int IdRestaurante, int Valoracion, int FechaEscrita, int Opinion)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
            INSERT INTO Resenas (IdRestaurante, IdUsuario, Valoracion, Opinion, FechaEscrita, CantidadAportes, CantidadVotosArriba, CantidadVotosAbajo) 
            VALUES (@pIdRestaurante, @pIdUsuario, @pValoracion, @pOpinion, @pFechaEscrita, @pCantidadAportes, @pCantidadVotosArriba, @pCantidadVotosAbajo)";
            db.Execute(sql, new
            {
                pIdRestaurante = IdRestaurante,
                pIdUsuario = IdUsuario,
                pValoracion = Valoracion,
                pOpinion = Opinion,
                pFechaEscrita = DateTime.Now,
                pCantidadAportes = 0,
                pCantidadVotosArriba = 0,
                pCantidadVotosAbajo = 0
            });
        }
    }
    public static void DarLike(int IdResena)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"UPDATE Resenas
            SET CantidadVotosArriba = CantidadVotosArriba + 1
            WHERE IdResena = @pIdResena";
            db.Execute(sql, new { pIdResena = IdResena });
        }
    }
    public static void DarDislike(int IdResena)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"UPDATE Resenas
            SET CantidadVotosAbajo = CantidadVotosAbajo + 1
            WHERE IdResena = @pIdResena";
            db.Execute(sql, new { pIdResena = IdResena });
        }
    }
    public static int ObtenerCantidadVotosArriba(int IdResena)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"SELECT CantidadVotosArriba FROM Resenas
                        WHERE IdResena = @IdResena";
            return db.QueryFirstOrDefault<int>(sql, new { IdResena = IdResena });
        }
    }
    public static int ObtenerCantidadVotosAbajo(int IdResena)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"SELECT CantidadVotosAbajo FROM Resenas
                        WHERE IdResena = @IdResena";
            return db.QueryFirstOrDefault<int>(sql, new { IdResena = IdResena });
        }
    }

    public static void Registrarse(string Nombre, string Imagen, string Apellido, string Email, string Contrasena, string NumeroTelefono, DateOnly FechaNacimiento, int Puntos)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute("Registrarse", new
            {
                Nombre,
                Imagen,
                Apellido,
                Email,
                Contrasena,
                NumeroTelefono,
                FechaNacimiento,
                Puntos
            }, commandType: CommandType.StoredProcedure);
        }
    }

    public static void RegistrarUsuario(string Nombre, string Apellido, string Contrasena, string NumeroTelefono, string Imagen, DateOnly FechaNacimiento, string Email, int Puntos)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string storedProcedure = "Registrarse";
            var fechaConvertida = FechaNacimiento.ToDateTime(TimeOnly.MinValue);
            Puntos = 0;
            var parameters = new
            {
                Nombre,
                Apellido,
                Contrasena,
                NumeroTelefono,
                Imagen,
                FechaNacimiento = fechaConvertida,
                Email,
                Puntos
            };
            db.Execute(
                storedProcedure,
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }
    }

    public static void InsertarResena(int idRestaurante, int idUsuario, short valoracion, string opinion)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
            INSERT INTO Resenas (IdRestaurante, IdUsuario, Valoracion, Opinion, FechaEscrita, CantidadAportes, CantidadVotosArriba, CantidadVotosAbajo)
            VALUES (@IdRestaurante, @IdUsuario, @Valoracion, @Opinion, @FechaEscrita, @CantidadAportes, @CantidadVotosArriba, @CantidadVotosAbajo)";

            var parameters = new
            {
                IdRestaurante = idRestaurante,
                IdUsuario = idUsuario,
                Valoracion = valoracion,
                Opinion = opinion,
                FechaEscrita = DateTime.Now,
                CantidadAportes = 0,
                CantidadVotosArriba = 0,
                CantidadVotosAbajo = 0
            };

            db.Execute(sql, parameters);
        }
    }

    public static void RegistrarRestaurante(string Nombre, string Contrasena, string NumeroTelefono, string Imagen, string Email)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
            INSERT INTO UsuarioRestaurante (Nombre, Contrasena, NumeroTelefono, Imagen, Email) 
            VALUES (@pNombre, @pContrasena, @pNumeroTelefono, @pImagen, @pEmail)";
            db.Execute(sql, new
            {
                pNombre = Nombre,
                pContrasena = Contrasena,
                pNumeroTelefono = NumeroTelefono,
                pImagen = Imagen,
                pEmail = Email,
            });
        }
    }
    public static RestauranteUsuario ObtenerRestaurantePorEmail(string Email)
    {
        RestauranteUsuario restaurante = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM UsuarioRestaurante WHERE Email = @pEmail";
            restaurante = db.QueryFirstOrDefault<RestauranteUsuario>(sql, new { pEmail = Email });
        }
        return restaurante;
    }

    public static void ActualizarComida(int IdComida, int Precio)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql;
            sql = @"UPDATE Comida 
                SET Precio = @pPrecio 
                WHERE IdComida = @pIdComida";

            db.Execute(sql, new
            {
                pPrecio = Precio,
                pIdComida = IdComida
            });
        }
    }

    public static string ObtenerNombreCategoriaComida(int IdCategoriaComida)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Nombre FROM CategoriasComidas WHERE IdCategoriaComida = @pIdCategoria";
            return db.QueryFirstOrDefault<string>(sql, new { pIdCategoria = IdCategoriaComida });
        }
    }
    public static List<CategoriaComida> ObtenerCategoriasComida()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT IdCategoriaComida, Nombre FROM CategoriasComidas";
            return db.Query<CategoriaComida>(sql).ToList();
        }
    }
    public static List<RestriccionAlimenticia> ObtenerRestriccionesAlimenticias()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT IdRestriccionAlimenticia, TipoRestriccion FROM RestriccionAlimenticia";
            return db.Query<RestriccionAlimenticia>(sql).ToList();
        }
    }
    public static void AgregarComida(Comida nuevaComida)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
           INSERT INTO Comida (
            IdRestaurante, 
            Nombre, 
            Descripcion, 
            Precio, 
            IdCategoriaComida, 
            IdRestriccionAlimenticia, 
            Imagen
        ) 
        VALUES (
            @pIdRestaurante, 
            @pNombre, 
            @pDescripcion, 
            @pPrecio, 
            @pIdCategoriaComida, 
            @pIdRestriccionAlimenticia, 
            @pImagen
        );
        ";

            db.Execute(sql, new
            {
                pIdRestaurante = nuevaComida.IdRestaurante,
                pNombre = nuevaComida.Nombre,
                pDescripcion = nuevaComida.Descripcion,
                pPrecio = nuevaComida.Precio,
                pIdCategoriaComida = nuevaComida.IdCategoriaComida,
                pIdRestriccionAlimenticia = nuevaComida.IdRestriccionAlimenticia,
                pImagen = nuevaComida.Imagen
            }
    );
        }
    }

    public static int AgregarPedido(int IdUsuario, int IdRestaurante, int Total)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
                INSERT INTO Pedidos (IdRestaurante, IdUsuario, Estado, Total)
                OUTPUT INSERTED.IdPedido
                VALUES (@pIdRestaurante, @pIdUsuario, @pEstado, @pTotal)";
            
            int nuevoId = db.QuerySingle<int>(sql, new
            {
                pIdRestaurante = IdRestaurante,
                pIdUsuario = IdUsuario,
                pEstado = "Pendiente",
                pTotal = Total  
            });
            
            return nuevoId;
        }
    }

        public static void AgregarDetallePedido(int idPedido, int idComida, int cantidad, int precio)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
                INSERT INTO DetallesPedido (IdPedido, IdComida, Cantidad, Precio)
                VALUES (@pIdPedido, @pIdComida, @pCantidad, @pPrecio)";
            
            db.Execute(sql, new
            {
                pIdPedido = idPedido,
                pIdComida = idComida,
                pCantidad = cantidad,
                pPrecio = precio
            });
        }
    }
    public static List<Pedido> ObtenerPedidosPorRestaurante(int IdRestaurante)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
                SELECT p.*, dp.* 
                FROM Pedidos p
                INNER JOIN DetallesPedido dp ON p.IdPedido = dp.IdPedido
                WHERE p.IdRestaurante = @pIdRestaurante
                ORDER BY p.IdPedido DESC";

        var pedidosDict = new Dictionary<int, Pedido>();
        
        db.Query<Pedido, DetallePedido, Pedido>(sql,
            (pedido, detalle) => 
            {
                if (!pedidosDict.TryGetValue(pedido.IdPedido, out var pedidoEntry))
                {
                    pedidoEntry = pedido;
                    pedidoEntry.Detalles = new List<DetallePedido>();
                    pedidosDict.Add(pedidoEntry.IdPedido, pedidoEntry);
                }
                pedidoEntry.Detalles.Add(detalle);
                return pedidoEntry;
            },
            new { pIdRestaurante = IdRestaurante },
            splitOn: "IdPedido"
        );

        return pedidosDict.Values.ToList();
        }
    }

    public static List<Pedido> ObtenerPedidosPorUsuario(int IdUsuario)
{
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = @"
            SELECT p.*, dp.* 
            FROM Pedidos p
            INNER JOIN DetallesPedido dp ON p.IdPedido = dp.IdPedido
            WHERE p.IdUsuario = @pIdUsuario
            ORDER BY p.IdPedido DESC";

        var pedidosDict = new Dictionary<int, Pedido>();
        
        db.Query<Pedido, DetallePedido, Pedido>(sql,
            (pedido, detalle) => 
            {
                if (!pedidosDict.TryGetValue(pedido.IdPedido, out var pedidoEntry))
                {
                    pedidoEntry = pedido;
                    pedidoEntry.Detalles = new List<DetallePedido>();
                    pedidosDict.Add(pedidoEntry.IdPedido, pedidoEntry);
                }
                pedidoEntry.Detalles.Add(detalle);
                return pedidoEntry;
            },
            new { pIdUsuario = IdUsuario },
            splitOn: "IdPedido"
        );

        return pedidosDict.Values.ToList();
    }
}

    public static string ObtenerNombreComida(int IdComida)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Nombre FROM Comida WHERE IdComida = @pIdComida";
            return db.QueryFirstOrDefault<string>(sql, new { pIdComida = IdComida });
        }
    }


    public static void ActualizarEstadoPedido(int IdPedido, string nuevoEstado)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"
                UPDATE Pedidos 
                SET Estado = @pEstado 
                WHERE IdPedido = @IdPedido";
            
            db.Execute(sql, new {
                IdPedido,
                pEstado = nuevoEstado
            });
        }
    }
}