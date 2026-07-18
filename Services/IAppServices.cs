using MauiApp2.Models;

namespace MauiApp2.Services;

public record VideoDto(int Id, string Titulo, string Descripcion, string UrlYouTube, string UrlMiniatura, int DuracionSegundos, string CategoriaNombre, bool EsFavorito);
public record EvaluacionDto(int Id, string Titulo, string Descripcion, int CantidadPreguntas, string CategoriaNombre, int? MejorPuntaje);
public record PreguntaDto(int Id, string Enunciado, string Explicacion, TemaMatematico Tema, IReadOnlyList<OpcionDto> Opciones);
public record OpcionDto(int Id, string Texto, int Orden);
public record ResultadoEvaluacionDto(int EvaluacionId, int Aciertos, int Total, int Puntaje, string Mensaje);
public record GaleriaDto(int Id, string Titulo, string Descripcion, string CategoriaNombre, int CantidadImagenes, string? RutaPortada);
public record ImagenGaleriaDto(int Id, string Titulo, string Descripcion, string RutaRecurso);
public record JuegoDto(int Id, string Titulo, string Descripcion, int TiempoPorPregunta, int CantidadPreguntas, string CategoriaNombre, string? UrlExterna, string? UrlEmbed);
public record ResultadoJuegoDto(int JuegoId, int Aciertos, int Total, int Puntaje, string Mensaje);
public record UsuarioDto(int Id, string Nombre, string Alias, int PuntosTotales, int Nivel);
public record PerfilResumenDto(int Id, string Nombre, string Alias, int PuntosTotales, int Nivel, DateTime FechaCreacion);
public record EstadisticasDto(int VideosVistos, int EvaluacionesCompletadas, int JuegosCompletados, int PreguntasRespondidas, int LogrosDesbloqueados);
public record LogroDto(int Id, string Nombre, string Descripcion, string Icono, bool Desbloqueado, DateTime? FechaDesbloqueo);
public record ProgresoRecienteDto(string Descripcion, int Puntos, DateTime Fecha);

public interface IVideoService
{
    Task<IReadOnlyList<VideoDto>> ObtenerVideosAsync(CancellationToken ct = default);
    Task<VideoDto?> ObtenerVideoAsync(int id, CancellationToken ct = default);
    Task RegistrarVisualizacionAsync(int videoId, CancellationToken ct = default);
    Task AlternarFavoritoAsync(int videoId, CancellationToken ct = default);
}

public interface IEvaluacionService
{
    Task<IReadOnlyList<EvaluacionDto>> ObtenerEvaluacionesAsync(CancellationToken ct = default);
    Task<IReadOnlyList<PreguntaDto>> ObtenerPreguntasAsync(int evaluacionId, CancellationToken ct = default);
    Task<ResultadoEvaluacionDto> GuardarResultadoAsync(int evaluacionId, int aciertos, int total, int tiempoSegundos, CancellationToken ct = default);
}

public interface IGaleriaService
{
    Task<IReadOnlyList<GaleriaDto>> ObtenerGaleriasAsync(CancellationToken ct = default);
    Task<IReadOnlyList<ImagenGaleriaDto>> ObtenerImagenesAsync(int galeriaId, CancellationToken ct = default);
}

public interface IJuegoService
{
    Task<IReadOnlyList<JuegoDto>> ObtenerJuegosAsync(CancellationToken ct = default);
    Task<JuegoDto?> ObtenerJuegoAsync(int id, CancellationToken ct = default);
    Task<IReadOnlyList<PreguntaDto>> ObtenerPreguntasJuegoAsync(int juegoId, CancellationToken ct = default);
    Task<ResultadoJuegoDto> GuardarResultadoAsync(int juegoId, int aciertos, int total, int tiempoSegundos, CancellationToken ct = default);
    Task<ResultadoJuegoDto> RegistrarJuegoExternoAsync(int juegoId, CancellationToken ct = default);
    Task ReiniciarPartidaJuegoAsync(int juegoId, CancellationToken ct = default);
}

public interface IUsuarioService
{
    Task<UsuarioDto> ObtenerUsuarioActualAsync(CancellationToken ct = default);
    Task<IReadOnlyList<PerfilResumenDto>> ListarPerfilesAsync(CancellationToken ct = default);
    Task<UsuarioDto> EntrarPorNombreAsync(string nombre, CancellationToken ct = default);
    Task<UsuarioDto> CrearNuevaPartidaAsync(string nombre, CancellationToken ct = default);
    Task SeleccionarPerfilAsync(int usuarioId, CancellationToken ct = default);
    Task ActualizarPerfilAsync(string nombre, string alias, CancellationToken ct = default);
    Task ResetearProgresoActualAsync(CancellationToken ct = default);
}

public interface IProgresoService
{
    Task<EstadisticasDto> ObtenerEstadisticasAsync(CancellationToken ct = default);
    Task<IReadOnlyList<LogroDto>> ObtenerLogrosAsync(CancellationToken ct = default);
    Task<IReadOnlyList<ProgresoRecienteDto>> ObtenerActividadRecienteAsync(CancellationToken ct = default);
    Task AgregarPuntosAsync(int puntos, TipoProgreso tipo, int referenciaId, string descripcion, CancellationToken ct = default);
}

public interface IPreguntaValidationService
{
    Task<bool> ValidarRespuestaAsync(int preguntaId, int opcionId, CancellationToken ct = default);
}

public interface IDatabaseInitializer
{
    Task InicializarAsync(CancellationToken ct = default);
}
