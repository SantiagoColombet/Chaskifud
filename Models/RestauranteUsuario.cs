public class RestauranteUsuario
{
    public int IdRestaurante { get; set; }
    public string Nombre { get; set; }
    public string Imagen { get; set; }
    public string Email { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public string Contrasena { get; set; }
    public string NumeroTelefono { get; set; }

public override string ToString()
    {
        return System.Text.Json.JsonSerializer.Serialize(this);
    }

    public static RestauranteUsuario? FromString(string? json)
    {
        if (json is null)
        {
            return null;
        }
        return System.Text.Json.JsonSerializer.Deserialize<RestauranteUsuario>(json);
    }
    
}