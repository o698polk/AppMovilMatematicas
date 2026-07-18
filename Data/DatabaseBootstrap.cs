using MauiApp2.Services;

namespace MauiApp2.Data;

/// <summary>
/// Inicialización segura de SQLite fuera del hilo UI (evita cierre en Android).
/// </summary>
public static class DatabaseBootstrap
{
    private static readonly Lock Gate = new();
    private static bool _listo;
    private static string? _error;

    public static bool Listo => _listo;
    public static string? Error => _error;

    public static void Inicializar(IServiceProvider services)
    {
        if (_listo) return;

        lock (Gate)
        {
            if (_listo) return;

            const int maxIntentos = 2;
            Exception? ultimoError = null;

            for (var intento = 1; intento <= maxIntentos; intento++)
            {
                try
                {
                    Task.Run(async () =>
                    {
                        using var scope = services.CreateScope();
                        await scope.ServiceProvider.GetRequiredService<IDatabaseInitializer>().InicializarAsync();
                    }).GetAwaiter().GetResult();

                    _listo = true;
                    _error = null;
                    return;
                }
                catch (Exception ex)
                {
                    ultimoError = ex;
                    System.Diagnostics.Debug.WriteLine($"DB init error (intento {intento}/{maxIntentos}): {ex}");
                }
            }

            _error = ultimoError?.Message;
        }
    }
}
