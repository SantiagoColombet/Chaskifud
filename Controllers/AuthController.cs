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
        _globalVariableService = globalVariableService; 

    }

    public IActionResult Login()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("Perfil", "Home");
        }
        else if (HttpContext.Session.GetString("local") != null)
        {
            return RedirectToAction("Perfil", "Home");

        }
        return View();
    }

    [HttpPost]
    [HttpPost]
    public IActionResult VerificarLogin(string email, string contrasena)
    {
        Usuario usuario = BD.ObtenerUsuarioPorEmail(email); 

        if (usuario != null && usuario.Contrasena == contrasena)
        {
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
        HttpContext.Session.Remove("local");
        _globalVariableService.nombreUsuario = "anonimo.png";
        Comida.carrito = new List<Comida>();
        return RedirectToAction("Login", "Auth");
    }

    public IActionResult Registrar()
    {
        return View("Registrar");
    }
    public IActionResult LoginLocal()
    {
        return View();
    }
    public IActionResult RegistrarLocal()
    {
        return View();
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
            Console.WriteLine($"Error al registrar usuario: {ex.Message}");
            return View("Error");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error inesperado: {ex.Message}");
            return View("Error");
        }
    }

    public IActionResult RegistrarRestaurante(string Nombre, string Contrasena, string NumeroTelefono, string Imagen, string Email)
    {
        try
        {
            BD.RegistrarRestaurante(Nombre,
                                Contrasena,
                                NumeroTelefono,
                                Imagen,
                                Email
                                );
            return View("LoginLocal");
        }
        catch (SqlException ex)
        {
            Console.WriteLine($"Error al registrar usuario: {ex.Message}");
            return View("Error");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error inesperado: {ex.Message}");
            return View("Error");
        }
    }
    [HttpPost]
    public IActionResult VerificarLoginLocal(string email, string contrasena)
    {
        RestauranteUsuario local = BD.ObtenerRestaurantePorEmail(email);

        if (local != null && local.Contrasena == contrasena)
        {
            _globalVariableService.nombreUsuario = local.Imagen;

            HttpContext.Session.SetString("local", local.ToString());

            ViewBag.local = HttpContext.Session.GetString("local");

            TempData["IdRestaurante"] = local.IdUsuarioRestaurante;

                return RedirectToAction("ConfRestaurantes", "Home");
        }
        else if (local == null)
        {
            return RedirectToAction("LoginLocal", "Auth");
        }
        else
        {
            ViewBag.Error = "Email o contraseña incorrectos.";
            return View("LoginLocal");
        }
    }

}
