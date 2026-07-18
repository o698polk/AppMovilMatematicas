namespace MauiApp2.Services;

/// <summary>
/// Estado global de visibilidad de la barra de navegación (persistido en el dispositivo).
/// </summary>
public interface INavegacionUiService
{
    bool NavVisible { get; }
    event Action? OnCambio;
    void AlternarNav();
    void EstablecerNavVisible(bool visible);
}

public class NavegacionUiService : INavegacionUiService
{
    private const string Key = "nav_visible";

    public bool NavVisible { get; private set; } = Preferences.Get(Key, true);

    public event Action? OnCambio;

    public void AlternarNav() => EstablecerNavVisible(!NavVisible);

    public void EstablecerNavVisible(bool visible)
    {
        if (NavVisible == visible) return;
        NavVisible = visible;
        Preferences.Set(Key, visible);
        OnCambio?.Invoke();
    }
}
