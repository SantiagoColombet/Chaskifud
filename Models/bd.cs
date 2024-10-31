using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static string _connectionString = @"Server=A-PHZ2-CIDI-08; DataBase=ChaskiBase; Trusted_Connection=True;";

  public static Usuario ObtenerInfoUsuario(int IdUsuario)
{
    Usuario usuario = null; 
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT * FROM Usuario WHERE IdUsuario = @pIdUsuario"; // Agregar '@' antes del parámetro
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
}
