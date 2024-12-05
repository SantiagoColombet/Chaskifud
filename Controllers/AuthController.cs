using System.Diagnostics;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Chaskifud.Services; 
using System.Data.SqlClient;
namespace test_session.Controllers;

public class AuthController : Controller
{
    private readonly ILogger<AuthController> _logger;
    private readonly GlobalVariableService _globalVariableService;

    public AuthController(ILogger<AuthController> logger, GlobalVariableService globalVariableService)
    {
        _logger = logger;
        _globalVariableService = globalVariableService; // Inicializar el servicio

    }

    public IActionResult Login()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("Perfil", "Home");
        }
        return View();
    }

    [HttpPost]
    [HttpPost]
public IActionResult VerificarLogin(string email, string contrasena)
{
    Usuario usuario = BD.ObtenerUsuarioPorEmail(email); // Método para obtener el usuario desde la BD
    
    if (usuario != null && usuario.Contrasena == contrasena)
    {
        // Guarda el usuario en la sesión
        HttpContext.Session.SetString("user", usuario.ToString());
        return RedirectToAction("Index", "Home");
    }
     else if (usuario == null)
        {
            return RedirectToAction("Login", "Auth");

        }
    else
    {
        ViewBag.Error = "Email o contraseña incorrectos.";
        return View("Login");
    }
}


    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        _globalVariableService.nombreUsuario = "anonimo.png";
        return RedirectToAction("Login");
    }

    public IActionResult Registrar()
    {
        return View("Registrar");
    } 
   public IActionResult registrarUsuario(string Nombre, string Apellido, string Contrasena, string NumeroTelefono, string Imagen, DateOnly FechaNacimiento, string Email, int Puntos)
{
    try
    {
        Puntos = 0;
        BD.RegistrarUsuario(Nombre,
                            Apellido,
                            Contrasena,
                            NumeroTelefono,
                            Imagen,
                            FechaNacimiento,
                            Email,
                            Puntos);
        return View("Login");
    }
    catch (SqlException ex)
    {
        // Manejo del error de base de datos
        Console.WriteLine($"Error al registrar usuario: {ex.Message}");
        return View("Error"); // Vista de error o mensaje para el usuario
    }
    catch (Exception ex)
    {
        // Manejo de otros errores
        Console.WriteLine($"Error inesperado: {ex.Message}");
        return View("Error");
    }
}

}
