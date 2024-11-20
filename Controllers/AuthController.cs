using System.Diagnostics;
using System.Text;
using Microsoft.AspNetCore.Mvc;

namespace test_session.Controllers;

public class AuthController : Controller
{
    private readonly ILogger<AuthController> _logger;

    public AuthController(ILogger<AuthController> logger)
    {
        _logger = logger;
    }

    public IActionResult Login()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("Index", "Home");
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
            return RedirectToAction("Registrar", "Home");

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
        return RedirectToAction("Login");
    }

}
