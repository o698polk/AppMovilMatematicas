using MauiApp2.Models;

namespace MauiApp2.Data.Seed;

/// <summary>
/// Catálogo oficial de galerías educativas con infografías PNG.
/// Alineado con los 6 videos de VideoCatalog.
/// </summary>
public static class GaleriaCatalog
{
    public record ImagenItem(string Titulo, string Descripcion, string Archivo, int Orden = 1);

    public record GaleriaItem(string Titulo, string Descripcion, int IndiceCategoria, int Orden, IReadOnlyList<ImagenItem> Imagenes);

    public static string RutaImagen(string archivo) => $"images/galeria/{archivo}";

    public static IReadOnlyList<GaleriaItem> ObtenerGalerias() =>
    [
        new("Proporcionalidad Directa",
            "Galletas y huevos: si aumenta una cantidad, aumenta la otra.",
            0, 1,
            [new("¡La Proporcionalidad Directa!",
                "1 huevo = 5 galletas · 3 huevos = 15 galletas. Relación 1:5 y 3:15.",
                "Proporcionalidad_Directa.png")]),

        new("Proporcionalidad Inversa",
            "Menos niños en el rompecabezas, más tiempo en el columpio.",
            0, 2,
            [new("¡La Proporcionalidad Inversa!",
                "Si una cantidad aumenta, la otra disminuye en la misma proporción.",
                "Proporcionalidad_Inversa.png")]),

        new("Porcentajes Básicos",
            "Mitad (50%) y cuarto (25%) con ejemplos visuales.",
            1, 3,
            [new("¡Los Porcentajes Básicos!",
                "10 manzanas → 5 azules (50%). 20 bloques → 5 rojos (25%).",
                "Porcentajes_Basicos.png")]),

        new("IVA y Facturas",
            "Impuesto al valor agregado y recibos de compra.",
            2, 4,
            [new("¡IVA y Facturas!",
                "Manzana $100 + IVA 16% = $116. Aprende a leer una factura.",
                "IVA_y_Facturas.png")]),

        new("Regla de Tres",
            "Encuentra el valor desconocido usando proporciones.",
            3, 5,
            [new("¡La Regla de Tres!",
                "2 kg = $100 → 5 kg = $250. Paso 1: plantear. Paso 2: resolver.",
                "Regla_de_Tres.png")]),

        new("Razones y Proporciones",
            "Compara cantidades y establece relaciones matemáticas.",
            3, 6,
            [new("¡Razones y Proporciones!",
                "Aprende a comparar cantidades y resolver problemas con proporciones.",
                "Razones_y_Proporciones.png")])
    ];

    public static IEnumerable<Galeria> CrearEntidades(IReadOnlyList<Categoria> categorias)
    {
        foreach (var item in ObtenerGalerias())
        {
            yield return new Galeria
            {
                CategoriaId = categorias[item.IndiceCategoria].Id,
                Titulo = item.Titulo,
                Descripcion = item.Descripcion,
                Imagenes = item.Imagenes.Select(img => new ImagenGaleria
                {
                    Titulo = img.Titulo,
                    Descripcion = img.Descripcion,
                    RutaRecurso = RutaImagen(img.Archivo),
                    Orden = img.Orden
                }).ToList()
            };
        }
    }
}
