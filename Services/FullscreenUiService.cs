namespace MauiApp2.Services;

/// <summary>
/// Modo pantalla completa de la app (oculta chrome de navegación).
/// </summary>
public interface IFullscreenUiService
{
    bool Activo { get; }
    event Action? OnCambio;
    void Activar();
    void Desactivar();
}

public sealed class FullscreenUiService : IFullscreenUiService
{
    public bool Activo { get; private set; }

    public event Action? OnCambio;

    public void Activar()
    {
        if (Activo) return;
        Activo = true;
        OnCambio?.Invoke();
    }

    public void Desactivar()
    {
        if (!Activo) return;
        Activo = false;
        OnCambio?.Invoke();
    }
}

/// <summary>
/// Control de orientación (portrait fijo vs rotación libre en fullscreen).
/// </summary>
public interface IOrientationService
{
    void PermitirRotacion();
    void BloquearPortrait();
}

public sealed class OrientationService : IOrientationService
{
    public void PermitirRotacion()
    {
#if ANDROID
        var activity = Platform.CurrentActivity;
        if (activity is not null)
            activity.RequestedOrientation = Android.Content.PM.ScreenOrientation.Sensor;
#endif
    }

    public void BloquearPortrait()
    {
#if ANDROID
        var activity = Platform.CurrentActivity;
        if (activity is not null)
            activity.RequestedOrientation = Android.Content.PM.ScreenOrientation.Portrait;
#endif
    }
}
