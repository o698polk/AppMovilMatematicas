using Microsoft.EntityFrameworkCore;
using MauiApp2.Data.Seed;
using MauiApp2.Models;

namespace MauiApp2.Data;

public static class DataSeeder
{
    public const int PreguntasPorEvaluacion = 10;

    public static async Task SeedAsync(AppDbContext context, CancellationToken ct = default)
    {
        context.Usuarios.Add(new Usuario { Nombre = "Estudiante", Alias = "Aprendiz Matemático" });

        var categorias = new[]
        {
            new Categoria { Nombre = "Proporcionalidad", Descripcion = "Directa e inversa", Icono = "⚖️", ColorHex = "#4FC3F7" },
            new Categoria { Nombre = "Porcentajes", Descripcion = "Cálculos y descuentos", Icono = "💯", ColorHex = "#81C784" },
            new Categoria { Nombre = "Finanzas", Descripcion = "IVA e interés simple", Icono = "💰", ColorHex = "#FFD54F" },
            new Categoria { Nombre = "Razones", Descripcion = "Razones y regla de tres", Icono = "📐", ColorHex = "#9575CD" }
        };
        context.Categorias.AddRange(categorias);
        await context.SaveChangesAsync(ct);

        var catalogo = VideoCatalog.ObtenerVideos();
        context.Videos.AddRange(catalogo.Select(v => new VideoEducativo
        {
            CategoriaId = categorias[v.IndiceCategoria].Id,
            Titulo = v.Titulo,
            Descripcion = v.Descripcion,
            UrlYouTube = VideoCatalog.UrlEmbed(v.YouTubeId),
            UrlMiniatura = VideoCatalog.UrlMiniatura(v.YouTubeId),
            DuracionSegundos = 420,
            Orden = v.Orden
        }));

        context.Galerias.AddRange(GaleriaCatalog.CrearEntidades(categorias));
        await context.SaveChangesAsync(ct);

        var evaluaciones = new[]
        {
            new Evaluacion { CategoriaId = categorias[0].Id, Titulo = "Evaluación: Proporcionalidad", Descripcion = "Pon a prueba proporcionalidad", CantidadPreguntas = PreguntasPorEvaluacion },
            new Evaluacion { CategoriaId = categorias[1].Id, Titulo = "Evaluación: Porcentajes", Descripcion = "Domina los porcentajes", CantidadPreguntas = PreguntasPorEvaluacion },
            new Evaluacion { CategoriaId = categorias[2].Id, Titulo = "Evaluación: Finanzas", Descripcion = "IVA e interés simple", CantidadPreguntas = PreguntasPorEvaluacion },
            new Evaluacion { CategoriaId = categorias[3].Id, Titulo = "Evaluación: Razones", Descripcion = "Razones y regla de tres", CantidadPreguntas = PreguntasPorEvaluacion }
        };
        context.Evaluaciones.AddRange(evaluaciones);

        context.Juegos.AddRange(JuegoCatalog.CrearEntidades(categorias));

        context.Logros.AddRange(
            new Logro { Nombre = "Primer Paso", Descripcion = "50 puntos", Icono = "🌱", PuntosRequeridos = 50 },
            new Logro { Nombre = "Explorador", Descripcion = "200 puntos", Icono = "🔍", PuntosRequeridos = 200 },
            new Logro { Nombre = "Matemático Junior", Descripcion = "500 puntos", Icono = "📊", PuntosRequeridos = 500 },
            new Logro { Nombre = "Maestro", Descripcion = "1000 puntos", Icono = "🏆", PuntosRequeridos = 1000 },
            new Logro { Nombre = "Genio", Descripcion = "2000 puntos", Icono = "⭐", PuntosRequeridos = 2000 });

        await context.SaveChangesAsync(ct);

        var banco = BancoPreguntasSeed.GenerarTodas();
        context.Preguntas.AddRange(banco.Select((p, i) => CrearPregunta(p, i + 1)));
        await context.SaveChangesAsync(ct);

        foreach (var eval in evaluaciones)
        {
            var temas = EvaluacionCatalog.TemasParaTitulo(eval.Titulo);
            if (temas is null) continue;
            await AsignarEvalAsync(context, eval.Id, ct, temas);
        }

        await context.SaveChangesAsync(ct);
    }

    /// <summary>
    /// Garantiza banco de preguntas y asignación a evaluaciones (repara BD incompleta en móvil).
    /// </summary>
    public static async Task AsegurarPreguntasEvaluacionesAsync(AppDbContext context, CancellationToken ct = default)
    {
        var evaluaciones = await context.Evaluaciones.OrderBy(e => e.Id).ToListAsync(ct);
        if (evaluaciones.Count == 0) return;

        if (!await context.Preguntas.AnyAsync(ct))
        {
            var banco = BancoPreguntasSeed.GenerarTodas();
            context.Preguntas.AddRange(banco.Select((p, i) => CrearPregunta(p, i + 1)));
            await context.SaveChangesAsync(ct);
        }

        await LiberarPreguntasBloqueadasAsync(context, ct);

        foreach (var eval in evaluaciones)
        {
            var temas = EvaluacionCatalog.TemasParaTitulo(eval.Titulo);
            if (temas is null) continue;

            var asignadas = await context.Preguntas.CountAsync(p => p.EvaluacionId == eval.Id, ct);
            if (asignadas >= PreguntasPorEvaluacion) continue;

            foreach (var p in await context.Preguntas.Where(p => p.EvaluacionId == eval.Id).ToListAsync(ct))
            {
                p.EvaluacionId = null;
                p.Orden = 0;
            }

            await context.SaveChangesAsync(ct);
            await AsignarEvalAsync(context, eval.Id, ct, temas);
            await context.SaveChangesAsync(ct);
        }
    }

    /// <summary>
    /// Libera preguntas atadas a juegos internos obsoletos o externos (sin banco propio).
    /// </summary>
    internal static async Task LiberarPreguntasBloqueadasAsync(AppDbContext context, CancellationToken ct = default)
    {
        var juegosConBancoPropio = await context.Juegos
            .Where(j => j.EsActivo && string.IsNullOrEmpty(j.UrlExterna) && j.CantidadPreguntas > 0)
            .Select(j => j.Id)
            .ToListAsync(ct);

        var bloqueadas = await context.Preguntas
            .Where(p => p.EvaluacionId == null && p.JuegoId != null)
            .ToListAsync(ct);

        var cambios = false;
        foreach (var pregunta in bloqueadas)
        {
            if (juegosConBancoPropio.Contains(pregunta.JuegoId!.Value)) continue;
            pregunta.JuegoId = null;
            cambios = true;
        }

        if (cambios)
            await context.SaveChangesAsync(ct);
    }

    internal static async Task<int> ContarPreguntasAsignadasAsync(AppDbContext context, int evaluacionId, CancellationToken ct = default)
        => await context.Preguntas.CountAsync(p => p.EvaluacionId == evaluacionId, ct);

    private static Pregunta CrearPregunta(PreguntaSeed s, int orden)
    {
        var p = new Pregunta { Tema = s.Tema, Enunciado = s.Enunciado, Explicacion = s.Explicacion, Orden = orden };
        for (var i = 0; i < s.Opciones.Length; i++)
            p.Opciones.Add(new OpcionRespuesta { Texto = s.Opciones[i], EsCorrecta = i == s.IndiceCorrecta, Orden = i + 1 });
        return p;
    }

    private static async Task AsignarEvalAsync(AppDbContext ctx, int evalId, CancellationToken ct, params TemaMatematico[] temas)
    {
        var preguntas = await ctx.Preguntas
            .Where(p => p.EvaluacionId == null && p.JuegoId == null && temas.Contains(p.Tema))
            .OrderBy(p => p.Id)
            .Take(PreguntasPorEvaluacion)
            .ToListAsync(ct);

        var orden = 1;
        foreach (var pregunta in preguntas)
        {
            pregunta.EvaluacionId = evalId;
            pregunta.Orden = orden++;
        }
    }
}
