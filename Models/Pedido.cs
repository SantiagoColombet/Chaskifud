public class Pedido
{
    public int IdPedido { get; set; }
    public int IdRestaurante { get; set; }
    public int IdUsuario { get; set; }
    public string Estado { get; set; } 
    public int Total { get; set; }

    public List<DetallePedido> Detalles { get; set; } = new List<DetallePedido>();

}