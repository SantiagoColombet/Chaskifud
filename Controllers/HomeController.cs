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
        return View();
    }

    public IActionResult Usuario()
    {
        ViewBag.usuario = BD.ObtenerInfoUsuario(1);
        return View();
    }

    public IActionResult Restaurante()
    {
        ViewBag.Restaurantes = BD.ObtenerRestaurantes();
        return View();
    }

public IActionResult Nosotros(){
    return View();
}
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}


