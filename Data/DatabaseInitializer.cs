using Microsoft.EntityFrameworkCore;
using MauiApp2.Data.Seed;
using MauiApp2.Services;

namespace MauiApp2.Data;

public class DatabaseInitializer(AppDbContext context) : IDatabaseInitializer
{
    public async Task InicializarAsync(CancellationToken ct = default)
    {
        try
        {
            await context.Database.EnsureCreatedAsync(ct);
            await AsegurarIndiceUsuarioNombreAsync(ct);

            if (!await context.Usuarios.AnyAsync(ct))
                await DataSeeder.SeedAsync(context, ct);
            else
            {
                await AsegurarEsquemaJuegosAsync(ct);
                await ActualizarUrlsVideosAsync(ct);
                await ActualizarGaleriasAsync(ct);
                await ActualizarJuegosAsync(ct);
            }

            await DataSeeder.AsegurarPreguntasEvaluacionesAsync(context, ct);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"DatabaseInitializer: {ex}");
            throw;
        }
    }

    private async Task AsegurarIndiceUsuarioNombreAsync(CancellationToken ct)
    {
        try
        {
            var conn = context.Database.GetDbConnection();
            if (conn.State != System.Data.ConnectionState.Open)
                await conn.OpenAsync(ct);

            await using var cmd = conn.CreateCommand();
            cmd.CommandText = "CREATE UNIQUE INDEX IF NOT EXISTS IX_Usuarios_Nombre ON Usuarios (Nombre)";
            await cmd.ExecuteNonQueryAsync(ct);
        }
        catch
        {
            // Índice opcional; la app valida duplicados en código.
        }
    }

    /// <summary>
    /// Sincroniza URLs de YouTube si la BD ya existía con enlaces anteriores.
    /// </summary>
    private async Task ActualizarUrlsVideosAsync(CancellationToken ct)
    {
        var videosDb = await context.Videos.ToListAsync(ct);
        var catalogo = VideoCatalog.ObtenerVideos();
        var cambios = false;

        foreach (var item in catalogo)
        {
            var video = videosDb.FirstOrDefault(v => v.Titulo == item.Titulo);
            if (video is null) continue;

            var embed = VideoCatalog.UrlEmbed(item.YouTubeId);
            var miniatura = VideoCatalog.UrlMiniatura(item.YouTubeId);
            if (video.UrlYouTube == embed && video.UrlMiniatura == miniatura) continue;

            video.UrlYouTube = embed;
            video.UrlMiniatura = miniatura;
            video.Descripcion = item.Descripcion;
            cambios = true;
        }

        if (cambios)
            await context.SaveChangesAsync(ct);
    }

    /// <summary>
    /// Migra galerías SVG antiguas a infografías PNG y sincroniza el catálogo.
    /// </summary>
    private async Task ActualizarGaleriasAsync(CancellationToken ct)
    {
        var categorias = await context.Categorias.OrderBy(c => c.Id).ToListAsync(ct);
        if (categorias.Count == 0) return;

        var tieneEstructuraAntigua = await context.ImagenesGaleria.AnyAsync(i => i.RutaRecurso.EndsWith(".svg"), ct)
            || await context.Galerias.AnyAsync(g =>
                g.Titulo == "Gráficos de Proporcionalidad"
                || g.Titulo == "Porcentajes Visuales"
                || g.Titulo == "Facturas y Finanzas", ct);

        if (tieneEstructuraAntigua)
        {
            context.ImagenesGaleria.RemoveRange(await context.ImagenesGaleria.ToListAsync(ct));
            context.Galerias.RemoveRange(await context.Galerias.ToListAsync(ct));
            context.Galerias.AddRange(GaleriaCatalog.CrearEntidades(categorias));
            await context.SaveChangesAsync(ct);
            return;
        }

        var catalogo = GaleriaCatalog.ObtenerGalerias();
        var cambios = false;

        foreach (var item in catalogo)
        {
            var galeria = await context.Galerias.FirstOrDefaultAsync(g => g.Titulo == item.Titulo, ct);
            if (galeria is null)
            {
                galeria = new Models.Galeria
                {
                    CategoriaId = categorias[item.IndiceCategoria].Id,
                    Titulo = item.Titulo,
                    Descripcion = item.Descripcion
                };
                context.Galerias.Add(galeria);
                await context.SaveChangesAsync(ct);
                cambios = true;
            }
            else if (galeria.Descripcion != item.Descripcion)
            {
                galeria.Descripcion = item.Descripcion;
                cambios = true;
            }

            foreach (var img in item.Imagenes)
            {
                var ruta = GaleriaCatalog.RutaImagen(img.Archivo);
                var existente = await context.ImagenesGaleria
                    .FirstOrDefaultAsync(i => i.GaleriaId == galeria.Id && i.Titulo == img.Titulo, ct);

                if (existente is null)
                {
                    context.ImagenesGaleria.Add(new Models.ImagenGaleria
                    {
                        GaleriaId = galeria.Id,
                        Titulo = img.Titulo,
                        Descripcion = img.Descripcion,
                        RutaRecurso = ruta,
                        Orden = img.Orden
                    });
                    cambios = true;
                }
                else if (existente.RutaRecurso != ruta || existente.Descripcion != img.Descripcion)
                {
                    existente.RutaRecurso = ruta;
                    existente.Descripcion = img.Descripcion;
                    cambios = true;
                }
            }
        }

        if (cambios)
            await context.SaveChangesAsync(ct);
    }

    private async Task AsegurarEsquemaJuegosAsync(CancellationToken ct)
    {
        try
        {
            if (await ColumnaExisteAsync("Juegos", "UrlExterna", ct)) return;
            await context.Database.ExecuteSqlRawAsync("ALTER TABLE Juegos ADD COLUMN UrlExterna TEXT NULL", ct);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"AsegurarEsquemaJuegos: {ex.Message}");
        }
    }

    private async Task<bool> ColumnaExisteAsync(string tabla, string columna, CancellationToken ct)
    {
        var conn = context.Database.GetDbConnection();
        if (conn.State != System.Data.ConnectionState.Open)
            await conn.OpenAsync(ct);

        await using var cmd = conn.CreateCommand();
        cmd.CommandText = $"PRAGMA table_info({tabla})";
        await using var reader = await cmd.ExecuteReaderAsync(ct);
        while (await reader.ReadAsync(ct))
        {
            if (reader.GetString(1).Equals(columna, StringComparison.OrdinalIgnoreCase))
                return true;
        }

        return false;
    }

    /// <summary>
    /// Migra juegos internos antiguos a juegos externos del catálogo oficial.
    /// </summary>
    private async Task ActualizarJuegosAsync(CancellationToken ct)
    {
        var categorias = await context.Categorias.OrderBy(c => c.Id).ToListAsync(ct);
        if (categorias.Count == 0) return;

        var titulosAntiguos = new[] { "Desafío Proporcional", "Reto Porcentajes", "Quiz Matemático" };
        var tieneJuegosAntiguos = await context.Juegos.AnyAsync(j => titulosAntiguos.Contains(j.Titulo), ct);

        if (tieneJuegosAntiguos)
        {
            var juegosAntiguos = await context.Juegos.Where(j => titulosAntiguos.Contains(j.Titulo)).ToListAsync(ct);
            var idsAntiguos = juegosAntiguos.Select(j => j.Id).ToList();

            foreach (var p in await context.Preguntas.Where(p => p.JuegoId != null && idsAntiguos.Contains(p.JuegoId.Value)).ToListAsync(ct))
                p.JuegoId = null;

            foreach (var j in juegosAntiguos)
                j.EsActivo = false;

            await context.SaveChangesAsync(ct);
        }

        var catalogo = JuegoCatalog.ObtenerJuegos();
        var cambios = false;

        foreach (var item in catalogo)
        {
            var juego = await context.Juegos.FirstOrDefaultAsync(j => j.Titulo == item.Titulo, ct);
            if (juego is null)
            {
                context.Juegos.Add(new Models.JuegoEducativo
                {
                    CategoriaId = categorias[item.IndiceCategoria].Id,
                    Titulo = item.Titulo,
                    Descripcion = item.Descripcion,
                    UrlExterna = item.UrlExterna,
                    CantidadPreguntas = 0,
                    TiempoPorPreguntaSegundos = 0,
                    EsActivo = true
                });
                cambios = true;
            }
            else if (juego.UrlExterna != item.UrlExterna
                     || juego.Descripcion != item.Descripcion
                     || !juego.EsActivo)
            {
                juego.UrlExterna = item.UrlExterna;
                juego.Descripcion = item.Descripcion;
                juego.CategoriaId = categorias[item.IndiceCategoria].Id;
                juego.EsActivo = true;
                cambios = true;
            }
        }

        if (cambios)
            await context.SaveChangesAsync(ct);
    }
}
