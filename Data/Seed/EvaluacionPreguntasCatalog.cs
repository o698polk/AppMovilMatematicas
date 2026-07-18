using System.Text.Json;
using System.Text.Json.Serialization;
using MauiApp2.Models;

namespace MauiApp2.Data.Seed;

public sealed class EvaluacionesPreguntasDocumento
{
    [JsonPropertyName("evaluaciones")]
    public List<EvaluacionPreguntasJson> Evaluaciones { get; set; } = [];
}

public sealed class EvaluacionPreguntasJson
{
    [JsonPropertyName("clave")]
    public string Clave { get; set; } = "";

    [JsonPropertyName("preguntas")]
    public List<PreguntaJson> Preguntas { get; set; } = [];
}

public sealed class PreguntaJson
{
    [JsonPropertyName("enunciado")]
    public string Enunciado { get; set; } = "";

    [JsonPropertyName("explicacion")]
    public string Explicacion { get; set; } = "";

    [JsonPropertyName("tema")]
    public string Tema { get; set; } = "";

    [JsonPropertyName("opciones")]
    public List<string> Opciones { get; set; } = [];

    [JsonPropertyName("indiceCorrecta")]
    public int IndiceCorrecta { get; set; }
}

/// <summary>
/// Catálogo de preguntas por evaluación: construye desde el banco y serializa/deserializa JSON.
/// </summary>
public static class EvaluacionPreguntasCatalog
{
    public const int PreguntasPorEvaluacion = 10;
    public const string RutaRelativaWwwroot = "data/evaluaciones-preguntas.json";
    public const string NombreRecursoEmbebido = "MauiApp2.Data.Seed.evaluaciones-preguntas.json";

    public static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true,
        WriteIndented = true
    };

    public static EvaluacionesPreguntasDocumento CrearDocumento()
    {
        var banco = BancoPreguntasSeed.GenerarTodas();
        return new EvaluacionesPreguntasDocumento
        {
            Evaluaciones =
            [
                CrearBloque("Proporcionalidad", banco, TemaMatematico.ProporcionalidadDirecta, TemaMatematico.ProporcionalidadInversa),
                CrearBloque("Porcentajes", banco, TemaMatematico.Porcentajes),
                CrearBloque("Finanzas", banco, TemaMatematico.FacturasIva, TemaMatematico.InteresSimple),
                CrearBloque("Razones", banco, TemaMatematico.Razones, TemaMatematico.ReglaDeTres)
            ]
        };
    }

    public static string Serializar(EvaluacionesPreguntasDocumento doc)
        => JsonSerializer.Serialize(doc, JsonOptions);

    public static EvaluacionesPreguntasDocumento Deserializar(string json)
        => JsonSerializer.Deserialize<EvaluacionesPreguntasDocumento>(json, JsonOptions)
           ?? throw new InvalidOperationException("JSON de evaluaciones vacío o inválido.");

    public static EvaluacionesPreguntasDocumento Deserializar(Stream stream)
        => JsonSerializer.Deserialize<EvaluacionesPreguntasDocumento>(stream, JsonOptions)
           ?? throw new InvalidOperationException("JSON de evaluaciones vacío o inválido.");

    public static string? ResolverClaveDesdeTitulo(string titulo)
    {
        foreach (var item in EvaluacionCatalog.Asignaciones)
        {
            if (titulo.Contains(item.PalabraClaveTitulo, StringComparison.OrdinalIgnoreCase))
                return item.PalabraClaveTitulo;
        }

        return null;
    }

    private static EvaluacionPreguntasJson CrearBloque(string clave, List<PreguntaSeed> banco, params TemaMatematico[] temas)
    {
        var preguntas = banco
            .Where(p => temas.Contains(p.Tema))
            .Take(PreguntasPorEvaluacion)
            .Select(p => new PreguntaJson
            {
                Enunciado = p.Enunciado,
                Explicacion = p.Explicacion,
                Tema = p.Tema.ToString(),
                Opciones = p.Opciones.ToList(),
                IndiceCorrecta = p.IndiceCorrecta
            })
            .ToList();

        if (preguntas.Count < PreguntasPorEvaluacion)
            throw new InvalidOperationException($"El banco no tiene {PreguntasPorEvaluacion} preguntas para {clave}.");

        return new EvaluacionPreguntasJson { Clave = clave, Preguntas = preguntas };
    }
}
