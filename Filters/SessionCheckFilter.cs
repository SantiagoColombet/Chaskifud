// using Microsoft.AspNetCore.Mvc;
// using Microsoft.AspNetCore.Mvc.Filters;
// using System.Text.Json;

// public class SessionCheckFilter : IActionFilter
// {
//     public void OnActionExecuting(ActionExecutingContext context)
//     {
//         var session = context.HttpContext.Session;
//         var userJson = session.GetString("user");

//         // Verifica si el usuario es válido
//         if (string.IsNullOrEmpty(userJson) || JsonSerializer.Deserialize<Usuario>(userJson) == null)
//         {
//             context.Result = new RedirectToActionResult("Login", "Auth", null);
//         }
//     }

//     public void OnActionExecuted(ActionExecutedContext context)
//     {
//         // No se requiere lógica posterior en este caso
//     }
// }
