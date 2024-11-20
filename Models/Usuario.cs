using System.Text.Json;

[Serializable]
public class Usuario
{
    public static int IdUsuario {get; set;}
    public static string Nombre{get; set;}
    public static string Apellido{get; set;}
    public static string Email{get; set;}
    public static DateTime FechaNacimiento{get; set;}
    public static string Contrasena{get; set;}
    public static string NumeroTelefono{get; set;}
    public static int Puntos {get; set;}
    public static string Imagen{get; set;}


     public Usuario(string email, string contrasena)
    {
        Email = email;
        Contrasena = contrasena;
    }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }

    public static Usuario? FromString(string? json)
    {
        if (json is null)
        {
            return null;
        }

        return JsonSerializer.Deserialize<Usuario>(json);
    }

}

  
