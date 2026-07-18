using MauiApp2.Models;

namespace MauiApp2.Data.Seed;

/// <summary>
/// Catálogo oficial de videos educativos de YouTube.
/// </summary>
public static class VideoCatalog
{
    public static IReadOnlyList<VideoSeedItem> ObtenerVideos() =>
    [
        new("Proporcionalidad Directa", "Aprende proporcionalidad directa con ejemplos claros.", "nP9SwAqhVTI", 1, 0),
        new("Proporcionalidad Inversa", "Descubre la proporcionalidad inversa paso a paso.", "iDisByLSTS0", 2, 0),
        new("Porcentajes Básicos", "Calcula porcentajes de forma sencilla.", "RE3XoDORMys", 1, 1),
        new("IVA y Facturas", "Entiende el IVA en facturas comerciales.", "jdataqvtIBk", 2, 2),
        new("Regla de Tres", "Resuelve problemas con regla de tres.", "N1vI94ySy94", 3, 3),
        new("Razones y Proporciones", "Conceptos fundamentales de razones.", "3eYwW4sDlxM", 3, 3)
    ];

    public record VideoSeedItem(string Titulo, string Descripcion, string YouTubeId, int Orden, int IndiceCategoria);

    public static string UrlEmbed(string youTubeId) => $"https://www.youtube.com/embed/{youTubeId}";

    public static string UrlMiniatura(string youTubeId) => $"https://img.youtube.com/vi/{youTubeId}/mqdefault.jpg";
}
