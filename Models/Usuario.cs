using System.Text.Json;

[Serializable]
public class Usuario
{
    public int IdUsuario { get; set; }
    public string Nombre { get; set; }
    public string Apellido { get; set; }
    public string Email { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public string Contrasena { get; set; }
    public string NumeroTelefono { get; set; }
    public int Puntos { get; set; }
    public string Imagen { get; set; }

    public Usuario() { }

    public Usuario(string email, string contrasena)
    {
        Email = email;
        Contrasena = contrasena;
    }

    public override string ToString()
    {
        return System.Text.Json.JsonSerializer.Serialize(this);
    }

    public static Usuario? FromString(string? json)
    {
        if (json is null)
        {
            return null;
        }
        return System.Text.Json.JsonSerializer.Deserialize<Usuario>(json);
    }
}
