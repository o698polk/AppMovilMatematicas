using MauiApp2.Models;

namespace MauiApp2.Data.Seed;

/// <summary>
/// Mapeo estable entre evaluaciones y temas del banco de preguntas.
/// No depende del orden de IDs en SQLite.
/// </summary>
public static class EvaluacionCatalog
{
    public sealed record Asignacion(string PalabraClaveTitulo, params TemaMatematico[] Temas);

    public static IReadOnlyList<Asignacion> Asignaciones { get; } =
    [
        new("Proporcionalidad", TemaMatematico.ProporcionalidadDirecta, TemaMatematico.ProporcionalidadInversa),
        new("Porcentajes", TemaMatematico.Porcentajes),
        new("Finanzas", TemaMatematico.FacturasIva, TemaMatematico.InteresSimple),
        new("Razones", TemaMatematico.Razones, TemaMatematico.ReglaDeTres)
    ];

    public static TemaMatematico[]? TemasParaTitulo(string titulo)
    {
        foreach (var item in Asignaciones)
        {
            if (titulo.Contains(item.PalabraClaveTitulo, StringComparison.OrdinalIgnoreCase))
                return item.Temas;
        }

        return null;
    }
}
