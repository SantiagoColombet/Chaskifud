using System.Data.SqlClient;
using Dapper;
using System.Data;
public class BD
{
    private static string _connectionString = @"Server=localhost\SQLEXPRESS; DataBase=ChaskiBase; Trusted_Connection=True;";

  public static Usuario ObtenerInfoUsuario(int IdUsuario)
{
    Usuario usuario = null; 
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Usuario WHERE IdUsuario = @pIdUsuario"; 
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
            local= db.QueryFirstOrDefault<Restaurante>(sql, new{pIdRestaurante = IdRestaurante});
        }
        return local;
    }

       public static List<Restaurante> ObtenerRestaurantes()
    {
        List<Restaurante> locales = new List<Restaurante>();

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Restaurantes";
            locales= db.Query<Restaurante>(sql).ToList();
        }
        return locales;
    }
     public static List<Comida>ObtenerComidasDeRestauranteElegido(int IdRestaurante)
    {
        List<Comida> comida = new List<Comida>();

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Comida WHERE IdRestaurante = @pIdRestaurante";
            comida= db.Query<Comida>(sql, new{pIdRestaurante = IdRestaurante}).ToList();
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
            db.Execute(sql, new{pIdResena = IdResena});
        }
    }
    public static void DarDislike(int IdResena)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = @"UPDATE Resenas
            SET CantidadVotosAbajo = CantidadVotosAbajo + 1
            WHERE IdResena = @pIdResena";
            db.Execute(sql, new{pIdResena = IdResena});
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

    public static void Registrarse(string Nombre, string Imagen, string Apellido, string Email, string Contrasena, string NumeroTelefono, DateOnly FechaNacimiento, int Puntos){
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute("Registrarse", new{
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

    public static void RegistrarUsuario (string Nombre, string Apellido, string Contrasena, string NumeroTelefono, string Imagen, DateOnly FechaNacimiento, string Email)
    {
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string storedProcedure = "Registrarse";
        var fechaConvertida = FechaNacimiento.ToDateTime(TimeOnly.MinValue);
    
        var parameters = new
        {
            Nombre,
            Apellido,
            Contrasena,
            NumeroTelefono,
            Imagen,
            FechaNacimiento = fechaConvertida,
            Email
        };          
        db.Execute(
            storedProcedure, 
            parameters, 
            commandType: CommandType.StoredProcedure
        );
    }
    }
}
