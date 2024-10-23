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
            string sql = "SELECT * FROM Usuario";
            usuario = db.QueryFirstOrDefault<Usuario>(sql, new { pIdUsuario = IdUsuario });
        }
        return usuario;
    }
}
