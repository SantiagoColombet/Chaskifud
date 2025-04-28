public class Pedido
{
    public int IdPedido { get; set; }
    public int IdRestaurante { get; set; }
    public int IdUsuario { get; set; }
    public string Estado { get; set; } 
    public DateTime Fecha { get; set; }
    public int Total { get; set; }
    public List<Comida> Items { get; set; } = new List<Comida>();
}