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

    public IActionResult Index()
    {
        ViewBag.Restaurantes = BD.ObtenerRestaurantes();
        return View();
    }


    public IActionResult Mapa()
    {
        return View();
    }
    public IActionResult Perfil()
    {
        ViewBag.usuario = BD.ObtenerInfoUsuario(1);
        return View();
    }
    public IActionResult PerfilPuntos()
    {
        ViewBag.usuario = BD.ObtenerInfoUsuario(1);
        return View();
    }
    public IActionResult PerfilEditar()
    {
        ViewBag.usuario = BD.ObtenerInfoUsuario(1);
        return View();
    }
    public IActionResult GuardarPerfil()
    {
        ViewBag.usuario = BD.ObtenerInfoUsuario(1);
        return View("Perfil");
    }
    public IActionResult Restaurante()
    {
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
        if (Comida.carrito.Any())
        {
            Console.WriteLine("Restaurante: " + Comida.carrito[0].IdRestaurante);
            Console.WriteLine("Restaurante: " + comidaElegida.IdRestaurante);
            if (Comida.carrito.Count != 0 && Comida.carrito[0].IdRestaurante != IdRestaurante)
            {
                TempData["Error"] = "Cannot add items from different restaurants to the cart.";
                return RedirectToAction("RestauranteElegido", IdRestaurante);
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


