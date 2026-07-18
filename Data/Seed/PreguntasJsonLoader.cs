using System.Collections.Concurrent;
using MauiApp2.Models;
using MauiApp2.Services;

namespace MauiApp2.Data.Seed;

public interface IPreguntasJsonLoader
{
    Task<IReadOnlyList<PreguntaDto>> ObtenerPreguntasPorTituloAsync(string tituloEvaluacion, CancellationToken ct = default);
    bool EsPreguntaJson(int preguntaId);
    bool? ValidarOpcionJson(int preguntaId, int opcionId);
}

/// <summary>
/// Carga preguntas desde JSON embebido / wwwroot. IDs sintéticos negativos para no chocar con SQLite.
/// </summary>
public sealed class PreguntasJsonLoader : IPreguntasJsonLoader
{
    private readonly ConcurrentDictionary<int, (int IndiceCorrecta, int OpcionIdCorrecta)> _correctas = new();
    private EvaluacionesPreguntasDocumento? _doc;
    private readonly SemaphoreSlim _gate = new(1, 1);

    public async Task<IReadOnlyList<PreguntaDto>> ObtenerPreguntasPorTituloAsync(string tituloEvaluacion, CancellationToken ct = default)
    {
        var doc = await ObtenerDocumentoAsync(ct);
        var clave = EvaluacionPreguntasCatalog.ResolverClaveDesdeTitulo(tituloEvaluacion)
            ?? throw new InvalidOperationException($"No hay clave JSON para: {tituloEvaluacion}");

        var evalIndex = doc.Evaluaciones.FindIndex(e =>
            e.Clave.Equals(clave, StringComparison.OrdinalIgnoreCase));
        if (evalIndex < 0)
            throw new InvalidOperationException($"No hay bloque JSON para clave: {clave}");

        var bloque = doc.Evaluaciones[evalIndex];
        if (bloque.Preguntas.Count == 0)
            throw new InvalidOperationException($"El JSON no tiene preguntas para: {clave}");

        var lista = new List<PreguntaDto>(bloque.Preguntas.Count);

        for (var i = 0; i < bloque.Preguntas.Count; i++)
        {
            var p = bloque.Preguntas[i];
            if (!Enum.TryParse<TemaMatematico>(p.Tema, ignoreCase: true, out var tema))
                tema = TemaMatematico.Porcentajes;

            // IDs negativos estables y sin overflow: -(1000*(eval+1) + (i+1))
            var preguntaId = -((evalIndex + 1) * 1000 + (i + 1));
            var opciones = new List<OpcionDto>(p.Opciones.Count);
            for (var o = 0; o < p.Opciones.Count; o++)
            {
                var opcionId = preguntaId * 10 - (o + 1);
                opciones.Add(new OpcionDto(opcionId, p.Opciones[o], o + 1));
            }

            var indice = Math.Clamp(p.IndiceCorrecta, 0, opciones.Count - 1);
            _correctas[preguntaId] = (indice, opciones[indice].Id);
            lista.Add(new PreguntaDto(preguntaId, p.Enunciado, p.Explicacion, tema, opciones));
        }

        return lista;
    }

    public bool EsPreguntaJson(int preguntaId) => preguntaId < 0;

    public bool? ValidarOpcionJson(int preguntaId, int opcionId)
    {
        if (!_correctas.TryGetValue(preguntaId, out var info))
            return null;
        return info.OpcionIdCorrecta == opcionId;
    }

    private async Task<EvaluacionesPreguntasDocumento> ObtenerDocumentoAsync(CancellationToken ct)
    {
        if (_doc is not null) return _doc;

        await _gate.WaitAsync(ct);
        try
        {
            if (_doc is not null) return _doc;

            _doc = await CargarDesdeRecursoEmbebidoAsync();
            if (_doc is null || _doc.Evaluaciones.Count == 0)
                _doc = await CargarDesdePaqueteAsync();
            if (_doc is null || _doc.Evaluaciones.Count == 0)
                _doc = EvaluacionPreguntasCatalog.CrearDocumento();

            return _doc;
        }
        finally
        {
            _gate.Release();
        }
    }

    private static Task<EvaluacionesPreguntasDocumento?> CargarDesdeRecursoEmbebidoAsync()
    {
        var asm = typeof(PreguntasJsonLoader).Assembly;
        using var stream = asm.GetManifestResourceStream(EvaluacionPreguntasCatalog.NombreRecursoEmbebido);
        if (stream is null) return Task.FromResult<EvaluacionesPreguntasDocumento?>(null);
        return Task.FromResult<EvaluacionesPreguntasDocumento?>(EvaluacionPreguntasCatalog.Deserializar(stream));
    }

    private static async Task<EvaluacionesPreguntasDocumento?> CargarDesdePaqueteAsync()
    {
        try
        {
            await using var stream = await FileSystem.OpenAppPackageFileAsync(EvaluacionPreguntasCatalog.RutaRelativaWwwroot);
            return EvaluacionPreguntasCatalog.Deserializar(stream);
        }
        catch
        {
            try
            {
                await using var stream = await FileSystem.OpenAppPackageFileAsync("wwwroot/" + EvaluacionPreguntasCatalog.RutaRelativaWwwroot);
                return EvaluacionPreguntasCatalog.Deserializar(stream);
            }
            catch
            {
                return null;
            }
        }
    }
}
