using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Chaskifud.Models;

namespace Chaskifud.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
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
    public IActionResult VerificarLogin(string email, string contrasena)
    {
        // Simula o implementa el acceso a la base de datos para obtener al usuario
        var usuario = BD.ObtenerUsuarioPorEmail(email); // Método que retorna un Usuario o null

        if (usuario != null && usuario.Contrasena == contrasena)
        {
            // Serializa y guarda el usuario en la sesión
            HttpContext.Session.SetString("user", usuario.ToString());
            return RedirectToAction("Index", "Home");
        }
        else if (usuario == null && usuario.Contrasena == null)
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
    public IActionResult Index()
    {

        var userJson = HttpContext.Session.GetString("user");
        var usuario = Usuario.FromString(userJson);

        if (usuario != null)
        {
            Contador.contador++;
        }

        if (usuario != null && Contador.contador > 0)
        {
            ViewBag.UserImg = usuario.Imagen;
        }

        ViewBag.Carrito = Comida.carrito;
        ViewBag.Restaurantes = BD.ObtenerRestaurantes();

        return View();
    }


    public IActionResult Registrar()
    {
        return View();
    }

    public IActionResult Mapa()
    {
        return View();
    }
    public IActionResult Perfil()
    {
        var userJson = HttpContext.Session.GetString("user");
        var usuario = Usuario.FromString(userJson);
        if (usuario != null)
        {
            ViewBag.usuario = BD.ObtenerInfoUsuario(usuario.IdUsuario);
        }
        return View();
    }
    public IActionResult PerfilPuntos()
    {
        var userJson = HttpContext.Session.GetString("user");
        var usuario = Usuario.FromString(userJson);
        if (usuario != null)
        {
            ViewBag.usuario = BD.ObtenerInfoUsuario(usuario.IdUsuario);
        }
        return View();
    }
    public IActionResult PerfilEditar()
    {
        var userJson = HttpContext.Session.GetString("user");
        var usuario = Usuario.FromString(userJson);
        if (usuario != null)
        {
            ViewBag.usuario = BD.ObtenerInfoUsuario(usuario.IdUsuario);
        }
        return View();
    }
    public IActionResult GuardarPerfil()
    {
        ViewBag.usuario = BD.ObtenerInfoUsuario(1);
        return View("Perfil");
    }
    public IActionResult Restaurante()
    {
        ViewBag.Carrito = Comida.carrito; // Ya inicializado como lista vacía
        ViewBag.Restaurantes = BD.ObtenerRestaurantes();
        return View();
    }


    public IActionResult RestauranteElegido(int IdRestaurante)
    {
        ViewBag.Restaurante = BD.ObtenerRestaurantesElegido(IdRestaurante);
        ViewBag.Comida = BD.ObtenerComidasDeRestauranteElegido(IdRestaurante);
        return View("RestauranteElegido");
    }

    public IActionResult Comprar(Comida comidaElegida, int IdRestaurante)
    {
        if (Comida.carrito == null)
        {
            Comida.carrito = new List<Comida>();
        }


        if (Comida.carrito.Any())
        {

            if (Comida.carrito.Count != 0 && Comida.carrito[0].IdRestaurante != IdRestaurante)
            {
                return RedirectToAction("RestauranteElegido", new { IdRestaurante = IdRestaurante, Error = true });
            }
            else
            {
                ViewBag.Restaurante = BD.ObtenerRestaurantesElegido(IdRestaurante);
                ViewBag.Comida = BD.ObtenerComidasDeRestauranteElegido(IdRestaurante);
                Comida.carrito.Add(comidaElegida);
                return View("RestauranteElegido");
            }
        }
        else
        {
            ViewBag.Restaurante = BD.ObtenerRestaurantesElegido(IdRestaurante);
            ViewBag.Comida = BD.ObtenerComidasDeRestauranteElegido(IdRestaurante);
            Comida.carrito.Add(comidaElegida);
            return View("RestauranteElegido");
        }


    }
    public IActionResult Carrito()
    {
        ViewBag.ListaComida = Comida.carrito;
        return View();
    }

    public IActionResult Chat()
    {

        return View("Chat");
    }

    [HttpPost]
    public IActionResult EliminarCarrito(int IdComida)
    {
        var itemToRemove = Comida.carrito.FirstOrDefault(c => c.IdComida == IdComida);

        if (itemToRemove != null)
        {
            Comida.carrito.Remove(itemToRemove);
        }

        return RedirectToAction("Carrito");
    }

    public IActionResult Pago()
    {

        return View();
    }
    public IActionResult IniciarSesion()
    {

        return View();
    }
    public IActionResult Nosotros()
    {
        return View();
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}


