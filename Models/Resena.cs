public class Resena
{
    public int IdRestaurante { get; set; }
    public int IdUsuario { get; set; }
    public string Opinion { get; set; }
    public string Valoracion { get; set; }
    public int IdResena { get; set; }
    public DateTime FechaEscrita { get; set;}
    public int CantidadVotosArriba { get; set;}
    public int CantidadVotosAbajo { get; set;}
    public string? Nombre { get; set;}

}
