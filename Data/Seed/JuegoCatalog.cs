using System.Text.RegularExpressions;
using MauiApp2.Models;

namespace MauiApp2.Data.Seed;

/// <summary>
/// Catálogo oficial de juegos educativos externos (Educaplay, calculadoras).
/// </summary>
public static partial class JuegoCatalog
{
    public record JuegoItem(string Titulo, string Descripcion, string UrlExterna, int IndiceCategoria, int Orden, string Emoji = "🎮");

    public static IReadOnlyList<JuegoItem> ObtenerJuegos() =>
    [
        new("Proporcionalidad Directa e Inversa",
            "Juego interactivo de Educaplay: identifica proporcionalidad directa e inversa.",
            "https://es.educaplay.com/recursos-educativos/1509007-proporcionalidad_directa_e_inversa.html",
            0, 1, "⚖️"),

        new("Porcentajes Básicos",
            "Practica porcentajes con actividades divertidas en Educaplay.",
            "https://es.educaplay.com/recursos-educativos/4101377-porcentajes.html",
            1, 2, "💯"),

        new("Calculadora IVA y Facturas",
            "Simula facturas y calcula el IVA de Ecuador.",
            "https://calculadoriva.com/ecuador",
            2, 3, "🧾"),

        new("Regla de Tres",
            "Resuelve problemas de regla de tres simple directa.",
            "https://es.educaplay.com/recursos-educativos/628436-regla_de_tres_simple_directa.html",
            3, 4, "📐"),

        new("Razones y Proporciones",
            "Compara razones y establece proporciones en Educaplay.",
            "https://es.educaplay.com/recursos-educativos/1877944-razones_y_proporciones.html",
            3, 5, "🔢")
    ];

    public static IEnumerable<JuegoEducativo> CrearEntidades(IReadOnlyList<Categoria> categorias)
    {
        foreach (var item in ObtenerJuegos())
        {
            yield return new JuegoEducativo
            {
                CategoriaId = categorias[item.IndiceCategoria].Id,
                Titulo = item.Titulo,
                Descripcion = item.Descripcion,
                UrlExterna = item.UrlExterna,
                CantidadPreguntas = 0,
                TiempoPorPreguntaSegundos = 0,
                EsActivo = true
            };
        }
    }

    public static string UrlEmbed(string urlExterna)
    {
        var match = EducaplayRecurso().Match(urlExterna);
        if (match.Success)
            return $"https://www.educaplay.com/game/{match.Groups[1].Value}";

        return urlExterna
            .Replace("https://es.educaplay.com/", "https://www.educaplay.com/", StringComparison.OrdinalIgnoreCase);
    }

    [GeneratedRegex(@"educaplay\.com/recursos-educativos/([^?#]+)", RegexOptions.IgnoreCase)]
    private static partial Regex EducaplayRecurso();
}
