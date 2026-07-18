using Microsoft.EntityFrameworkCore;
using MauiApp2.Constants;
using MauiApp2.Data;
using MauiApp2.Data.Seed;
using MauiApp2.Models;

namespace MauiApp2.Services;

public class VideoService(AppDbContext ctx, IProgresoService progreso, ISesionService sesion) : IVideoService
{
    public async Task<IReadOnlyList<VideoDto>> ObtenerVideosAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var favs = await ctx.Favoritos.Where(f => f.UsuarioId == u.Id && f.TipoEntidad == TipoFavorito.Video).Select(f => f.EntidadId).ToListAsync(ct);
        var videos = await ctx.Videos.Include(v => v.Categoria).OrderBy(v => v.Orden).ToListAsync(ct);
        return videos.Select(v => new VideoDto(v.Id, v.Titulo, v.Descripcion, v.UrlYouTube, v.UrlMiniatura, v.DuracionSegundos, v.Categoria!.Nombre, favs.Contains(v.Id))).ToList();
    }

    public async Task<VideoDto?> ObtenerVideoAsync(int id, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var fav = await ctx.Favoritos.AnyAsync(f => f.UsuarioId == u.Id && f.TipoEntidad == TipoFavorito.Video && f.EntidadId == id, ct);
        var v = await ctx.Videos.Include(x => x.Categoria).FirstOrDefaultAsync(x => x.Id == id, ct);
        return v is null ? null : new VideoDto(v.Id, v.Titulo, v.Descripcion, v.UrlYouTube, v.UrlMiniatura, v.DuracionSegundos, v.Categoria!.Nombre, fav);
    }

    public async Task RegistrarVisualizacionAsync(int videoId, CancellationToken ct = default)
        => await progreso.AgregarPuntosAsync(5, TipoProgreso.VideoVisto, videoId, MensajesRefuerzo.VideoCompletado, ct);

    public async Task AlternarFavoritoAsync(int videoId, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var f = await ctx.Favoritos.FirstOrDefaultAsync(x => x.UsuarioId == u.Id && x.TipoEntidad == TipoFavorito.Video && x.EntidadId == videoId, ct);
        if (f is null) ctx.Favoritos.Add(new Favorito { UsuarioId = u.Id, TipoEntidad = TipoFavorito.Video, EntidadId = videoId });
        else ctx.Favoritos.Remove(f);
        await ctx.SaveChangesAsync(ct);
    }
}

public class EvaluacionService(AppDbContext ctx, IProgresoService progreso, ISesionService sesion, IPreguntasJsonLoader jsonLoader) : IEvaluacionService
{
    public async Task<IReadOnlyList<EvaluacionDto>> ObtenerEvaluacionesAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var mejores = await ctx.ResultadosEvaluacion.Where(r => r.UsuarioId == u.Id).GroupBy(r => r.EvaluacionId)
            .Select(g => new { g.Key, Mejor = g.Max(r => r.Puntaje) }).ToDictionaryAsync(x => x.Key, x => x.Mejor, ct);
        var evals = await ctx.Evaluaciones.Include(e => e.Categoria).OrderBy(e => e.Id).ToListAsync(ct);
        return evals.Select(e => new EvaluacionDto(e.Id, e.Titulo, e.Descripcion, e.CantidadPreguntas, e.Categoria!.Nombre, mejores.TryGetValue(e.Id, out var m) ? m : null)).ToList();
    }

    public async Task<IReadOnlyList<PreguntaDto>> ObtenerPreguntasAsync(int evaluacionId, CancellationToken ct = default)
    {
        try
        {
            var desdeDb = await MapPreguntas(
                ctx.Preguntas.Include(p => p.Opciones).Where(p => p.EvaluacionId == evaluacionId).OrderBy(p => p.Orden), ct);
            if (desdeDb.Count > 0)
                return desdeDb;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"SQLite preguntas falló, usando JSON: {ex.Message}");
        }

        var eval = await ctx.Evaluaciones.AsNoTracking().FirstOrDefaultAsync(e => e.Id == evaluacionId, ct)
            ?? throw new InvalidOperationException($"Evaluación {evaluacionId} no encontrada.");

        var desdeJson = await jsonLoader.ObtenerPreguntasPorTituloAsync(eval.Titulo, ct);
        if (desdeJson.Count == 0)
            throw new InvalidOperationException($"No hay preguntas (SQLite ni JSON) para: {eval.Titulo}");

        return desdeJson;
    }

    public async Task<ResultadoEvaluacionDto> GuardarResultadoAsync(int evaluacionId, int aciertos, int total, int tiempoSegundos, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var puntaje = total > 0 ? (int)Math.Round(aciertos * 100.0 / total) : 0;
        ctx.ResultadosEvaluacion.Add(new ResultadoEvaluacion { UsuarioId = u.Id, EvaluacionId = evaluacionId, Aciertos = aciertos, TotalPreguntas = total, Puntaje = puntaje, TiempoSegundos = tiempoSegundos });
        await ctx.SaveChangesAsync(ct);
        await progreso.AgregarPuntosAsync(aciertos * 10, TipoProgreso.EvaluacionCompletada, evaluacionId, $"Evaluación: {aciertos}/{total}", ct);
        return new ResultadoEvaluacionDto(evaluacionId, aciertos, total, puntaje, puntaje >= 70 ? MensajesRefuerzo.CierreExcelente : MensajesRefuerzo.CierreParcial);
    }

    internal static async Task<IReadOnlyList<PreguntaDto>> MapPreguntas(IQueryable<Pregunta> q, CancellationToken ct)
    {
        var items = await q.AsSplitQuery().AsNoTracking().ToListAsync(ct);
        return items
            .OrderBy(p => p.Orden)
            .Select(p => new PreguntaDto(
                p.Id,
                p.Enunciado,
                p.Explicacion,
                p.Tema,
                p.Opciones.OrderBy(o => o.Orden).Select(o => new OpcionDto(o.Id, o.Texto, o.Orden)).ToList()))
            .ToList();
    }
}

public class GaleriaService(AppDbContext ctx) : IGaleriaService
{
    public async Task<IReadOnlyList<GaleriaDto>> ObtenerGaleriasAsync(CancellationToken ct = default)
        => await ctx.Galerias.Include(g => g.Categoria).Include(g => g.Imagenes).OrderBy(g => g.Id)
            .Select(g => new GaleriaDto(
                g.Id,
                g.Titulo,
                g.Descripcion,
                g.Categoria!.Nombre,
                g.Imagenes.Count,
                g.Imagenes.OrderBy(i => i.Orden).Select(i => i.RutaRecurso).FirstOrDefault()))
            .ToListAsync(ct);

    public async Task<IReadOnlyList<ImagenGaleriaDto>> ObtenerImagenesAsync(int galeriaId, CancellationToken ct = default)
        => await ctx.ImagenesGaleria.Where(i => i.GaleriaId == galeriaId).OrderBy(i => i.Orden)
            .Select(i => new ImagenGaleriaDto(i.Id, i.Titulo, i.Descripcion, i.RutaRecurso)).ToListAsync(ct);
}

public class JuegoService(AppDbContext ctx, IProgresoService progreso, ISesionService sesion) : IJuegoService
{
    public async Task<IReadOnlyList<JuegoDto>> ObtenerJuegosAsync(CancellationToken ct = default)
    {
        var juegos = await ctx.Juegos.Include(j => j.Categoria).Where(j => j.EsActivo).OrderBy(j => j.Id).ToListAsync(ct);
        return juegos.Select(MapJuego).ToList();
    }

    public async Task<JuegoDto?> ObtenerJuegoAsync(int id, CancellationToken ct = default)
    {
        var juego = await ctx.Juegos.Include(j => j.Categoria).FirstOrDefaultAsync(j => j.Id == id && j.EsActivo, ct);
        return juego is null ? null : MapJuego(juego);
    }

    public async Task<IReadOnlyList<PreguntaDto>> ObtenerPreguntasJuegoAsync(int juegoId, CancellationToken ct = default)
        => await EvaluacionService.MapPreguntas(ctx.Preguntas.Include(p => p.Opciones).Where(p => p.JuegoId == juegoId).OrderBy(p => p.Orden), ct);

    public async Task<ResultadoJuegoDto> GuardarResultadoAsync(int juegoId, int aciertos, int total, int tiempoSegundos, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var puntaje = total > 0 ? (int)Math.Round(aciertos * 100.0 / total) : 0;
        ctx.ResultadosJuego.Add(new ResultadoJuego { UsuarioId = u.Id, JuegoId = juegoId, Aciertos = aciertos, TotalPreguntas = total, Puntaje = puntaje, TiempoSegundos = tiempoSegundos });
        await ctx.SaveChangesAsync(ct);
        await progreso.AgregarPuntosAsync(aciertos * 15, TipoProgreso.JuegoCompletado, juegoId, $"Juego: {aciertos}/{total}", ct);
        return new ResultadoJuegoDto(juegoId, aciertos, total, puntaje, puntaje >= 70 ? MensajesRefuerzo.CierreExcelente : MensajesRefuerzo.CierreParcial);
    }

    public async Task<ResultadoJuegoDto> RegistrarJuegoExternoAsync(int juegoId, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        ctx.ResultadosJuego.Add(new ResultadoJuego
        {
            UsuarioId = u.Id,
            JuegoId = juegoId,
            Aciertos = 0,
            TotalPreguntas = 0,
            Puntaje = 100,
            TiempoSegundos = 0
        });
        await ctx.SaveChangesAsync(ct);
        await progreso.AgregarPuntosAsync(25, TipoProgreso.JuegoCompletado, juegoId, "Juego externo completado", ct);
        return new ResultadoJuegoDto(juegoId, 0, 0, 100, MensajesRefuerzo.JuegoExternoCompletado);
    }

    public async Task ReiniciarPartidaJuegoAsync(int juegoId, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var resultados = await ctx.ResultadosJuego
            .Where(r => r.UsuarioId == u.Id && r.JuegoId == juegoId)
            .ToListAsync(ct);
        var progresos = await ctx.Progresos
            .Where(p => p.UsuarioId == u.Id && p.Tipo == TipoProgreso.JuegoCompletado && p.ReferenciaId == juegoId)
            .ToListAsync(ct);

        if (resultados.Count == 0 && progresos.Count == 0) return;

        var puntosPerdidos = progresos.Sum(p => p.PuntosGanados);
        ctx.ResultadosJuego.RemoveRange(resultados);
        ctx.Progresos.RemoveRange(progresos);
        u.PuntosTotales = Math.Max(0, u.PuntosTotales - puntosPerdidos);
        u.Nivel = Math.Max(1, u.PuntosTotales / 100 + 1);
        await ctx.SaveChangesAsync(ct);
    }

    private static JuegoDto MapJuego(JuegoEducativo j) => new(
        j.Id,
        j.Titulo,
        j.Descripcion,
        j.TiempoPorPreguntaSegundos,
        j.CantidadPreguntas,
        j.Categoria?.Nombre ?? "",
        j.UrlExterna,
        string.IsNullOrEmpty(j.UrlExterna) ? null : JuegoCatalog.UrlEmbed(j.UrlExterna));
}

public class UsuarioService(AppDbContext ctx, ISesionService sesion) : IUsuarioService
{
    public async Task<UsuarioDto> ObtenerUsuarioActualAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        return MapUsuario(u);
    }

    public async Task<IReadOnlyList<PerfilResumenDto>> ListarPerfilesAsync(CancellationToken ct = default)
        => await ctx.Usuarios.OrderByDescending(u => u.FechaCreacion)
            .Select(u => new PerfilResumenDto(u.Id, u.Nombre, u.Alias, u.PuntosTotales, u.Nivel, u.FechaCreacion))
            .ToListAsync(ct);

    public async Task<UsuarioDto> EntrarPorNombreAsync(string nombre, CancellationToken ct = default)
    {
        var limpio = NormalizarNombre(nombre);
        if (string.IsNullOrEmpty(limpio))
            throw new ArgumentException("Escribe un nombre para entrar.");

        var existente = await BuscarPorNombreAsync(limpio, ct);
        if (existente is not null)
        {
            sesion.EstablecerUsuario(existente.Id);
            return MapUsuario(existente);
        }

        return await CrearPerfilInternoAsync(limpio, ct);
    }

    public async Task<UsuarioDto> CrearNuevaPartidaAsync(string nombre, CancellationToken ct = default)
    {
        var limpio = NormalizarNombre(nombre);
        if (string.IsNullOrEmpty(limpio))
            throw new ArgumentException("Escribe un nombre para la nueva partida.");

        if (await BuscarPorNombreAsync(limpio, ct) is not null)
            throw new InvalidOperationException($"Ya existe un perfil llamado \"{limpio}\". Entra con ese nombre o elige otro.");

        return await CrearPerfilInternoAsync(limpio, ct);
    }

    public async Task SeleccionarPerfilAsync(int usuarioId, CancellationToken ct = default)
    {
        var existe = await ctx.Usuarios.AnyAsync(u => u.Id == usuarioId, ct);
        if (!existe) throw new InvalidOperationException("Perfil no encontrado.");
        sesion.EstablecerUsuario(usuarioId);
    }

    public async Task ActualizarPerfilAsync(string nombre, string alias, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var limpio = NormalizarNombre(nombre);
        if (!string.IsNullOrEmpty(limpio))
        {
            var duplicado = await ctx.Usuarios
                .AnyAsync(x => x.Id != u.Id && x.Nombre.ToLower() == limpio.ToLower(), ct);
            if (duplicado)
                throw new InvalidOperationException("Ese nombre ya lo usa otro perfil.");
            u.Nombre = limpio;
        }

        if (!string.IsNullOrWhiteSpace(alias))
            u.Alias = alias.Trim();

        await ctx.SaveChangesAsync(ct);
    }

    public async Task ResetearProgresoActualAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);

        ctx.Progresos.RemoveRange(await ctx.Progresos.Where(p => p.UsuarioId == u.Id).ToListAsync(ct));
        ctx.LogrosUsuario.RemoveRange(await ctx.LogrosUsuario.Where(l => l.UsuarioId == u.Id).ToListAsync(ct));
        ctx.ResultadosEvaluacion.RemoveRange(await ctx.ResultadosEvaluacion.Where(r => r.UsuarioId == u.Id).ToListAsync(ct));
        ctx.ResultadosJuego.RemoveRange(await ctx.ResultadosJuego.Where(r => r.UsuarioId == u.Id).ToListAsync(ct));
        ctx.Favoritos.RemoveRange(await ctx.Favoritos.Where(f => f.UsuarioId == u.Id).ToListAsync(ct));

        u.PuntosTotales = 0;
        u.Nivel = 1;
        await ctx.SaveChangesAsync(ct);
    }

    private async Task<UsuarioDto> CrearPerfilInternoAsync(string nombre, CancellationToken ct)
    {
        var usuario = new Usuario
        {
            Nombre = nombre,
            Alias = nombre,
            PuntosTotales = 0,
            Nivel = 1,
            FechaCreacion = DateTime.UtcNow
        };
        ctx.Usuarios.Add(usuario);
        await ctx.SaveChangesAsync(ct);
        sesion.EstablecerUsuario(usuario.Id);
        return MapUsuario(usuario);
    }

    private async Task<Usuario?> BuscarPorNombreAsync(string nombre, CancellationToken ct)
        => await ctx.Usuarios.FirstOrDefaultAsync(u => u.Nombre.ToLower() == nombre.ToLower(), ct);

    private static string NormalizarNombre(string nombre) => nombre.Trim();

    private static UsuarioDto MapUsuario(Usuario u) => new(u.Id, u.Nombre, u.Alias, u.PuntosTotales, u.Nivel);
}

public class ProgresoService(AppDbContext ctx, ISesionService sesion) : IProgresoService
{
    public async Task<EstadisticasDto> ObtenerEstadisticasAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var p = await ctx.Progresos.Where(x => x.UsuarioId == u.Id).ToListAsync(ct);
        return new EstadisticasDto(p.Count(x => x.Tipo == TipoProgreso.VideoVisto), p.Count(x => x.Tipo == TipoProgreso.EvaluacionCompletada),
            p.Count(x => x.Tipo == TipoProgreso.JuegoCompletado), p.Count(x => x.Tipo == TipoProgreso.PreguntaRespondida),
            await ctx.LogrosUsuario.CountAsync(l => l.UsuarioId == u.Id, ct));
    }

    public async Task<IReadOnlyList<LogroDto>> ObtenerLogrosAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        var des = await ctx.LogrosUsuario.Where(l => l.UsuarioId == u.Id).ToDictionaryAsync(l => l.LogroId, l => l.FechaDesbloqueo, ct);
        return await ctx.Logros.OrderBy(l => l.PuntosRequeridos).Select(l => new LogroDto(l.Id, l.Nombre, l.Descripcion, l.Icono, des.ContainsKey(l.Id), des.GetValueOrDefault(l.Id))).ToListAsync(ct);
    }

    public async Task<IReadOnlyList<ProgresoRecienteDto>> ObtenerActividadRecienteAsync(CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        return await ctx.Progresos.Where(p => p.UsuarioId == u.Id).OrderByDescending(p => p.Fecha).Take(10)
            .Select(p => new ProgresoRecienteDto(p.Descripcion, p.PuntosGanados, p.Fecha)).ToListAsync(ct);
    }

    public async Task AgregarPuntosAsync(int puntos, TipoProgreso tipo, int referenciaId, string descripcion, CancellationToken ct = default)
    {
        var u = await ctx.ObtenerUsuarioSesionAsync(sesion, ct);
        u.PuntosTotales += puntos;
        u.Nivel = Math.Max(1, u.PuntosTotales / 100 + 1);
        ctx.Progresos.Add(new ProgresoUsuario { UsuarioId = u.Id, Tipo = tipo, ReferenciaId = referenciaId, PuntosGanados = puntos, Descripcion = descripcion });
        await ctx.SaveChangesAsync(ct);
        await VerificarLogrosAsync(u.Id, ct);
    }

    private async Task VerificarLogrosAsync(int usuarioId, CancellationToken ct)
    {
        var u = await ctx.Usuarios.FindAsync([usuarioId], ct);
        if (u is null) return;
        var obtenidos = await ctx.LogrosUsuario.Where(l => l.UsuarioId == usuarioId).Select(l => l.LogroId).ToListAsync(ct);
        var nuevos = await ctx.Logros.Where(l => !obtenidos.Contains(l.Id) && l.PuntosRequeridos <= u.PuntosTotales).ToListAsync(ct);
        foreach (var l in nuevos) ctx.LogrosUsuario.Add(new LogroUsuario { UsuarioId = usuarioId, LogroId = l.Id });
        if (nuevos.Count > 0) await ctx.SaveChangesAsync(ct);
    }
}

public class PreguntaValidationService(AppDbContext ctx, IPreguntasJsonLoader jsonLoader) : IPreguntaValidationService
{
    public async Task<bool> ValidarRespuestaAsync(int preguntaId, int opcionId, CancellationToken ct = default)
    {
        if (jsonLoader.EsPreguntaJson(preguntaId))
        {
            var json = jsonLoader.ValidarOpcionJson(preguntaId, opcionId);
            if (json is not null) return json.Value;
        }

        return await ctx.Opciones.AnyAsync(o => o.Id == opcionId && o.PreguntaId == preguntaId && o.EsCorrecta, ct);
    }
}
