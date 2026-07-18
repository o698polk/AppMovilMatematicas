namespace MauiApp2.Models;

public class Usuario
{
    public int Id { get; set; }
    public string Nombre { get; set; } = "Estudiante";
    public string Alias { get; set; } = "Aprendiz";
    public int PuntosTotales { get; set; }
    public int Nivel { get; set; } = 1;
    public DateTime FechaCreacion { get; set; } = DateTime.UtcNow;
}

public class Categoria
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public string Icono { get; set; } = "📚";
    public string ColorHex { get; set; } = "#4FC3F7";
}

public class VideoEducativo
{
    public int Id { get; set; }
    public int CategoriaId { get; set; }
    public string Titulo { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public string UrlYouTube { get; set; } = string.Empty;
    public string UrlMiniatura { get; set; } = string.Empty;
    public int DuracionSegundos { get; set; }
    public int Orden { get; set; }
    public Categoria? Categoria { get; set; }
}

public class Evaluacion
{
    public int Id { get; set; }
    public int CategoriaId { get; set; }
    public string Titulo { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public int CantidadPreguntas { get; set; } = 10;
    public int PuntajeMinimoAprobacion { get; set; } = 70;
    public Categoria? Categoria { get; set; }
    public ICollection<Pregunta> Preguntas { get; set; } = [];
}

public class Pregunta
{
    public int Id { get; set; }
    public int? EvaluacionId { get; set; }
    public int? JuegoId { get; set; }
    public TemaMatematico Tema { get; set; }
    public string Enunciado { get; set; } = string.Empty;
    public string Explicacion { get; set; } = string.Empty;
    public int Orden { get; set; }
    public int Puntos { get; set; } = 10;
    public Evaluacion? Evaluacion { get; set; }
    public JuegoEducativo? Juego { get; set; }
    public ICollection<OpcionRespuesta> Opciones { get; set; } = [];
}

public class OpcionRespuesta
{
    public int Id { get; set; }
    public int PreguntaId { get; set; }
    public string Texto { get; set; } = string.Empty;
    public bool EsCorrecta { get; set; }
    public int Orden { get; set; }
    public Pregunta? Pregunta { get; set; }
}

public class ResultadoEvaluacion
{
    public int Id { get; set; }
    public int UsuarioId { get; set; }
    public int EvaluacionId { get; set; }
    public int Aciertos { get; set; }
    public int TotalPreguntas { get; set; }
    public int Puntaje { get; set; }
    public int TiempoSegundos { get; set; }
    public DateTime Fecha { get; set; } = DateTime.UtcNow;
}

public class Galeria
{
    public int Id { get; set; }
    public int CategoriaId { get; set; }
    public string Titulo { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public Categoria? Categoria { get; set; }
    public ICollection<ImagenGaleria> Imagenes { get; set; } = [];
}

public class ImagenGaleria
{
    public int Id { get; set; }
    public int GaleriaId { get; set; }
    public string Titulo { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public string RutaRecurso { get; set; } = string.Empty;
    public int Orden { get; set; }
}

public class JuegoEducativo
{
    public int Id { get; set; }
    public int CategoriaId { get; set; }
    public string Titulo { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public int TiempoPorPreguntaSegundos { get; set; } = 30;
    public int CantidadPreguntas { get; set; } = 10;
    public string? UrlExterna { get; set; }
    public bool EsActivo { get; set; } = true;
    public Categoria? Categoria { get; set; }
}

public class ResultadoJuego
{
    public int Id { get; set; }
    public int UsuarioId { get; set; }
    public int JuegoId { get; set; }
    public int Aciertos { get; set; }
    public int TotalPreguntas { get; set; }
    public int Puntaje { get; set; }
    public int TiempoSegundos { get; set; }
    public DateTime Fecha { get; set; } = DateTime.UtcNow;
}

public class Favorito
{
    public int Id { get; set; }
    public int UsuarioId { get; set; }
    public TipoFavorito TipoEntidad { get; set; }
    public int EntidadId { get; set; }
    public DateTime FechaCreacion { get; set; } = DateTime.UtcNow;
}

public class ProgresoUsuario
{
    public int Id { get; set; }
    public int UsuarioId { get; set; }
    public TipoProgreso Tipo { get; set; }
    public int ReferenciaId { get; set; }
    public int PuntosGanados { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public DateTime Fecha { get; set; } = DateTime.UtcNow;
}

public class Logro
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string Descripcion { get; set; } = string.Empty;
    public string Icono { get; set; } = "🏅";
    public int PuntosRequeridos { get; set; }
}

public class LogroUsuario
{
    public int Id { get; set; }
    public int UsuarioId { get; set; }
    public int LogroId { get; set; }
    public DateTime FechaDesbloqueo { get; set; } = DateTime.UtcNow;
    public Logro? Logro { get; set; }
}
