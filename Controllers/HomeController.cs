using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Chaskifud.Models;
using Chaskifud.Services;

namespace Chaskifud.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly GlobalVariableService _globalVariableService;
    // Modificar el constructor para inyectar el servicio
    public HomeController(ILogger<HomeController> logger, GlobalVariableService globalVariableService)
    {
        _logger = logger;
        _globalVariableService = globalVariableService; // Inicializar el servicio
    }


    public IActionResult Index()
    {

        var userJson = HttpContext.Session.GetString("user");
        var usuario = Usuario.FromString(userJson);
        if (usuario != null)
        {
            if (usuario != null)
            {
                _globalVariableService.nombreUsuario = usuario.Imagen;

                Contador.contador++;
            }

            if (usuario != null && Contador.contador > 0)
            {
                ViewBag.UserImg = usuario.Imagen;
            }

            ViewBag.Carrito = Comida.carrito;

        }
        // Local
        else
        {
            var localJson = HttpContext.Session.GetString("local");
            var local = RestauranteUsuario.FromString(localJson);

            if (local != null)
            {
                _globalVariableService.nombreUsuario = local.Nombre;
                Contador.contador++;
            }

            if (local != null && Contador.contador > 0)
            {
                ViewBag.UserImg = local.Imagen;
            }
        }
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
        ViewBag.hayLocal = usuario;
        if (usuario != null)
        {
            ViewBag.usuario = BD.ObtenerInfoUsuario(usuario.IdUsuario);
        }
        else
        {
            var localJson = HttpContext.Session.GetString("local");
            var local = Usuario.FromString(localJson);

            ViewBag.local = local;
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
    public IActionResult RestauranteElegidoXComida(int IdCategoriaRestaurante)
    {
        ViewBag.Carrito = Comida.carrito; // Ya inicializado como lista vacía
        ViewBag.Restaurante = BD.ObtenerRestaurantesElegidoXCategoriaRestaurante(IdCategoriaRestaurante);

        return View();
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
        int count = Comida.carrito.Count();
        ViewBag.count = count;
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

    public IActionResult Pedido()
    {
        int pagoFinal = 0;
        ViewBag.ListaComida = Comida.carrito;
        foreach (Comida com in ViewBag.ListaComida)
        {
            pagoFinal += com.Precio;
        }
        ViewBag.pagoFinal = pagoFinal;
        return View();
    }

 [HttpPost]
    public IActionResult PedidoRealizado(int pIdUsuario)
    {
        // 1) Agrupo ítems iguales y seteo la propiedad 'cantidad'
        var itemsAgrupados = Comida.carrito
            .GroupBy(c => c.IdComida)
            .Select(g =>
            {
                var comida = g.First();
                comida.cantidad = g.Count();
                return comida;
            })
            .ToList();

        // 2) Calculo el total
        int total = itemsAgrupados.Sum(i => i.Precio * i.cantidad);

        // 3) Creo el objeto Pedido
        var pedido = new Pedido
        {
            IdRestaurante = itemsAgrupados.FirstOrDefault()?.IdRestaurante ?? 0,
            IdUsuario      = pIdUsuario,
            Estado         = "Pendiente",
            Fecha          = DateTime.Now,
            Total          = total,
            Items          = itemsAgrupados
        };

        // 4) (Opcional) Guardar en base de datos
        // _context.Pedidos.Add(pedido);
        // _context.SaveChanges();

        // 5) Limpiar carrito
        Comida.carrito.Clear();

        // 6) Mostrar vista de confirmación, pasando el Pedido
        return View(pedido);
    }
    public IActionResult IniciarSesion()
    {

        return View();
    }
    public IActionResult Resena(int IdRestaurante)
    {
        ViewBag.resena = BD.ObtenerResenasRestaurante(IdRestaurante);
        return View();
    }
    public IActionResult Nosotros()
    {
        return View();
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
    public IActionResult VerificarLoginLocal(string email, string contrasena)
    {
        RestauranteUsuario local = BD.ObtenerRestaurantePorEmail(email);

        if (local != null && local.Contrasena == contrasena)
        {
            HttpContext.Session.SetString("local", local.ToString());
            TempData["IdRestaurante"] = local.IdUsuarioRestaurante;
            return RedirectToAction("Index", "Home");
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
    public IActionResult Logout()
    {

        HttpContext.Session.Remove("user");
        Comida.carrito = new List<Comida>(); ;
        _globalVariableService.nombreUsuario = "anonimo.png";
        return RedirectToAction("Login");

    }
    [HttpPost]
    public JsonResult VotarArriba([FromBody] VotoRequest request)
    {
        Console.WriteLine($"IdResena: {request.IdResena}, IdRestaurante: {request.IdRestaurante}");
        BD.DarLike(request.IdResena);
        int nuevaCantidadVotos = BD.ObtenerCantidadVotosArriba(request.IdResena);
        return Json(new { nuevaCantidadVotos });
    }

    [HttpPost]
    public JsonResult VotarAbajo([FromBody] VotoRequest request)
    {
        Console.WriteLine($"IdResena: {request.IdResena}, IdRestaurante: {request.IdRestaurante}");
        BD.DarDislike(request.IdResena);
        int nuevaCantidadVotos = BD.ObtenerCantidadVotosAbajo(request.IdResena);
        return Json(new { nuevaCantidadVotos });
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public IActionResult Emprendimiento()
    {
        return View();
    }

    public IActionResult NegociosAfiliados()
    {
        return View();
    }


    public IActionResult Preguntas()
    {
        return View();
    }
    public IActionResult Foros()
    {
        return View();
    }

    public IActionResult NuestrosServicios()
    {
        return View();
    }
    public IActionResult CrearResena(int idRestaurante, int idUsuario, short valoracion, string opinion)
    {
        BD.InsertarResena(idRestaurante, idUsuario, valoracion, opinion);
        return RedirectToAction("Restaurante");
    }

    public IActionResult ConfRestaurantes()
    {
        if (!TempData.ContainsKey("IdRestaurante") || !int.TryParse(TempData["IdRestaurante"]?.ToString(), out int idRestaurante))
        {
            return RedirectToAction("Error");
        }

        TempData.Keep("IdRestaurante");

        ViewBag.Restaurante = BD.ObtenerRestaurantesElegido(idRestaurante);
        ViewBag.Comida = BD.ObtenerComidasDeRestauranteElegido(idRestaurante);
        ViewBag.Categorias = BD.ObtenerCategoriasComida();
        ViewBag.Restricciones = BD.ObtenerRestriccionesAlimenticias();

        return View();
    }
    [HttpPost]
    public IActionResult ActualizarComida(int IdComida, int IdRestaurante, int Precio)
    {
        try
        {
            BD.ActualizarComida(IdComida, Precio);

            TempData["IdRestaurante"] = IdRestaurante;
            return RedirectToAction("ConfRestaurantes");
        }
        catch (Exception ex)
        {
            TempData["IdRestaurante"] = IdRestaurante;
            return RedirectToAction("ConfRestaurantes");
        }
    }
    [HttpPost]
    [HttpPost]
    public IActionResult AgregarComida(Comida comida)
    {
        try
        {

            BD.AgregarComida(comida);

            return RedirectToAction("ConfRestaurantes", new { IdRestaurante = comida.IdRestaurante });
        }
        catch (Exception ex)
        {
            return RedirectToAction("ConfRestaurantes", new { IdRestaurante = comida.IdRestaurante });
        }
    }
}


